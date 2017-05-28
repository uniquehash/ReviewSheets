# research - minishell - 04/10/2017

* how exactly does bash shell work?
	* not yet youging first i must explore the GNU

* which components of GNU bash must minishell implement?
	* simple commands
		* shell syntax
		* shell command
			* simple commands
	* environment
		* shell parameters
	* builtins
		* shell builtin commands 
			* Bash Builtin Commands

* what is [errno](https://en.wikipedia.org/wiki/Errno.h)?
	* header file in the stdlib
	* defines macros for reporting an retrieving error conditions through error codes 

* what does the man say access do?
	* `#include <unistd.h>`
	* `int access(const char *path, int amode)`
	* checks the accessibility of the file named by path for the access permissions indicated by amode
		* amode
			* bitwise inclusive OR of the access permissions to be checked

* what does the man say getcwd do?
	* `#include <unistd.h>`
	* `char *getcwd(char *buf, size_t size)`
	* copies the absolute pathname of the current working directory into the memory referenced by buff and returns a pointer to buf
		* size argument is the size in bytes of the array referenced by buf
		* if buf is NULL space is allocated as necessary to store the pathname

* what does the man say chdir do?
	* `#include <unistd.h>`
	* `int chdir(const char *path)`
	* the path argument points to the pathname of a directory
	* the `chdir` function causes the named directory to beome the current working directory
		* the starting point for path searches of pathnames not beginning with a slash

* what does the man say fstat do?
	* `#include <sys/stat.h>`
	* `int fstat(int fildes, struct stat *buf)`
	* obtains information about an open file known by the file descriptor filedes

* what does the man say fork do?

* what does the man say execve do?

* what does the man say wait do?

* what does the man say waitpid do?

* what does the man say wait3 do?

* what does the man say wait4 do?

* what does the man say signal do?

* what does the man say kill do?

