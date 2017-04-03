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

### March, 17th, 2017

* long term shit i need to do	
	* work with smart locus on their virtualization set up
		* setting up the ingestion scripts with docker compose
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
	* learn go
	* figure out a classification method for determining what kind of company i want to work for
		* high level, this manual classification system
			* use template and draw generalizations
				* twilio
				* valve
				* other

* immediate shit to do			
	* 42 stuff
		* restarting ls
		* algorithm for push_swap
	* finish chopping up the video
	* write in the description for the livestream
	* finish the google foobar

* fun stuff to do
	* work on DnD system

Since i'm going to be away from the lab computers for a few days i'm going to focus today and tomorrow on stuff i can do on the lab computers. that means putting push_swap down for a second and working on ls. the upside of this is that it is a more effecient use of resources. the downside of this is that it means i will not submit anything anytime soon. 

a lot more of ls was salvagable then i thought. this is good. first i'm going to refactor t_clip, my mini library for cli argument handling. after that's good i'll get to handling the arguments within the program. next will be handling basic ls functionality without arguments or flags. after i'll introduce arguments. then i'll start handling flags. i'll handle the recursion first, then the long print, then the time sort, then the reverse sort, then the hidden files. i need to handle errors properly as i come across them from the getgo, as oppose to lumping them all together at the end

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion
		* long print 
		* timesort
		* reverse sort
		* hidden files

handling arguments within the program is going to be a lot more straight forward this time around. basically the char** get received from clip, and then shoved into a handle_arguments function. the first step of the handle_arguments function is to convert the char** into a filelist. it will extract the access_path of each char** and then attempt to open that access_path. it will then find the desired file in that directory. if found it will return the file to the convert function which will organize them into a filelist and send them back to the handle_arguments function. if there the file cannot be found or there is an error of any kind the error will be displayed using perror, and that entry in the char** will not be added to the filelist. the directories will then be extracted from the filelist, by checking their filetype bit. both list are sorted. then they should be passed through the same process that ls would go through if it were normally called. which will be the next piece i figure out.

* handle arguments within the program
	* clip contains args char**
	* handle_args receives char**
		* convert to filelist
			* extract access path
				* if contains a '/'
					* returns path from index 1 to pen ultimate '/'
				* if doesn't contain a '/'
					* returns '.'
			* open access path
				* if access path doesn't open
					* prints perror
					* returns NULL
				* find file in directory
					* if not found
						* prints perror
						* returns NULL
					* if found
						* returns file
			* returns filelist
		* extract the dir from the filelist
			* check filetype bit
		* sort the filelist
		* same behavior as if it were a normal ls call

if filename is null it means were looking for '.' in the access path

### March, 18th, 2017

working on extract_filename. the issue your working on is the problem when you add a slash to the end of a filename, which marks it as a directory but also fucks your extraction system.

### Match, 21st, 2017

working on the docker container stuff. need to mount a local folder, take in parameter to add to the containers ENV variables and persist. Keeping the container alive might actually be the most difficult component of this task.

okay so more or less i'm going to have a Dockerfile that will add a bunch of shit to the ENV of the container then shove it all in a file, run the crontab that will source that file and then finally run a script that will properly run the python scripts that charlie wrote. 

* Dockerfile
	* installs all dependencies
	* loads a bunch of data into containers ENV 
	* runs a shell command to shove all that data into a file prepended by namespaced exports
	* adds the proper files into the container including charlies scripts and the crontab
	* mounts the json files into the container from the host file
	* runs the crontab command in the foreground

### March, 24th, 2017

got the docker stuff working except that now i need to figure out how to connect to the db on the host machine. there has to be a normal way to do that that isn't stupid. 

### March, 29th, 2017

figured out what my issue was. i was double deleting a string cause i'm dumb.

now i have argument seperation mostly down. time to move on to simple ls behavior. probably tomorrow. remember filenames are blobs of information.

### March, 30th, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion
		* long print 
		* timesort
		* reverse sort
		* hidden files

time to build some of ls functionality. first refactor things a bit to have them in the appropriate files.
need to work on how my filelist injest files but besides that should be good.

### March, 31st, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion
		* long print 
		* timesort
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files

so now i'm working on implementing basic ls functionality. i need to fix my filelist set up.

time to introduce argument handling. to handle time sorting for arguments i'll make a small wrapper and sort the actual files.

woooo got it done. that's really dope though. arguments are handled both relative and absolute.

tomorrow i'm gonna start implementing flags.

































































