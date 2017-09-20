# notes on the unit testing framework pytest

* what is [pytest](https://docs.pytest.org/en/latest/index.html)?
	* the pytest framework makes it easy to write small tests
 	* scales to support complex functional testing for applications and libraries
 	* features
 		* detailed info on failing assert statements
 		* auto-discovery of test modules and functions
 		* modular fixtures for managing small or parametrized long-lived test resource
		* can run unittest including trial and nose test suites out of the box
		* rich plugin architecture, with over 315+ external plugins

* how to [get started with pytest](https://docs.pytest.org/en/latest/getting-started.html)?
	* install
		* `pip install -U pytest`
	* first test run
		* create a first test file with a simple test function
		* test_sample.py
		```
			# content of test_sample.py
			def func(x):
				return x + 1
			def test_answer():
				assert func(3) == 5
		```
		* execute test function
			* `pytest`
	* pytest will run all files in the current directory and it subdirectories of the form test_*.py or *_test.py
		* follows a set of standard test discovery rules
	* asserting than a certain exception is raised
		* to assert that some code raises an exception you can use the raises helper 
		```
			# content of test_sysexit.py
			import pytest
			def f():
				raise SystemExit(1)
			def test_mytest():
				with pytest.raises(SystemExit):
					f()
		```
	* grouping multiple tests in a class
		* tests can be logically grouped together into classes
		```
			# content of test_class.py
			class TestClass(object):
				def test_one(self):
					x = 'this'
					assert 'h' in x	
				def test_two(self):
					x = 'hello'
					assert hasattr(x, 'check')
		```
	* functional testing
		* requesting a unique temporary directory
			* for functional tests one often needs to create some files and pass them to application objects
			* pytest provides builtin fixtures/function arguments which allow to request arbitraty resources for example a unique temporary directory
			```
				# content of test_tmpdir.py
				def test_needsfiles(tmpdir):
					print (tmpdir)
					assert 0
			```
			* using the name `tmpdir` in the test function signature will allow pytest to lookup and call a fixture factory to create the resources before execution
		* pytest has many builtin fixtures/function arguments

* what are the [invocations and usage of pytest](https://docs.pytest.org/en/latest/usage.html)?
	* invoke testing through the python interpreter from the command line
		* `python -m pytest [...]`
		* almost equivalent to invoking the command line script `pytest [...]` directly, except that python will also add the current directory to sys.path
	* possible exit codes
		* running pytest can result in six different exit codes
			* exit code 0
				* all tests were collected and passed successfully
			* exit code 1
				* tests were collected and run but some of the tests failed
			* exit code 2
				* test execution was interrupted by the user
			* exit code 3
				* internal error happened while executing tests
			* exit code 4
				* pytest command line usage error
			* exit code 5
				* no tests were collected
	* stopping after the first (or N) failures
		* `pytest -x			# stop after first failure`
		* `pytest --maxfail = 2		# stop after two failutes`
	* specifying tests / selecting tests
		* pytest supports several ways to run and select tests from the command-line
		* run tests in a module
			* `pytest test_mod.py`
		* run tests in a directory
			* `pytest testing/`
		* run tests by keyword expressions
			* `pytest -k "MyClass and not method"
				* will run tests which contain names that match the given string expression
				* which can include python operators that use filenames, class names and function names as variables
				* above example will run
					* `TestMyClass.test_something`
				* but not
					* `TestMyClass.test_method_simple`
		* run tests by node ids
			* each collected test is assigned a unique nodeid which consist of the module filename followed by specifiers like class names, function names, and parameters from parametrization seperated by characters
			* run a specific test within a module
				* `pytest test_mod.py::test_func`
				* `pytest test_mod.py::TestClass::test_method`
			* run tests by marker expressions
				* `pytest -m slow`
				* will run all tests which are decorated with the `@pytest.mark.slow` decorator
			* run tests from packages
				* `pytest --pyargs pkg.testing`
				* will import pkg.testing and use its filesystem location to find and run tests from
	* modifying python traceback printing
	```
		pytest	--showlocals		# show local variables in tracebacks
		pytest	-l			# show local variables (shortcut)

		pytest	--tb=auto		# (default) 'long' tracebacks for the first and last entry
							# 'short' style for the otehr entries
		pytest	--tb=long		# exhaustive, information traceback formatting
		pytest	--tb=short		# shorter traceback format
		pytest	--tb=line		# only one line per failure
		pytest	--tb=native		# python standard library formatting
		pytest	--tb=no			# no traceback at all
	```
	* the `--full-trace` causes very long traces to be printed on error
		* ensures that a stack trace is printed on KeyboardInterrupt
	* dropping to PDB (Python Debugger) on failures
		* `pytest --pdb`
			* this will invoke the python debugger on every failure
		* on every failure the exception information is stored on `sys.last_value`, `sys.last_type`, `sys.last_traceback`
	* setting breakpoints
		* use the native Python `import pdb; pdb.set_trace()` call in code
			* pytest automatically disables its ouput capture for that test
			* output capture in other tests is not affected
			* any prior test output that has already been captured and will be processed as such
			* any later output produced within the same test will not be captured and will instead get sent directly to `sys.stdout`
	* profiling test execution duration
		* to list of the slowest 10 test durations
			* `pytest --durations = 10`
	* creating JUnitXML format files
		* create result files which can be read by Jenkins or other continuous integration servers 
			* `pytest --junitxml=path`
		* to set the name of the root test suite xml item
			* you can configure the `junit_suite_name` option in your config file
			* `[pytest] junit_suite_name = my_suite`
	
	* record_xml_property
		* to log additional information for a test you can use the `record_xml_property` fixture
		```
			def test_function(record_xml_property):
				record_xml_property("example_key", 1)
				assert 0
		```
		* will add an extra property `example_key="1"` to the generated `testcase` tag
	* logXML: add_global_property
		* if you want to add a properties node in the testsuite level which may contains properties that are relevant to all testcases you can use `LogXML.add_global_properties`
		```
			import pytest
			
			@pytest.fixture(scope="session")
			def log_global_env_facts(f):
				if pytest.config.pluginmanager.hasplugin('junitxml'):
					my_junit = getattr(pytest.config, '_xml', None)
				my_junit.add_global_property('ARCH', 'PPC')
				my_junit.add_global_property('STORAGE_TYPE', 'CEPH')
			@pytest.mark.usefixtures(log_global_env_facts)
			def start_and_prepare_env():
				pass
			class TestMe(object):
				def test_foo(self):
					assert True
		```
	* sending test report to online pastebin service
		* creating a URL for each test failure
			* `pytest --pastebin=failed`
		* creating a URL for a whole test session log
			* `pytest --pastebin=all`
	* calling pytest from Python code
		* invoke pytest from python code directly
			* `pytest.main()`
		* pass it options and arguments
			* `pytest.main(['-x', 'mytestdir'])
		* specify additional plugins to pytest.main
		```
			# content of myinvoke.py
			import pytest
			class MyPlugin(object):
				def pytest_sessionfinish(self):
					print("*** test run reporting finishing")
			pytest.main(["-qq"], plugins=[MyPlugin()])
		```

* how do we [write and report assertion in test with pytest](https://docs.pytest.org/en/latest/assert.html)?
	* pytest allows you to use the standard python assert for verifying expectations and values in python tests
	* example
	```
		# content of test_assert1.py
		def f():
			return 3
		def test_function():
			assert f() == 4
	```
	* pytest has support for showing the values of the most common subexpressions including calls, attributes, comparisons, and binary and unary operators
	* if you specify a message with the assertion 
		* `assert a % 2 == 0, "value was odd, should be even"`
		* no assertion introspection takes place at all and the message will simply be shown in the traceback
	* assertions about expected exceptions
		* `pytest.raises`
			* context manager
			* write assertions about raised exceptions
			* example
			```
				import pytest
				def test_zero_division():
					with pytest.raises(ZeroDivisionError):
						1/0
			```
			* if you need to have access to the actual exception info
			```
				def test_recursion_depth():
					with pytest.raises(RuntimeError) as excinfo:
						def f():
							f()
						f()
					assert 'maximum recursion' in str(excinfo.value)
			```
			* `excinfo` is an `ExceptionInfo` instance which is a wrapper around the actual exception raised
				* main attributes of interest are
					* `.type`
					* `.value`
					* `.traceback`
			* in the context manager form you may use the keyword argument message to specify a custom failure message
			```
				>>> with raises(ZeroDivisionError, message="Expecting ZeroDivisionError"):
				...	pass
				... Failed: Expecting ZeroDivisionError
			```
			* context manager form accepts a `match` keywork parameter to test that a regular expression matches on the string representation of an exception
			```
				import pytest
				def myfunc():
					raise ValueError("Exception 123 raised")
				def test_match():
					with pytest.raises(ValueError, match=r'.* 123 .*'):
						myfunc()
			```
				* match uses the re.search function
	* assertions about expected warnings
		* use pytest.warns
	* making use of context-sensitive comparisons
		* pytest has rich support for providing context-sensitive information when it encounters comparisons
		```
			# content of test_assert2.py
			def test_set_comparison():
				set1 = set("1308")
				set2 = set("8035")
				assert set1 == set2
		```
			* special comparisons are done for a number of cases
				* comparing long strings
					* context diff is shown
				* comparing long sequences
					* first failing indices
				* comparing dicts
					* different entries
	* defining your own assertion comparison
		* it is possible to add you own detailed explanations by implementing the `pytest_assertrepr_compare` hook
			* `pytest_assertrepr_compare(config, op, left, right)`
				* return explanation for comparisons in failing assert expressions
				* return None for no custom explanation
				* otherwise return a list of strings 
					* will be joined by newlines 
	* advanced assertion introspection
		* reporting details about a failing assertion is achieved by rewriting statements before they are run
		* rewritten assert statements put introspection information into the assertion failure message
		* pytest only rewrites test modules directly discovered by its test collection process, so asserts in supporting modules which are not themselves test modules will not be rewritten
		* pytest rewrites test modules on import by using an import hook to write new pyc files
			* most of the time this works transparently 
			* if you are messing with import yourself the import hook may interfere
				* two options
					* disable rewriting for a specific module by adding the string PYTEST_DONT_REWRITE to its docstring
					* disable rewriting for all modules by using --assert=plain

* how does the [pytest API and builtin fixtures](https://docs.pytest.org/en/latest/builtin.html)?
	* a list of `pytest.*` API functions and fixtures
	* invoking pytest interactively
		* `main(args=None, plugins=None)`
			* return exit code after performing an in-process test run
			* parameters
				* args
					* list of command line arguments
				* plugins
					* list of plugin objects to be auto-registered during initialization
	* helpers for assertions about exceptions/warnings
		* `raises(expected_exception, *args, **kwargs)`
			* assert that a code block/function call raises `expected_exception` and raise a failure exception otherwise
			* this helper produces a `ExceptionInfo()` object
			* using python 2.5 or above can use this function as a context manager
				* in this form you may use the keyword argument `message` to specify a custom failure message
				```
					>>> with raises(ZeroDivisionError, message="Expecting ZeroDivisionError"):
					...	pass
					Traceback (most recent call last):
						...
					Failed: Expecting ZeroDivisionError
				```
				* can use keyword match to assert that the exception matches a text or regex
				```
					>>> with raises(ValueError, match='must be 0 or None'):
					...	raise ValueError("value must be 0 or None")
					>>> with raises(ValueError, match=r'must be \d+$'):
					...	raise ValueError("value must be 42")
		* `ExceptionInfo(tup=None, exprinfo=None)`
			* wraps sys.exc_info() objects and offers help for navigating the traceback
			* type = None
				* the exception class
			* value = None
				* the exception instance
			* tb = None
				* the exception raw traceback
			* typename = None
				* the exception type name
			* traceback = None 
				* the exception traceback(_pytest._code.Traceback instance)
			* exconly(tryshort=False)
				* return the exception as a string
			* errisinstance(exc)
				* return True if the exception is an instance of exc
			* getrepr(showlocals=False, style='long', abspath=False, tbfilter=True, funcargs=Faslse)
				* returns str()able representation of this exception info
			* match(regexp)
				* match the regular expression 'regexp' on the string representation of the exception
				* if it matches then True is returned (so that it is possible to write 'assert excinfo.match()')
				* if it does not match AssertionError is raised
	* comparing floating point numbers
		* `approx(expected, rel=None, abd=None, nan_ok=False)`
			* assert that two numbers or two sets of numbers are equal to each other within some tolerance
			* by default approx considers numbers within a relative tolerance of 1e-6	
	* raising a specific test outcome
		* you can use the following functions in your test, fixture or setup functions to force a certain test outcome
		* `fail(msg="", pytrace=True)`
			* explicitely fail an currently-executing test with the given message
		* `skip(msg="")`
			* skip an executing test with the given message
			* usually better to use the `pytest.mark.skipif` marker to declare a test to be skipped under certain conditions
		* `importorskip(modname, minversion=None)`
			* return imported module if it has at least "minversion" as its __version__ attribute
			* if no minversion is specified the skip is only triggered if the module cannot be imported
		* `xfail(reason="")`
			* xfail an executing test or setup functions with the given reason
		* `exit(msg)`
			* exit testing process as if keyboardInterupt was triggered
	* fixtures and request
		* `fixture(scope='function', params=None, autouse=False, ids=None, name=None)`
			* return a decorator to mark a fixture factory function
			* this decorator can be used (with or without parameters) to define a fixture function
			* name of the fixture function can later be referenced to cause its invocation ahead of running tests
			* test functions can directly use fixture names as input arguments in which case the fixture instance returned from the fixture function will be injected
			* parameters
				* scope
					* the scope for which this fixture is shared
						* function (default)
						* class
						* module
						* session
				* params
					* an optional list of parameters which will cause multiple invocations of the fixture function and all of the test using it
				* autouse
					* if True the fixture func is activated for all test that can see it
				* ids
					* list of string ids each corresponding to the params so that they are part of the test id
					* if no ids are provided they will be generated automatically from params
				* name
					* name of the fixture
					* defualts to the name of the decorated function
					* if a fixture is used in the same module in which it is defined the function name of the fixture will be shadowed by the function arg that requests the fixture
			* fixtures can optionally provide their values to test functions using a yield statement
		* `FixtureRequest`
			* a request for a fixture from a test or fixture function
			* a request object gives access to the requesting test context and has an optional param attribute in case the fixture is parametrized indirectly
			* fixturename = None
				* fixture for which this request is being performed
			* scope = None
				* scope string one of "function", "class", "module", "session"
			* node
				* underlying collection node
			* config
				* the pytest config object associated with this request 		














































