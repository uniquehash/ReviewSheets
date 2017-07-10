# day01 of the c++ piscine

time for some real OOP

* what is [adhoc polymorphism in the context of c++](https://elearning.intra.42.fr/notions/piscine-c-d02-93e8d707-f883-4f82-928b-cbc45a162079/subnotions/piscine-c-d02-ad-hoc-polymorphism/videos/adhoc-polymorphism)?
	* function overloading is a c++ principle which allows you to define many functions having the same name but accepting different parameters
		* does not exist in c
	* function overloading works on any function not just member function
	* allows you to specialize the transformations that a function does based on its parameters
	* example
		* Sample.class.hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			
			class Sample {
			public:
				Sample(void);
				~Sample(void);
				
				void	bar(const char c)  	const;
				void	bar(const int n)   	const;
				void	bar(const float z)	const;
				void	bar(const Sample& i) 	const;
			};
			#endif
		```
		* Sample.class.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			
			Sample::Sample(void)
			{
				std::cout << "Constructor called" << std::endl;
				return;
			}
			Sample::~Sample(void)
			{
				std::cout << "Destructor called" << std::endl;
				return;
			}
			void	Sample::bar(const char c) const 	
			{
				std::cout << "Member function bar called with char overload : " << c << std::endl;
				return;
			}		
			void	Sample::bar(const int n) const
			{
				std::cour << "Member function bar called with int overload : " << n << std::endl;
				return;
			}
			void	Sample::bar(const float z) const
			{
				std::cout << "Member function bar called with float overload : " << z << std::endl;
				return;
			}	
			void	Sample::bar(const Sample& i) const
			{
				(void) i;
				std::cout << "Member function bar called with Sample overload" << std::endl;
				return;
			}
		```

* what is [operator overloading in c++](https://elearning.intra.42.fr/notions/piscine-c-d02-93e8d707-f883-4f82-928b-cbc45a162079/subnotions/piscine-c-d02-operator-overload/videos/operator-overload-529054e5-9052-4e0b-a6fc-e44e4e5ef4d0)?
	* rules of operator overloading
		* easy to fuck shit up for users
		* overload must be natural
			* if behavior of operator is strange fucks shit up
		* overload of the operator must be related to the natural semantics of the operator
			* if you make matrices multiple on the '+' operator that would be very confusing
		* just do not do it
			* it is rarely a good idea
		* if you are not comfortable with it you will probably do stupid things
	* vocabulary
		* infix notation
			* `1 + 1`
			* operator is inbetween the two operands
		* prefix notation
			* `+ 1 1`
			* operator precedes operands
			* also known as functional notation
		* postfix notation
			* `1 1 +`
			* operator follows operands
			* also known as polish reverse notation
	* operator key word
		* allows you to specify what transformation a specific operator does to an object and it the parameters
			* unary and binary operators can be overloaded, terenary cannot
		* .hpp
			* `Integer& operator=(const Integer& rhs);`
		* .cpp
			* `Integer& Integer::operator=(const Integer& rhs) { //do assignment; return *this;}`
	* stream redirection operator
		* since it is not within the naked language itself it must be overloaded outside of the context of the class
	* example
		* Integer.class.hpp
		```
			#ifndef INTEGER_CLASS_H
			# define INTEGER_CLASS_H
			#include <iostream>
			
			class Integer {
			public:
				Integer(const int n);
				~Integer(void);
				int	getValue(void) const;
				Integer& operator=(const Integer& rhs);
				Integer  operator+(const Integer& rhs) const;
			private:
				int	_n;
			};
			std::ostream& operator<<(std::ostream& o, const Integer& rhs);
			#endif
		```
		* Integer.class.cpp
		```
			#include <iostream>
			#include "Integer.class.hpp"
			Integer::Integer(const int n) : _n(n)
			{
				std::cout << "Constructor called with value " << n << std::endl;
				return;
			}
			Integer::~Integer(void)
			{
				std::cout << "Destructor called with value " << this->_n << std::endl;
				return;
			}
			int	Integer::getValue(void) const 
			{
				return this->_n;
			}
			Integer&	Integer::operator=(const Integer& rhs)
			{
				std::cout << "Assignation operator called from " << this->_n;
				std::cout << " to " << rhs.getValue() << std::endl;
				this->_n = rhs.getValue();
				return *this;
			}
			Integer		Integer::operator+(const Integer& rhs) const 
			{
				std::cout << "Addition operator called with " << this->_n;
				std::cout << " and " << rhs.getValue() << std::endl;
				return Integer(this->_n + rhs.getValue());
			}
			std::ostream&	operator<<(std::ostream& o, const Integer& rhs)
			{
				o << rhs.getValue();
				return o;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Integer.class.hpp"
			int	main()
			{
				Integer	x(30);
				Integer	y(10);
				Integer	z(0);
				
				std::cout << "Value of x : " << x << std::endl;
				std::cout << "Value of y : " << y << std::endl;
				y = Integer(12);
				std::cout << "Value of y : " << y << std::endl;
				
				std::cout << "Value of z : " << z << std::endl;
				z = x + y;
				std::cout << "Value of z : " << z << std::endl;
				return 0;
			}
		```

* what is a [canonical form in c++](https://elearning.intra.42.fr/notions/piscine-c-d02-93e8d707-f883-4f82-928b-cbc45a162079/subnotions/piscine-c-d02-canonical-form/videos/canonical-form-01a8eb8f-a83d-4352-bd4d-5cedae1cf300)?
	* class canonical form
		* has a default constructor
		* has a copy constructor 
		* has = operator
			* unlike a copy constructor, no new instance is created 
		* has destructor
	* example
		* .hpp
		```
			#ifndef SAMPLE_CLASS_H
			# define SAMPLE_CLASS_H
			#include <iostream>	
			class Sample {
			public:
				Sample(void);	
				Sample(const int n);
				Sample(const Sample& src);
				~Sample(void);
				
				Sample&	operator=(const Sample& rhs);
				int	getFoo(void) const;
			private:
				int	_foo;
			};
			std::ostream&	operator<<(std::ostream& o, const Sample& i);
			#endif
		```
		* .cpp	
		```
			#include <iostream>
			#include "Sample.class.hpp"
			Sample::Sample(void) : _foo(0)
			{
				std::cout << "Default Constructor called" << std::endl;
				reutrn;
			}
			Sample::Sample(const int n) : _foo(n)
			{
				std::cout << "Parametric Constructor called" << std::endl;
				return;
			}
			Sample::Sample(const Sample& src)
			{
				std::cout << "Copy constructor called" << std::endl;
				*this = src;
				return;
			}
			Sample::~Sample(void)
			{
				std::cout << "Destructor caleld" << std::endl;
				return;
			}
			int	Sample::getFoo(void) const 
			{
				return this->_foo;
			}
			Sample& Sample::operator=(const Sample& rhs)
			{
				std::cout << "Assignment operator called" << std::endl;
				if (this != &rhs)
					this->_foo = rhs.getFoo();
				return *this;
			}
			std::ostream&	operator<<(std::ostream& o, const Sample& i)
			{	
				o << "The value of _foo is : " << i.getFoo();
				return o;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Sample.class.hpp"
			int	main() 
			{
				Sample	instance1;
				Sample	instance2(42);
				Sample	instance3(instance1);
				
				std::cout << instance1 << std::endl;
				std::cout << instance2 << std::endl;
				std::cout << instance3 << std::endl;
				instance3 = instance2;
				std::cout << instance3 << std::endl;
				return 0;
			}
		```


			



			




	






































