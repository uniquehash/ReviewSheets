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
	* implemented with a Timsort
	* python lists have a built-in `list.sort()` method that modifies the list in-place
		* `sorted()` builds a new sorted list from an iterable
	* sorting basics
		* a simple assorted sort is very easy
			* use the sorting function
				* `list.sort()`
					* is slightly more efficient than `sorted()` but is destructive
	* key functions
		* both `list.sort()` and `sorted()` have a key parameter to specify a function to be called on each list element prior to making comparisons
			* example
				* case-insensitive string comparison
				```
					>>> sorted("This is a test string from Andrew".split(), key=str.lower)
					['a', 'Andrew', 'from', 'is', 'string', 'test', 'This']
				```
		* the value of key parameter should be a function that takes a single argument and returns a key to use for sorting purposes
			* key function called exactly once for each input record
		* common pattern is to sort complex objects using some of the objects indices as keys
			* example
			```
				>>> student_tuples = [
					('john', 'A', 15),
					('jane', 'B', 12),
					('dave', 'B', 10),
				]
				>>> sorted(student_tuples, key=lambda student: student[2]) # will sort by age
				[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
			```
	* operator module functions
		* operator module	
			* python provides convenience functions to make accessor functions easier and faster
			* `operator.itemgetter()`
				* grabs an iterable items property by index
				* example
				```	
					>>> from operator import itemgetter, attrgetter
					>>> sorted(student_tuples, key=itemgetter(2))
					[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
				```
			* `operator.attrgetter()`
				* grabs an key-lookup property by key
				* example
				```
					>>> from operator import itemgetter, attrgetter
					>>> sorted(student_objects, key=attrgetter('age'))
					[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
				```
			* operator module allows multiple levels of sorting
				* example - sort by grade then by age
				```
					>>> from operator import itemgetter, attrgetter
					>>> sorted(student_tuples, key=itemgetter(1,2))
					[('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
					>>> sorted(student_objects, key=attrgetter('grade', 'age'))
					[('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
				```
			* `operator.methodcaller()`
				* makes method calls with fixed parameters for each object being sorted
					* example - using the `str.count()` method to compute message priority by countinf the number of exclamation marks in a message
					```
						>>> from operator import methodcaller
						>>> messages = ['critical!!!', 'hurry!', 'standby', 'immediate!!']
						>>> sorted(messages, key=methodcaller('count', '!'))
						['standby', 'hurry!', 'immediate!!', 'critical!!!']
	* ascending and descending
		* both `list.sort()` and `sorted()` accept a reverse parameter with a boolean value
			* used to flag descending sorts
		* example - reverse order
		```
			>>> sorted(student_tuples, key=itemgetter(2), reverse=True)
			[('john', 'A', 15), ('jane', 'B', 12), ('dave', 'B', 10)]
			>>> sorted(student_objects, key=attrgetter('age'), reverse=True)
			[('john', 'A', 15), ('jane', 'B', 12), ('dave', 'B', 10)]
		```
	* sort stability and complex sorts
		* sorts are guaranteed to be stable
			* when multiple records have the same key their original order is preserved
	* the old way using decorate-sort-undecorate
		* known as DSU and also known as the shwartzian transform (Randal L. Schwartz)
			* initial list is decorated with new values that control the sort order
			* the decorated list is sorted
			* the decorations are removed, creating a list that contains only the initial values in the new order	
		* tuples are compared lexicographically
			* first item is compared
			* if they are the same second item is compared
			* ... to infinity and beyond!!!
		* for large list where the comparison information is expensive to calculate in python before 2.4 DSU is likely to be the fastest way to sort a list
			* after version 2.4 the key function provides the same functionality 
		* example - sort data by grade using DSU
		```
			decorated = [(student.grade, i, student) for i, student in enumerate(student_objects)]
			decorated.sort()
			[student for grade, i, student in decorated]
			[('john', 'A', 15), ('jane', 'B', 12), ('dave', 'B', 10)]
		```
	* the old way using the cmp parameter
		* in python 2.x
			* list.sort() supports a cmp parameter to handle user specified comparison functions
				* works like magic
		* `cmp` argument
			* took a function that could take two arguments to be compared
				* return a negative value for less-than
				* return 0 if they are equal
				* return a positive value if greater-than
			* example
			```
				def numeric_compare(x, y):
					return x - y
				sorted([5, 2, 4, 1, 3], cmp=numeric_compare)
				[1, 2, 3, 4, 5]
		
				def reverse_numeric(x, y):
					return y - x
				sorted([5, 2, 4, 1, 3], cmp=reverse_numeric)
				[5, 4, 3, 2, 1]
			```	
		* the `cmp_to_key()` function exist to convert a cmp function to the now standard key function format
			* `functools.cmp_to_key()`
	* to create a standard sort order for a class
		* add the appropriate rich comparison methods
	* key functions need not depend directly on the objects being sorted
		* can also access external resources

* what is a decorator in python?
	* [primer](https://realpython.com/blog/python/primer-on-python-decorators/)
		* decorators provide a simple syntax for calling higher-order functions
			* decorator is a function that takes another function and extends the behavior of the latter function without explicitily modifying it
	* [python wiki](https://wiki.python.org/moin/PythonDecorators)

* what is [the Timsort](https://en.wikipedia.org/wiki/Timsort)?
	* a hybrid stable sorting algorithm
		* derived from merge sort and insertion sort
	* designed to perform well on many kinds of real-world data

* how many [functions are in the functools module](https://docs.python.org/2/library/functools.html#module-functools)?
	* 6?
















































