# Unit Testing in C

documentation and research on unit testing in C

#### questions

* what is a 'iteration table'?

* what is TAP output?

* what is JUnit output?

#### landscape 

* [SO source](http://stackoverflow.com/questions/65820/unit-testing-c-code)
	* [Check](http://check.sourceforge.net/doc/check_html/check_2.html#SEC3)
		* uses fork() to create a new address space and not trash itself if there are issues.
	* [AceUnit](http://aceunit.sourceforge.net/)
		* C code unit test framework focused on comfort 
		* attempts to mimick JUnit 4.x, includes reflection-like capabilities
		* can be used in resource constraint environments and runs fine without any standard C functions 
		* does not use forks to trap signals 
	* [GNU Autounit](http://autounit.tigris.org/)
		* uses forks to run unit tests in a separate address space 
			* Check author found the idea here
		* uses the Glib extensively
			* linking and such need special options 
	* cUnit
		* uses Glib but does not fork to protect the address space of unit tests
	* [CUnit](http://cunit.sourceforge.net/)
		* standard C
		* does not fork or protect the address space of unit tests
	* [CuTest](http://cutest.sourceforge.net/)
		* uses one .c and one .h file to drop in source tree
	* [CppUnit](https://sourceforge.net/projects/cppunit/)
		* premier unit testing framework for C++
			* can be used to test C code
		* stable, actively developed and has a GUI interface
		* primary reasones to not use 
			* it's quite big
			* must write code in C++ 
				* must use a C++ compiler
	* [embUnit](https://sourceforge.net/projects/embunit/)
		* unit test framework for embedded systems 
		* supercedded by AceUnit
	* [MinUnit](http://www.jera.com/techinfo/jtns/jtn002.html)
		* minimal set of micros
		* used to show how easy it is to use unit test in code
		* +1 for small projects
	* [CUnit for Mr.Ando](http://park.ruru.ne.jp/ando/work/CUnitForAndo/html/)
		* CUnit implementation that is fairly new. 
	* [CMocka](https://cmocka.org/)
		* test framework for C with support for mock objects
		* easy to use and setup
	* [Criterion](https://github.com/Snaipe/Criterion)
		* cross-platform C unit test framework
		* supports 
			* automatic test registration
			* parameterized tests
			* parameterized theories
			* can output to multiple formats 
				* TAP 
				* JUnit
				* XML
		* each test runs in its own process 
			* signals and crashes can be reported and tested
	* [HWUT](http://hwut.sourceforge.net/)
		* a general Unit Test tool with good support for C
		* help create Makefiles 
		* generate massive test cases coded in minimal 'iteration tables'
		* walk along side state machines
		* generate C-stubs
		* etc... 
		* verdicts are based on 'good stdout/bad stdout'
		* comparison function is flexible