module Igg
  module Builder
    module EntityBuilder
      def in_app_root?
        File.exist?('lib/game/entities')
      end     
      def build_entity
      	if in_app_root?
      		@width, @height = 16, 16
      		empty_directory "lib/game/entities"
       		template 'builder/templates/entity/entity.tt', "lib/game/entities/#{@name}.js"
      	else
      		puts "you are not in an ImpactJS project root folder"
      	end

      end
    end
  end
end