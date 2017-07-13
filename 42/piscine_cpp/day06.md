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

* how to do [upcast and downcast in c++](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-upcast-and-downcast/videos/upcast-and-downcast)?
	* using c syntax
	* classes also have hierarchy of types
		* child > parent > abstract
		* explicit incorrect reinterpration makes problems

* what are [static casts in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-static-cast/videos/static-cast)?
	* 5 types of casts possible
		* conversion
			* casting such that the format of the data is different but what it represents stays the same
		* reinterpretation
			* casting such that the format of the data is the same but what it represents changes
		* qualifier cast
			* casting to change the qualifiers of a type
		* downcast
			* casting to a more specific or more precise type
		* upcast
			* casting to a less specific or less precise type
	* cpp static cast
		* conversion type cast with simple data types
		* used to downcast complex data types
			* checks to make sure that the types are compatible within the same inheritence tree
			* does not prevent or check for information loss
		* `static_cast<int>(b)`

* what are [dynamic casts in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-dynamic-cast/videos/dynamic-cast)?
	* occurs during runtime
	* thus if dynamic cast fails must be caught in runtime code
	* only functions on polymorphic classes, thus virtual classes must exist
	* only used in the case of a downcast and verifies whether downcast is possible
	* if cast fails on pointer
		* dynamic cast returns NULL
	* if cast fails on reference
		* throws `std::bad_cast`
	* what is the point of a dynamic cast
		* useful for integration of third party software

* how do [reinterpret cast work in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-reinterpret-cast/videos/reinterpret-cast)?
	* not blocked by compiler 
	* useful for turning `voids*` into other datatypes
		* compiler checks nothing
		* `reinterpret_cast<int*>(b);`

* how do [const cast work in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-const-cast/videos/const-cast)?
	* allows you to change the qualifiers of a data type 
	* `const_cast<int *>(b);`

* how do [cast operators work in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-cast-operators/videos/cast-operators)?
	* you can basically overload type casting operators to do implicit type casting for your class
	* this is super fucking cool
	* .hpp
		* `operator int()`
	* .cpp
		* `operator int() { return static_cast<int>(this->_v); }`

* how does the [explicit keyword work in cpp](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-explicit-keyword/videos/explicit-keyword)?
	* this key word prevents implicit conversions via constructors
	* example
		* main.cpp
		```
			#include <iostream>
			
			class A {};
			class B {};
			
			class C
			{
			
			public:
						C(const A& _) { return; }
				explicit	C(const B& _) { return; }
			};
			
			void	f(const C& _) { return; }
			int	maint(void)
			{
				f(A());		// implicit conversion compiles
				f(B());		// implicit conversion does not compile because constructor is marked explicit
			}
		```
		* since a C object has a constructor that takes `B` or `A` objects either can be passed to the `f` function that has parameter `C`
			* except since the `B` constructor in C has been marked with keyword explicit, it cannot

* which [casts do what](https://elearning.intra.42.fr/notions/piscine-c-d06-casts/subnotions/piscine-c-d06-casts-conclusion/videos/conclusion-132)?
	* which type of casts do cpp casts cover
		* implicit cast
			* conversion
			* upcast
		* static cast
			* conversion
			* upcast
		* dynamic cast
			* upcast
			* downcast
		* const cast
			* type qualifier 
		* reinterpretation cast
			* reinterpretation
			* upcast
			* downcast
		* legacy c cast
			* conversion
			* reinterpretation
			* upcast
			* downcast
			* type qualifier

	* what features do these casts have
		* implicit 
			* semantic check
			* reliable at run
		* static cast
			* semantic check
		* dynamic cast
			* semantic check
			* reliable at run 
			* test at run
		* const cast
		* reinterpret cast
		* legacy c cast








































































