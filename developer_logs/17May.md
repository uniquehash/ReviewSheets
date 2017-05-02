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




