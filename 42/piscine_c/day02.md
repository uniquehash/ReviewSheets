# day02

#### question




#### explore 

* key instructions 
	* Norminator 
		* style guide check 
	* using forbidden function is considered cheating 
		* -42 for assignment 
	* if `ft_putchar()` is an authorized function they compile it using their own `ft_putchar.c`
	* only submit a main() function if they ask for a program 
	* Moulinette compiles with 
		* -Wall
		* -Wextra
		* -Werror
		* using gcc
	* do not leave any additional file in directory 
	* launch Norminator with the -R CheckForbiddenSourceHeader flag
		* Moulinette will use it too 

* the norm
	* denomination - naming shit 
		* mandatory 
			* a structures name must start by `s_`
			* a typedefs name must start by `t_`
			* a union name must start by `u_`
			* a enums name must start by `e_` 
			* a globals name must start by `g_` 
			* variables and functions names can only contain lowercases, digits and '_' (Unix case)
			* files and directories names can only contain lowercases, digits and '_' (Unix case) 
			* characters that are not part of the standard ascii table are forbidden 
		* advice 
			* objects ( variables, functions, macros, types, files, or directories) must have the most explicit and mnemonic names as possible 	
				* only counters should be named abrituarly 
			* abreviations are tolerated as long as it is to shorten the original name and that it remains intelligible 
				* names with more than one word are seperated by '_'
			* all identifiers (functions, macros, types, variables) must be in english 
			* any use of global variables must be justifiable 
	* formatting 
		* mandatory part 
			* all files must begin with the standard school header 
				* available in the default dumps 
			* must ident code with 4-space actual tabs 
			* each function must be a maximum of 25 lines not counting the functions curly brackets 
			* each line must be at most 80 columns wide comments included 
			* one each instruction per line 
			* an empty line no spaces or tabs
			* a line can never end with spaces or tabulations 
			* need to start a new line after each curly bracket or end of control structure 
			* each comma or semi-colon must be followed by a space 
			* each operator (binary or ternary) or operand must be separated by one and only one space 
			* each C keyword must be followed by a space except for keywords for types 
				* int, char, float, sizeof
			* each variable declaration must be indented on the same column 
			* the asterisks that go with pointers must be stuck to variable names 
			* one single variable declaration per line 
			* we cannot stick a declaration and an initialization on the same line except for global variables and static variables 
			* declarations must be at the beginning of a function and must be separated by an empty line 
			* there cannot be an empty line between declarations or implementations 
			* multiple assignments are strictly forbidden 
			* you may add a new line after an instruction or control structure but you will have to add an indentation with brackets or affection operator 
				* operator must be at the beginning of a line 
	* function parameters
		* mandatory part 
			* a function can take 4 named parameters maximum 
			* a function that does not take arguments must be explicetly prototyped with the word void as an argument 
	* functions 
		* mandatory part
		 	* parameters in functions prototype must be named 
			* each function must be separated from the next by an empty line 
		* advice 
			* your functions identifiers must be aligned within a same file same goes for header files 
	* typedef, struct, enum, union 
		* mandatory 
			* add a tab when declaring a struct, enum, or union 
			* when declaring a variable of type struct, enum, or union add a single space in the type 
			* add a tab between two parameters of a typedef
			* when declaring a struct, union, or enum, with a typedef all rules apply you must align the typedefs name with the struct/union/enums name 
			* you cannot declare a structure in a .c file 
	* headers 
		* mandatory 
			* the things allowed in header files are : header inclusions, declarations, defines, prototypes, and macros 
			* all includes (.c or .h) must be at the beginning of the file 
			* we will protect headers from double inclusions 	
				* if file is `ft_foo.h` its bystander macro is FT_FOO_H
			* functions prototypes must exclusively be in .h files 
			* unused header inclusions (.h) are forbidden 
		* advice 
			* all header inclusions must be justified in a .c file as well as in a .h file 
	* macros and pre-processors 
		* mandatory part 
			* "defines" that explain or describe code are forbidden 
			* multiline macros are forbidden 
			* only macros names are uppercase 
			* you must indent characters following #if, #ifdef or #ifndef
	* forbidden stuff
		* mandatory 
			* you are not allowed to use 
				* for 
				* do...while 
				* switch 
				* case 
				* goto
			* interlinked ternary operators such as '?'
			* VLAs - variable length arrays 
	* comments 
		* mandatory part 
			* you are allowed to comment your code in your source files 
			* comments annot be inside functions bodies 
			* comments start and end by a single line 
				* all intermediary lines must align and start by '**'
		* advice 
			* comments must be in english 
			* comment cannot justify a bastard function 
	* files 
		* mandatory 
			* you cannot include a .c file 
			* you cannot have more than 5 function-definitions in a .c file 
	* makefile 
		* advice 
			* the $(NAME), clean, fclean, re and all rules are mandatory 
			* if the makefile relinks the project wil be considered non-functional 
			* in the case of a multibinary project on top of the rules weve seen you must have a rule that compiles both binaries as well as a specific rule for each binary compiled 
			* in the case of a project that calls a functions library your makefile must compile this library automatically 
			* wildcard are forbidden 
	
* make shit work 
	* bash script 
		* runs norminette 
		* compiles main, function, ft_putchar in the library 
			* puts in a bin 
			* runs bin 
			* removes bin 

* first step in c 
	* .c extensions denotes a source file 
	* print school header
		* `:Stdheader`
	* compile file with gcc
		* create executable from source file 
			* `gcc -o exe source.c`
			* example:
				* `gcc -o day02 day02.c`
		* execute with`./` 

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
	








