# overview of binary numbers algorithm


* how does [one add binary numbers](https://en.wikipedia.org/wiki/Binary_number#Addition)?
	* the simplest binary arithmetic operation
	* basically you add and then if you pass the base kind you carry
	```
		0 + 0 -> 0, carry 0
		0 + 1 -> 1, carry 0
		1 + 0 -> 1, carry 0
		1 + 1 -> 0, carry 1
	```
	* example
	```
		1111
	  + 0001
	  -------
	   10000

	    1101
	  + 0001
	  -------
	    1110
	```

* what [happens when a data type overflows](https://stackoverflow.com/questions/9679973/in-a-computer-why-does-adding-one-to-the-maximum-integer-results-in-zero)?
	* the carry is pushed forward
		* for unsigned data types
			* the carry is lost and the 0 bits remaining are all that is left
			* 4 bit unsigned integer overflow
			```				
				A = 11111111 == 255;
				B = 00000001 == 1;
				C = A + B;

					|11111111|
				  + |00000001|
				  --|----|-
				   1|00000000| 
				C = |00000000|

				C == 00000000 == 0;
			```
		* for signed data types
			* the first bit is kept as a sign bit
			* if the sign bit is 1 when the carry is pushed forward then they are added together
				* the second carry is lost and the remaining bits are all that is kept
			* 8 bit signed integer overflow
			```
				 8 bits -> |01111111| -> value represents 127
							^
				 			sign bit == 0 == positive
				
				A = 01111111 == 127;
				B = 00000001 == 1;
				C = A + B;

					|01111111|
				  + |00000001|
				  --|--------|-
				C = |10000000| 
				
				C == 10000000 == -127;
			```

* how does [one subtract in binary numbers](https://en.wikipedia.org/wiki/Binary_number#Subtraction)?
	* two methods
		* borrow from the higher value
		* add a negative number

* what is [two's complement and how does it work](https://en.wikipedia.org/wiki/Two%27s_complement)?
	* the complement of a N-bit number with respect to 2^N
		* 4 bit example 
		```
				A = 0101;
				two_complement(A) == 1010;

				0101
			  + 1010
			   ------
			    1111
		```

* what is [a complement in mathematics](https://en.wikipedia.org/wiki/Method_of_complements)?
	* a technique used to subtract one number from another using only addition of postive numbers
		* commonly used in mechanical calculators and still used in modern computers
	* the radix complement
		* n digit number y in radix b 
			* b^n - y
		* radix just means base
		* basically what do you need to add to the number to make it all max digits or radix - 1
		* 4 digit radix 5 example
		```
				A = 2413;
				radix_complement(A) == 2031;

				2413
			  +	2031
			   ------	
			    4444
		```

* what is [a radix in mathematics](https://en.wikipedia.org/wiki/Radix)?
	* in mathematical numeral systems the radix or base is the number of unique digits, including 0 used to represent numbers in a positional numeral system



































