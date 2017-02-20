# learning go, one question at a time



* why use [go in the first place](http://stackoverflow.com/questions/2198529/what-are-the-advantages-and-disadvantages-of-go-programming-language)?
	* go compile very quickly
	* go supports concurrency at the language level
	* functions are first class objects in go
	* go has garbage collection
	* strings and maps are built into the language
	* go compiles to machine code
	* go is very strongly typed
	* go is not object oriented in the traditional sense
	* comes with an inbuilt web server, no need for Apache or Nginx
	* go has go routines
		* go routines are able to use threads effectively
			* divides the thread again into subthreads
			* for project that require higher concurrency this is a very good choice
	* little environment set up to get started
	* go community is active
	* basically sounds like a less fucked up C

* what should be my first step in learning go?
	* [tour of go](https://tour.golang.org/list)
		* the first steps tutorial offered by the maintainers of go
		* structure
			* basics
				* learning the basics of the language
					* basic scopes
					* basic logic flow
					* basic language constructs
			* methods and interfaces
				* learn how to define methods on types, declare interfaces and put it all together
					* creating your own constructs
			* concurrency
				* go provides concurrency features as part of the core language
					* taking advantage of concurrency in go


* what are packages in go and how do they work?
	* [tour of go](https://tour.golang.org/basics/1)
		* all go programs are composed of packages
			* programs start running in package `main`
		* factored imports
			* import statements can be grouped together with parathese
				* why are [factored import statements good practice](http://stackoverflow.com/questions/30424935/why-is-the-factored-import-statement-better)?
					* there is no machine difference, but there is a readibility and pain in the ass to type difference
		* exported names
			* a name is exported if it begins with a capital letter
			* when importing a package you can only refer to exported names
				* basic anything that does not begin with a capital letter is considered isolated to the scope of the package
	* [Understanding Golang Packages](https://thenewstack.io/understanding-golang-packages/)
		* go provides modularity and code reusability through its package ecosystem
			* encourages writing small pieces of software components through packages and composing the app with these packages
		* workspace
			* programs are kept in a directory hierarchy called a workspace
				* simply a root directory of your go application 
				* three subdirectories
					* src
						* contains source files organized as packages
							* your code goes here
					* pkg
						* contains go package objects
					* bin
						* contains executale programs
				* if you know C this pattern should be very familiar to you
			* you have to specify the location of the workspace before developing go programs
				* GOPATH environment variable is used for specifying the location of go workspaces
		* packages 
			* source files are organized into system directories called packages
				* naming convention
					* name of the system directory where the go source goes
					* within the same folder the package name will be the same for all source
				* first letter of identifier starts with uppercase
					* identifier exported to other packages
				* first letter of identifier starts with lowercase
					* identifier not exoprted to other packages
				* this is basically like a short cut for declaring some things static or not
			* go has a strong standard library
				* comes with a web package built in
			* main
				* for your executable program
				* like C main indicates that the package should compile as an executable (ok not like C)
					* main entry point
			* import
				* the keyword `import` is used for importing packages into other packages
				* download and install third-party go packages by using go get command
					* will fetch the packages from the source repository
					* puts the package on the GOPATH location
		

* what are [functions in golang work(https://tour.golang.org/basics/4)?
	* functions
		* a function can take 0 to more arguments
			* the type of the argument is declared after the variable name
			* cool bonus you can group declarations to save a few characters
		* multiple results
			* a function can return any number of results
			* this is super badass
		* named return values
			* return values can be named
				* treated as variables declared at the top of the function
			* naked return
				* a return without arguments 
				* if the functions has named returns a naked return will return them in their last state of execution

* what are [variables in golang](https://tour.golang.org/basics/8)?
	* variables
		* `var`
			* declares a list of variables 
				* like function argument lists the type is last
			* can be at package or function level 	
		* with initializers 
			* var declarations can include initializers
				* one per variable
				* if an initializer is present the type can be ommitted
					* the variable will take the type of the initializer
			
		* short variable declarations
			* `:=` 
				* short assignment statement
				* inside a function 
					* can be used in place of a `var` declaration with implicit type
				* outside a function
					* every statement begins with a keyword
						* `var`, `func`, ect....
					* `:=` construct not available
			
* what are [basic types in golang](https://tour.golang.org/basics/11)?
	* [more definitions of these types](https://www.tutorialspoint.com/go/go_data_types.htm)
	* four categories of basic types
		* boolean types
			* `bool`
		* numeric types
			* `int`, `int8`, `int16`, `int32`, `int64`
				* `int`
					* usually default to 32 bits wide on 32-bit systems and 64 bits wide on 64-bits systems
				* good practice to use `int` unless there is a specific reason to use a specific width
			* `uint`, `uint8`, `uint16`, `uint32`, `uint64`
				* `uint`
					* usually default to 32 bits wide on 32-bit systems and 64 bits wide on 64-bits systems
				* good practice to use `uint` unless there is a specific reason to use a specific width
			* `byte`
				* alias for `uint8`
			* `rune`
				* alias for `uint32`
				* represents a Unicode code point
			* `float32`, `float64`
				* represents numbers that can contain a frational component
			* `complex64`, `complex128`
				* represents complex numbers
				* `complex64`
					* `float32` to represent the real part and the remaining bits to represent the imaginary parts
				* `complex128`
					* `float64` to represent the real part and the remaining bits to represent the imaginary parts
		* string types
			* `string`
		* derived types
			* come back to this later
	* zero values
		* variables declared without an explicit initial value are given their categories zero value
			* boolean
				* `false`
			* numeric
				* `0`
			* string
				* `""` (empty string)
			* derived types
				* come back later home dog

* how to do [type conversion in golang](https://tour.golang.org/basics/13)?
	* assignment between items of different type requires an explicit conversion
		* general syntax
			* `var f data_type = data_type(i)`
		* concrete example
			```
				var i int = 42
				var f float64 = float64(i)
				var u uint = uint(f)
			```	
	* similar to type casting in C except has to be completely explicit

* what is [type inferencing in golang](https://tour.golang.org/basics/14)?
	* when declaring a variable without specifying an explicit type
		* the variables type is inferred from the value on the right hand side
	* when the right hand side is typed the new variable is of that same type
	* when the right hand side contains an untyped numeric constant
		* variable will adapt to the type of the numeric constant

* what are [constants in golang](https://tour.golang.org/basics/15)?
	* constants are declared like variables
		* with keyword `const` instead of `var`
	* constants can be character, string, boolean, or numeric values
	* constants cannot be declared using the `:=` syntax
	* numeric constants
		* high-precision values
		* untyped constants take the type needed by its context

* what are golangs [looping constructs](https://tour.golang.org/flowcontrol/1)?
	* `for`
		* the only looping construct in golang
		* three components separated by semicolons
			* the init statement	
				* optional
				* exucted before the first iteration
				* often a short variable declaration
					* only visible in the scope of the `for` statement
			* the condition expression
				* evaluated before every iteration
				* loop continues iterating until the boolean condition evaluates to `false`
			* the post statement
				* optional
				* executed at the end of every iteration
		* there are no parentheses surrounding the three components of the `for` statement and the `{}` braces are always required
		* concrete exmple
			* `for x = 0; x < 5; x++ {}`
	* a `for` loop without an init and post statement is basically a while loop
		* a sort of while loop
			* `for x < 100 {}`
	* if you ommit a loop condition it loops forever 
		* an ifinite loop
			* `for {}`

* what are golangs [branching constructs](https://tour.golang.org/flowcontrol/5)?
	* `if`
		* no need for parenthesis but `{}` are required
		* can execute a short statement before the condition
			* similar to `for`
			* variables declared by the statement are only in the scope until the end of the `if`
	* `else`
		* variables declared inside an `if` short statement are also available inside of any of the `if` or `else` blocks that follow
	* `switch`
		* basically a list of `if - else` statments for particular cases
		* the switch key word is followed by a condition of which the result is evaluated against the case statements	
		* `fallthrough`
			* prevents the case from breaking automatically
				* basically forces the code in the next case scope to execute
		* evaluation order
			* cases are evaluated from top to bottom stopping when a case succeeds
		* no condition
			* a switch with no condition is the same as `switch true` as in the switch case will simply run each condition in the cases

* what is a [defer statement in golang](https://tour.golang.org/flowcontrol/12)?
	* this is really fucking cool
	* `defer`
		* defers the execution of a function until the surrounding function returns
		* the arguments of the function are evaluated immediately but the function call is not executed until the surrounding function returns
			* kinda like loading a bullet in the chamber in one function and firing it automatically after the return statement
			* trigger cast? 
			* seriously cool
				* dude this is native to the language whatttttt
	* stacking defer calls
		* deferred function calls are pushed onto a stack
			* when a function returns its deferred calls are executed in LIFO order

	* [more on defer statements](https://blog.golang.org/defer-panic-and-recover)
		* three rules to defer statements
			* deferred functions arguments are evaluated when the `defer` statement is evaluated
			* deferred function calls are executed in LIFO order after the surrounding function returns
			* deferred functions may read and assign to the returning functions named return values

* how to setup your environment to start go?
	* OS X
		* first [download go](https://golang.org/doc/install?download=go1.8.darwin-amd64.pkg)
		* set your [GOPATH environment variable](https://golang.org/doc/code.html#GOPATH) for the directory you will be setting up your first workspace
			* the GOPATH environment variable specifies the location of your workspace
				* defaults to a directory named `go` inside your home directory
			* GOPATH must not be the same path as your go installation
			* [to set your GOPATH](https://github.com/golang/go/wiki/SettingGOPATH)
				* cmd `go env GOPATH` in shell
					* prints the effective current GOPATH
				 * bash
					* go to your shell profile for example `.bash_profile` and add
						* `export GOPATH=$PATH_TO_WORKSPACE`
					* save and source your shell
			* to set your GOBIN
				* bash
					* go to your shell profile for example `.bash_profile` and add
						* `export GOBIN=$PATH_TO_WORKSPACE/bin`
					* save and source your shell
		* test your installation
			* make the directory `src/hello` inside your workspace
				* create a file named `hello.go`
					```
						package main
						import "fmt"
						
						func main() {
							fmt.Printf("hello, world\n")
						}
					```
			* build with the go tool
				* `cd $GOPATH; go build`					
				* builds an executable named `hello` in the `src/hello` directory
			* execute the resulting executable
			* funsies
				* `go install` cmd
					* will install the executable into your workspace `bin` directory 
					* if using custom GOPATH you will want to also set the GOBIN
				* `go clean` cmd
					* will remove the executable from the `src/hello` directory 

* what are [pointers like in golang](https://tour.golang.org/moretypes/1)?
	* like C golang has pointers
	* the syntax is the same as C
		* `var p *data_type`
			* p is a pointer to `data_type`
		* `&`
			* references the memory address
		* `*`
			* derferences the value
	* go does not allow for pointer arithmetic
		* saddddd faceeeee

* what are [structs like in golang](https://tour.golang.org/moretypes/2)?
	* a struct is a collection of properties
	* use the `type` keyword to create a pseudo data type
		* like `typedef` in C
	* struct fields 
		* accessed using a dot
	* pointers to structs
		* pointers to structs allow implicit dereferencing with the dot accessor
	* struct literals
		* denotes a newly allocated struct value by listing the values of its fields
		* list just a subset of fields by using the `Name:` syntax
			* the order of the named fields becomes irrelevant
 
* what are [arrays like in golang](https://tour.golang.org/moretypes/6)?
	* arrays are declared with the brackets before the name (weirdos)
		* abstract
			* `var a [n]data_type`
		* concrete
			* `var a [5]int`
	* they are accessed using traditional syntax
		* `a[0] = 42`
	* an arrays length is part of its type
		* like C arrays cannot be resized

* what are [slices in golang](https://tour.golang.org/moretypes/7)?
	* a dynamically-sized flexible view into the elements of an array
		* slices do not store data
			* describes a section of the array it is referenced from 
			* changing the underlying elements of a slice modifies the corresponding elements of its underlying array
				* if any other slices reference the same array they will see those changes as well
	* declared with a similar syntax to arrays
		* abstract
			* `var slice []data_type`
		* concrete
			* `var x [4]int = {2, 4, 5, 6}; var slice []int = x[1:3]`
		* the difference is that they are declared with empty square brackets
		* the ranges for assigning slices are exclusive
			* `a[0:5]`
				* from index 0 until index 5 not including index 5
	* slice literals
		* a slice literal is like an array literal without a length
			* compiler will first create an array literal from the slice literal and then build a slice that references it
				* array literal
					* `[3]bool{true, true, false}`
				* slice literal
					* `[]bool{true, true, false}`	
	* slice defaults
		* omitting either a high or low bound will set a default
			* low bound is 0
			* high bound is the length of array/slice
	* slice length and capacity
		* length
			* the number of elements it contains
			* can extend the length of a slice by reslicing it if there is enough capacity
		* capacity
			* the number of elements in the referenced array
		* `len(s)`
			* will get the length of a slice
		* `cap(s)`
			* will get the capacity of a slice
		* if you try to extend the length beyond the capacity you get a panic runtime error
	* nil slices
		* the zero value of a slice is `nil`
			* `nil` slices have a length and capacity of 0 and references no array
	* slices and `make`
		* the make builtin function can be used to make slices
	* slices can contain any type
		* including other slices
	* slice and `append`
		* appends the appropriate type to the end of the slice
			* if the result creates a length greater than the capacity
				* allocates a new array to reference from

* what is the [built-in make function in golang](https://golang.org/pkg/builtin/#make)?
	* `func make(Type, size IntegerType) Type`
	* allocates and initializes an object of type
		* slice
			* size specifies the length
			* capacity is equal to length
				* a second integer argument can be used to specify a different capacity
				* cannot be smaller than the length
			* example
				* `make([]int, 0, 10)`
					* returns a slice of length 0 and capacity 10
		* map
			* empty map is allocated with enough space to hold the specified number of elements
			* if size is omitted a small starting size is allocated
		* chan
			* channels buffer is initialized with the specified buffer capacity
				* if zero, or omitted
					* channel is unbuffered
	* first argument is a type not a value
	* return type is the same as the type of its argument
	
* what is the [built-in append function in golang](https://golang.org/pkg/builtin/#append)?
	* `func append(slice []Type, elems ...Type) []Type`
	* appends elements to the end of a slice 
		* if it has sufficient capacity the destination is resliced to accommodate the new elements
		* if it does not a new array to be referenced will be allocated 
		* append returns the updated slice
			* must store the result of append, usually in the variable holding the original slice
	* special case
		* you can append a string to a byte slice
			* `slice = append([]byte("hello "), "world"...)`

* what is a [range in golang](https://tour.golang.org/moretypes/16)?
	* 







































































* why are [factored import statements good practice](http://stackoverflow.com/questions/30424935/why-is-the-factored-import-statement-better)?
	* there is no machine difference, but there is a readibility and pain in the ass to type difference

* what is [different about the go declaration syntax](https://blog.golang.org/gos-declaration-syntax)?
	* declaration is left right (the reverse of c)
		* the variable name is first then followed by the type
	* this is fairly useful when data types get increasingly more complex

* what is a [workspace in the context of go](https://golang.org/doc/code.html#Workspaces)?
	* a directory hierarchy with three directories at its root
		* `src`
			* typically contains multiple version control repositories
			* contains Go source files
		* `pkg`
			* contains package objects
		* `bin`
			* contains executable commands
	* the go tool builds source packages and installs the resulting binaries to the `pkg` and `bin` directories
	* a typical workspace contains many source repositories containing many packages and commands
	* most Go programmers keep **all** their Go source code and dependencies in a single workspace
	
















































	
