# May, 2017

### May, 1st, 2017

man i'm tired haha. starting at 23:41 today, but hey hackers gotta hack. working on lem-in. 

pretty sure i need to implement link storing at this point. wait i implemented link storing already.

wait fuck am i done with data storing? it seems like it....

well in that case screw it i'm further ahead than i thought. i'm just gonna detail out my steps for the next session and get out of here. lol when was the last time this happened? this is a nice feeling.

basically as i traverse starting at the start node if i find the end node i stop. i keep track of where i am as i go, kinda like hensel and grettle with breadcrumbs, and when i find where i'm going i just list that path.

the way i'm going to do that is find the node starting from the start and then breath first search from the bottom of it's connections list. this will be done in a recursive fashion, with a `char**` in the `t_farm` variable being added to and removed from as we traverse, detailing the path. at each node a scan will be performed to determine if a path to the end has been found. once found i stop.

* recursive traversal through the tree
	* scan connections of current node
		* if end found return 1
		* if terminal node return 0
	* add n - ith connection to the path `char**`
	* recurse into the n - ith connection
	* if recurs returned 0
		* remove the n - ith connection from path `char**`

after that i just need to build the output functionality and i should be done?

### May, 3rd, 2017

taking naps before dinner is a good idea. i feel much better.

so first step is implementing the path finding algorithm.

* recursive traversal through the tree
	* scan connections of current node
		* if end found return 1
		* if terminal node return 0
	* add n - ith connection to the path `char**`
	* recurse into the n - ith connection
	* if recurs returned 0
		* remove the n - ith connection from path `char**`

### May, 5th, 2017

okay figured out how to spot cycles. basically any node i've passed through in the passed is ignored in subsequent checks. and if a path ends up with no more places to go it dies. 

* recursive traversal through the tree
	* scan connections of current node
		* if end found return 1
		* if terminal node return 0
	* add n - ith connection to the path `char**`
	* recurse into the n - ith connection
	* if recurs returned 0
		* remove the n - ith connection from path `char**`


holy shit.

it worked.

fuckkkkkkkk yea.

now i just need to do the output and i'm good.

okay the ouput is actually going to take a little thinking. an a white board. not today. i'm gonna set up to maximize trip to the city.

### May, 7th, 2017

okay for the hercules i need to understand socket programming.

wooooo.

eh, i'm not sure what they mean by proxy so i'll ask Mason about it.

okay so for the output for lem-in.

there are 3 states. waxing, constant, waning.

### May, 10th, 2017

woo finished lem-in.

### May, 11th, 2017

cleaned up my leaks on ft_printf. I should probably go through and like clean up all my libraries. Hell i could build my hash table mini library. yea let's do that. let's make today a library day.

okay i'm gonna make a hash table.

actually before that let's take care of important things. first i need to make sure my lem-in is good to go. then i need to do that write up for smart locus.

oh god my char** library is definetly leaking like crazy. ughhhhh. oh well this is what i get for being lazy at inception. 

will focuse on smart locus first because that is more immediately important. 

kk the smart locus thing is done. 

okay now designing a hash table. hash tables have a few components.

* hash table
	* storage
		* we need to keep these values somewhere
	* hashing
		* they need to create a unique number that can be tied to a index
	* collisions
		* what happens when a value generates the key

i actually just need the hash table interface. i don't need the O(1) aspect. so i can just do a linked list.














