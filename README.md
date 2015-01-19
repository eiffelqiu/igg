## ImpactJS Game Generator.


### Installation

    $ gem install igg 

### Help

    $ igg 
	Commands:
	  igg entity [NAME]   # generate an ImpactJS Game entity
	  igg help [COMMAND]  # Describe available commands or one specific command
	  igg level [NAME]    # generate an ImpactJS Game level
	  igg project [NAME]  # generate an ImpactJS Game project

	Options:
	  -w, [--width=N]   # width
	                    # Default: 320
	  -h, [--height=N]  # height
	                    # Default: 240

### Generate an ImpactJS Game project

    $ cb project phone   # default width=320 height=240     	  

### Generate an ImpactJS Game Level

    $ cb level shooting   

### Generate an ImpactJS Game Entity

    $ cb entity player 

### Run Server mode to play the game

    $ igg server  ## open 'http://localhost:4567' in browser
![igg server usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen1.png)

### Run Server mode to run weltmeister level editor

    $ igg server  ## open 'http://localhost:4567/weltmeister' in browser
![weltmeister usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen2.png)    

