# questions from the get_next_line project

* what is a [static variable](https://en.wikipedia.org/wiki/Static_variable)?
	* a variable that has been allocated statically so that its lifetime extends across the entire run of the program
	* generally memory is allocated at compile time before the associated program is executed
	* the address of the variable is known at compile time
	* when the program is loaded into memory, static variables are stored in the data segment if initialized or the BSS segment if unitialized
	* locally scoped
	* extent of the entire run of the program
	* 

* what is a [variable](https://en.wikipedia.org/wiki/Variable_(computer_science))?
	* a storage location paired with an associated symbolic name (identifier)
	* the identifier can be bound to a value during run time, allowing it to be changed suring program execution
	* compilers replace the symbolic name with the actual location of data
	* scope which describes where in the programs text the variable may be used 
	* extent describes when in a programs execution a variable has a meaningful value
	* a variable whose scope begins before its extent does is said to be uninitialized
	* a variable whose extent ends before its scope may become a dangling pointer

* what is [name binding](https://en.wikipedia.org/wiki/Name_binding)?
	* the association of entities(data/code) with identifiers 
	* binding time
		* static 
			* binding of names before the program is run
		* dynamic
			* binding performed as the program is run		

* what is a [dangling pointer](https://en.wikipedia.org/wiki/Dangling_pointer)?
	* pointer that points to the memory of location of an object that has been since deallocated
	* if the original program dereferences the dangling pointer unpredicatable behavior may result

* what is a [wild pointer](https://en.wikipedia.org/wiki/Dangling_pointer#Cause_of_wild_pointers)?
	* uninitialized pointers
	* static variables are automatically initialized to 0

* what is [extent](https://en.wikipedia.org/wiki/Variable_(computer_science)#Scope_and_extent)?
	* describes when in a program execution a variable has a meaningful value, how long it lives
	* a runtime aspect of a variable
		* each binding of a variable to a value can have its own extent at runtime
		* the extend of the binding is the portion og the programs execution time during which the variable continues to refer to the same value or memory location
		* a running program may enter and leave a given extent many times
		* without a garbage collector a variable whose extent permanently outlasts its scope can result in a memory leak 
			* the program will never be able to free it since the variable which would be used to reference it is no longer accessble 

* what is address space?

* what is the data segment of a programs address space?

* what are automatic variables?

* what is a [end of file character(EOF)](https://latedev.wordpress.com/2012/12/04/all-about-eof/)?
	* basically end of file character doesn't exist
	* in C eof is a macro that is set to -1, and is used like NULL to more semantically describe that a read function has reached the end of a file

* what is a [file descriptor](https://en.wikipedia.org/wiki/File_descriptor)?
	* basically an id that refers to a open file

* what mechanism does [C employ to interface with files](https://www.gnu.org/software/libc/manual/html_node/Streams-and-File-Descriptors.html)?
	* file descriptors 
		* represented as `int` objects
		* low-level interface
		* more granuality
	* streams
		* represented as `FILE *` objects
		* high-level interface
		* treats all kinds of files the same

* how does [C read from a file reliably](https://www.gnu.org/software/libc/manual/html_node/File-Position.html#File-Position)?
	* open files keep track of where in the file the next byte to be read or written is
		* implemented by the number of bytes from the beginnning of the file
	* each open file has it's own descriptor and file position pointer 
		* opening the same file multiple times in one program will provid independent pointer and file positions







