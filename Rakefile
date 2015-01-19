# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "igg"
  gem.homepage = "http://github.com/eiffelqiu/igg"
  gem.license = "GPL2"
  gem.summary = %Q{ImpactJS Game Gadget}
  gem.description = %Q{Several tools for fast developing an ImpactJS Game, include generators and built-in server to run the game and weltmeister level editor right in the current project folder without require apache server and PHP configuration.}
  gem.email = "eiffelqiu@qq.com"
  gem.authors = ["eiffel qiu"]
  gem.executables = ['igg']
  gem.files = Dir.glob('lib/**/*.*')
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "igg #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
