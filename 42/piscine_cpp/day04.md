# day04 of the c++ piscine

subtyping is a thing

* what is [sub-typing polymorphism in c++](https://elearning.intra.42.fr/notions/piscine-c-d04-sub-typing-polymorphism/subnotions/piscine-c-d04-sub-typing-polymorphism-sub-typing-polymorphism/videos/sub-typing-polymorphism-81257a51-9540-4381-ad72-2510d1d12739)?
	* you can use a class closer to the base to encapsulate and use any derived type with help of the virtual keyword
		* since the virtual keyword will at run time use the most derived override, you can use a base class to fluidly handle many different types with the same pointer
	* method
		* a vitual member function
		* a member function whos resolution is determined at runtime and done at execution time
	* example
		* poly1.cpp
		```
			#include <string>
			#include <iostream>
			class Character
			{
				public:
					virtual void	sayHello(const std::string& target);
			};
			class Warrior : public Character
			{
				public:
					virtual void	sayHello(const std::string& target);
			};
			class Cat
			{
				//[..]
			};
			void	Character::sayHello(const std::string& target)
			{
				std::cout << "Hello " << target << " !" << std::endl;
			}
			void	Warrior::sayHello(const std::string& target)
			{
				std::cout << "F*** off " << target << ", I don't like you !" << std::endl;
			}
			int	main(void)
			{
				//This is OK, obviously, Warrior IS a Warrior
				Warrior*	a = new Warrior(void);
				//This is also OK, because Warrior IS a Character
				Character*	b = new Warrior(void);
				//This would NOT be ok because Character IS NOT a Warrior
				//(Although they ARE related, and W IS-A C, the reverse is untrue)
				//Warrior*	c = new Character(void);
				
				//This would NOT be ok either because Cat IS NOT a Character
				//(They are not even related)
				//Character*	d = new Cat(void);
				
				a->sayHello("students");
				b->sayHello("students");
			}
		```

* what are [abstract classes, interfaces, and pure method in c++](https://elearning.intra.42.fr/notions/piscine-c-d04-sub-typing-polymorphism/subnotions/piscine-c-d04-sub-typing-polymorphism-abstract-classes-and-interfaces/videos/abstract-classes-and-interfaces-7f0efb4e-7f91-4730-8e4f-c35b64923f65)?
	* pure functions
		* cannot be implemented
		* function is purely abstract
		* when a class inherits a pure function it must implement the behavior
		* classes with pure functions (abstract classes) cannot be compiled
		* syntax
			* the syntax to declare a pure function is as follows
				* `virtual void	attack(const std::string& target) = 0;`
	* abstract classes
		* classes that contain at least one pure function
		* they cannot be compiled
		* convention
			* prepending abstract classes with a capital `A` is a good convention to indicate that they are abstract
	* interface classes
		* classes that contain only pure functions 
		* they are a way to define behavior of a class
		* they do not contain any attributes
		* convention
			* prepending interface classes with a capital `I` is a good convention to indicate that that they are an interface
	* example
		* poly2.cpp
		```
			#include <string>
			#include <iostream>
			class ACharacter
			{
				public:
					virtual void	attack(const std::string& target) = 0;
					void		sayHello(const std::string& target);
			};
			class Warrior : public ACharacter
			{
				public:
					virtual void	attack(const std::string& target);	
			};
			void	ACharacter::sayHello(const std::string& target)
			{
				std::cout << "Hello " << target << " !" << std::endl;
			}
			void	Warrior::attack(const std::string& target)
			{
				std::cout << "*attack " << target << " with a sword*" << std::endl;
			}
			class	ICoffeeMaker
			{
				public:
					virtual void		fillWaterTank(IWaterSource* src) = 0;
					virtual ICoffee*	makeCoffee(const std::string& type) = 0;
			};
			int	main()
			{
				ACharacter*	a = new Warrior(void);	
				//This would NOT be ok because ACharacter is abstract
				//ACharacter*	b = new ACharacter(void);
				
				a->sayHello("students");
				a->attack("roger");
			}
		```
			


































