# TDD (test-driven development)

#### questions

* what is a Unit Under Test (UUT)?

* how many different types of test are there?
	* integration testing 
	* unit under test
	* compliance testing

* what is [dependency inversion principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)?
	* a specific form of decoupling software modules
		* makes high-level modules independent of the low-level module implementation details
	* principles 
		* A. high-level modules should not depend on low-level modules. both should depend on abstractions
		* B. abstractions should not depend on details. details should depend on abstractions.
	* architecture design pattern comparison
		* traditional layers pattern
			* ![policy layer --> mechanism layer --> utility layer](https://upload.wikimedia.org/wikipedia/commons/4/42/Traditional_Layers_Pattern.png "traditional layers")
				* lower-level components are designed to be consumed by higher-level components which enable increasingly complex systems to be built
				* higher-level components depend directly upon lower-level components to achieve some task
				* this limits the reuse opportunities of the higher-level components
		* ownership inversion
			* ![policy layer --> <<interface>> policy service interface <-- mechanism layer --> <<interface>> mechanism service interface <---utility layer](https://upload.wikimedia.org/wikipedia/commons/8/8d/DIPLayersPattern.png "ownership inversion")
				* by adding an abstraction layer both high and low-level layers avoid traditional dependencies from top to bottom. 
				* this does not mean that lower-level layers depend on higher-level layers 
				* both layers depend on abstractions that draw the behavior needed by higher-level layers
				* in a direct application of dependency inversion, the abstracts are owned by the upper/policy layers
					* this architecture groups the higher/policy components and the abstracts that define lower services together in the same package 
					* the lower-level layers are created by inheritance/implementation of these abstract classes or interfaces

* what is [design by contract](https://en.wikipedia.org/wiki/Design_by_contract)?


#### overview

* [wiki](https://en.wikipedia.org/wiki/Test-driven_development)
	* TDD is software development process that relies on the repetition of a very short development cycle
	* Specs are turned into very specific test cases
		* software is improved to pass the tests 
	* development cycle
		* ![development cycle for TDD](https://upload.wikimedia.org/wikipedia/commons/0/0b/TDD_Global_Lifecycle.png "dev cycle")
			* add a test 
				* each new feature begins with writing test. 
					* the test defines a function or improvements of a function
					* dev must clearly understand spec to be able to write an appropriate test
						* can be accomplished through use cases and user stories
					* test can be written in whatever testing framework is appropriate to the software environment 
				* test are written before the code is laid down
			* run all tests and see if the new test fails
				* validates that the test harness is working correctly that the new test does not mistakenly pass without requiring any new code, and that the required feature does not already exist
					* also test to make sure the test don't always pass making them worthless
					* [test harness](https://en.wikipedia.org/wiki/Test_harness)
						* also known as automated test framework 
						* a collection of software and test data configured to test a program unit by running it under varying conditions and monitoring it's behavior and outpus
						* two components
							* test execution engine
							* test script repository
						* basically a program that powers the testing of app
			* write the code 
				* write code that makes the test pass
				* the new code written at this stage is not perfect nor optimized
				* dev must only make the test pass
			* run test
				* if all the test pass the dev can be confident that the new code meets the test requirements and does not break other shit
			* refactor code
				* clean up code base regularly 
				* optimize basically
			* repeat with a new feature
	* best practice
		* test structure
			* setup
				* put the Unit Under Test or the overal test system in the state needed to run the test
			* execution
				* trigger/drive the UUT to perform the target behavior and capture all output
			* validation
				* ensure the results of the test are correct. 
			* cleanup
				* restore the UUT or the overall test system to the pre-test state. allows immediate retesting
		* individual best practice
			* separate common set up and teardown logic into test support services utilized by the appropriate test cases
			* keep each test oracle focused on only the results necessary to validate its test
				* test oracle compare the output of the system under test for a given test-case input to the output that the oracle determines that product should have
			* design time-related tests to allow tolerance for execution in non-real time operating systems. the common practice of allowing 5-10 percent margin for late execution reduces the potential number of false negatives in test execution. 
			* treat your test code with the same respect as your production code. it also must work correctly for both positive and negative cases, last a long time and be readable and maintainable
			* get together with your team and review your tests and test practices to share effective techniques and catch bad habits. it may be helpful to review this section during your discussion
		* anti-patterns
			* having test cases depend on system state manipulated from previously executed test cases 
				* always start a unit test from a known and pre-configured state
			* dependencies between test cases
				* a test suite where test cases are dependent upon each other is brittle and complex
				* execution order should not be presumed
				* basic refactoring of the initial test cases or structure of the UUT causes a spiral of increasingly pervasive impacts in associated tests.
			* interdependent tests
				* interdependent tests can cause cascading false negatives 
				* a failure in an early test case breaks a later test case even if no actual fault exists in the UUT, increasing defect analysis and debug efforts 
			* testing precise execution behavior timing or performance
			* building "all-knowing oracles"
				* an oracle that inspects more than necessary is more expensive and brittle over time 
				* this is a very common error and is dangerous because it causes a subtle but pervasive time sink across the complex project
			* testing implementation details 
			* slow running test
	* key person: 
		* [Kent Beck](https://en.wikipedia.org/wiki/Kent_Beck)
			* creator of [extreme programming](https://en.wikipedia.org/wiki/Extreme_programming)
				* a type of agile Test-driven_development
			* creator of [Smalltalk](https://en.wikipedia.org/wiki/Smalltalk)
				* one of the first OO languages 
			* one of the 17 original signers of the [agile manifesto](https://en.wikipedia.org/wiki/Agile_software_development#The_Agile_Manifesto)
	* distilation 
		* forces devs to write more test 
		* forces devs to focus on interface first 
		* forces devs to break down problems into a complexity small enough to be tested  
		* basicallu TDD forces devs to follow good practice and provides small checking along the way

#### types of test
	





