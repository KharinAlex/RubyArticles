# RubyArticles

# Installation

- Make working dir and clone repository:

		mkdir RubyArticles
		cd RubyArticles
		git clone git@github.com:KharinAlex/RubyArticles.git

- Run build with makefile:

		make up

# Working process
- To send commands into application container use:

		make shell-app cmd="put your commands here"

- To get access to the db container use:
		
		make shell-db

- To stop containers use:
		
		make stop

- To clean all docker files use:

		make clean-docker
