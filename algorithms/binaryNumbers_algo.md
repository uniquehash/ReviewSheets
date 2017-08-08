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
				A = 1111;
				B = 0001;
				C = A + B;

					|1111|
				  + |0001|
				  --|----|-
				   1|0000| 
				C = |0000|

				C == 0000;
			```
		* for signed data types
			* the first bit is kept as a sign bit
			* if the sign bit is 1 when the carry is pushed forward then they are added together
				* the second carry is lost and the remaining bits are all that is kept




* how does [one subtract in binary numbers]()?




































