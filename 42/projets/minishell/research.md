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
	* `#include <unistd.h>`
	* `pid_t fork(void)`
	* forck causes the creation of a new process 
	* the new process (child process) is an exact copy of the calling process (parent process) except for
		* the child process has a unique process ID
		* the child process has a different parent process ID
		* the child process has its own copy of the parent's descriptors
			* these descriptors reference the same underlying objects
				* file pointers in file objects are shared between the child and the parent
				* lseek(2) on a descriptor in the child process can affect a subsequent read or write by the parent
				* this descriptor copying is also used by the shell to establish standard input and output for newly created processes as well as to set up pipes
		* the child processes resource utilization are set to 0
	* returns
		* the process id to the parent

* what does the man say execve do?
	* `#include <unistd.h>`
	* `int execve(const char *path, char *const argv[], char *const envp[])`
	* execve transforms the calling process into a new process
	* the new process is constructed from an ordinary file who's name is pointed to by path called the new process file
	* this file is either an executable object file or a file of dara for an interpreter
	* an executable object file consists of an identigying header, followed by pages of data representing the initial program (text) and initialized data pages
	* additional pages may be specified by the header to be initialized with zero data
	* the argument argv is a pointer to a null-terminated array of character pointers to null-terminated character strings
		* these strings construct the argument list to be made available to the new process
		* at least one argument must be present in the array
			* by custom the first element should be the name of the executed program 
	* the argument envp is a pointe to a null-terminated arrray of character pointer to null-terminate strings
		* a pointer to this array is normally stored in the global variable environ
		* these strings pass information to the new process that is not directly an argument to the command


* what does the man say wait do?
	* `#include <sys/types.h>`
	* `#include <sys/wait.h>`
	* `pid_t wait(int *status)`
	* these system calls are used to wait for state changes in a child of the calling process and obtain information about the child whose state has changed
		* a state change is considered to be
			* the child terminated
				* performing wait allows the system to release the resources associated with the child
				* without wai tthe terminated child remains in a zombie state
			* the child was stopped by a signal
			* the child was resumed by a signal
		* if a child has already changed state then these calls return immediately	
			* otherwise they block until either a child changes state or a signal handler interrupts the call
	* waitable
		* a child whose state has changed and which has not yet been waited upon by one of these system calls
	* wait()
		* suspends execution of the calling process until one of its children terminates
		* equivalent to `waitpid(-1, &status, 0);`


* what does the man say waitpid do?
	* `#include <sys/types.h>`
	* `#include <sys/wait.h>`
	* `pid_t waitpid(pid_t pid, int *status, int options)`
	* these system calls are used to wait for state changes in a child of the calling process and obtain information about the child whose state has changed
		* a state is considered changed when
			* the child process has terminated
				* performing wait allows the system to release the resources associated with the child
			* the child was stopped by a signal
			* the child was resumed by a signal
		* if wait is not performed then the terminated child remains in a zombie state
	* waitable
		* a child whose state has changed and which has not yet been waited upon by one of these system calls
	* waitpid()
		* suspends execution of the calling process until a child specified by pid argument has changed state
		* by default waitpid waits only for terminated children but this behavior is modifiable via the options argument as described below
			* pid < -1
				* wait for any child process whose process group ID is equal to the absolute value of pid
			* pid == -1
				* wait for any child process
			* pid == 0
				* wait for any child process whose process group ID is equal to that of the calling process
			* pid > 0
				* wait for the child whose process ID is equal to the value of pid


* what does the man say wait3 do?
	* `#include <sys/wait.h>`
	* `pid_t wait3(int *stat_loc, int options, struct rusage *rusage)`
	* same thing as wait but with rusage
	* rusage
		* if non-zero a summary of the resources used by the terminated process and all its children is returned 


* what does the man say wait4 do?
	* `#include <sys/wait.h>`
	* `pid_t wait4(pid_t pid, int *stat_loc, int options, struct rusage *rusage)`
	* same thing as waitpid but with rusage
	* rusage
		* if non-zero a summary of the resources used by the terminated process and all its children is returned


* what does the man say signal do?
	* `#include <signal.h>`
	* `void (*signal(int sig, void (*func)(int)))(int)`
		* `typedef void (*sig_t)(int)`
		* `sig_t signal(int sig, sig_t func)`
	* the signal facility is a simplified interface to the more general sigaction(2) facility
	* signals allow the manipulation of a process from outside its domain as well as allowing the process to manipulate itself or copies of itself (children)
		* two types of general types of signals
			* those that cause termination of a process
				* result from an irrecoverable error
				* result of a user at a terminal typing interrupt characters				
			* those that do not cause termination
		* signals are used when a process os stopped because it wishes to access its control terminal while in the background
		* signals are optinally generated when 
			* a process resumes after being stopped
			* when the status of child processes changes
			* when input is ready at the control terminal
		* most signals result in the termination of the process receiving them if no action is take
		* some signals cause the process receiving them to be stopped or are simply discarded if the process has not requested otherwise
	* the sig argument specifies which signal was received
	* the func procedure allows a user to choose the action upon receipt of a signal 
		* for default func should be SIG_DFL
		* to ignore signal func should be SIG_IGN
			* subsequent instances of the signal to be ignored and pending instances to be discarded
	the handled signal is unblocked when the function returns and the process continues from where it left off when the signal occurred


* what does the man say kill do?
	* `#include <signal.h>`
	* `int kill(pid_t pid, int sig)`
	* the kill function sends the signal specified by sig to pid a process or a group of processes
		* typically sig will be one of the signals specified in sigaction(2)
		* a value of 0 however will cause error checking to be performed
			* can be used to check the validity of pid
	* for a process to have permission to send a signal to a process designated by pid the real or effective user ID of the receiving process must mathc that of the sending proccess or the user might have appropriate privileges
		* the SIGCONT can always be sent to any descendant of the current process
	* pid > greater than zero
		* sig is sent to the process whose ID is equal to pid
	* pid == zero
		* sig is sent to all processes whose group ID is equal to the process group ID of the sender and for which the process has permission 
	* pid == -1
		* if the user has super-user privileges the signal is sent to all processes excluding system processes and the porcess sending the signal
		* if the user is not the super-user the signal is sent to all processes with the same uid as the user excluding the process sending the signal




















