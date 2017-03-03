# notes on built-in functions in python 2.7


* what and how does the [sorted() python function work](https://docs.python.org/2/library/functions.html#sorted)?
	* what does it do
		* returns a new sorted list from the items in iterable
	* function signature
		* `sorted(iterable[, cmp[, key[, reverse]]])`
			* iterable is any object with the `__iter__` method
			* cmp 
				* specifies a custom comparison function that takes two arguments
					* return  
						* negative number
							* first argument is smaller than the second argument	
						* zero
							* first argument is equal to the second argument
						* positive number
							* first argument is larger than the second argument
					* default value is `None`
			* key 
				* specifies a function that takes one argument that is used to extract a comparison key from each list element
					* applies a transformation to the element before passing it to the cmp function
				* default value is `None`
					* compare the elements directly
			* reverse
				* a boolean value
					* `True`
						* the list elements are sorted as if each comparison were reversed
	* the key and reverse conversion processes are much faster than specifying an equivalent cmp function
		* cmp is called multiple time for each list element while key and reverse touch each element only once
			* you can use `functools.cmp_to_key()` to convert an old-style cmp function to a key function
	* stable sort

* what is an [iterable in python](http://stackoverflow.com/questions/9884132/what-exactly-are-pythons-iterator-iterable-and-iteration-protocols)?
	* an object that has an `__iter__` method which returns an iterator
	* an object that defines a `__getitem__` method that can take sequential indexes starting from zero
		* raises an `IndexError` when the indexes are no longer valid

* what is an [iterator in python](http://stackoverflow.com/questions/9884132/what-exactly-are-pythons-iterator-iterable-and-iteration-protocols)?
	* python 2
		* an object with a `next` method
	* python 3
		* an object with a `__next__` method

* what is does a [next method do in python](https://docs.python.org/dev/library/stdtypes.html#iterator-types)?
	* returns the next item from the container
		* if there are no futher items 
			* raise the `StopIteration` exception
	* corresponds to the `tp_iternext` slot of the type structure for python objects in the Python/C api

* what is [an old-style cmp function in python](http://stackoverflow.com/questions/30043067/python3-style-sorting-old-cmp-method-functionality-in-new-key-mechanism)?
	* in python3 cmp methods are not used and unavailable instead you need to create a proper key

* what secrets are [hidden within the python sorting how to](https://docs.python.org/2/howto/sorting.html)?












