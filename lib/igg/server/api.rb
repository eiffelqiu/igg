require 'rubygems'
require 'sinatra'
require 'sinatra/base'

module Igg
  module APIRoutes
    def self.registered(app)
	  app.get /\/lib\/weltmeister\/api\/glob(.php)?/ do
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

	  app.get /\/lib\/weltmeister\/api\/browse(.php)?/ do
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

	  app.post /\/lib\/weltmeister\/api\/save(.php)?/ do
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

	  app.helpers do
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
	  end
end