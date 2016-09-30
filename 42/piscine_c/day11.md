# day11

# questions 


#explore 

* linked list example
	* list.h
		* protect from multiple inclusion ect...
		* example: 
			* list.h
			```
				#ifndef LIST_H
				# define LIST_H

				typedef struct s_list t_list;

				struct s_list {
					char *str;
					t_list *next;
				};

				t_list *add_link(t_list *list, char *str);
				void	print_list(t_list *list);

				#endif
			```
	* main.c
		*example: 
			* main.c
			```
				#include <stdlib.h>
				#include "list.h"

				int main(void)
				{
					t_list *list;

					list = NULL;
					
					list = add_link(list, "toto\n");
					list = add_link(list, "tata\n");
					list = add_link(list, "tutu\n");

					print_list(list);

					return (0);
				}
			```
			* add_link.c
			```
				#include <stdlib.h>
				#include "list.h"

				t_list *add_link(t_list *list, char *str)
				{
					t_list *tmp;
					tmp = malloc(sizeof(t_list));
					if (tmp)
					{
						tmp -> str = str;
						tmp -> next = list;
					}
					return tmp;
				}
			```
			* print_list.c
			```
				#include "list.h"
				void print_list(t_list *list)
				{
					while (list)
					{
						ft_putstr(list -> str);
						list = list -> next;
					}
				}
			```





	


