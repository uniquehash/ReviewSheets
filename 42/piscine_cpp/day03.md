# day03 of the c++ piscine

discovering the magic of inheritance

* what is [inheritance in c++](https://elearning.intra.42.fr/notions/piscine-c-d03-inheritance/subnotions/inheritance-c/videos/inheritance-c-dd50c36f-f2fd-473d-b071-75850ef7651a)?
	* a way to cut on repeating code by sharing previous code
	* there are now three scopes
		* public
			* accessible from anywhere
		* protected
			* accessible from instance of child class
			* accessible from instance of class
		* private
			* accessible from instance of class
	* syntactic mechanism
		* inheritance is used with the following syntax
		* `class Cat : public Animal`
	* example
		* heritage2.cpp
		```
			#include <string>
			class	Animal
			{
				private:
					int	_numberOfLegs;
				public:
					Animal(void);
					Animal(const Animal&);
					Animal&	operator=(const Animal&);
					~Animal(void);	
					
					void	run(int distance);
			};
			class	Cat : public Animal
			{
				public:
					Cat(void);
					Cat(const Cat&);
					cat&	operator=(const Cat&);
					~Cat(void);
			
					void	scornSomeone(const std::string&	target);
			};
			class	Pony : public Animal
			{
				public:
					Pony(void);
					Pony(const Pony&);
					Pony&	operator=(const Pony&);
					~Pony();

					void	doMagic(const std::string& target);
			};
		```


* what is [diamond inheritance](http://www.programmerinterview.com/index.php/c-cplusplus/diamond-problem/)?
	* when in an inheritance hierarchy you have a class that inherits from 2 seperate subclasses of the same base class
		* the concerned class now has a copy of both the subclasses AND each of those subclasses has a instantiated copy of the same base class
		* when calling a method or attribute of the base class the compiler cannot decide which base class copy to call and so it crashes
	* solution	
		* using the virtual keyword

* what is the [virtual keyword in c++](https://stackoverflow.com/questions/1306778/c-virtual-pure-virtual-explained)?
	* virtual allows the program to select at run-time the most-derived override of a method
	* basically gives the program a method for choosing which base class function to call within the diamond problem


















