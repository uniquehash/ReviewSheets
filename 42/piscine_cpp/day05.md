# day05 of the c++ piscine

exception handling

* what are [nested classes in c++](https://elearning.intra.42.fr/notions/piscine-c-d05-nested-classes-and-exceptions/subnotions/piscine-c-d05-nested-classes-and-exceptions-nested-classes/videos/nested-classes-a3ade7f9-0edb-4ec0-80f4-b84fcecff16f)?
	* we can define classes in the definition of other classes
	* in other words nested classes are possible

* what are [exceptions and how does c++ handle them](https://elearning.intra.42.fr/notions/piscine-c-d05-nested-classes-and-exceptions/subnotions/piscine-c-d05-nested-classes-and-exceptions-exceptions/videos/exceptions-fab276dc-34b4-4197-8507-978cd4ac4c26)?
	* exceptions are a way of reporting with a message
	* try, catch, throw
		* try - catch blocks
			* used to responde to errors gracefully
		* throw
			* forcefully launches the catch block
	* exceptions can be defined and sublassed like every other object
		* example
		```
			class PEBKACException : public std::exception
			{
				public:
					virtual const char* what() const throw()
					{
						return("Problem exists between keyboard and chair\n");
					}
			};
		```
	* generic and specific catches
		* generic
			* catches all exceptions
			* awful practice
		* specific
			* catches only specific exceptions




























