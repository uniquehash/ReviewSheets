# notes on the list data structure in python, thank you google for making me do this research hahaha

* what is a [list in python](https://python.swaroopch.com/data_structures.html)?
	* a data structure that holds an ordered collection of items
		* a sequence of items

* how are [lists implemented in python](http://stackoverflow.com/questions/914233/what-is-the-underlying-data-structure-for-python-lists)?
	* list objects are implemeneted as arrays
		* optimized for fast fixed-length operations
		* incur O(n) memory movement costs for pop(0) and insert(0, v) operations which change both the size and position of the underlying data

* what are the [methods of the list object](https://docs.python.org/2/tutorial/datastructures.html)?
	* instance methods
		* list.**append**(x)
			* adds an item to the end of the list 
			* equivalent array operation
				* `a[len(a):] = [x]`
		* list.**extend**(L)
			* extend the list by appending all the items in the given list
			* equivalent array operation
				* `a[len(a):] = L`
		* list.**insert**(i, x)
			* insert an item at a given position
				* i: index of the element before which to insert
				* x: element to insert
		* list.**remove**(x)
			* remove the first item from the list whos value is x
			* error if no item
		* list.**pop**([i])
			* remove the item at given position in the list and return it
				* if no index specified defaults to last item in the list
		* list.**index**(x)
			* return the index in the list of the first item whose value is x
			* error if there is no such item
		* list.**count**(x)
			* return the number of times x appears in the list







































