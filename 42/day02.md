








* c in 42 minutes 
	* subset of c 
	* computer 
		* cpu 
		* ram 
		* devices 
		* interlinxed by bus 
		* clock system for synchrocity 
	* programming 
		* instructions to the cpu
		* handle data
		* both are kept in RAM
	* c in programming 
		* layer above machine code 
	* instructions and information 
		* c programs have both 
		* RAM is a sequence of bytes (8 bits) 
		* each byte has a unique address in RAM 
		* c must access bytes in order to store informations 
	* c types 
		| type 		     | number of bytes | range       		      |
		| ------------------ | --------------- | ---------------------------- |
		| char               | 1 - 8 bits      | -128 / +127 		      |
		| unsigned char      | 1 - 8 bits      | 0 / 255 		      | 
		| short              | 2 - 16 bits     | -32768 / + 32767 	      |
		| unsigned short     | 2 - 16 bits     | 0 / 65536 		      | 
		| int                | 4 - 32 bits     | -2147483648 / +2147483648    | 
		| unsigned int       | 4 - 32 bits     | 0 / 4294967296    	      | 
		| long long          | 8 - 64 bits     | -9223372036854775808 / + ... | 
		| unsigned long long | 8 - 64 bits     | 0 / 184467440737095516       |
		| *                  | 8 - 64 bits     | address 		      |
	* structure of a program 
		* a program is a set of functions 
		* a function is a closed entity that has 
			* input data 
				* the parameters 
			* a piece of output data 	
				* return value 
		* a function is made of 
			* instructions for the cpu 
			* local data 
				* variables 
	* simple functions  
		* function declaration 
		```
			type 	name(type1 param1, type2 param2, ...)
			BLOCK
		```
		* block 
		```
			{
				local variables declaration 
				instructions; 
			} 
		```
		* example setup - sum function declaration 
		```
			int	sum(int value1, int value2) 
			{ 
			  int	total; 
			  
			  instructions 
			} 
		```
	* compound types 
		* arrays 
		```
			type	name[numeric_value];		int 	tab[42];
		```
		* structures 
		```
			struct	struct_name			struct s_fortytwo 
			{					{
				type	name; 				int a; 
				type	name; 				char b[21];
			};					};
		```
		* declaration 
		```
			struct	struct_name	name; 		struct s_fortytwo a; 
		```
	* the norm 
		* some added constraints 
		* for learning 
			* helps to organize the code 
		* for the community 
			* look and feel 
			* helps for the reading 
	* entry point 
		* where to start from 
		* a mandatory function with a specific main 
		* somewhere in the program there must be a main 
	* 3 kinds of instructions 
		* blocks: 
		```
			declarations; 
			instructions; 
		```
		* expressions: 
			```
				expression; 
				//an expression is a computation that always evaluates to a numerical value 
			```
			* immediate numerical values: 
				*	0	42	0x1A	010
			* variables 
				* a		with int a; for instance 
				* b[18]		with char b[63]; for instance 
				* sft_var.a	with a structure 
			* function calls: 
				* sum(18, a) 
			* computations: + - * / % ()
				* 1 + 3 - (a * 42 + b[0]) / sum(21, 34 - b[10])
			* assignations: 
				* a = 42 
				* b[2 + a] = sum(12, 30) 
				* sft_var.a = 0
			* comparisons: == != < > <= >= 	|| && !
				* a < 2 + b[23]
				* a - 2 == 35 || b[11] + 3 >= 17
			* binary operators: >> << | & ^ 
				* process binarry data directly 
			* shortcuts 
				* a += 10     #=> a = a + 10
				* b[50] /=2   #=> b[50] = b[50] / 2
				* a++ 	      #=> a += 1  		#=> a = a + 1 	
			* specials: 
				* 'A' 	#=> 65
				* sizeof(type_of_var)
				* &a  (address of variable a in ram)
				* exp ? exp2:exp3
			* strings 
				* "hello forty two" automatically stores a sequence of ascii codes in a char array ended by O; evaluates to the address of the first char
		* control structures
			* allows to control the preceedings of instructions inside a block 
			* if 
			```
				if (expression) 
					instruction 	
				
				if(expression) 
					instruction 
				else 
					instruction 
			```
			* while 
			```
				while (expression) 
					instruction 
			```
			* return 
			```
				return (expression);
				return;
			```
	* pointers 
		* definition 
			* a pointer is a variable that stores the memory address of another variable of a given type 
		* declaration 
			* type 	*name; 				int *p;
			* p stores the address of an int variable 
		* use 
			* p = &a; 				*p = 1; #=> a = 1; 
			* if p stores the address of a then *p is another name for the memory area of a; 
			* *name is the object of type type, the address of which is stored in name	
		* pointers arithmetic 
			* let	int 	tab[42]; 	and 	p = &(tab[0]);
			* tab[x]	#=> *(p+x)
	








