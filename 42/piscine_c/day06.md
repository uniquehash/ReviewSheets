# day 06

# questions


# explore
	
	* librairies 
		* in order to create a a library you need .o files
		* prefix libraries with `lib`
			* `ar rc lib[name].a [library_function].o [libraryfunction].o`
			* example
				* `ar rc libstr.a ft_putchar.o ft_putstr.o` 
			* tell compiler that library is in current directory 
				* `gcc main.c -L. -l[library_suffix]
				* example
					* `gcc main.c -L. -lstr`
		* ranlib
			* takes your library as an argument and creates an index in it for gcc
			* example 
				* `ranlib libstr.a`
		* main parameters 
			* to retrieve parameters passed to main 
				* `int argc` 
					* number of parameter
					* argc always equal at least 1
				* `char **argv`
					* an array of strings 
					* `argv[0]` 
						* the name of the binary, first element on the command line  
				* main.c 
				```
					int main(int argc, char **argv)
					{
						ft_putstr("random string");
						ft_putstr(argv[1]);
						ft_putchar('\n');
						return (0);
					}
				```
	* [c program compilation](https://www.cs.cf.ac.uk/Dave/C/node3.html)
		* creating the program 
			* write a program save it with the `.c` extension 
		* the compilation model
			* preprocessor
				* input is source code 
				* responsible for removing comments 
				* interpreting special `preprocessor directives denoted by `#`
					* `#include` 
						* includes contents of a named file called header files
				* outputs source code	 
			* compiler
				* input is output of preprocessor which is source code
				* translates source code into assembly code 
			* assembler 
				* input is output of compiler which is  assembly code 
				* creates object code 
					* files have a `.o` extension

			* link editor  
				* input is object code + any libraries 
				references library functions to combine them in main 
	* `gcc -c` 
		* assemble and compile file but do not link	
