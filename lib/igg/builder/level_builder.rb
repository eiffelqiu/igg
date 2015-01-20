module Igg
  module Builder
    module LevelBuilder
      def in_app_root?
        File.exist?('lib/game/levels')
      end     
      def build_level
      	if in_app_root?
      		empty_directory "lib/game/levels"
       		template 'builder/templates/level/level.tt', "lib/game/levels/#{@name}.js"
      	else
      		puts "you are not in an ImpactJS project root folder"
      	end

      end
    end
  end
end