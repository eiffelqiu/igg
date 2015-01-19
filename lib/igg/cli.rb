require 'sinatra'
require 'sinatra/base'
require 'pathname'
require 'json'
require 'thor'

require_relative 'ext/string_extention'
%w[project entity level].each { |task| require_relative "builder/#{task}_builder" }

class Server < Sinatra::Base

  set :public_folder, Dir.pwd

  # This is where you could serve different pages depending on the device accessing the page,
  # such as for iPads and mobile devices.

  # get '/', :agent => /iphone|android/i do
  #   File.read('mobile.html')
  # end

  get '/' do
    File.read('./index.html')
  end

  get '/weltmeister' do
    File.read('./weltmeister.html')
  end

  get /\/lib\/weltmeister\/api\/glob(.php)?/ do
    @files = params[:glob].inject([]) do |memo, glob|
      dir = from_impact_basedir(glob)
      Pathname.glob(dir).each do |d|
        memo << relative_pathname(d)
      end
      memo
    end
    
    content_type :json
    @files.to_json
  end

  get /\/lib\/weltmeister\/api\/browse(.php)?/ do
    @dir = from_impact_basedir(params[:dir])
    @type = params[:type]
    
    extensions = []
    
    case @type
      when 'images' then extensions += %w{png gif jpg jpeg bmp}
      when 'scripts' then extensions += %w{js}
      else extensions += "*".to_a
    end

    parent = @dir ? relative_pathname(Pathname.new(@dir).parent) : false
    directories = Pathname.new(@dir).children.select { |c| c.directory? }.map { |d| relative_pathname d }
    files = Pathname.glob(File.join(@dir, "*.{#{extensions.join(',')}}")).map { |f| relative_pathname f }

    content_type :json
    {
      :parent => parent,
      :dirs => directories,
      :files => files
    }.to_json
  end

  post /\/lib\/weltmeister\/api\/save(.php)?/ do
    response = { :error => 0 }
    
    if params[:path] && params[:data]
      @dir = from_impact_basedir(params[:path])
      
      if File.extname(@dir) == ".js"
        begin
          File.open(@dir, 'w') { |f| f.write(params[:data]) }
        rescue => e
          response[:error] = 2
          response[:msg] = "Could not save the level file. " + e.message
        end
      else
        response[:error] = 3
        response[:msg] = "File must have a .js suffix"
      end
    else
      response[:error] = 1
      response[:msg] = "No Data or Path specified"
    end
    
    content_type :json
    response.to_json
  end

  helpers do
    def from_impact_basedir(dir)
      @folder = dir.to_s.sub(%r{\.\./?},"")
     # File.join(File.dirname(__FILE__), @folder)
     File.join(Dir.pwd, @folder)
    end
    def relative_pathname(path)
      # @asset_root ||= Pathname(File.dirname(__FILE__)).realpath
      @asset_root ||= Pathname(Dir.pwd).realpath
      path = Pathname(File.expand_path(path))
      path.relative_path_from(@asset_root).cleanpath.to_s
    end
  end

end

class Igg::CLI < Thor
  include Thor::Actions
  Igg::Builder.constants.each { |b| include "Igg::Builder::#{b}".to_class }

  def initialize(*args); super; processing(*args) end

  def self.source_root; File.dirname(__FILE__) end

  class_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  class_option :height, :type => :numeric, :default => 240, :required => false, :aliases => "-h", :desc => "height"

  %w[project entity level].each do |type|
    class_eval %{
      desc "#{type} [NAME]", "generate an ImpactJS Game #{type}"
      def #{type}(name=nil) end
    }
  end

  private
  def processing(*args)
    method = args[2][:current_command][:name] # default project name is app type name
    @name, @width, @height  = args[0][0] || "#{method}", options[:width], options[:height]
    @name = "#{@name}".downcase                                  
    if method == 'server' then
      Server.run!
    elsif method != 'help' 
      send "build_#{method}" 
    end

  end
end