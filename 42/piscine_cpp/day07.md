# day07 of the c++ piscine

templates are the path to ascencion

* what in the [duck are templates in cpp](https://elearning.intra.42.fr/notions/piscine-c-d07-templates/subnotions/piscine-c-d07-templates-templates/videos/templates)?
	* a syntax that allows you define code patterns that will work on arbritary types
		* allows you to define
			* function templates 
			* class templates
			* structure templates
		* the compiler will model the instantiation of your template for each type

* how do [templates work in cpp](https://elearning.intra.42.fr/notions/piscine-c-d07-templates/subnotions/piscine-c-d07-templates-templates/videos/templates)?
	* templates must be explicitely marked and preceded by a special keyword line
		* they must also provide the possible template label
		* `template <typename T>`
	* casts are actually templates
	* homogenious template definition example
		* with ints
		```
			int	max(int x, int y)
			{
				return (x >= y ? x : y);
			}
		```
		* with templates
		```	
			template <typename T>
			T	max(T x, T y)
			{
				return ( x >= y ? x : y);
			}
		```
	* templates must be instantiated	
		* explicit instantiation
			* `max<int>(a, b)`
		* implicit instantiation
			* `max(a, b)`
	* example with function templates
		* main.cpp
		```
			template<typename T>
			T	max(const T& x, const T& y)
			{
				return (x >= y) ? x : y;
			}
			
			int	foo(int x)
			{
				std::cout << "Long computing time" << std::endl;
			}
			
			int	main(void)
			{
				int	a = 21;
				int	b = 42;
				
				std::cout << "Max of " << a << " and " << b << " is ";
				std::cout << max<int>(a, b) << std::endl;
				std::cout << "Max of " << a << " and " << b << " is ";
				std::cout << max(a, b) << std::endl;
		
				
				float	c = -1.7f;
				float	d = 4.2f;
				
				std::cout << "Max of " << c << " and " << d << " is ";
				std::cout << max<float>(c, d) << std::endl;
				std::cout << "Max of " << c << " and " << d << " is ";
				std::cout << max(c, d) << std::endl;
				
				
				char	e = 'a';
				char	f = 'z';
				
				std::cout << "Max of " << e << " and " << f << " is ";
				std::cout << max<char>(e, f) << std::endl;
				std::cout << "Max of " << e << " and " << f << " is ";
				std::cout << max(e, f) << std::endl;
				
				int	ret = max<int>(foo(a), foo(b));
				std::cout << "Max of " << a << " and " << b << " is ";
				std::cout << ret << std::endl;
				
				return 0;
			}
		```
	* classes and structures can also be templated
		* which means you no longer have to do crazy `void*` math
	* example with class template
		* list.cpp
		```
			#include <iostream>
			
			template<typename T>
			class List
			{
	
				public:
					List<T>(const T& content){ //do_shit }
					List<T>(const List<T>& list){ //do_shit }
					~List<T>(void){ //do_shit }
				
				private:
					T		_content;
					List<T>*	_next;
			};
			
			int	main(void)
			{
				List<int>		a(42);	
				List<float>		b(3.14f);
				List<List<int>>		c(a);
				
				return 0;
			}
		```

* how do [default types work with cpp templates](https://elearning.intra.42.fr/notions/piscine-c-d07-templates/subnotions/piscine-c-d07-templates-default-type/videos/default-type)?
	* you can add default types to templates
		* `template<typename T = float>`
	* exmample using a vector class
		* vertext.class.tpp
		```
			#include <iostream>
			#include <iomanip>
			
			template<typename T = float>
			class Vertex
			{
				public:
					vertex(const T& x, const T& y, const T&z) : _x(x), _y(y), _z(z) {}
					~Vertex(void){}
					
					const T&	getX(void) const { return this->_x; }
					const T&	getY(void) const { return this->_y; }
					const T&	getZ(void) const { return this->_z; }
				
				private:
					const T		_x;
					const T		_y;
					const T		_z;
					
					Vertex(void);
			};
			
			template<typename T>
			std::ostream&	operator<<(std::ostream& o, const Vertex<T>& v)
			{
				std::cout.precision(1);
				o << setiosflags(std::ios::fixed);
				o << "Vertex( ";
				o << v.getX() << ", ";
				o << v.getY() << ", ";
				o << v.getZ();
				o << " )";
				return o;
			}
		```
		* main.cpp
		```
			#include <iostream>
			#include "Vertex.class.tpp"
			
			int	main(void)
			{
				Vertex<int>	v1(12, 23, 34);
				Vertex<>	v2(12, 23, 34);

				std::cout << v1 << std::endl;
				std::cout << v2 << std::endl;
				return 0;
			}
		```

* what is [template specialization in the context of cpp](https://elearning.intra.42.fr/notions/piscine-c-d07-templates/subnotions/piscine-c-d07-templates-specialization/videos/specialization)?
	* specialization is when you handle particular type for templates seperately 
	* two types of specialization
		* partial
			* in the case of multiple template types you only specialize less then every datatype
			```
				template<typename U>
				class Pair<int, U>{};
			```
		* complete
			* when you specialize every template type 
			```
				template<>
				class Pair<bool, bool>{};
			```
	* function template complete specialization is simply overloading
	* example
		* Pair.class.tpp
		```
			#include <iostream>
			#include <iomanip>
			
			template<typename T, typename U>
			class Pair
			{
				public:
					Pair<T, U>(const T& lhs, const U& rhs) : _lhs(lhs), _rhs(rhs)
					{
						std::cout << "General template" << std::endl;
						return;
					}
					~Pair<T, U>(void){}
					
					const T&	fst(void) const { return this->_lhs;}
					const U&	snd(void) const { return this->_rhs;}
				private:
					const T&	_lhs;
					const U&	_rhs;
					Pair<T, U>(void);
			};
			
			template<typename U>
			class Pair<int, U>
			{
				public:
					Pair<int, U>(int lhs, const U& rhs) : _lhs(lhs), _rhs(rhs)
					{
						std::cout << "Int partial specialization" << std::endl;
						return;
					}
					~Pair<int, U>(void){}
					
					int		fst(void) const { return this->_lhs; }
					const U&	snd(void) const { return this->_rhs; }
				private:
					int		_lhs;
					const U&	_rhs;
					Pair<int, U>(void);
			};

			template<>
			class Pair<bool, bool>
			{
				public:
					Pair<bool, bool>(bool lhs, bool rhs)
					{
						std::cout << "Bool/bool specialization" << std::endl;
						this->_n = 0;
						this->_n |= static_cast<int>(lhs) << 0;
						this->_n |= static_cast<int>(rhs) << 1;
						return;	
					}
					~Pair<bool, bool>(void){}
				private:
					int		_n;
					Pair<bool, bool>(void);
			};
			
			template<typename T, typename U>
			std::ostream&	operator<<(std::ostream& o, Pair<T, U> const p&)
			{
				o << "Pair( " << p.fst() << ", " << p.snd() << " )";
				return o;
			} 	
	
					





































