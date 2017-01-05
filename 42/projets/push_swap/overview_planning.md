# overview - push_swap - 12/25/2016

YOU REFACTORED THE STRSPLIT, DON'T FORGET TO ADD IT TO LIB WHEN DONE
* functions to add to libft when done 
	* ft_strsplit
	* ft_strsearch_ov
	* ft_strtrim_c (in strsplit)
	* ft_charstr_del

* write 2 programs
		* `checker`		
		* `push_swap`			

* allowed functions
	* write
	* read
	* malloc
	* free
	* exit

* starting condition
	* 2 stacks 
		* `a`
			* a list of random positive or negative numbers without duplicates
		* `b`
			* empty

* ending condition
	* sorted in ascending order in stack `a`

* `checker` spec
	* gets the stack `a` formatted as a list of integers
		* first argument should be at the top of the stack
		* if no argument is given `checker` stops and displays nothing
	* read instructions on the standard input
		* each instruction is followed by a `\n`
		* execute instruction on the stack received as an argument
	* if stack `a` is actually sorted and `b` is empty 
		* display 'OK\n' on stdout
	* else 
		* display 'KO\n' on stdout
	* if error
		* display 'Error\n' on stderr
		* error examples
			* arguments not integers
			* arguments bigger than an integer
			* duplicates
			* instruction don't exist
			* instruction incorrectly formatted

* `push_swap` program
	* recieve as an argument stack `a` as a list of integers 
		* first argument at the top of the stack
	* display the smallest list of instructions possible to sort the stack `a` into ascending order
	* instructions are separated by a `\n`
	* during defence the number of instructions of your algorithm will be compared to a maximum number of operation tolerated 
		* if program displays a list too big or if the list isn't sorted properly you get no points
	* in case of error
		* display 'Error\n' on the stderr
		* error examples
			* arguments that aren't integers 
			* arguments that are bigger than integers
			* duplicates 

* the over lap functionality
	* receive a list of space deliminated integers as arguments
		* either with argc `2` or argc `n`
	* turn this list of text integers into proper integers in a linked list of structs
		* check the input for any possible errors
			* arguments not integers
			* arguments bigger than an integer
			* duplicates
	* perform each transformation move on two linked list
		* make it a struct array (memory is irrelevant)
		* the core functionality should work with function pointers to allow maximum flexibility

* structs
	* s_result struct
		* `int*` true_sort
		* `char*` op_list
		* `size_t` op_count
		* `int` algo_index
	* s_stack struct
		* `int*` arr;
		* `int*` brr;
		* `size_t` asize;
		* `size_t` bsize;


* checker architecture
	* turn args into `int` array
	* validate `int` array
	* receive operations from stdin
	* validate and perform operations
		* substring by new line and send each into a validation function
		* check against an array of tokens
		* the index of the token in the array corresponds to an function to be performed
		* if the arg matches one of thex tokens 
			* execute function with corresponding index
	* check to see if the list is sorted
		* if yes
			* print ok
		* else
			* print ko






