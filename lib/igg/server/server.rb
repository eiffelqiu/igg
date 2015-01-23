########################################################
##
## reference code from Chris Darroch's 'impactrb'
## code:   https://github.com/chrisdarroch/impactrb
##
## I adpated it to run in current impact project folder
##
########################################################
require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'api')

module Igg
  class Server < Sinatra::Base

    register Igg::APIRoutes

    configure { set :server, :puma }

    set :public_folder, Dir.pwd

    get '/', :agent => /iphone|android/i do
      File.read('mobile.html')
    end

    get '/' do
      File.read('./index.html')
    end

    get '/weltmeister' do
      File.read('./weltmeister.html')
    end
    
  end
end

