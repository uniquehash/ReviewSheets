# day00 of the c++ piscine

there are a lot of videos

* what [sweet knowledge is contained in the introduction video](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-introduction/videos/introduction-2fa2682c-60fe-4443-918a-732c12249471)?
	* day00 is about learning the basics topics of c++
		* namespace
			* a semantic relationship between symbols and functions to create some sort of semantic bag
		* stdio streams
			* bay to handle std input, output and error
			* new syntax
		* class and instances
			* oop baby
		* member attributes and member functions
			* actually using a class
		* this
			* refers to itself
		* init list
			* c++ specific syntax to initialize stuff
		* const
			* c++ specific syntax
		* encapsulation
			* proper use of encapsulation
		* class vs struct
			* structs still exist
		* accessors 
			* access private attributes safely
		* comparisons
			* creating comparisons
		* non member attributes and non member functions
			* static attributes and functions
				* static means something different in c
		* pointers to members
			* impossible to have pointers on member functions or attributes

* what are [namespaces in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-namespaces/videos/namespaces-b808b721-b1f6-4a1e-b378-07007568181d)?
	* creates a semantic association between a groups of symbols and functions
	* namespaces are semantically distinct from each other so they can have the same names and identifiers
	* namespaces can be aliased to prevent having to type very long names multiple times
	* '::'
		* scope resolution operator
		* searches for identifier on the right side in the namespace on the left side
		* if there is nothing to the left of the scope resolution operator global scope is assumed
	
* what are [stdio streams in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-stdio-streams/videos/stdio-streams-d0e4e4ad-8385-454a-85e8-74b5d8cb3ca1)?
	* the standard c++ library has syntax and objects to make your life a whole lot easier
	* functions
		* cout
			* standard output
		* cin
			* standard input
	* buffer redirection
		* you can send a buffer of characters from a source to a destination
			* '>>'
				* brings buff of characters from the left into the buffer on the right
			* '<<'	
				* brings buff of characters from the right into the buffer on the left

* what are [classes and instances in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-class-and-instance/videos/class-and-instance-fab87de6-c15a-4716-b93d-9c048c38b884)?
	* thors way of naming files
		* `Classname.class.hpp`
			* capitalize class name
			* explicitily mention class
			* hpp for file format for headers
			* cpp for file format for source
	* constructor
		* name of the class
		* is used to initialize all memory allocated to class
		* example
			* .hpp
				* `Sample(void);`
			* .cpp
				* `Sample::Sample(void) { #do something; return; }`
	* deconstructor
		* name of the class with a tilda infront
		* is used to properly destroy all memory allocated to class
		* example
			* .hpp
				* `~Sample(void);`
			* .cpp
				* `Sample::~Sample(void) { #do something; return; }`
	* instantiating a class
		* using classes in code is like using data types
		* example
			* main.cpp
			```
				#include "Sample.class.hpp"
				int	main() {
					Sample instance;
				
					return 0;
				}
			```
	* example
		* Sample.class.hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			
			public:
				sample(void);
				~sample(void);
			};
		
			#endif
		```
		* Sample.class.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			Sample::Sample(void) {
				std::cout << "Constructor called" << std::endl;
				return;
			}
			
			Sample::~Sample(void) {
				std::cout << "Destructor called" << std::endl;
				return;
			}
		```

* what are [member attributes and member functions in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-member-attributes-and-member-function/videos/member-attributes-and-member-functions-ba2e1155-3f6f-4515-9a3b-8e08c2f1dfff)?
	* member attribute
		* a variable initialized by every instance of a class but independent of oneanother
		* example
			* .hpp
				* `int foo;`
	* member function
		* a function that is usuable by any instance of the class
		* c++ always passes as first parameter a special parameter that refers to the instance
		* example
			* .hpp
				* `void	bar(void);`
			* .cpp
				* `void	Sample::bar(void) { #dosomething; return; }`
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				int	foo;
				
				Sample(void);
				~Sample(void);
				
				void	bar(void);
			};
			
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"

			Sample::Sample(void) {
				std::cout << "Contsructor called" << std::endl;
				return;
			}
			
			Sample::~Sample(void) {
				std::cin << "Destructor called" << std::endl;
				return;
			}
			
			void	Sample::bar(void) {
				std::cout << "Member function called" << endl;
				return;
			}
		```	
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			int main() {
			
				Sample instance;
			
				instance.foo = 42;
				std::cout << "instance.foo: " << instance.foo << std::endl;

				instance.bar();
				
				return 0;
			}
		```
* what is does the [this keyword mean in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-this/videos/this-04b8453b-7675-4339-a680-c6239c3a25a8)?
	* this
		* a pointer that points to the current instance of the class

* what is an [initialization list in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-initialization-list/videos/initialization-list-b897ef91-650b-4e1e-b10e-ac2117c3182d)?
	* a special syntax to implicitly match up constructor assignment
		* .hpp
			* `char a1; int a2; float a3; Sample2(char p1, int p2, float p3);`
		* .cpp
			* `Sample2::Sample2(char p1, int p2, float p3) : a1(p1), a2(p2), a3(p3) { #dosomething; return; }`
	* example
		* .hpp
		```
			#ifndef SAMPLE2_CLASS_H
			# define SAMPLE2_CLASS_H
			
			class Sample2 {
			
			public: 
				char	a1;
				int	a2;
				float	a3;
			
				Sample2(char p1, int p2, float p3);
				~Sample2(void);
			
			};
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample2.class.hpp"
			
			Sample2::Sample2(char p1, int p2, float p3) : a1(p1), a2(p2), a3(p3) {
				std::cout << "Constructor called" << std::endl;
				std::cout << "this->a1: " << this->a1 << std::endl;
				std::cout << "this->a2: " << this->a2 << std::endl;
				std::cout << "this->a3: " << this->a3 << std::endl;
				return;
			}
		
			Sample2::~Sample2(void) {
				std::cout << "Destructor called" << std::endl;
				return;	
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample2.class.hpp"
			
			int	main() {
				Sample2 instance2('z', 13, 3.14f);
				return 0;
			}
		```

* what is a [const in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-const/videos/const-c0f10448-8fd3-4a06-83ed-abcce68c18a1)?
	* const variable
		* allows you to make a variable constant
			* cannot make assignments to constant variables
			* prevents future problem solving from violating your original design assumptions
		* init list
			* allows you to initialize constant variables in classes
		* syntax
			* `float const pi;`
	* const functions
		* declares that this function will not change the state of the instance
		* prevents future problem solving from violating your original design assumptions
		* syntax
			* .hpp
				* `void	bar(void) const;`
			* .cpp
				* `void	Sample::bar(void) const { #do something but don't change the state of the instance; return; }`
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				float	const	pi;
				int		qb;

				Sample(float const pi);
				~Sample(void);
				
				void	bar(void) const;
			};
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
				
			Sample::Sample(float const f) : pi(f), qb(42) {
				std::cout << "Constructor called" << endl;
				return;
			}
			
			Sample::~Sample(void) {
				std::cout << "Destructure called" << endl;
				return;
			}
	
			Sample::bar(void) const {
				std::cout << "this->pi: " << this->pi << endl;
				std::cout << "this->qb: " << this->qb << endl;
				return;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			int	main() {
				Sample instance(3.14f);
				instance.bar();
				return 0;
			}
		```

* what does [visibility mean in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-visibility/videos/visibility-b41e77f8-2a44-45e4-828d-d892c6472b3f)?
	* the point of visibility is to hide implementation details in order to prevent the user from being overwhelmed
	* convention
		* starting methods in the private scope with an underscore is a common convention and allows you to immediately tell the difference
		* `private: int _privateFoo; void _privateBar(void) const;`
	* visibility controls access
		* public scope can be referenced and called by any other class or program 
		* private scope can only be referenced and called internally by methods within the class
	* though usually it makes sense for constructors and deconstructors in the public scope, there are cases where they should be put in the private scope
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				int publicFoo;
				Sample(void);
				~Sample(void);
				void	publicBar(void) const;
			private:
				int	_privateFoo;
				void	_privateBar(void) const;
			};
			
			#endif
		```
		* .cpp
		```
			#inlcude <iostream>
			#inlcude "Sample.class.hpp"
			
			Sample::Sample(void) {
				std::cout << "Constructor called" << std::endl;
				this->publicFoo = 0;
				std::cout << "this->publicFoo: " << this->publicFoo << std::endl;
				this->_privateFoo = 0;
				std::cout << "this->_privateFoo: " << this->_privateFoo << std::endl;
				
				this->publicBar();
				this->_privateBar();
				return;
			}
			
			Sample::~Sample(void) {
				std::cout << "Destructor called" << std::endl;
				return;
			}

			Sample::publicFoo(void) const {
				std::cout << "Member function publicBar called" << std::endl;
				return;
			}

			Sample::_privateBar(void) const {
				std::cout << "Member function _privateBar called" << std::endl;
				return;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"

			int	main()	{
			
				Sample	instance;
				
				instance.publicFoo = 42;	
				std::cout << "instance.publicFoo: " << instance.publicFoo << std::endl;
				// if uncommented the lines below will break everything
				// instance._privateFoo = 42;
				// std::cout << "instance._privateFoo: " << instance._privateFoo << std::endl;
				
				instance.publicBar();
				// if uncommented the line bellow will break everything
				// instance._privateBar();
				return 0;
			}
		```

* what is the [difference between classes and structs in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-class-vs-struct/videos/class-vs-struct-facd39b6-9318-4769-94ff-0b652ae7df2a)?
	* they have a different default scope
		* struct
			* default scope public
		* class
			* default scope private

* what are [accessors in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-accessors/videos/accessors-c-7a376854-e47f-45be-bf15-8f2e3e258bf1)?
	* all attributes of a class should be private
	* accessors are public functions that enable you to interact with private class attributes
		* getters
			* should be const
			* retrieve the calue of the attribute
		* setters
			* change the value of the attribute
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				Sample(void);
				~Sample(void);

				int	getFoo(void) const;
				void	setFoo(int v);
			private:
				int _foo;
			};
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			Sample::Sample(void) {
				std::cout << "Constructor is called" << std::endl;
				this->setFoo(0);
				std::cout << "this->getFoo(): " << this->getFoo() << std::endl;
				return;
			}
			
			Sample::~Sample(void) {
				std::cout << "Destructor called" << std::endl;
				return;
			}
		
			int	Sample::getFoo(void) const {
				return this->_foo;
			}
			
			void	Sample::setFoo(int v) {
				if (v >= 0)
					this->_foo = v;
				return;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			int	main() {
				Sample	instance;
				
				instance.setFoo(42);
				std::cout << "instance.getFoo(): " << instance.getFoo() << std::endl;
				instance.setFoo(-42);
				std::cout << "instance.getFoo(): " << instance.getFoo() << std::endl;
				return 0;
			}
		```

* what are [class comparisons in the context of c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-comparisons/videos/comparisons-c-dbe5c48f-fdc4-4c9e-82db-36707689e918)?
	* comparison functions can be created to compare two different instances of a class
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public: 
				Sample(int v);
				~Sample(void);	
				
				int	getFoo(void) const;
				int	compare(Sample *other) const;
			private:
				int	_foo;
			};
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sampe.class.hpp"
			
			Sample::Sample(int v) : _foo(v) {
				std::cout << "constructor called" << std::endl;
				return;
			}
			Sample::~Sample(void) {
				std::cout << "deconstructor called" << std::endl;
				return;
			}
			int	Sample::getFoo(void) const {
				return this->_foo;
			}
			int	Sample::compare(Sample *other) const {
				if (this->_foo < other->getFoo())
					return -1;
				else if (this->_foo > other->getFoo())
					return 1;
				return 0;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			int main() {
				Sample instance1(42);
				Sample instance2(42);

				if (&instance1 == &instance1)
					std::cout << "instance1 and instance1 are physically equal" << std::endl;
				else
					std::cout << "instance1 and instance1 are not physically equal" << std::endl;
				
				if (&instance1 == &instance2)
					std::cout << "instance1 and instance2 are physically equal" << std::endl;
				else
					std::cout << "instance1 and instance2 are not physically equal" << std::endl;
				
				if (instance1.compare(&instance1) == 0)
					std::cout << "instance1 and instance1 are structurally equal" << std::endl;
				else 
					std::cout << "instance1 and instance1 are not structurally equal" << std::endl;
				
				if (instance1.compare(&instance2) == 0)
					std::cout << "instance1 and instance2 are structurally equal" << std::endl;
				else
					std::cout << "instance1 and instance2 are not structurally equal" << std::endl;
				
				return 0;
			}
		```

* what are [non member attributes and non member functions in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-non-member-attributes-and-non-member-functions/videos/non-member-attributes-and-non-member-functions-a8dc1dd4-1576-4dda-af7b-a3480378e1de)?
	* non member attributes
		* same thing as class attributes
		* denoted by use of the static keyword
			* `static int	_nbInst;`
		* non memeber attributes should be initialized at compile time 
			* `int	Sample::_nbInst = 0;`
	* non member functions
		* same thing as class functions
		* denoted by use of the static keyword
			* `static int	getNbInst(void);`
		* not passed the special parameter `this` as first argument or at all
			* must explicitely detail namespace to change non member attribute
				* `int	Sample::getNbInst(void) { return Sample::_nbInst; }`
		* like static variables must be called using the namespace
			* `Sample::getNbInst();`
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				Sample(void);
				~Sample(void);
			
				static int	getNbInst(void);
			private:
				static int	_nbInst;
			}
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			Sample::Sample(void) {
				std::cout << "constructor called" << std::endl;
				Sample::_nbInst += 1;
				return;
			}
			Sample::~Sample(void) {
				std::cout << "destructor called" << std::endl;
				Sample::_nbInst -= 1;
				return;
			}
			int	Sample::getNbInst(void) {
				return Sample::_nbInst;
			}
			int	Sample::_nbInst = 0;
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			void	f0(void) {
				Sample instance;	
				std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
				return;
			}
			void	f1(void) {
				Sample instance;
				std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
				f0();
				return;
			}
			int	main(void) {
				std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
				f1();
				std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
				return 0;
			}
		```

* what are [pointers to members in c++](https://elearning.intra.42.fr/notions/piscine-c-d00-c-basics/subnotions/piscine-c-d00-c-basics-pointers-to-members/videos/pointers-to-members-08a26a7b-4a2b-41be-b969-f29b6f9e39ab)?
	* instance pointers
		* will allow you to store the memory address of a instance of a class
			* declare
				* `Sample	*instancep;`
			* assign
				* `instancep = &instance;`
	* member attribute pointers
		* will allow you to store the memory address of a member attribute of a class
			* declare
				* `int	Sample::*p = NULL;`
			* assign
				* `p = &Sample::foo;`	
		* can be used in conjunction with an instance to access the corresponding member attribute 
			* `instance.*p = 21; //changes the value of member attribute foo in instance to 21`
			* the way i think this works
				* the `.` selects the instance of the object to the left of it
				* the `*` dereferences the pointer to the right of it 
				* then the combination searches within the instance for the memory address of the dereferenced pointer 
			* it could also
				* just be a special magic operator
			* can be used just as easily with a pointer to an instance replacing `.` with `->`
	* member function pointers
		* will allow you to store the memory address of a member function of a class
			* declare
				* `void	(Sample::*f)(void) const;`
			* assign
				* `f = &Sample::bar;`
		* can be used in conjunction with an instance to access the corresponding member function
			* works the same way as member attributes
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				int	foo;
				Sample(void);
				~Sample(void);
				void	bar(void) const;			
			};
			#endif
		```
		* .cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			Sample::Sample(void) : foo(0) {
				std::cout << "Constructor called" << std::endl;
				return;
			}
			Sample::~Sample(void) {
				std::cout << "Destructor called" << std::endl;
				return;
			}
			void	Sample::bar(void) const {
				std::cout << "Member function bar called" << std::endl;
				return;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			int	main() {
				Sample	instance;
				Sample	*instancep = &instance;
			
				int	Sample::*p = NULL;
				void	(Sample::*f)(void) const;
			
				p = &Sample::foo;
				std::cout << "value of member foo: " << instance.foo << std::endl;
				instance.*p = 21;
				std::cout << "value of member foo: " << instance.foo << std::endl;
				instancep->*p = 42;
				std::cout << "value of member foo: " << instance.foo << std::endl;

				f = &Sample::bar;
				(instance.*f)();
				(instancep->*f)();
				return 0;
			}





































































































	
