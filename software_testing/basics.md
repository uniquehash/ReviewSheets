# notes on testing software

* what is [software testing](https://en.wikipedia.org/wiki/Software_testing)?
	* an investigation conducted to provide stakeholders with information about the quality of the software product or service under test
	* provide an objective independent view of the software to allow the business to appreciate and understand the risks of software implementation
	* test techniques include the process of executing a program or application with the intent of finding bugs
		* and verifying that the software product is fit for use
	* involves execution of software component or system component to evaluate one or more properties of interest
		* meets the requirements that guided its design and development
		* responds correctly to all kinds of inputs
		* performs its function within an acceptable time
		* is sufficiently usable
		* can be installed and run in its intended environments 
		* achieves the general result its stakeholders desire
	* as the number of possible tests for even simple software components is practically infinite all software testing uses some strategy to select tests are feasible for the available time and resources
	* overview
		* defects and failures
			* not all software defects are caused by coding errors
			* common sourve of expensive defects is requirement gaps
				* non-functional requirement 
					* testability
					* scalability 
					* maintainability
					* usability
					* performance
					* security
			* software faults occur through the following processes
				* programmer makes an error which results in a defect in the software source code
				* if this defect is executed in certain situations the system will produce wrong results causing a failure
				* not all defects will necessarily result in failures
				* a defect can turn into a failure when the environment is changed
			* input combinations and preconditions
				* a fundamental problem with software testing is that testing under all combinations of inputs and preconditions is not feasible even with a simple product
				* the number of defects in a software product can be very large and defects that occur infrequently are difficult to find in testing
				* non-functional dimensions of quality are highly subjective 
				* software developers cannot test everything but they can use combinatorial test design to identify the minimum number of tests needed to get the coverage they want
					* combinatorial test design enables users to get greater test coverage with fewer tests
		* economics
			* software bugs costs the U.S. economy 59.5 billion annually
			* commonly believed that the earlier a defect is found the cheaper it is to fix it
		* roles
			* many roles exist in testing
				* test manager
				* test lead
				* test analyst
				* test designer
				* tester
				* automation developer 
				* test administrator
		* code coverage tools
			* can evaluate the completeness of a test suite that was created with any method including black-box testing
			* allows software teams to examine parts of a system that are rarely tested and ensures that the most important function points have been tested
				* function coverage
					* reports on functions executed
				* statement coverage
					* reports on the number of lines executed to complete the test
					* 100% statement coverage ensures that all code paths or branches are executed at least once
				* decision coverage
					* reports on whether both the True and False branch of a given test has been executed
	* testing methods
		* static testing
			* reviews, walkthroughs, inspections
			* implicit like proofreading
			* involves verification
		* dynamic testing
			* executing programmed code with a given set of test cases 
			* may begin before the program is 100% complete in order to test particular sections of code and are applied to discrete functions or modules
			* typical techniques for this are either using stubs/drivers or execution from a debugger environment
			* involves validation
		* white-box testing
			* also known as clear box testing, glass box testing, transparent box testing, and structural testing 
			* tests internal structures or workings of a program as opposed to the funcationality exposed to the end-user
			* an internal perspective of the system as well as programming skills are used to design test cases
			* tester chooses inputs to exercise paths through the code and determine the appropriate outputs
			* can be applied at most levels though usually done at the unit level
				* unit testing
				* integration testing
				* system testing
			* can test paths
				* within a unit
				* between units during integration
				* between subsystems during a system-level test
			* will not detect unimplemented parts of the specification or missing requirements
			* techniques used
				* API-testing
					* testing of the application using public and private APIs
				* code coverage
					* creating tests to satisfy some criteria of code coverage	
				* fault injection methods
					* intentionally introducing faults to gauge the efficacy of testing strategies
				* mutation testing methods
				* static testing methods
		* black-box testing
			* treats software as a black box
			* examines functionality without any knowledge of internal implementation
			* testers only aware of what the software is supposed to do not how it does it
			* testing methods
				* equivalence partitioning
				* boundary value analysis
				* all-pairs testing
				* state transition tables
				* decision table testing
				* fuzz testing
				* model-based testing
				* use case testing
				* exploratory testing
				* specification-based testing
			* can be applied to all levels of software testing
				* unit test
				* integration test
				* system test 
				* acceptance test
					* test conducted to determine if the requirements of a specification or contract are met
			* most of all higher level testing is black box testing
		* visual testing
			* provide developers with the ability to examine what was happening at the point of software failure by presenting the data in such a way that the developer can easily find the information she or he requires and the information is expressed clearly
			* the core of visual testing is the idea that showing someone a problem, rather than just describing it greatly increases clarity and understanding 
			* advantages
				* quality of communication is increased drastically because testers can show the problem to the developer as opposed to just describing it and the need to replicate test failures will cease to exist in many cases
		* grey-box testing
			* involves having knowledge of internal data structures and algorithms for purposes of designing tests, while executing those tests at the user or black-box level
			* tester is not required to have full access to the software source code
			* manipulating input data and formatting output do not qualify as grey-box
				* because the input and output are clearly outside of the black-box that we are calling the system under test
			* by knowing the underlying concepts of how the software works testers make better-informed testing choices while testing the software from outside
	* testing levels							
		* generally there are five recognized levels of tests
			* unit testing
				* refers to tests that verify the functionality of a specific section of code
					* usually at the function level
					* in an object oriented environment usually at the class level
				* usually written by developers as they work on code 
					* ensure that the specific function is working as expected
					* one function may have multiple tests
				* unit testing alone cannot verify the functionality of a piece of software but rather is used to ensure that the building blocks of the software work independently from each other
				* unit testing is a software development process that involves synchronized application of a broad spectrum of defect prevention and detection strategies in order to reduce software development risks, time, and costs
				* performed by the software developer or engineer during the construction phase of the software development lifecycle
				* augments traditional QA
			* integration testing
				* any type of software testing that seeks to verify the interfaces between components against a software design
			* component interface testing
				* the practice component interface can be used to check the handling of data passed between various units, or subsystem components, beyond full integration testing between those units
				* the data being passed can be considered as message packets and the range or data types can be checked for data generated from one unit and tested for valifity before passing into another unit
				* tests can include checking the handling of some extreme data values while other interface variables are passed as normal values
				* unsual data values in an interface can help explain unexpected performance in the next unit
				* component interface testing is a variation of black-box testing
			* system testing
				* tests a completely integrated system to verify that the system meets its requirement
			* operational acceptance testing
				* used to conduct operational readiness of a product, service, or system as a part of a quality management system
	* testing types
		* installation testing
			* assures that the system is installed correctly and working 
		* compatibility testing
			* a common cause of software failure is a lack of its compatibility with other application software, operating systems, or target environments that differ greatly from the original 
			* backward compatibility failure example
				* can occur because the programmer develop and test software only on the latest version of the target environment, which not all users may be running
				* results in the unintended consequence that the latest work may not function on earlier versions of the target environment, or on older hardware that earlier versions of the target environment was capable of using
			* the point
				* basically environmental differences may cause issues in end user use of the application
				* compatibility testing tests this
		* sanity testing
			* determines whether it is reasonable to proceed with further testing
		* smoke testing
			* consists of minimal attempts to operate the software, designed to determine whether there are any basic problems that will prevent it from working at all
			* can be used as build verification test
		* regression testing
			* focuses on finding defects after a major code change has occurred
			* typically regressions occur as an uninteded consequence of program changes
				* when the newly developed part of the software collides with previously existing code
			* common methods
				* re-running previous sets of test cases and checking whether previously fixed faults have re-emerged
			* typically the largest test effort in commercial software development
		* acceptance testing
			* can mean one of two things
				* smoke test
				* acceptance testing performed by the customer often in their lab environemnt on their own hardware 
					* may be performed as part of the hand-off process between any two phases of development
		* alpha testing
			* simulated or actual operational testing by potential users/customers or an independent test team at the developers site
		* beta testing
			* comes after alpha testing and can be considered a form of external user accpetance testing
			* versions of the software are released to a limited audience outside of the programming team known as beta testers
		* functional testing	
			* refers to activities that verify a specific action or function of the code
			* these are usually found in the code requirements documentation although some development methodologies work from use cases or user stories 
			* functional tests tend to answer the question of 
				* can the user do this?
				* does this particular function work?
		* non-functional testing
			* refers to aspects of the software that may not be related to a specific function or user action 
				* scalability
				* other performance
				* behvior under certain constraints
				* security
			* testing will determine the breaking point
				* point at which extremes of scalability or performance leads to unstable execution
		* continuous testing
			* the process of executing automated tests as part of the software delivery pipeline to obtain immmediate feedback on the business risks associated with a software release candidate
			* includes validation of both functional requirements and non-functional requirements
		* destructive testing 
			* testing attempts to cause the software or a sub-system to fail
			* it verifies that the software functions properly even when it receives invalid or unexpected inputs
				* establishes the robustness of input validation and error-management routines
		* software performance testing
			* performance testing is generally executed to determine how a system or sub-system performs in terms of responsiveness and stability under a particular workload
			* load testing
				* concerned with testing that the system can continue to operate under a specific load
			* volume testing 
				* a way to test software functions even when certain components increase radically in size
			* stress testing 
				* a way to test reliability under unexpected or rare workloads
			* stability testing
				* checks to see if the software can continuously function well in or above an acceptable period
			* real-time testing
				* real-time software systems have strict timing constraints
		* usability testing
			* check if the user interface is easy to use and understand
		* accessibility testing
			* may include compliance with standards such as 
		* security testing
			* type of testing conducted to evaluate the degree to which a test item and associated data and information are protected so that an unauthorised persons or systems cannot use, read, or modify them, and authorized persons or systems are not denied access to them
		* internationalization and localization	
			* the general ability of software to be internalized and localized	
				* can be automatically tested without actual translation
		* development testing
			* a software development process that involved synchronized application of a broad spectrum of defect prevention and detection strategies in order to reduce software development risks, time, and costs
			* it is performed by the software developer or engineer during the construction phase of the software development lifecycle
			* basically unit testing
		* A/B testing
			* a comparison of two outputs generally when only one variable has changed
			* useful in fine-tuning
		* concurrent testing
			* focus is on the performance while continuously running with normal input and under normal operational conditions as opposed to stress testing, or fuzz testing
		* conformance testing or type testing
			* conformance testing verifies that a product performs according to its specified standard
	* testing process
		* 












































* what is [mutation testing](https://en.wikipedia.org/wiki/Mutation_testing)?
	* used to design new software tests and evaluate the quality of existing software tests
	* involves modifying a program in small ways
	* each mutated version is called a mutant and tests detect and reject mutants by cause the behavior of the original version to differ from the mutant
		* called killing the mutant
	* test suites are measured by the percentage of mutants that they kill
		* new test can be designed to kill additional mutants
	* mutants are based on well-defined mutation operators that either mimic typicall programming errors oe force the creation of valuable tests
	* purpose is to help the tester develop effective tests or locate weaknesses in the test dara used for the program or in sections of the code that are seldom or never accessed during exectution
	* a form of white-box testing






