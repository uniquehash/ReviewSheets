# day04


#### question 



#### explore 

* recursion practice
	examples:
		* main
		```
			int main()
			{
				fn();
				return (0);
			}
		```

		* no stopping condition: infinite loop - segfault
		```
			int fn()
			{
				fn();
				return (0);
			}
		```
		* not incrementing the variable: ifinite loop - segfault 
		```
			int fn()
			{
				int i;

				i = 0;
			
				if (i <= 5)
				{
					i += 1;
					fn();
				}
				else
				{
					return (0);
				}
			}
		```
		* functioning recursion
		```
			int fn(int i)
			{
				if (i <= 5)
				{
					i += 1;
					write(1, "D", 1);
					fn(i);
					write(1, "f", 1);
					return (0);
				}
				else
				{
					return (0);
				}
			}

		```

