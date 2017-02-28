# February, 2017

### February, 2nd, 2017

must find segfault. hahaha always assume null!!!

welp now i need to figure out the long print of ls. oh i did that already haha. 

build long format gooooooo.

* organizational
	* bitch to kwame about av
		* organize team
	* ad hoc for the doc for permissions rights
	* figure out some video editing process and approval process
	* get mentor team set up for los altos 
	* ask lou about the back of bocal

breaking up long printing. i can probably put permissions in one function, and have it apply to group, individual, and other. i can throw the entire options string into a function. i can do the rest inline except for the time stuff, and path stuff. both of those should be handled in seperate functions. 

### February, 4th, 2017

figured out why it was broken. of course i was passing it the file name instead of the file path. how is the computer going to know how to find the file if i don't tell it. duhhhhhh.

* shit on the horrizon
	* talk to jamie on monday 2/6 about the showcase event
	* work with freidrich on the av protocol stuff
	* talk with justin about mentor squad

keep long printing wooooooo.

so i can make a generalizable function that takes a bit shifting incrementer to do the work for all three pieces of information. the reason this is valuable is that i'm gonna have to norm this bitch, and i don't want to add an extra file.

### February, 5th, 2017

alright now i'm up to figuring out time strings. 

### February, 6th, 2017

* organizational
	* bitch to kwame about av
		* organize team
	* ad hoc for the doc for permissions rights
	* figure out some video editing process and approval process	
	* set up a meeting with jamie about the event 
	* work with kane on his pitch structure
	* meeting with smart locus on tuesday
		* read material tuesday
	* get pictures of space from hs hacks
		* send to brezh
	* try to move the session for d&d
	* how to have other people add collaberators to a project

figuring out time parsing

i figured out time parsing! woooooooo.

now i'm working on the column spacing. depending on the size of different properties of the contents of the directory, the spacing between columns will change. all of the spacing for each item will always match.

finished long printing :)

all that is theoritically left is handling arguments and handling reverse sort and time sort.

### February, 7th, 2017

* meeting with jamie
	* talk about showcase
	
	* get a feel for speakers coming up
		* beezwax stephan this friday 11:30am 
		* tomer 22nd 8pm 
	* pass on josh's information
		* taken care of
	* pass on tino hacks email
		* population
		* power sittuation
		* outside devices
		* can 42 kids be mentors
	* talk about silicon valley 
		* now in 42's court 
	* get a feel for program development
		* no point in infastructure

* meeting with smart locus
	* what does pneumatically equipped mean

### February, 8th, 2017

time to do the time sort, fix the block size thing, and implement the reverse sort.

your clip isn't working right look into the flag overiding.

it's working just not tied.

wooo check time sort, and reverse to be sure but should be done. also do block size.

### February, 9th, 2017

okay my sort is broken. there's some shady shit going with the fifo file i have no idea what.

i need to implement the clip short flag handling.
this shit is handled

i need to implement the block size thing. 
so they round up and down depending on the modulus. that is a huge pain in the ass to implement only gonna do it if it matters. 

i need to implement a real print function for default.
wooo done :)

there are like 36 memory leaks when i sort with time, gottttta look at that haha. 

took care of the ordering issues. however the time sort is still fucked so that needs to be reviewed.

all that's left is fixing the time sort, implementing arguments, and then hella clean up.

### February, 13th, 2017

hackathon went fucking awesome, got to keep working on that 

* showcase
	* get the fucking info from everyone
	* finish make a splash page

* ls
	* fix time sort
		* not accurate
		* memory leaks
	* implementing arguments
		* like all of it
	* norming and clean up

* maintenance
	* reimplement strlist with a linked list

i have the args list now being disected into dir list and non dir list. the next step is looping through the lists and running ls on each one. fuckkkkkkkkkk this blows. now i have to copy over all this shit for the algorithm stack. this is very annoying. 

### February, 14th, 2017

found the thing. clear all the print statements.

file printing is not working for paths


* ls
	* fix time sort
		<!-- * not accurate -->
		<!-- * memory leaks -->
	* implementing arguments
		* pretty much done? clean up i guess
			<!-- * yea done till final check -->
	* refactor -R
		* change the printing and stuff	
	* norming and clean up

i need to figure out how to compare time stamps.

barf i need to fix the estimation error in block size

barf i need to change the print style for arguments


### February, 15th, 2017

time to finish the time sort thing.

wooo done. 

0: 1
0: format parsing
1: format parsing
2: format parsing
3: format parsing
malloc(3) = 0x7faf68c033e0
4: format parsing
5: format parsing
6: format parsing
0: flow
malloc(3) = 0x7faf68c00020
malloc(3) = 0x7faf68c033f0
free(0x7faf68c033d0)
1: flow
malloc(2) = 0x7faf68c033d0
free(0x7faf68c00020)
malloc(1) = 0x7faf68c00020


malloc(1) = 0x7faf68c03410

free(0x7faf68c00020)
free(0x7faf68c033d0)
2: flow
malloc(4) = 0x7faf68c033d0
3: flow
7: format parsing
free(0x7faf68c033e0)
8: format parsing
1: 1
malloc(5) = 0x7faf68c033e0
2: 1
malloc(17) = 0x7faf68c03420
free(0x7faf68c03400)
3: 1
malloc(19) = 0x7faf68c03440
free(0x7faf68c03420)
4: 1
5: 1
free(0x7faf68c033e0)
6: 1
reset start
reset post flag
reset post prepend
reset post length
free(0x7faf68c033f0)
lol
malloc(1) = 0x7faf68c033f0
reset post conversion
free(0x7faf68c033d0)
reset post substring
reset post mfieldwidth
reset post precision
7: 1

* ls
	* change the output to match ls 
		* boooo
	* norm and clean up
	* remove memory leaks from printf

### February, 16th, 2017

check other print f things for leaks.
fuck it.

now for ls i just need to change the output to match ls. clean and norm. also need to put in the errors. 

* ls
	* change the output to match ls 
		* boooo
		* just not going to do this
	* norm and clean up
	* make sure the error handling is right

### February, 20th, 2017

this week is gonna have very little coding unfortunately, but that's okay these events are gonna be sick.

* immediate i need to work on
	* go over the structure with jamie
		* tomorrow early
		* think through the AV component
			* 5:15pm
	* work on my showcase intro
		* tomorrow early
	* work on my intro for tomer
		* wednesday early
		* think through AV set up
		* think through moonlight transition
			* fuckkkkkkk
	* work on my moonlight pitch
		* wednesday early
	* work with kane on his pitch
		* 6pm
	* talk to tomer
		* post charlies class 
	* wake up at 6AM 
		* erryday this week, ain't no two ways about it


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
			* dockerize a web-app
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
	* finish ls
		* change the output to match ls 
		* norm and clean up
		* make sure the error handling is right

### February, 21st, 2017


* immediate i need to work on
	* go over the structure with jamie
		* tuesday early
			* not happening do it live
		* think through the AV component
			* 5:15pm
	* work on my showcase intro
		* today
	* work on my intro for tomer
		* wednesday early
		* think through AV set up
		* think through moonlight transition
			* fuckkkkkkk
	* work on my moonlight pitch
		* wednesday early
	* wake up at 6AM 
		* lol fuck me


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
	* finish ls
		* norm and clean up
		* make sure the error handling is right
			* done
		* substitute with your printf
		* check for leaks
			* done

almost done with ls. just need to norm it, put my printf in there, do the error handling for nonexistant files and no permission files, and fix this weird -a segfault.

norm is a low energy task, i can do it tonight after everything.

just need to handle errors right.

woooooo. just need to norm and substitute printf. so i'm done. that took longer than expected. 65ish hours, after norming it's gonna be like 70 - 75. 

alright well then i should stop procrastinating my set up for the event. time to start pitch writing.

### February, 22nd, 2017


* immediate i need to work on	
	* work on my showcase intro
		* thursday
	* work on my intro for tomer
		* today
	* work on my moonlight pitch
		* today
	* work with Kane at 4pm, remind at 3:30pm



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
	* finish ls
		* norm and clean up
		* make sure the error handling is right
			* done
		* substitute with your printf
		* check for leaks
			* done

### February, 23rd, 2017

* immediate i need to work on	
	* work on my showcase intro
		* thursday

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
	* finish ls
		* norm and clean up				
		* fix recursive new line output


alright last thing left is the showcase. what a fucking week.

for ls, i need to fix the new line output, it's a little fucked up.

### February, 24th, 2017

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
	* finish ls
		* norm and clean up				
		* fix recursive new line output

* immediate shit
	<!-- * finish ls -->
	<!-- * finish hercules_hind -->

i need to be able to find the locations of particular logins. my first step is finding the right api end points to hit to get the data.

well that was fun, back to norming ls.

finished norming ls, now to fixing the printing hickup.

woooo now i just need to get corrected.

moving on to learning more about virtualization.

### February, 25th, 2017

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
	* write the description of the moonlight vids
		* pitches
		* showcase
	* edit the tomer video
	* call christi
		* message on monday
	* call trish
		* message on monday

* fun stuff to do
	* work on DnD system



### February, 25th, 2017

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
	* write the description of the moonlight vids
		* pitches
		* showcase
	* edit the tomer video
	* call christi
		* call at 9am
	* call trish
		* call sometime this week
	* call natalie
		* tuesday night

* fun stuff to do
	* work on DnD system


* shit to do as i get loopier
	* write the description of the moonlight vids
		* pitches
		* showcase
	* do a bunch of more research on virtualization
	* work on DnD
	* meetings
		* christi
			* 9am
		* ambassadors
			* 2pm (probs an hour)
		* trish
			* unknown
		* natalie
			* evening
			
### February, 27th-28th, 2017

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
	* write the description of the moonlight vids
		* pitches
		* showcase
	* edit the tomer video
	* call christi
		* call at 9am
	* call trish
		* call sometime this week
	* call natalie
		* tuesday night

* fun stuff to do
	* work on DnD system


* shit to do as i get loopier cause #noSleep
	<!-- * write the description of the moonlight vids -->
		<!-- * pitches -->
		<!-- * showcase -->
	* do a bunch of more research on virtualization
	* work on DnD
	* meetings
		* christi
			* 9am
		* ambassadors
			* 2pm (probs an hour)
		* trish
			* unknown
		* natalie
			* evening







	









