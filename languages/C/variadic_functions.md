# variadic functions

create: 11/10/2016


#### overview

Variadic functions are this thing that allow you to have an arbritary amount of parameters passed to a function. they are declared by having an [ellipsis](https://en.wikipedia.org/wiki/Ellipsis_(computer_programming)) in the function declaration. 

* they are navigating using three macros
	* first declare a variable of type `va_list` called `ap`
	* `va_start`
		* takes as an parameter `ap`
		* takes as an parameter the name of the last known parameter before the `va_list`
			* the callee has to know where the function parameters live
			* only works if you have at least one function parameter
				* otherwise the callee won't know where the function 
		* initializes `ap`
	* `va_arg`
		* takes a `va_list` as a parameter
		* takes a type as a parameter
		* converts the value of the argument into the appropriate type and returns it
	* `va_end`
		* called when you are done reading the arguments

basically you need to have some way of knowing the type of that argument you are retrieving, which quickly gets complicated. Makes sense too. A type simply tells you how many bytes to interpret to properly represent the value. Without knowing the type how could C possibly know the value? 