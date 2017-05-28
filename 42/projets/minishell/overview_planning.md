# overview - minishell - 04/10/2017

* allowed functions
	* malloc
	* free
	* access
	* open, close, read, write
	* opendir, readdir, closedir
	* getcwd
	* chdir
	* stat, lstat, fstat
	* fork
	* execve
	* wait
	* waitpid
	* wait3
	* wait4
	* signal
	* kill
	* exit

* mandatory functionality
	* program a mini UNIX command interpreter
	* must display a prompt
	* must wait until you type a command line, validated by pressing enter
	* the prompt is shown again only once the command has been completely executed
	* simple commands
		* no pipes
		* no redirects
		* no advanced functions
	* the executables are those you can find in the paths indicated in the PATH variable
	* when executables cannot be found it has to show an error message and display the prompt again
	* must manage erros without errno
		* display a message adapted to the error output
	* must deal correctly with the PATH and the environment
		* copy of system `char **environ`
	* you must implement a series of builtins
		* echo
		* cd
		* setenv
		* unsetenv
		* env
		* exit
	* chose as a reference any shell of your choosing

* what i want
	* employ scorched earth development
		* architect for the current needs and only the current needs
		* rebuild as your needs change


* plan 
	* research errno and uderstand how it works
		* design a shitty
		* build a shitty errno
	* refresh on bash interpreter
		* design a shitty interpreter for this set of requirements
		* build a shitty interpreter
	* research the intricacies of how the PATH variable works
		* design a proper PATH setup
		* build a proper PATH setup
	* design a decent environment variables set up
		* build it
	* start working on the built-ins
		* build setenv
		* build unsetenv
		* build env
		* build exit
		* research echo
		* research cd
	* bonus
		* research how to hook up man pages in my shell
			* this probably works out of the box with the PATH













