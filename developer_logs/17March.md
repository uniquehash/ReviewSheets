# March, 2017

### March, 2nd, 2017

* long term shit i need to do
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other
	* learn more about virtualization
		* fairly important cause of interlink with cris
		* starting points as told by cris
			* dockerize a web-app -> now reinforced by smart locus needs
				* flask
					* basic flask app
					* rely on db
						* postgress
				* write a docker file 
				* write a docker compose file
			* container orchestration
				* kubernetes
			* get an AWS setup running with a kubernetes cluster
				* get it to deploying with kubernetes
			* make jenkins happen
				* what is jenkins
	* work on the frame work
		* i should do this above go
	* learn go
	* rebrand as a data acquisition specialist

* immediate shit to do
	* burn ls and restart :(	
	* chop up the video and 

* fun stuff to do
	* work on DnD system

i've been doing a lot of reasearch oriented stuff. this does not exactly add exciting sagas to the dev logs. this is something i should change. hmmmm. i guess i could write a little on my thoughts of the implications of something i researched during the day. that should add a little meat to these bones.

docker basically creates a nice interface over existing tools to simplify operating-system level virtualization. One thing i can see being super useful is the ability to have all the dependencies static within the container without interferring with one another. This means you wont have the problem where you try to upgrade a part of the system, and break the rest of it.

### March, 3rd, 2017

* long term shit i need to do
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other
	* learn more about virtualization
		* fairly important cause of interlink with cris
		* starting points as told by cris
			* dockerize a web-app -> now reinforced by smart locus needs
				* flask
					* basic flask app
					* rely on db
						* postgress
				* write a docker file 
				* write a docker compose file
			* container orchestration
				* kubernetes
			* get an AWS setup running with a kubernetes cluster
				* get it to deploying with kubernetes
			* make jenkins happen
				* what is jenkins
	* work on the frame work
		* i should do this above go
	* learn go
	* rebrand as a data acquisition specialist

* immediate shit to do
	* 42 stuff
		* burn ls and restart :(
		* algorithm for push_swap
	* chop up the video and 

* fun stuff to do
	* work on DnD system

working on docker stuffs mostly.

### March, 6th, 2017

* long term shit i need to do	
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other
	* learn more about virtualization
		* fairly important cause of interlink with cris
		* starting points as told by cris
			* dockerize a web-app -> now reinforced by smart locus needs
				* flask
					* basic flask app
					* rely on db
						* postgress
				* write a docker file 
				* write a docker compose file
			* container orchestration
				* kubernetes
			* get an AWS setup running with a kubernetes cluster
				* get it to deploying with kubernetes
			* make jenkins happen
				* what is jenkins
	* work on the frame work
		* i should do this above go
	* learn go
	

* immediate shit to do	
	* finish the google foobar
	* chop up the video and 
	* rebrand as a data acquisition specialist
	* 42 stuff
		* burn ls and restart :(
		* algorithm for push_swap

* fun stuff to do
	* work on DnD system

so this google foobar thing kind of changes everythin. now i'm going to end up interview ready, which means i might as well apply to a bunch of internships, which means that im changing my whole plan basically. so lets focus on today.

* today
	* talk to jamie
		* designathon
	* talk to john
		* the video
	* work on the markov chain problem
		* build a matrix library
			* exist
			* create identity matrix of arbritary size
			* re-arrange rows and columns
			* subset
			* matrix subtraction			
			* matrix multiplication
			
			* inverse of matrix

	* build a docker container for the process on the server
		* not sure just start doing


### March, 8th, 2017

* long term shit i need to do		
	* learn more about virtualization
		* fairly important cause of interlink with cris
		* starting points as told by cris
			* dockerize a web-app -> now reinforced by smart locus needs
				* flask
					* basic flask app
					* rely on db
						* postgress
				* write a docker file 
				* write a docker compose file
			* container orchestration
				* kubernetes
			* get an AWS setup running with a kubernetes cluster
				* get it to deploying with kubernetes
			* make jenkins happen
				* what is jenkins
	* work on the frame work
		* i should do this above go
	* learn go
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other

* immediate shit to do	
	* finish the google foobar
	* chop up the video and 
	* rebrand as a data acquisition specialist
	* 42 stuff
		* burn ls and restart :(
		* algorithm for push_swap

* fun stuff to do
	* work on DnD system

okay i got the google foobar stuff under control. back to virtualization. so were going to use docker compose to manage the containers, dockerui to visualize the docker host. To pass a directory to a container i need to mount it to the container. passing arbritary arguments should be no big deal. really my next step should be to go throught the getting started compose thing, and just set up a docker image using compose. very likely that my questions will be answered in the process of doing that.

### March, 9th, 2017

* long term shit i need to do		
	* learn more about virtualization
		* fairly important cause of interlink with cris
		* starting points as told by cris
			* dockerize a web-app -> now reinforced by smart locus needs
				* flask
					* basic flask app
					* rely on db
						* postgress
				* write a docker file 
				* write a docker compose file
			* container orchestration
				* kubernetes
			* get an AWS setup running with a kubernetes cluster
				* get it to deploying with kubernetes
			* make jenkins happen
				* what is jenkins
	* work on the frame work
		* i should do this above go
	* learn go
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other

* immediate shit to do	
	* finish the google foobar
	* chop up the video and 
	* rebrand as a data acquisition specialist
	* 42 stuff
		* burn ls and restart :(
		* algorithm for push_swap

* fun stuff to do
	* work on DnD system

okay so now i have a basic container getting spun up with compose. the compose file is going to contain a single service for the building. it's going to mount a folder associated to an arbritary path to the container. pass credentials to the container's as environment variables.

so for the docker volume thing to go host to container you need to either use the command line options or use `docker-compose`. this is for flexbility in development but honestly fuck.

now i need to figure out how to pass information to the container as environment variables.

### March, 12th, 2017

fuck it. i'm just gonna go through this shit by hand. onword to sorting 100 integers by hand using the merge sort method.

okay learned a lot from that, like the fundementals of the things. at their root algorithm are just ways of doing things. you can think of a good algorithm like a fractal, they are natural phenomenons discovered that just work at every layer of iteration. but even after the over all stragy of the algorithm, it can be further optmized at various steps. this can be pre-processing, better methodology for particular components, ect...

now i'm going to build a python algorithm thing to do a bunch of testing. shorter development cycles here are key.


































