# day 07


#### questions




#### explore
	* dynamic memory allocation 
	```
		#include <stdlib.h>
		#define LEN		42000000

		int		main()
		{
			int i;
			char *str;	
		
			str = (char*)malloc(sizeof(*str) * (LEN + 1));
			i = 0;
			while (i < LEN)
			{
				str[i] = '0' + (i % 10);
				i++;
			}
			free(str);
			str[i] = '\0';
			while (1)
				;
			return (0);
		}
	```
