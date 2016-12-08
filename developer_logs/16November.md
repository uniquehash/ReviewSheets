# November

### November 12th 2016 - working on printf

i've more or less figured out how i'm gonna parse the strings. hopefully it can be as recursive as i want it to be. looking forward to writing a summary after i see the feasability of the basics.

i imported the functions from my libft i think i will need to use in the project. This will hopefully make using it in conjunction with libft simpler and less brittle.

### November 13th 2016 - working on printf

let's get this parsing thing done (it didn't get done)

### November 14th 2016 - working on printf

no seriously let's get this string parsing thing done. using stric to find the current char in the string within the array of key chars.

this never happened :(

### Novemeber 21st 2016 - priority TGF

first thing i got to do is figure out what the fuck i'm doing.

analytics
	implementing the event components on the server for heap analytics 
	implementing the identity tie to the users (email) for heap analytics 

facebook
	implement a programic share to facebook button in the sharings

ux
	add "help text" concept to the avatars world and community

so basically i'm going to have to add a whole bunch of javascript to the sharing settings. kinda of annoying but at least there really isn't any js infastructure there to read through first. i can straight implement. 

fuckkkkkkk. i need to do page specific javascript in browse, manage ect... to make this work. bright side it means i don't have to change anything about the russian doll partials i have set up. kinda blows. 

basic idea for hover help text
	add javascript that will insert a hover hijack basically on world and community elements
		make function generalized and take a global that has the appropriate source in it
		since this needs to be specific to each page its no biggie to use globals like this

i can use the mouseEvent tracker i labored over in the drag and drop to do this which is pretty sweet. saves me a lot of boilerplate.

instead of doing some crazy runtime checking i can use a specific selector to isolate and only attach the listeners to the appropriate divs.

pretty much managed to finish the ux component of these tasks which is good. need to tackle facebook and sharing tomorrow.

### November 22nd 2016 - priority TGF

okay lets break down the facebook component.

facebook
	implement a programic share to facebook button in the sharings
		add a __facebook__ group into the sharing settings stream
		add the help text hover over community and world
		add a javascript catch for the facebook button that will start the share dialog

added the group to the stream. gotta love good architecture. that could of been such a pain in the ass.

implemented the help text hover, though it's definetly going to need to be changed. Phillip needs to look at it first.

### November 24th 2016 - back to printf

here we go again, gotta finish this string parsing sittuation.

all right so i'm gonna have my three symbol detection algorithm functions. 

* symbol detection algorithm
	* single-character single-symbol
		* `int ft_printf_strchri(char const *s, char const *c, size_t *index)`
			* description
				* `ft_printf_stric` will search through `s` for any of the characters in `c`. if found it will return 1 and set `*index` to the index in string `s` of character `*c`
			* parameters
				* `char const *s`: a string to search
				* `char const *c`: a string filled with characters to find
				* `size_t *index`: the reference to a size_t that will contain the index of character if found
			* returns
				1: character found
				0: character not found
				-1: error
	* single-character multi-symbol
		* `int	ft_printf_1chrNsym(char const *s, char const *c, char **s_str)`
			* description 
				* `ft_printf_1chrNsym` will search through `s` for any of the charactes in `c`. if found it will append character `*c` to the string `*s_str` and continue to append characters in `s` that match `c` to `*s_str` until it finds a non-matching character then it will return 1.
			* parameters
				* `char const *s`: a string to search
				* `char const *c`: a string filled with characters to find
				* `char **s_str`: a reference to a string to append found characters too
			* returns
				1: character found
				0: character not found
				-1: error
	* multi-character single-symbol
		* `int	ft_printf_Nchr1sym(char const *s, char const **c, char **s_str)`
			* description
				* `ft_printf_Nchr1sym` will search through `s` for any of the symbols in `c`. if found it will append the character `**c` to the string `*s_str` and search for the next character in the symbol. multi-character symbols should be placed at the end of the array of symbols. 
			* parameters
				* `char const *s`: a string to search
				* `char const **c`: an array of strings filled with symbols to find
				* `char **s_str`: a reference to a string to append found symbols too
			* returns
				1: character found
				0: character not found
				-1: error

so now my symbol and character detection functions are functioning. These are insanely flexible and will allow me to add any type of flag to my function. 

### November 25th, 2016 - printf continues 

#### questions 
	
* what happens when you automatically allocate memory in an array but do not initialize it in c?
	* no idea

* [can you increment function pointers like normal pointers](http://stackoverflow.com/questions/5085366/incrementing-function-pointers)? 
	* no
		* function pointers can not do pointer arithmatic


#### explore 

* facts 
	* the conversions themselves are single-character acii
	* i need to know the type of the data before i can get it from the ellipsis
	* the length modifiers will alter the data-type of the conversion
 
* desires 
	* i want avoid long ass if else statements if at all possible 
	* i want my overall structure to be recursive, cause sexy

* links
	* there is a 1 to 1 relationship between the interface to the ellipsis and the data-type it returns
	* there is a 1 to 1 relationship between a single ascii characters and decimal numbers 
	* there is a 1 to 1 relationship betweem converting arbritary data-type to `char *`


* plan 
	* i can have individual functions for each retrieval desired data-type possible
	* i can have individual functions for each conversion of data-type to `char*`
		* possible i can combine this with the above 

	* i can use various arrays of functions to iterate through options
		* string parsing function array
			* function for each modifier type
			* each function increments the pointer to the sequence and passes it to the next one 
		* modifier apply function array
			* function for each modifier type


	* i can use the conversion acii digit as an index since it is single digit, there will be no collisions
		* this can be the index of an `char*` array of function pointers 
			* the function called can then have a specific behavior for the length modifier
				* this will be a series of if else functions that will call the appropriate ellipsis retrieval function

### November 26th 2016

so now i'm worling on my apply functions. this project was my first step in intuitive technology design. slowly but surely i'm developing an intuitive understanding of bits the same way i understand cells. 

looks like i have to start fucking around with the ellipses and variadic functions a little sooner than anticipated. they also can't be passed around which makes them a total pain in the ass. 

man this whole "compiled" language thing is a major pain in the ass and forcing me to do all these hacky things, or face the cascading switchcase of death (fuck that). 

just realized. i don't need to do the hack, i can just do the conversions right off the bat by passing the va_arg results to the conversion function.

### November 27th 2016 - printf

super stoked i didn't have to use the illllll hack. basically the structure is done. I should grind through the conversions before i do anything. Ugh. where have my grinding skills gone? use to be my game. well logically, if i use to be able to do it, i can still do it. i just have to suck it up and stop being a little bitch and go. ha. i just remembered the mantra for this. for pushing myself. "Fuck you, do more".

ugh. i'm going to run into this typing problem quite a bit. i'll just write a function that doesn't care what the size of the number is, it just turns it into a `char*` regardless. it's gonna have to take in a `void*` to get arround the annoying typing sittuation. that isn't going to work at all. can't dereference a `void*` since the data type dictates the size in memory to the compiler. 

new option, write 2 `itoa_base` functions each for the largest data type possible, which will encompass all integer datatypes since downcasting is no biggie. one of the `itoa_base` will handle signed, and one will handle unsigned.

### November 28th 2016 - tgf

doing some bug fixes as well as a few feature reconfigurations.

* total tasks
	* self-avatar
		* can definetly be done today 
		* manage families
			* see your own avatar and info in view members
				* remove all button actions
		* manage accounts
			* change "personal" to your name 
				* same format as viewing members
	* add middle initial to front end
		* talk to designers (phillip)
	* create page changes
		* can definetly be done today 
		* change the order of the create page items
			* basically going to have to have a "mobile page" that's almost the same thing ready to go
				* anything different would be needlessly complicated
	* integrate heap analytics onto serverside
		* may be done today 
	* how to shuffle videos
		* may be done today
	* design and implement organizations
		* this is gonna take a bunch of thinking, don't even bother till a few days from now.
	* create pdf bug
		* explore 

* tasks reasonable for today
	* ~~create pdf bug~~
		* ~~explore~~
	* ~~self-avatar~~
	* ~~create page changes~~

the self-avatar thing should be pretty straight forward. the lack of seeing your-self was a "handled case" to begin with. oh i can just shift the case from not seeing yourself at all to seing yourself but no buttons that shouldn't be too bad.

definetly an improvement to have your name be there instead of personal. like super improvement. had to dig up a bunch of code but the actual change was minimal, which always feels good.

next up fixing the create writing bug. 

### November 29th 2016 - heap analytics

it's finally time to add the code portion of heap analytics to the app.

* two components
	* the identify api
		* use to attach an identiy to the user on the heap side, making it easier to group and understand who is doing what
			* this should be as simple as adding a little javascript
				* nope since the piece of information (email) i want to tie is part of the current user object which is rails i need to first pass the info to the info to the front end
					* :(
		* wooo this is done	
			* wasn't too hard, thank the tech gods
	* the server side api 
		* used to trigger heap events from the server
			* more things to track with finer control
			* unfortunately there is no way for this to be retro active, for obvious reasons	
		* theres suppose to be a gem to use to do this easily
			* we shall see
			* turns out it was pretty straight forward
				* good thing i did the identity thing first other wise it wouldn't have worked right
				
### November 30th 2016 - printf

my shiftstr is causing the length global to spill over into the conversion global. i need to fix it to prevent it from doing that. of the top of my head doing something with the strlen is probably the call, a little math goes a long way.













