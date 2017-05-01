# April, 2017

### April, 1st, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion <- 
		* long print 
		* timesort
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files

time to implement the recursion flag. should be fun. working on recursion, make sure it works right.

### April, 2nd, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
		* - alone should be passed as argument
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion <- 
		* long print <- 
		* timesort
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files <-

need to do some testing on the recursion flag but it looks to be working appropriately.

my printing isn't the same as theirs. i need to change how print for args.

when i pass file args, the directory of the file also ends up getting printed which is not right.

done with recursion. on to long print.

i'm having these issues with the block size need to ask someone about it. 

finished the hidden files stuff.

all that's left is the reverse sort, the time sort and the sticky bit thing.

4096	/	512	= 8 	%0 		tot no round: 8		tot round: 8	tot up: 8
3248	/	512	= 6 	%176	tot no round: 14	tot round: 14	tot up: 15
14		/	512	= 0 	%14		tot no round: 14	tot round: 14	tot up: 16
9		/	512	= 0		%9		tot no round: 14	tot round: 14	tot up: 17
4096	/	512	= 8 	%0 		tot no round: 22	tot round: 22	tot up: 25
4096	/	512	= 8 	%0 		tot no round: 30	tot round: 30	tot up: 33
64876	/	512	= 126 	%364 	tot no round: 156	tot round: 157	tot up: 160
4096	/	512	= 8 	%0 		tot no round: 164	tot round: 165	tot up: 168
4096	/	512	= 8 	%0 		tot no round: 172	tot round: 173	tot up: 176
4096	/	512	= 8 	%0 		tot no round: 180	tot round: 181	tot up: 184
4096	/	512	= 8 	%0 		tot no round: 188	tot round: 189	tot up: 192
196608	/	512	= 384	%0		tot no round: 572	tot round: 573	tot up: 576

woooooo i figured out the fucking thing with the block size. 

all that's left is sorts and the sticky bit and then i'm ready for extensive testing. 

fuccccccck. i need to redo how my program executes on files. you know what. fuck it. hopefully no one will notice.

### April, 5th, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
		* - alone should be passed as argument
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion 
		* long print  
		* timesort <-
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files 

the dreaded time sort is here. fuckkkkkk. okay so the order is seconds, then nano-seconds, then lexical. i honestly need to redo the whole thing cause it's bad.

got it pretty much done just need to apply it to the strlist.

found a solution that is better for all of this. it will also allow me to fix the column issue that was bound to come up during corrections.

i will treat files and directories seperately. do the same thing i'm doing now to seperate them. on files i check to see if it ends with a slash, if so it's not a valid file or directory. i attempt to extract it's access path and find the file. if the file is not found then it's not a valid file. i add the file to a file list as i go. then i sort the filelist by the appropriate sorting method, and execute the ls like function on them. basically completely different pipeline than for directories.

for directories. i sort them approriately lexically, and then if it's a time sort i'm not sure what i do. this basically should be my focus tomorrow. if i figure this out i'm pretty much done.

wow the rush for this weekend looks pretty complex.

### April, 6th, 2017

so to handle the arguments basically files will be left alone and then a custom ls function will be used for them. 

for directories. first i'm going to lexically sort it. then i'm just gonna open them all the fuck up throw their "." in a filelist and sort the fucker. i'm gonna have to build yet another sorting algorithm that handles both these things but you know what. its. time. to. stop. being. smart.

### April, 10th, 2017

i can keep the flag inside the function i just need to set it equal to i within the parent and then set it after. this is pretty disgusting but fuck it.

* plan for tonight
	* finish this argument handling thing
	* research minishell

next is handling files.

i'm going to just open up all the files and add them to a filelist and then just run basically ls on this filelist. that way they will be validated in "order" and the weight of sorting will be handled by the ls functionality.

okay. so. now i have two problems. first off the path names are different for files and directories. second the columns are kinda of off for files. i think this is where i give it a shot more or less and see what happens. might be able to push it through.

next is norming and testing. 

taking a break from ls for a second to read the minishell subject and start research.

for minishell i'm not overengineering. i'm going to implement each project as i go in the set, and then refactor / scrap as necessary. the goal for this set of projects is to practice scorched earth development.

my first research step is to go deeeeeeep into the arcane, and learn the ins and outs of the GNU shell. this is likely going to take a while, if i do 2-3 hours a day it should probably take me roughly a week and change to complete read it through. 

so for some reason i'm crashing on long printing ft_printf/src. and the program just generally freaks out on that one. apparently it's because of the number of files in the directory. 82 is my limit? 

### April, 12th, 2017

okay well fuck it. i'm just gonna not allow those filelist to have more than 80 files and hope it passes.

this is gross. I just disallowed the directories that were segfaulting me. super fucking gross. but should get it through. god it's gross. pretty close to submiting now i guess. i should focus on more research in the afternoon. god it's gross. 

it's still gross. i'm ready to norm though pretty sure.

okay, tomorrow there is a correction point sale. so the goal of today is getting both ls and push_swap ready to be corrected. this is gonna be rough, cause time. ls just needs to be normed at this point, and most of it is simple norming stuff. push_swap is entirely done except for the algorithm, and mostly normed as well.

* plan to be ready for tomorrow
	* implement common algo in python
	* implement common algo in C
	* norm ls
		* norm in the spot for tomorrow
		* preferably the spot where you already did all the gross stuff
	* norm push_swap

for push swap the algorithm is basically a shortest path algo, for each element in the list.

### April, 13th, 2017

I JUST HAD A BREAKTHROUGH ON PUSH SWAP!!!!! 

this algo might actually work. it's a really nice optimization on the shortest path algo people have been using. basically we can think of stack b as a belt. the only thing that matters is that the min value is to the left of the max value at all times. so if something is found to be the max or min value it must be immediately moved to that point. so long as this principle holds we should be able to insert anywhere in the list in a sorted fashion and never have a worry. simple insight that holds little worth until we combine it with the shortest path algorithm, which determines the next spot to place a element based on the additive rotation distance on the two stacks. this makes sure we are always making the cheapest move. the capital value is that it allows us to take advantage of natural runs, as well as make it likely that we are kept towards the center of the sorted stack, thus decreasing the max possible distance and the cost of turtles and rabbits. the key problem here is that movement is so expensive that minimizing it is the only way to go, which means that high overhead solution are completely unfeasible.

to formalize.

* formal concept
	* min must always be to the left of max
		* if the value to push to the stack is a new min then it must be placed to the immediate left of max
	* max must always be to the right of min
		* if the value to push to the stack is a new max then it must be placed to the immediate right of max
	* minimize movement by moving the element that will have the least cost
	* no need to place anything in stack b

### April, 18th, 2017

Worked on jgravity yesterday. physics is super fucking cool. trying to simulate the universe. like that shit is crazy.

woooooo! finished implementing my algorithm in push_swap. makes me really happy. however i now need to find some simple algorithms for size 3 and 5. just a stone throw away from being able to submit this project.

reflecting on it this was a great project. i really did develop the beginnings of an algorithmic intuition, as well as the start of a mathematical intuition. i found a huge amount of resources on how to find and understand algorithms. this school fucking rocks.

for my algorithm for 3 i should be able to do it with just a rotation and a swap. there are a few possible states.

* sort for 3 elements
	* a[0] > a[1] > a[2]
		* 10 > 9 > 8
			* sa: 9, 10, 8
			* rra: 8, 9, 19
		* sa(); rra();
	* a[0] > a[1] < a[2]
		* 10 > 8 < 9
			* ra: 8, 9, 10
		* ra();
	* a[0] < a[1] > a[2]
		* 8 < 10 > 9
			* rra: 9, 8, 10
			* sa: 8, 9, 10
		* rra; sa;
	* a[0] < a[1] < a[2]
		* nothing

for my algorithm for 5 i'm gonna turn it into an algorithm of 3 with a simple merge at the end.

basically immediately pb twice and then run the size three algorithm, and then merge the remaining two. i can further optimize that in a bunch of ways. i just really don't want to.

### April, 19th, 2017

we got the physics simulation working with a simple demo!

### April, 20th, 2017

set up my station in the bocal today, which is pretty sweet. 

my checker has two issues. it is tolerant of spaces, and it doesn't check for incorrect input.

and i'm done. finsihed push_swap. woooooo. now to correct it....

actually, before calling it a night, i'm gonna push through and norm ls too.

### April, 23rd, 2017

so on thursday we give kwame our decision on jgravity. i wanna have a huge chunk of lem_in done by then. 

lem-in is straight forwardish. the most complicated part is the parsing, and the data representation, after that it's pretty straight forward.

so i have multiple phases of processing. the easiest way to handle that is to make a function array and cycle through it. also managing state is a pain. i think i can pass in a phase id and then return a phase id, basically it wil perform something base on the phase id it receives (in many cases do nothing) and then based on what happens return the phase it should be in.

actually no. i'll pass in a pointer, and return whether it should be run again or not. i'm cascading through the possible options.

i'm just gonna do the parsing today. the shoving in structures i'll do tomorrow.

### April, 24th, 2017

okay z3 is shut down for a while, so i'm going to just make my ls work on my current computer and submit it.

### April, 25th, 2017

i got ls corrected today! now i'm finally focused on lem-in. it also seems that for jgravity we will have a large team. i'm worried that it will be unmanagable but we will have to see.

okay lem-in.

when i'm done reading input i'm gonna have a validator function that will go through and make sure that we are dealing with a valid map.

how do i deal with `##start` and `##end`. what if i just got the next line? cool that works. so then i will just grab the next line and pass it to a store room function, which will accept an char* input, the farm struct, and a flag detailing whether it be the start, end, or simple room.

but before i can build these i must build my map structs contained in farm. i have a few structs here. actually i can just have one, with special pointers. oh god the amount of functions i'm going to be building is obnoxious. infastructure ftw. oh god. i thought i was going to be able to just point to all of the nodes and be done with it. but no. the lists would intefere with each other if there is any over lap. a hash table is starting to seem more and more useful. plus i'll have it for other problems down the road.

wait. fuck that.

i can make a linked list, where the contents are a char* for name, char** for connections. i have a libray to handle all the complex aspects of that, and as god awful as it may be to reallocate that many times it gets the fucking job done. 

so in this implementation i'll need a check function that will make sure that both names in a link are valid names. then for adding connections i'll also have a function. as far as traversing, i'll basically breath first check and then start recursing down from the end of the list. as i go i'll update a char** representing a path. god. this is how awful software is made. 

okay my infastructure is made more or less. next thing to do is to shove all the data in there.

# April, 30th, 2017

back to lem-in.

i already implemented some of the infastructure.

lol i tried to implement store links without implementing store rooms.

now the room storing is implemented.






























