#### questions from 

* What is FreeBSD mean ?

* what does the source and destination should not overlap mean?
	* it refers to literal overlapping memory

* what does restrict mean in a c function signature?
	* [restrict](https://en.wikipedia.org/wiki/Restrict)
	* a keyword that lets the compiler know that the following pointer is the only one that points to that memory block
		* allows the compiler to write better optimized machine code. 

* what is a zeroed byte?
	* zeroed bytes are bytes that are set null

* what does error `expected parameter declarator` mean?
	* you are trying to define a macro, it freaks out. 
		* to create function prototype first undeclare the macro

* why is memove returning dst post change rather than the original value?

* testing harness in C?
	* [unit testing in c](http://stackoverflow.com/questions/65820/unit-testing-c-code)