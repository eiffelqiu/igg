require 'thor'
require_relative 'ext/string_extention'
%w[project entity level].each { |task| require_relative "builder/#{task}_builder" }

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
    send "build_#{method}" if method != 'help' 
  end
end