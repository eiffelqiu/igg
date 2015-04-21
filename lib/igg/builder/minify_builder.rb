require 'reduce'
require 'colorize'

module Igg
  module Builder
    module MinifyBuilder
      def in_app_root?
        File.exist?('lib/game') && File.exist?('lib/impact')
      end     
      def build_minify
      	if in_app_root?
          
          File.open('game.js','a') do |mergedFile|
            engineFilesInDir = Dir["lib/impact/**/*.js"]
            puts "*" * Igg::Conf::MAXSIZE
            puts "packing impact.js engine files ... "
            puts "*" * Igg::Conf::MAXSIZE
            engineFilesInDir.each do |file|
              mergedFile << "\n"
              puts "minifying '#{file}' ... ".colorize(:color => :red, :background => :white)
              text = File.open(file, 'r').read
              text.each_line do |line|
                  mergedFile << line
              end
            end
          end 

          File.open('game.js','a') do |mergedFile|

            gameFilesInDir = Dir["lib/game/**/*.js"]
            puts "*" * Igg::Conf::MAXSIZE
            puts "packing game files ... "
            puts "*" * Igg::Conf::MAXSIZE
            gameFilesInDir.each do |file|
              mergedFile << "\n"
              puts "minifying '#{file}' ... ".colorize(:color => :red, :background => :white)
              text = File.open(file, 'r').read
              text.each_line do |line|
                  mergedFile << line
              end
            end
          end 

          reduced_data = Reduce.reduce('game.js')
          File.open('game.min.js','w') do |f|
              f.write(reduced_data)
          end
      	else
      		puts "you are not in an ImpactJS project root folder"
      	end

      end
    end
  end
end