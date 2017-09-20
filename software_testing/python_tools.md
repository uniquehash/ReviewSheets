# notes on python tools useful for testing

* what are some [python tools useful for testing](https://wiki.python.org/moin/PythonTestingToolsTaxonomy)?
	* holy shit a straight up taxonomy
	* unit testing tools
		|     tool     |     category     |     part of     |             claim to fame             |
		|:------------:|:----------------:|:---------------:|:-------------------------------------:|
		| unittest | unit testing | python stdlib | easy to use by people familiar with the xUnit frameworks; strong support for test organization and reuse via test suites |
		| doctest | unit testing | python stdlib | copy and paste output from shell session; agile documentation; unit tests themselves can serve as documentation when combined with epydoc |
		| pytest | unit testing | standalone | no api!; automatic collection of tests; simple asserts; strong support for test fixtures/state management via setup/teardown hooks; strong debugging support via customized traceback |
		| nose | unittest extension | extension for unittest | provides an alternate test discovery and running process for unittest; intended to mimic the behavior of py.test as much as is reasonably possible without resorting to too much magic; more friendly with unittest; |
		| testify | unittest extensions | extension for unittest | provides enhanced test fixture setup, split test suits into buckets for easy parallelization; fancy color test runner with lots of logging / reporting option
		| trial | unittest extensions | twisted | support writing asynch unit tests using deferreds and new result types; integrates with doctest and coverage | 
		| subunit | unittest extensions | extension for unittest | transparently adds support for running unittest test cases/suits in a separate process; |
		| testresources | unittest extension | extension for unittest | provides a mechanism for managing resources [=> expensive bits of infrastructure] that are needed by tests |
		| testtools | unittest extension | extension for unittest | useful extensions to unittest derived from custom extensions by projects such as twisted and bazaar |
		| sancho | unit testing | mems exchange tools | runs test and provides output for tests that fail; does not count tests passed or failed; targets projects that do not maintain failing tests |
		| zope.testing | unit testing | standalone | test runner that includes support for post-mortem debugging of test failures; includes profiling and coverage reporting; no dependency on zope |
		| pry | unit testing | standalone | elegant unit testing framework with built-in coverage analysis, profiling, micro-benchmarking and a powerful command-line interface |
		| pythoscope | unit testing | standalone | tool that will automatically or semi-automatically generate unit tests for legacy systems written in python |
		| testlib | unittest extension | logilab-common | gives more power to standard unittest; more assert* methods; support for module level setup/teardown; skip test feature |
		| pytest | test runner | logilab-common | test finder/runner; selectively run tests; stop on first failure; |
		| dutest | unittest extension | PyOOP package | object oriented interface to retrieve unittest cases out of doctests; hides initialization from doctests by allowing setup and teardown for each interactive example; allows control over all the options provided by doctest; specialized classes allow selective test discovery across a package hierarchy |
	* mock testing tools


* what is [pytest](https://docs.pytest.org/en/latest/index.html)?
	* the pytest framework makes it easy to write small tests
	* scales to support complex functional testing for applications and libraries
	* features
		* detailed info on failing assert statements
		* auto-discovery of test modules and functions
		* modular fixtures for managing small or parametrized long-lived test resource
		* can run unittest including trial and nose test suites out of the box
		* rich plugin architecture, with over 315+ external plugins




















































































