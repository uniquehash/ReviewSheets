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
	* testing artifacts
		* test plan
			* a document detailing the objectives, target market, internal beta team, and processes for a specific beta test
		* traceability matrix
			* a table that correlates requirements or design documents to test documents
		* test case
			* normally consists of a unique identifier, requirement references from a design specification, preconditions, events, a series of steps to follow, input, output, expected result, and actual result
		* test script
			* a procedure, or programming code that replicates user actions
		* test suite
			* most common term for a collection of test cases
		* test fixture or test data
			* multiple sets of values or data are used to test the same functionality of a particular feature
		* test harness
			* the software, tools, samples of data input and output, and configurations are all reffered to collectively as the test harness

* what is [unit testing](https://en.wikipedia.org/wiki/Unit_testing)?
	* a software testing method by which units are tested to determine whether they are fit to use
		* individual units of source code
		* sets of one or more computer program modules together with associated control data
		* usage procedures
		* operating procedures
	* description
		* one can view a unit as the smallest testable part of an application
		* procedural programming
			* unit could be an entire module
			* more commonly an individual function or procedure
		* object-oriented programming
			* unit is often an entire interface such as a class
			* can also be an individual method
		* ideally each test case is independent from the others
		* substitutes such as X can be used to assist testing a module in isolation
			* method stubs
			* mock objects
			* fakes
			* test harnesses
		* some classes may have references to other classes and testing a class can frequently splii over into testing another class
			* unit test should usually not go outside of its own class boundary
			* especially should not cross such process/network boundaries
				* can introduce unacceptable performance problems to the unit test-suite
			* crossing such unit boundaries turns unit tests into integration tests
				* when test cases fail makes it less clear which component is causing the failure
			* swe should create an abstract interface around the database queries
				* then implement that interface with their own mock object
				* allows the unit to be more thoroughly tested than may have been previously achieved
	* techniques
		* unit testing is commonly automated
		* objective in unit testing is to isolate a unit and validate its correctness
		* to fully realize the effect of isolation while using an automated approach the unit or code body under test is executed within a framework outside of its natural environment
	* advantages 
		* the goal of unit testing is to isolate each part of the program and show that the individual parts are correct
		* provides a strict written contract that the piece of code must satisfy
		* find problems early
			* bugs in implementation
			* flaws or missing parts in the specification for the unit
				* the process of writing thorough set of tests forces the author to think through inputs, outputs, and error conditions
		* facilitates change
			* allows programmers to refactor cord or upgrade system libraries at a later data, and still have certainty the module still works correctly
		* simplifies integration
			* may reduce uncertainty in the units themselves and can be used in a bottom-up testing style approach
			* simplifies integration tests
		* documentation
			* provides a sort of living documentation of the system
			* developers looking to learn what functionality is provided by a unit, and how to use it can look at the unit tests to gain a basic understanding of the units interface
			* unit test cases embody characteristics that are critical to the success of the unit
			* can indicate appropriate/inappropriate use of a unit as well as negative behaviors that are to be trapped by the unit
		* design
			* the combination of writing the unit test to specify the interface plus the refactoring activities performed after the test is passing may take the place of formal design
	* disadvantages
		* decision problem
			* cannot cover every edge case
		* not integration testing
			* elaborate hierarchy of unit tests does not equal integration testing
			* integration with peripheral units should be included in integration tests but not in unit tests
			* integration testing typically relies heavily on humans testing manually
			* high-level or global-scope testing can be difficult to automate 
				* manual testing often appears faster and cheaper
		* combinatorial problem
			* testing code requires significantly more code than writing code
			* some problems are intrinsically harder to test
				* nondeterministic in nature
				* involve multiple threads
			* unit test code is likely to be as buggy as the code its testing
		* realism
			* difficulty of setting up realistic and useful tests 
			* necessary to create relevant initial conditions so the part of the application being tested behaves like the part of the complete system
		* record keeping
			* to obtain the intended benefits from unit testing rigorous discipline is needed throughout the software development process
			* essential to keep careful records not only of the tests that have been performed, but of all the changes that have been made to the source code of this or any other unit in the software
		* sustainability challenges
			* essential to implement a sustainable process for ensuring that the test case failures are reviewed regularly and addressed immediately
		* platform differences
			* unit testing embedded system software presents a unique challenge
				* software is being developed on a different platform that the one it will eventually run on 
				* cannot readily run a test program in the actual deployment environment	
		* external work
			* unit tests tend to be easiest when a method has input parameters and some output
			* not as easy to create unit tests when a major function of the method is to interact with something external to the application
				* mocks are not as comprehensive

* what is a [method stub](https://en.wikipedia.org/wiki/Method_stub)?
	* a piece of code used to stand in for some other programming functionality
		* may simulate the behavior of existing code 
		* temproary substitute for yet-to-be-developed code
	* most useful in porting, distributed computing as well as general software development and testing
	* a routine that does not actually do anything other than declaring itself and the parameters it accepts and returning something that is usually the values expected in one of the positive cases for the caller
	* common as placeholders for implementation of a known interface, where the interface is designed but not yet implemented

* what is a [mock object](https://en.wikipedia.org/wiki/Mock_object)?
	* simulated objects that mimic the behavior of a real objects in controlled ways
	* programmer typically creates a mock object to test the behavior of some other object 
	* reasons for use
		* can simulate the behavior of complex, real objects
			* useful when a real object is impractical or impossible to incorporate into a unit test
		* if object has any of the following characteristics use a mock object
			* object supplies non-deterministic results
			* has states that are difficult to create or reproduce
			* is slow 
			* does not yet exist or may change behavior
			* would have to inlcude information and methods exclusively for testing purposes
	* technical details
		* mock objects have the same interface as the real objects they mimic allowing a client object to remain unaware of whether it is using a real object or a mock object
		* many mock object frameworks allow programmers to specify which and in what order methods will be invoked on a mock object and what parameters will be passed to them as well as what values will be returned
		* the behavior of a complex object such as a network socket can be mimicked by a mock object 
			* allows the programmer to discover whether the object being tested responds appropriately to the wide variety of states such mock object may be in
		* mocks, fakes, and stubs
			* classification between these things is highly inconsistent across the literature
				* consistently though they all represent a production object in a testing environment by exposing the same interface
		* setting expectations
			* you can set state
			* you can set return values
		* writing log strings
			* within mocks you can add loging entries informing the ready of what happened
	* limitations
		* the use of mock objects can closely couple the unit tests to the implementation of the code that is being tested 
		* if overdone can cause maintenance issues

* what is a [test harness](https://en.wikipedia.org/wiki/Test_harness)?
	* a collection of software and test data configured to test a problem unit by running it under varying conditions and monitoring its behavior and outputs	
		* two main components	
			* test execution engine
			* test script repository
	* allows for the automation of tests
	* should 
		* allow specific tests to run 
		* orchestrate a runtime environment
		* provide a capability to analyze results
	* typical objectives 
		* automate the testing process
		* execute test suites of test cases
		* generate associated test reports 
	* may provide following benefits
		* increased productivity due to automation of the testing process
		* increased probability that regression testing will occur
		* increased quality of software components and applications
		* repeatability of subsequent test runs
		* offline testing
		* access to conditions and/or use cases that are otherwise difficult to simulate
	* alternative definition
		* software constructed to facilitate integration testing 

* what is [test automation](https://en.wikipedia.org/wiki/Test_automation)?
	* the use of special software to control the execution of tests and the comparison of actual outcomes with predicted outcomes
	* can automate some repetitive but necessary tasks in a formalized testing process already in place 
		* perform additional testing that would be difficult to do manually
	* overview
		* once automated tests have been developed they can be run quickly and repeatedly
		* two main approaches
			* graphical user interface testing
				* testing framework that generates user interface events such as keystrokes and mouse clicks, and observes the changes that result in the user interface, to validate that the observable behavior of the program is correct
			* api driven testing
				* testing framework that uses a programming interface to the application to validate the behaviour under test
				* typically api driven testing bypasses application user interfaces altogether 
				* can also be testing public usually interfaces to classes 
				* modules or libraries are tested with a variety of input arguments to validate that the results that are returned are correct
		* can be expensive and are usually employe in combination with manual testing 
			* cost-effective in the long term especially when used in regression testing
		* one way to generate test cases automatically is model-based testing through the use of a model of the system for test case generaion
		* 5 main factors to consider in test automation decision are
			* SUT (System Under Test)
			* the types and number of tests
			* test-tool
			* human and organizational topics
			* cross-cutting factors
		* most frequent individual factors identified in the study were
			* need for regression testing
			* economic factors
			* maturity of SUT (System Under Test)
	* unit testing
		* growing trend in software development is the use of testing framework such as the xUnit framework that allow the execution of unit tests to determine whether various sections of the code are acting as expected under various circumstances
	* GUI (Graphical User Interface) testing
		* many test automation tools provide record and playback features that allow users to interactively record user action and replay them back any number of times, comparing actual results to those expected
		* requires little to no software development
		* reliance on these features poses major reliability and maintainability problems
			* relabelling a button or moving it to another part of the window may require the test to be re-recorded
		* for GUI testing on websites use headless browsers
		* script-less test automation
			* builds a model of the application and then enables the tester to create test cases by simply inserting test parameters and conditions 
	* API driven testing
		* widely used by software testers due to the difficulty of creating and maintaining GUI-based automation testing
		* involves directly testing APIs as part of integration testing to determine if they meet expectations for functionality, reliability, performance, and security
		* APIs lack a GUI 
		* API testing is performed at the message layer
		* considered critical when an API serves as the primary interface to application logic since GUI tests can be difficult to maintain with the short release cycles and frequent changes commonly used with agile software development
	* continuous testing
		* the process of executing automated tests as part of the software delivery pipeline to obtain immediate feedback on the business risks associated with a software release candidate
		* scope of testing extends from validating bottom-up requirements or user stories to assessing the system requirements associated with overarching business goals
	* what to test
		* platform and OS independence
		* data driven capability
			* input data
			* output data
			* metadata
		* customizable reporting
		* easy debugging and logging
		* version control friendly 
		* extensible & customizable
		* common driver
		* support unattended test runs for integration with build processes and batch runs 
		* email notification like bounce messages
		* support distributed execution environment
		* distributed application support
	* framework approach in automation
		* a test automation framework is an integrated system that sets the rules of automation of a specific product
		* system integrates
			* fuction libraries
			* test data sources
			* object details
			* various reusable modules
		* components act as small building blocks which need to be assembled to represent a business process
		* main advantage is the low cost for maintenance
		* various framework/scripting techniques are generally used
			* linear
				* procedural code, possibly generated by tools like those that use record and playback
			* structured
				* uses control structures
			* data-driven
				* data is persisted outside of tests in a database, spreadsheet, or other mechanism
			* keyword-driven
			* hybrid
				* two or more of the patterns above are used
			* agile automation framework	
		* testing framework is responsible for
			* defining the format in which to express expectations
			* creating a mechanism to hook into or drive the application under test
			* executing the tests
			* reporting results
		* test automation interface
			* platforms that provide a single workspace for incorporating multiple testing tools and frameworks for system/intergration testing of application under test
			* the goal of test automation interface is to simplify the process of mapping tests to business criteria without coding coming in the way of the process
			* core modules	
				* interface engine
					* built on top of interface environment
					* consists of a parser and a test runner
					* parser is present to parse the object files coming from the object repository into the test specific scripting language
					* test runner executes the test scripts using a test harness
				* interface environment
				* object repository
					* are a collection of UI/Application object data recorded by the testing tool while exploring the application under test
	* defining boundaries between automation framework and a testing tool
		* tools are specifically designed to target some particular test environment 
		* tools serve as a driving agent for an automation process
		* automation framework is infrastructure that provides solutions where different tools can do their job in a unified manner
	
* what is [xUnit](https://en.wikipedia.org/wiki/XUnit)?
	* the collective name for several unit testing frameworks that derive their structure and functionality from smalltalks SUnit
	* xUnit architecture
		* test runner
			* an executable program that runs tests implemented using an xUnit framework and reports the test results
		* test case
			* the most elemental class
			* all unit tests are inherited from here
		* test fixtures
			* also known as a test context
			* the set of preconditions or state needed to run a test
			* developer should set up a known good state before the tests and return to the original state after the tests
		* test suites
			* a set of tests that all share the same fixture
		* test executions
			* the execution of an individual unit test proceeds as follows
		* test result formatter
			* produces results in one or more output formats
		* assertions
			* a function or macro that verifies the behavior or the state of the unit under test
			* usually assertion expresses a logical condition that is true for results expected in a correctly running system under test
			* failure of an assertion typically throws an exception, aborting the execution of the current test

		











































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






