# research - push_swap - 12/25/2016


* what is the goal of the push_swap project?
	* write 2 programs
		* `checker`
			* takes integer arguments
			* reads instructions on standard output
			* executes instructions
			* displays ok if integers are sorted
			* displays ko if integers are not sorted 

		* `push_swap`
			* calculates and displays on the standard output the smallest algorithm using `Push_swap` instruction language that sorts integer arguments received

* what is the `push_swap instruction language`?
	* the series of operations we are allowed to use to create a sorting algorithm for `push_swap`
	* operations
		* `sa`
			* swap a
			* swap the first 2 elements at the top of stack `a`
			* do nothing if there is only one or no elements
		* `sb`
			* swap b
			* swap the first 2 elements at the top of stack `b`
			* do nothing if there is only one or no elements
		* `ss`
			* swap a and swap b at the same time
		* `pa`
			* push a
			* take the first element at the top of `b` and put it at the top of `a`
			* do nothing if `b` is empty
		* `pb`
			* push b
			* take the first element at the top of `a` and put it at the top of `b`
			* do nothing if `a` is empty
		* `ra`
			* rotate a
			* shift up all elements of stack `a` by 1
			* first element becomes the last one
		* `rb`
			* rotate b
			* shift up all elements of stack `b` by 1
			* first element becomes the last one
		* `rr`
			* rotate a and rotate b at the same time
		* `rra`
			* reverse rotate a
			* shift down all elements of stack `a` by 1
			* the last element becomes the first one
		* `rrb`
			* reverse rotate b
			* shift down all elements of stack `b` by 1
			* the last element becomes the first one
		* `rrr`
			* reverse rotate a and reverse rotate b at the same time


* what is [complexity in terms of algorithms](https://en.wikipedia.org/wiki/Analysis_of_algorithms)?
	* the efficiency of algorithms is determined in relation to the input length in two dimensions
		* [time complexity](https://en.wikipedia.org/wiki/Time_complexity)
			* quantifies the amount of time take by an algorithm to run as a function of the length of the string representing the input
		* [space complexity](https://en.wikipedia.org/wiki/DSPACE)
			* represents the total amount of memory space that a normal physical computer would need to solve a given computational problem with a given algorithm
	* multiple notations have been developed to describe this phenomenon
		* [big O notation](https://en.wikipedia.org/wiki/Big_O_notation)
			* notation that characterizes functions according to their growth rates
		* big-omega notation
			* math
		* big-theta notation
			* math
	* time efficiency estimates depend on what is defined to be a step
		* two cost models are generally used
			* uniform cost model
				* assigns a constant cost to every machine operation, regardless of the numbers involved
			* logarithmic cost model
				* assigns a cost to every machine operation proportional to the number of bits involved

* what is a [sorting algorithms](https://en.wikipedia.org/wiki/Sorting_algorithm)?
	* an algorithm that puts elements of a list in a particular order
		* formal conditions
			* ouput is in nondecreading order
				* it's in order
			* ouptut is a permutation of the input
				* output has all of the elements in the input

* [how are sorting algorithms classified](https://en.wikipedia.org/wiki/Sorting_algorithm#Classification)?
	* computational complexity
		* algorithms have particulare situtations which they are optimised for 
			* worst
				* time complexity for the worst case scenario for that algorithm
			* average
				* time complexity for the average case scenario for that algorithm
			* best
				* time complexity for the best case scenario for that algorithm
	* computational complexity of swaps
		* specifically for in-place sorting algorithms
	* memory usage
		* the amount of memory the algorithm uses while sorting
		* in-place algorithms are always O(1)
	* recursion
		* algorithms can employ recursion
			* recursive
				* uses recursion
			* non-recursive
				* does not use recursion
			* both
				* uses both
	* stability
		* to what degree does the algorithm maintain the relative order of records with equal keys
	* are they a comparison sort
		* a comparison sort examines data only by comparing two elements with a comparison operator
			* comparison sort
			* not comparison sort
	* general method
		* multiple methods can be used to sort
			* insertion
			* exchange
				* bubble sort
				* quicksort
			* selection
				* shaker sort
				* heapsort
			* merging
			* partitioning
	* parallel or serial
		* whether the algorithm is run in series or in parallel
			* parallel
			* serial
	* adaptability
		* whether or not the presortedness of the input affects the running time
			* algorithms that take this into account are called adaptive

* what does [stability mean in relation to sorting algorithms](https://en.wikipedia.org/wiki/Sorting_algorithm#Stability)?
	* when sorting some kind of data only part of the data is examined when determining the order
		* you can only sort by a subset of all the characteristics of the data
	* stable means that aside from the sorting characteristic order in the input the second priority sorting characteristic
		* all other characteristic of the data is ignored for the purposes of sorting


* how do [sorting algorithms work](https://en.wikipedia.org/wiki/Sorting_algorithm)?
	
* what is a [comparison based sorting algorithm](https://en.wikipedia.org/wiki/Comparison_sort)?
	* a sorting algorithm that only reads the list elements through a single abstract comparison operation
		* compares on a single feature two elements and determins which should be before the other
	* examples of comparison sorting algorithms
		* quick sort
		* heap sort
		* merge sort
		* intro sort
		* insertion sort
		* selection sort
		* bubble sort
		* odd-even sort
		* cocktail sort
		* cycle sort
		* merge insertion sort
		* smooth sort
		* timsort


* what is [integer sorting](https://en.wikipedia.org/wiki/Integer_sorting)?
	* a subset of algorithmic sorting problems
	* the key is that with integer sorting you can perform integer arithmetic on the keys allowing for shortcuts that would normally not be possible
	* time bounds for integer sorting algorithms depend on three parameters
		* number `n` of data values to be sorted
			* input size basically
		* the magnitude `k` of the largest possible key to be sorted
		* the number `w` of bits that can be represented in a single machine word
	* designed to work in particular models of computation
		* [pointer machine](https://en.wikipedia.org/wiki/Pointer_machine)
			* recieves input and transforms it into output
		* [random access machine](https://en.wikipedia.org/wiki/Random-access_machine)
			* a counting machine with the ability to indirectly access registers
	* the classic integer sorting algorithms
		* pigeonhole sort
		* counting sort
		* radix sort



* what is the [pointer machine model of computation](https://en.wikipedia.org/wiki/Pointer_machine)?
	* recieves input and transforms it into output

* what is the [random access machine model of computation](https://en.wikipedia.org/wiki/Random-access_machine)?
	* a counting machine with the ability to indirectly access registers

* what are [models of computation in terms of sorting algorithms](https://en.wikipedia.org/wiki/Model_of_computation)?
	* nothing to do with sorting algorithm, has to do with computability theory
	* the definition of the set of allowable operations used in computation and their respective costs
		* by assuming a particular model of computation it is possible to analyze the computational resources required or to discuss the limitations of algorithms or computers
	* basically how does the system compute things 
	* two broad categories
		* [abstract machine and models equivalent](https://en.wikipedia.org/wiki/Abstract_machine)
			* a theoretical model of a computer hardware or software where the computing processes are abstracted
			* assumes a discrete time paradigm	
		* [decision tree models](https://en.wikipedia.org/wiki/Decision_tree_model)
			* algorithmic processes are considered to be decision tree's a sequence of operations based on a comparisons of some quantity the comparison being assigned the unit computational cost
* the fuck is [computability theory](https://en.wikipedia.org/wiki/Computability_theory)?
	* basicaly indepth study of computation
		* things about questions like
			* what does it mean for a function on the natural numbers to be computable?
			* how can noncomputable functions be classified into a hierarchy based on their level of noncomputability?
		* kinda like the logical consequences of being able to do computation


* what is a [in-place based sorting algorithm](https://en.wikipedia.org/wiki/In-place_algorithm)?
	* an algorithm that transforms input using no auxiliary data structure
		* examples 
			* bubble sort
			* comb sort
			* selection sort
			* insertion sort
			* heapsort
			* shell sort
			* quicksort

* any good graphic visualization of time complexities for sorting algorithms?
	* [sorting algorithms animations by toptal](https://www.toptal.com/developers/sorting-algorithms)

* any background information on [stack sorting algorithms](http://liacs.leidenuniv.nl/~rijnjnvan/ds2013/assets/opdrachten/opdracht1-stacksorting.pdf)?























	
