## ImpactJS Game Gadget. (Current Version 0.0.7)

Several tools for fast developing an ImpactJS Game, include generators and built-in server to run the game and weltmeister level editor right in the current project folder without requiring apache http server and PHP configuration.

### Requirement

    1: Ruby 1.9.x or later (tested)
    2: ImpactJS (buy your license 99$)


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

    $ igg project pong   # default width=320 height=240   

### Generate an ImpactJS Game Level

    $ igg level shooting  # default width=320 height=240  

### Generate an ImpactJS Game Entity

    $ igg entity player # default width=16 height=16 

### How to run Igg Server

    # you need 3 steps to run server
    #
    # 1: Copy 'impact' folder to current project's 'lib' subdirectory.  
    # 2: Copy 'weltmeister' folder to current project's 'lib' subdirectory. 
    # 3: Copy 'weltmeister.html' to current project's root. 
    #
    # ImpactJS project directory should look like this    
![project directory usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen6.png)   


### Run Server mode to play the game

    $ igg server   ## Must Run in an ImpactJS project folder

![igg server usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen1.png)

	open 'http://localhost:4567' in browser

![play impact game usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen3.png)
![index usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen5.png)

	$ igg server   ## DO NOT Run in an ImpactJS project folder will NOT start server

![run server error usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen4.png)

### Run Server mode to run weltmeister level editor

    $ igg server 

    open 'http://localhost:4567/weltmeister' in browser

![weltmeister usage](https://raw.github.com/eiffelqiu/igg/master/doc/screen2.png)    

