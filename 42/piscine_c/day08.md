# day08


#### question 



#### explore

* preprocessing 
	* preprocessor command `cpp`
	* add hashes before commands 
	* `#include` 
		* add a file to another file before compilation 
			* not limited to .h files 
		* two syntax 
			* `#include <unistd.h>`
			* `#include "fct.h"`
				* means that it is local 
	* `#define`
		* creating macros with the preprocessor 
			* macros replace word for word what is on the left with what is on the right 
		* macros can accept parameters
		* allow you to link strings 
			* `#define TOTO(x) #x`
				

* file.h 
	* prevents problems 
	* keep prototype in `.h` file 

* data structures 
	* typedef
		* redefine a type 
		* create your own type
		* typedef is a scoped variable 
		* example:
			```
				typedef int cacahuete;
	
				int		main(void)
				{
					cacahuete a;
					a = 10;
					return (0);
				}
			```
	* struct
		* allow you to create groups of data 
			* called a structure 
		* example: 
			* struct
			```
				struct	s_point
				{
					int x;
					int y;	
				};

				int		main(void)
				{
					struct s_point a;
					struct s_point b;

					a.x = 10;
					a.y = 42;
					b = a;

					return (0);
				}
			```
			* typedef with struct
			```
				typedef struct	s_point
				{


				}				t_point;
				
				int	main(void)
				{
					t_point a;
					t_point b;
					t_point *ptr;

					a.x = 10;
					a.y = 42;
					b = a;
					ptr = &a;
					//(*ptr).x = 10;
					ptr->x = 10;

					return (0);
				}
			```
	* enum
		* kinda like ints, except used to make lists
		* automatically increments values by 1
		* example:
			* enums
			```
				enum	e_list
				{
					val1 = 4,
					val2 = 7,
					val3
				};

				int	main(void)
				{
					enum e_list a;

					a = val1;
					

					return (0);
				}
			```
	* union
		* access memory areas of structures
		* structs add padding 
			* makes x32 computers faster to find 
			* the size of elements is the combination % 4
		* example: 
			```
				#inlcude "tools.h" 

				struct	s_test
				{
					int		i;
					char	c;
					float	f;
					char	tab[4];
				};
				
				union	u_test
				{
					int		i;
					char	c;
					float	f;
					chat	tab[4];
				};

				int		main(void)
				{
					//ft_putnbr(sizeof(union u_test)); #=> 4 bytes
					
					union u_test	a;
					a.i = 424242;

					//ft_putnbr(sizeof(struct s_test)); #=> 16 bytes
					return (0);
				}

			```




