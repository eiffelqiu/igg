module Igg
  module Builder
    module ProjectBuilder
      def build_project
      	empty_directory "#{@name}/lib"
      	empty_directory "#{@name}/lib/game"
      	empty_directory "#{@name}/lib/game/entities"
      	empty_directory "#{@name}/lib/game/levels"
      	empty_directory "#{@name}/media"
      	empty_directory "#{@name}/media/sounds"
        empty_directory "#{@name}/js"

      	copy_file 'builder/templates/project/sounds/death.mp3',"#{@name}/media/sounds/death.mp3"
      	copy_file 'builder/templates/project/sounds/death.ogg',"#{@name}/media/sounds/death.ogg"
      	copy_file 'builder/templates/project/sounds/jump.mp3',"#{@name}/media/sounds/jump.mp3"
      	copy_file 'builder/templates/project/sounds/jump.ogg',"#{@name}/media/sounds/jump.ogg"
      	copy_file 'builder/templates/project/sounds/shoot.mp3',"#{@name}/media/sounds/shoot.mp3"
      	copy_file 'builder/templates/project/sounds/shoot.ogg',"#{@name}/media/sounds/shoot.ogg"
      	copy_file 'builder/templates/project/sounds/theme.mp3',"#{@name}/media/sounds/theme.mp3"
      	copy_file 'builder/templates/project/sounds/theme.ogg',"#{@name}/media/sounds/theme.ogg"

        copy_file 'builder/templates/project/jquery.min.js',"#{@name}/js/jquery.min.js"
        copy_file 'builder/templates/project/toggleDebug.js',"#{@name}/js/toggleDebug.js"

      	copy_file 'builder/templates/project/04b03.font.png',"#{@name}/media/04b03.font.png"
        copy_file 'builder/templates/project/levelexit.js', "#{@name}/lib/game/entities/levelexit.js"
        template 'builder/templates/project/main.tt', "#{@name}/lib/game/main.js"
        template 'builder/templates/level/main.js', "#{@name}/lib/game/levels/main.js"
        template 'builder/templates/project/index.html', "#{@name}/index.html"
      end
    end
  end
end