# overview of sorting algorithms


* what is a good [starting point for knowing what algorithms exist](https://rosettacode.org/wiki/Category:Sorting_Algorithms)?
	* bead sort
		* the core of this sort is that if the beads are one dimension, by allowing them to fall through on another dimension they will always be sorted
			* since they will continue to fall until they rest on another bead
			* this is a really cool application of the properties of the world
	* bogosort
		* generates permutations of its input until it finds one that is sorted
	* bubble sort
		* repeatedly steps through the list to be sorted compares each pair of adjacent items and swaps them if they are in the wrong order
			* does this until no swaps are needed indicating that the list is sorted
	* circle sort
		* compares the first element to the last element swaps them if they are out of order, then compares the second element to the second last element
			* once the center of the list is reached, split it in two and apply the algorithm to half the array
				* repeat until there is only one single element in the array
					* repeat until there are no more swaps to make
	* cocktail sort
	* comb sort
	* counting sort
	* cycle sort
	* gnome sort
	* heapsort
	* insertion sort
	* merge sort
	* pancake sort
	* patience sort
	* permutation sort
	* quicksort
	* radix sort
	* selection sort
	* shell sort
	* sleep sort 
	* stooge sort
	* strand sort
	* tree sort on a linked list

* what is a [bead sort](https://en.wikipedia.org/wiki/Bead_sort)?
	* also called a gravity sort
		* natural sorting algorithm
	* overview
		* the core of this sort is that if the beads are one dimension, by allowing them to fall through on another dimension they will always be sorted
			* since they will continue to fall until they rest on another bead
			* this is a really cool application of the properties of the world
	* time complexity
		* can reach O(n) on digital and analog systems
			* slower in software and only works for positive integers
	* space complexity
		* best case O(n^2)
	* practical application
		* [white paper](http://algo2.iti.kit.edu/schultes/umc/asg2/umcasg2.pdf)
			* almost none but its so fucking cool
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Bead_sort)

* what is a [bogosort](https://en.wikipedia.org/wiki/Bogosort)?
	* overview
		* generates permutations of its input until it finds one that is sorted
	* time complexity
		* worst   case: unbounded || O((n+1)!)
		* best    case: O(n)
		* average case: O((n+1)!)
	* space complexity
		* worst   case: O(n)
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Bogosort)

* what is a [bubble sort](https://en.wikipedia.org/wiki/Bubble_sort)?
	* [DANCE INTERPRETATION](https://www.youtube.com/watch?v=lyZQPjUT5B4&feature=youtu.be)
	* overview
		* repeatedly steps through the list to be sorted compares each pair of adjacent items and swaps them if they are in the wrong order
			* does this until no swaps are needed indicating that the list is sorted
	* time complexity
		* worst   case: O(n^2)
		* best    case: O(n)
		* average case: O(n^2)
	* space complexity
		* worst   case: O(1)
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Bubble_sort)?
	* vocabulary
		* rabbits
			* large elements that move towards the end of the list will be moved quickly as they will be larger than most elements in their path and be moved multiple times per pass
		* turles
			* small elements that move towards the beginning of the list will be moved slowly as they will only be able to move once per pass

* what is a [circle sort](https://rosettacode.org/wiki/Sorting_Algorithms/Circle_Sort)?
	* overview
		* compares the first element to the last element swaps them if they are out of order, then compares the second element to the second last element
			* once the center of the list is reached, split it in two and apply the algorithm to half the array
				* repeat until there is only one single element in the array
					* repeat until there are no more swaps to make
	* [implementation](https://rosettacode.org/wiki/Sorting_Algorithms/Circle_Sort)

* what is a [cocktail sort](https://en.wikipedia.org/wiki/Cocktail_shaker_sort)
	* overview
		* basically a bubble sorts that sorts in both directions on each pass through the list
		* more efficiently takes care of the turtle problem
	* time complexity
		* best    case: O(n^2)
		* worst   case: O(n)
		* average case: O(n^2)
	* space complexity
		* worst   case: O(1)
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Cocktail_sort)

* what is a [comb sort](https://en.wikipedia.org/wiki/Comb_sort)
	* overview
		* in a bubble sort when two elements are compared they always have a gap of one
			* this is not needed
		* in the comb sort the gap between elements starts at a large and then with each pass shrinks by some arbritary shrink factor
			* reduces turtles, or the bubble sort worst cases
	* time complexity
		* best    case: theta(nlogn)
		* worst   case: O(n^2)
		* average case: omega(n^2/2^P) where p is the number of increments
	* space complexity
		* worst   case: O(1)
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Comb_sort)

* what is a [counting sort](https://en.wikipedia.org/wiki/Counting_sort)
	* overview
		* sorts a collection of objects according to keys that are small integers
			* operates by counting the number of objects that have each distinct key value and using arithmetic on those counts to determine the positions of key value in the ouput sequence
		* loops over the items computing a histogram of the number of times each key occurs within the input collection
			* performs a prefix sum computation to determine for each key the starting position in the output array of the items having that key
				* moves each item into its sorted position in the output array
	* time complexity
		* O(n + k) where k is the number of iterations
	* space complexity
		* O(n + k)
	* [implementation](https://rosettacode.org/wiki/Sorting_algorithms/Counting_sort)








































	




























