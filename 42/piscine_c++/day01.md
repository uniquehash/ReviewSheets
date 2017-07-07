# day01 of the c++ piscine

memory is tricky

* why use the [new and delete key word to allocate memory instead of malloc](https://elearning.intra.42.fr/notions/piscine-c-d01-c-basics-2/subnotions/piscine-c-d01-c-basics-2-new-and-delete/videos/new-and-delete-7be8f20f-ef88-4ccb-a2fb-cdec8ecc1f87)?
	* new calls the constructor when allocating memory
	* delete calls the destructor when freeing memory
	* malloc and free does neither of these things

* how do [new and delete work in c++](https://elearning.intra.42.fr/notions/piscine-c-d01-c-basics-2/subnotions/piscine-c-d01-c-basics-2-new-and-delete/videos/new-and-delete-7be8f20f-ef88-4ccb-a2fb-cdec8ecc1f87)?
	* they allocate and free memory in a OO way
	* you can declare arrays of objects and delete them
		* main.cpp
			* new array of objects 
				* `Student* students = new Student[42];`
					* cannot handle constructors with parameters
			* delete array of objects
				* `delete [] students;`
	* example
		* main0.cpp	
		```
			#include <iostream>
			#include <string>
			
			class Student
			{
				private:
					std::string_login;
			
				public:
					Student(std::string login) : _login(login)
					{
						std::cout << "Student " << this->_login << " is born" << std::endl;
					}
					
					~Student()
					{
						std::cout << "Student " << this->_login << " died" << std::endl;
					}
			};
			
			int	main()
			{
				Student		bob = Student("bfubar");
				Student*	jim = new Student("jfubar");
			
				// do some stuff
		
				delete jim; //jim is destroyed
				return (0); //bob is destroyed
			}
		```
		* main1.cpp
		```
			#include <iostream>
			#include <string>
			
			class Student
			{
				private:
					std::string	_login;
				
				public:
					Student() : _login("ldefault")
					{
						std::cout << "Student " << this->_login << " is born" << std::endl;
					}
					~Student()
					{
						std::cout << "Student " << this->_login << " died" << std::endl;
					}		
			};
			int	main()
			{
				Student*	students = new Student[42];
				// do something 
				delete [] students;
			}
		```

* how do [references work in c++](https://elearning.intra.42.fr/notions/piscine-c-d01-c-basics-2/subnotions/piscine-c-d01-c-basics-2-references/videos/references-420b32fe-9392-4bcc-a740-090f171d3bdc)?
	* if something will always exist and never change use a reference, else use a pointer
	* definition
		* references are an alias for an existing variable
		* a pointer that is constant always referenced and never nothing, cannot be created uninitialized
		* example
			* ref.cpp
			```
				#include <iostream>
				
				int main()
				{
					int	numberOfBalls = 42;
					int*	ballsPtr = &numberOfBalls;
					int&	ballsRef = numberOfBalls;
					//	int& ballsRef2; // this would blow up your program since references must be initialized	
				
					std::cout << numberOfBalls << " " << *ballsPtr << " " << ballsRef << std::endl;
					*ballsPtr = 21;
					std::cout << numberOfBalls << std::endl;
					ballsRef = 84;
					std::cout << numberOfBalls << std::endl;
					return (0);
				}
		* passing by reference
			* you can pass variables by reference which syntactically is a little nicer
			* example
				* ref2.cpp
				```
					#include <iostream>
					#include <string>
			
					void	byPtr(std::string* str)
					{
						*str += " and ponies";
					}
					void	byConstPtr(const std::string* str)
					{
						std::cout << *str << std::endl;
					}
					void	byRef(std::string& str)
					{
						str += " and ponies";
					}
					void	byConstRef(const std::string& str)
					{
						std::cout << str << std::endl;
					}
					int	main()
					{
						std::string str = "i like butterflies";
						std::cout << str << std::endl;
						byPtr(&str);
						byConstPtr(&str);
						str = "i like otters";
						std::cout << str << std::endl;
						byRef(str);
						byConstRef(str);
						return(0);
					}
				```
		* you can return references which is nice
			* example
				* ref3.cpp
				```
					#include <iostream>
					#include <string>
					
					class Student
					{
						private:
							std::string _login;
						public:
							Student(const std::string& login) : _login(login)
							{}
							std::string&	getLoginRef()
							{
								return this->_login;
							}
							const std::string& getLoginRefConst() const
							{
								return this->_login;
							}
							std::string*	getLoginPtr()
							{
								return &(this->_login);	
							}
							const std::string* getLoginPtrConst() const
							{
								return &(this->_login);
							}
						};
						int	main()
						{
							Student		bob = Student("bfubar");
							const Student	jim = Student("jfubar");
						
							std::cout << bob.getLoginRefConst() << " " << jim.getLoginRefConst() << std::endl;
							std::cout << *(bob.getLoginPtrConst()) << " " << *(jim.getLoginPtrConst()) << std::endl;
							
							bob.getLoginRef() = "bobfubar";
							std::cout << bob.getLoginRefConst() << std::endl;

							*(bob.getLoginPtr()) = "bobbyfubar";
							std::cout << bob.getLoginRefConst() << std::endl;
						}

* how do [filestreams work in c++](https://elearning.intra.42.fr/notions/piscine-c-d01-c-basics-2/subnotions/piscine-c-d01-c-basics-2-filestream/videos/filestreams)?
	* you can use streams to interact with files
	* you can create streams to input into files
		* `std::ifstream ifs("numbers");`
	* you can create streams to output to files
		* `std::ofstream ofs("test.out");
	* example
		* fstream.cpp
		```
			#include <iostream>
			#include <fstream>	
			int	main()
			{
				std::ifstream	ifs("numbers");
				unsigned int	dst;
				unsigned int	dst2;
				ifs >> dst >> dst2;
				
				std::cout << dst << " " << dst2 << std::end;
				ifs.close();
				//-------------------------------
				std::ofstream	ofs("test.out");
				
				ofs << "i like ponies a whole damn lot" << std::endl;
				ofs.close();
			}
		```



































