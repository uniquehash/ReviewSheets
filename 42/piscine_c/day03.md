# day 03


#### questions 




#### explore 

* introduction to pointers 
	* mmu 
		* allows you to reserve memory 
	* memory has two parts 
		* high memory
			* stack  
				* used everytime a function call, or do any initializing, assignment 
				* start at the top 
					* allocate as you go 
		* low memory
			* heap 
				* place where you can allocate memory 
	
* assignment 
	* initialize 
		* a pointer that looks for ints 
			* `int *ptr;`
	* assignment 
		* set the value of the pointer to that of the memory address of a int `a`
			* `ptr = &a`
	* types must match

* dereferencing 
	* access value of pointer 
		* `*ptr`
	* pointer to pointer 
		* initialize 
			* `int **ptr2;`
		* assignment 
			* `ptr2 = &ptr;`
		* access value 
			* `**ptr2`

* pointer arithmetic 
	* when you add a value to a pointer the compiler will multiply by the size of the type

* array 
	* an array is an implecit pointer 

* character string 
	* `' '` 
		* for strings literal, single bytes
	* `" "`
		* character string 
			* returns the address of the first character
			* terminated by the compiler with a \0
		* must add terminating \0
		* pointer strings cannnot be written to
		
* pointer usage
	* pass by reference is done manually
	
* void pointer 
	* a pointer to is set without a type
	* can be used to point to anything 
	* used for transporting addresses 
	
	
	
	
	
	 


	














	
