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

### May, 12th, 2017

well fixed my mini char ** lib. no more memory leaks. this is the testing main:
```
// test for char** lib
// char			** ft_fstrlist_add(char **strlist, char *str);
// char			** ft_strlist_add(char **strlist, char *str);		--
// char			** ft_strlist_build(size_t size);					--
// void			   ft_strlist_del(char	***strlist);				--
// int			   ft_strlist_findindex(char **strlist, char *str);	--
// size_t		   ft_strlist_len(char	**strlist);					--
// char			** ft_strlist_minus(char **strlist);				--
// void			   ft_strlist_print(char **strlist);				--
// char			** ft_strlist_remove(char **strlist, char *str);	--
// int	main(void)
// {

// 	char **list;

// 	list = NULL;
// 	while (1){

	// build
	// list = ft_strlist_build(3);
	// list[0] = ft_strdup("one");
	// list[1] = ft_strdup("two");
	// list[2] = ft_strdup("three");

	// add
	// list = ft_strlist_add(list, "one");
	// list = ft_strlist_add(list, "two");
	// list = ft_strlist_add(list, "three");

	// find index
	// printf("index of %s is %d\n", "two", ft_strlist_findindex(list, "two"));

	// len
	// printf("size of list: %zd\n", ft_strlist_len(list));

	// minus
	// list = ft_strlist_minus(list);

	// remove
	// list = ft_strlist_remove(list, "two");

	// ft_strlist_print(list);
	// ft_strlist_del(&list);

	// sleep(100);}
// }
```

eventually i will want to incorporate it into my libft.

i probably still have memory leaks. so it's time to look into that.

oh god my get next line has leaks. whelp. that is going to take a while. this will not be ready by the correction point sale :(

### May, 13th, 2017

I BUILT A FUCKING HASH MAP IN C WOOOOOOOOOOOOOOO!!!!!!!!! FUCK YEA.

### May, 20th, 2017

ugh. i can't believe i forgot the author file. so stupid. so very stupid.

okay the contact email thing is out of hand. i talked to Mikhail about some breaking into ML stuff to deal with it. it's all text classification, which as it turns out is well explored problem.

* text classification
	* subset
		* spam classification
	* possible frameworks
		* fast text facebook
	* possible libraries
		* keras
	* simple models
		* bag of words
		* random forrest
	* advanced models
		* lstm
		* rnn
	* education resources
		* stanford course on nlp
			* cs224: nlp with deep learning
	* vocab
		* word embeddings
			* word2vec
			* GloVe
	* implementation details
		* tf-idf
		* stop words
		* n-gram

### May, 24th, 2017

Man what an exhausting trip to nyc. well back to code. so lets architect this minishell a little.

so minishell is basically reading data via the command line, handling environment variables, handling path, handle errors without errno, building the buil-ins.

so the built-ins should go last. since they use everything else. errors should be done as i go, since their pretty integral. PATH should go before environment variables, since it will influence the design. taking in information should probably go first? it kinda doesn't matter cause it's a siloed component. that's the interpreter. 

* minishell
	* research errno and uderstand how it works
		* design a shitty
		* build a shitty errno
	* refresh on bash interpreter
		* design a shitty interpreter for this set of requirements
		* build a shitty interpreter
	* research the intricacies of how the PATH variable works
		* design a proper PATH setup
		* build a proper PATH setup
	* design a decent environment variables set up
		* build it
	* start working on the built-ins
		* build setenv
		* build unsetenv
		* build env
		* build exit
		* research echo
		* research cd
	* bonus
		* research how to hook up man pages in my shell
			* this probably works out of the box with the PATH

cool that's a decent plan. i'll leave it be until i start.

gonna work on that article.

### May, 26th, 2017

working on minishell. first going to do some research on errno.

what does minishell require as intepreter functionality. let us see.

* interpreter
	* display prompt
		* simple can be anything
	* receive input
		* something like get next line should work
	* interpret input
		* this is where it gets dicy
			* tokenize the input
				* classify as either word or operator
			* parse tokens as simple commands
			* shell expansion
	* act on interpretation

okay! wonderful news! my new gnl doesn't work right on fd 0, 1, 2. which of course is what minishell is all about. so imaaaaa have to rewrite it before i finish! gonna leave it alone for now and use an old crappy one but yea no bueno.

alright i am now reading a line woooooo. lol. next is tokenizing the input. 

### May, 27th, 2017

working on the interpreter. okay i was thinking way to complicated for the scope of the problem. though i will have to scrap everything when i move forward, this will give me a far better idea of how this shit works.






















