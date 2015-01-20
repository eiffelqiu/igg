require 'sinatra'
require 'sinatra/base'
require 'pathname'
require 'json'
require 'thor'
require_relative 'server'

require_relative 'ext/string_extention'
%w[project entity level].each { |task| require_relative "builder/#{task}_builder" }

class Igg::CLI < Thor
  include Thor::Actions
  Igg::Builder.constants.each { |b| include "Igg::Builder::#{b}".to_class }

  def initialize(*args); super; processing(*args) end

  def self.source_root; File.dirname(__FILE__) end

  %w[project entity level].each do |type|
    if type == 'entity' 
        method_option :width, :type => :numeric, :default => 16, :required => false, :aliases => "-w", :desc => "width"
        method_option :height, :type => :numeric, :default => 16, :required => false, :aliases => "-h", :desc => "height"
    else
        method_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
        method_option :height, :type => :numeric, :default => 240, :required => false, :aliases => "-h", :desc => "height"
    end      

    class_eval %{
      desc "#{type} [name]", "generate an ImpactJS Game #{type}"
      def #{type}(name=nil) end
    }
  end

  private
  def processing(*args)
    method = args[2][:current_command][:name] # default project name is app type name
    @name, @width, @height  = args[0][0] || "#{method}", options[:width], options[:height]
    @name = "#{@name}".downcase                                  
    if method == 'server' then
      if File.exist?('lib/weltmeister/config.js')
        File.write("lib/weltmeister/config.js",File.open("lib/weltmeister/config.js",&:read).gsub(".php",""))
        puts 
        puts "*" * 80
        puts "Server automatically modified lib/weltmeister/config.js file"
        puts "and removed all '.php' suffix in API of this file"
        puts 
        puts "Play your game  : http://localhost:4567/"
        puts "Run weltmeister : http://localhost:4567/weltmeister"
        puts "*" * 80
        puts                
        Server.run!
      else
        puts "*" * 80
        puts "Can't start server without impact and weltmeister, you must do as follow"
        puts 
        puts "1: Copy 'impact' folder to current project's 'lib' subdirectory."
        puts "2: Copy 'weltmeister' folder to current project's 'lib' subdirectory."
        puts "3: Copy 'weltmeister.html' to current project's root."        
        puts "*" * 80
        exit
      end      
    elsif method == 'help' 

    else
      send "build_#{method}" 
    end

  end
end