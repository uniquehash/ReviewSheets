# day06 of the c++ piscine

casting is hard, lets blow it up

* how do [casts work in c](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-from-c-type-conversion/videos/from-c-type-conversion)?
	* explicit casting
		* when you exlicitely cast something
		* `int woo = 5; (double) woo;`
	* implicit casting
		* when you assign types of different formats to each other	
		* compile flags exist to prevent implicit downcasting
	* conversions
		* when you take information representing a value stored in one format and store it in another format while still representing the original value in the new format
	* hierarchy of types
		* when down casting, be explicit

* how does [type reinterpretation work in c](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-from-c-type-reinterpretation/videos/from-c-type-reinterpretation)?
	* address types also have hierarchy
		* `void*`
			* most general pointer type
	* reinterpretations
		* when you take information representing a value stored in one format and reinterpret the information without modifying its format leading the value represented by the information to be different than the original value
	

* how does type [qualifier reinterpretation work in c](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-from-c-type-qualifier-reinterpretation/videos/from-c-type-qualifier-reinterpretation)?
	* qualifier reinterpretation is a special case of reinterpretation
		* more static has higher rank in type conversion
		* const int > int > volatile int
	* reasons to do this
		* you are wrong, redesign your program
		* your dependency is wrong, you cannot change the code, do the hack
	


























