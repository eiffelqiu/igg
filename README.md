## ImpactJS Game Gadget.

Several tools for fast developing an ImpactJS Game, include generators and built-in server to run the game and weltmeister level editor right in the current project folder without require apache server and PHP configuration.

### Installation

    $ gem install igg 

### Help

    $ igg 
	Commands:
	  igg entity [name]   # generate an ImpactJS Game entity
	  igg help [COMMAND]  # Describe available commands or one specific command
	  igg level [name]    # generate an ImpactJS Game level
	  igg project [name]  # generate an ImpactJS Game project

### Generate an ImpactJS Game project

    $ igg project phone   # default width=320 height=240     	  

### Generate an ImpactJS Game Level

    $ igg level shooting  # default width=320 height=240  

### Generate an ImpactJS Game Entity

    $ igg entity player # default width=16 height=16 

### Run Server mode to play the game

    $ igg server   ## Must Run in an ImpactJS project folder

![igg server usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen1.png)

	open 'http://localhost:4567' in browser

![play impact game usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen3.png)

	$ igg server   ## DO NOT Run in an ImpactJS project folder will NOT start server

![run server error usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen4.png)


### Run Server mode to run weltmeister level editor

    $ igg server 

    open 'http://localhost:4567/weltmeister' in browser

![weltmeister usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen2.png)    

