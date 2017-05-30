# bash rtfm my initial exploration into the arcane and wizadry of GNU
4/10/2017, 5/10/2017

* [what is bash](https://www.gnu.org/software/bash/manual/bash.html#What-is-Bash_003f)?
	* the shell or command language interpreter for the GNU operating system
	* stands for 'Bourne-Again SHell' a pun best left to historians
	* compatible with `sh`
	* implements useful features from
		* Korn shell `ksh`
		* C shell `csh`
	* default shell for GNU operating systems

* [what is a shell](https://www.gnu.org/software/bash/manual/bash.html#What-is-a-shell_003f)?
	* macro processor that executes commands
	* dual natured
		* command interpreter
			* provides a UI to GNU utilities
		* programming language
			* allows GNU utilities to be combined
	* two modes
		* interactive
			* accept any input typed from the keyboard
		* non-interactive
			* execute commands read from a file
			* this allows files containing commands to become commands themselves
				* have the same status as system commands in directories such as `/bin` 
				* allows users or groups to establish custom environment to automate their own custom tasks
	* commands can executed in two ways
		* synchronously
			* shell waits for synchronous commands to complete before accepting more input
		* asynchronously
			* continue to execute in parallel with the shell while it reads and executes addirional commands
	* builtins
		* a small set of commands that do things that would be impossible or inconvenient to do via a seperate utility
			* programs that directly manipulate the shell itself would be problematic otherwise
				* `cd`, `break`, `continue`, `exec`
			* programs that would be very inconvenient to use as separate utilities
				* `history`, `getopts`, `kill`, `pwd`

* [what is a macro processor](http://jon.es/htm4l/htm4l/macros.html)?
	* a program where identified text and symbols are expanded to create larger expressions
		* sort of like subsitution in algebra

* what does [POSIX mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* family of open system standards based on Unix
	* bash is primarily concerned with the shell and utilities portion of the POSIX 1003.1 standard

* what does [blank mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* space or tab character
	* ascii
		* ` `
		* `\t`

* what does [builtin mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* command that is implemented internally by the shell itself rather than by an executable program somewhere in the file system

* what does [control operator mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* token that performs a control function
	* control operators
		* `\n`
		* `||`
		* `&&`
		* `&`
		* `;`
		* `;;`
		* `;&`
		* `;;&`
		* `|`
		* `|&`
		* `(`
		* `)`


* what does [token mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* sequence of characters considered a single unit by the shell
	* either a word or an operator

* what does [word mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* sequence of characters treated as a unit by the shell
	* may not include unquoted metacharacters

* what does [metacharacter mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* character that when unquoted separates words
	* metacharacters
		* ` `
		* `\t`
		* `\n`
		* `|`
		* `&`
		* `;`
		* `(`
		* `)`
		* `<`
		* `>`

* what does [operator mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* control operator or a redirection operator
	* operators contain at least one unquoted metacharacter

* what does [exit status mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* value returned by a command to its caller
		* restricted to 8 bits max value is 255

* what does [field mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* unit of text that is the result of one of the shell expansions
		* after expansion when executing a command the resulting fields are used as the command name and arguments

* what does [filename mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* string of characters used to identify a file

* what does [job mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* set of processes comprising a pipeline
		* all processes that descend from it that are all in the same process group

* what does [job control mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* mechanism by which users can selectively stop (suspend) and restart (resume) execution of processes

* what does [name mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* word consisting solely of letters, numbers, and underscores
		* must begin with a letter or underscore
	* used as shell variable and function names
	* also referred to as identifier

* what does [process group mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* collection of related processes each having the same process group ID

* what does [process group ID mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* unique identifier that represents a process group during its lifetime

* what does [reserved word mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* word that has a special meaning to the shell
	* usually used to introduce flow control constructs

* what does [return status mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* synonym for exit status

* what does [signal mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* mechanism by which a process may be notified by the kernel of an event occurring in the system

* what does [special builtin mean in the GNU context](https://www.gnu.org/software/bash/manual/bash.html#Definitions)?
	* builtin command that has been classified as special by the POSIX standard

* what are the [bash's basic shell features](https://www.gnu.org/software/bash/manual/bash.html#Basic-Shell-Features)?
	* building blocks
		* commands
		* control structures
		* shell function
		* shell parameters
		* shell expansions
		* redirections
	* shell features
		* syntax
			* what your input means to the shell
		* commands
			* the types of commands you can use
		* functions
			* grouping commands by name
		* parameters
			* how the shell stores values
		* shell expansions
			* how bash expands parameters and the various expansions available
		* redirections
			* a way to control where input and output go
		* executing commands
			* what happens when you run a command
		* shell scripts
			* executing files of shell commands

* how does the [syntax of bash work](https://www.gnu.org/software/bash/manual/bash.html#Shell-Syntax)?
	* components
		* shell operation
			* the basic operation of the shell
		* quoting
			* how to remove the special meaning from characters
		* comments
			* how to specify comments
	* shell reads input proceeding through a sequence of operations
		* input indicates the beginning of a comment 
			* shell ignores the comment symbol and the rest of that line
		* divides the input into words and operators
			* employes the quoting rules to select which meanings to assign various words and characters
		* parses tokens into commands and other constructs
			* removes special meaning of certain words or characters
			* expands certain words or characters
			* redirects input and output as needed
			* executes the specified command
			* waits fot the commands exit status
			* makes the exit status available for further inspection or processing

* how does bash [operate on it's input](https://www.gnu.org/software/bash/manual/bash.html#Shell-Operation)?
	* reads input
		* from file
		* string supplied as an argument to the `-c` invocation option
		* from the user's terminal
	* breaks the input into words and operators 
		* obeys quoting rules
		* tokens are separated by metacharacters
		* alias expansion is performed by this step
	* parses the tokens into simple and compound commands
	* perform shell expansions
		* break the expanded tokens into
			* lists of filenames
			* commands
			* arguments
	* preforms any necessary redirections
		* removes redirection operators and their operands from the argument list
	* execute the command
	* optionally waits for the command to complete and collects its exit status

* what are the [bash quoting rules](https://www.gnu.org/software/bash/manual/bash.html#Quoting)?
	* components
		* escape characters
			* how to remove the special meaning from a single character
		* single quotes
			* how to inhibit all interpretation of a sequence of characters
		* double quotes
			* how to supress most of the interpretation of a sequence of characters
		* ANSI-C quoting
			* how to expand ANSI-C sequences in quoted strings
		* locale translation
			* how to translate strings into different languages
	* used to remove special meaning of certain characters or words to the shell
		* disable special treatment for special characters 
		* prevent reserved words from being recognized as such
		* prevent parameter expansion
	* shell metacharacters hold special meaning to the shell and must be quoted to represent itself
	* when command history expansion facilities are being used
		* history expansion character must be quoted to prevent histroy expansion 
	* mechanisms
		* escape character
		* single quotes
		* double quotes

* how do [escape characters of bash's quoting rules work](https://www.gnu.org/software/bash/manual/bash.html#Escape-Character)?
	* non-quoted `\` is the bash escape character
	* preserves the literal value of the next character that follows

* how do [single quotes in bash's quoting rules work](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes)?
	* preserves the literal value of each character within the quotes
	* a single quote may not occur between single quotes even when preceded by an escape character

* how do [double quotes in bash's quoting rules work](https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes)?
	* preserves the literal value of all characters within the quotes with exception
		* `$`
		* ```
		* `\`
			* retains special meaning when followd
				* `$`, ```, `"`, `\\`, `newline`
			* removes the `\` character
		* `"`
			* must be preceded by a backslash 
		* when history expansion is enabled
			* `!`
	* characters with special meaning in double quotes
		* `*`
		* `@`

* how does [ANSI-C quoting work in bash's quoting rules](https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting)?
	* words of the form `$'string'` are treated specially
		* decoded as followed eliminating the dollar sign and `\`
			* `\a`
				* alert (bell)
			* `\b`
				* backspace
			* `\e`, `\E`
				* escape character
			* `\f`
				* form feed
			* `\n`
				* newline
			* `\r`
				* carriage return
			* `\t`
				* horizontal tab
			* `\v`
				* vertical tab
			* `\\`
				* backslash
			* `\'`
				* single quote
			* `\"`
				* double quote
			* `\?`
				* question mark
			* `\cx`
				* a control-x character

* how does [locale-specific translation work in bash quoting](https://www.gnu.org/software/bash/manual/bash.html#Locale-Translation)?
	* double quoted string preceded by a dollar sign will cause the string to be translated according to the current locale
		* `$"string"`
		* if the current locale is C or POSIX the dollar sign is ignored

* how do [comments work in the bash syntax](https://www.gnu.org/software/bash/manual/bash.html#Comments)?
	* non-interactive shell
		* a word beginning with `#` will cause all characters that follow it until the next line to be ignored
	* interactive shell
		* if `interactive_comments` option of the `shopt` builtin is enabled
			* a word beginning with `#` will cause all characters that follow it until the next line to be ignored
		* else
			* comments are disabled
		* default in interactive shells is for it to be turned on

* how does bash [expand simple commands](https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion)?
	* when a simple command is executed the shell performs the following expansions assignments and redirections from left to right
		* the words that the parser has marked as variable assignments and redirections are saved for later processing
		* the words that are not variable assignments or redirections are expanded 
			* if any words remain after expansion the first word is taken to be the name of the command and the remaining words are the arguments
		* redirections are performed as described above
		* the text after the `=` in each variable assignment undergoes tilde expansion, parameter expansion, command subsitution, arithmetic expansion, and quote removal before being assigned to the variable
	* no command name results
		* the variable assignments affect the current shell environment
		* otherwise the variables are added to the environment of the executed command and do not affect the current shell environment 
			* if any of the assignments attempt to assin a value to a readonly variable an error occurs and the command exits with a non-zero status
		* redirections are performed but do not affect the current shell environment
			* a redirection error causes the command to exit with a non-zero status
	* command name left after expansion
		* execution proceeds 
		* command exits

* how does bash [execute simple commands](https://www.gnu.org/software/bash/manual/bash.html#Command-Search-and-Execution)?
	* command name contains no slashes
		* the shell attempts to locate it
			* if there exists a shell function by that name that function is invoked
	* name does not match a shell function
		* shell searches for it in the list of shell builtins
			* if match found builtin is invoked
	* name is neither a shell funciton or a builtin and contains no slashes
		* shell searches each element of $PATH for a directory containing an executable file by that name
		* uses a hashtable to remember the full pathnames of executable files to avoid multiple path searches 
		* a full search of the directories in $PATH is performed only if the command is not found in the hash table
			* if the search is unsuccessful the shell searches for a defined shell function named `command_not_found_handle` 
			* if the function exists it is invoked with the original command and the original commands arguments as its arguments and the function's exit status becomes the exit status of the shell
			* if the function is not defined the shell prints an error message and returns an exit status of 127
	* search is successful or if the command name contains one or more slashes 
		* the shell executes the named program in a separate execution environment
	* execution fails because the file is not in executable format and the file is not a directory
		* it is assumed to be a shell script and the shell executes it as described in shell scripts
	* command was not begun asynchronously
		* the shell waits for the command to complete and collects its exit status

* how does bash [handle command exit status's](https://www.gnu.org/software/bash/manual/bash.html#Exit-Status)?
	* the exit status of an executed command is the value returned by the waitpid system call or equivalent function 
		* exit statuses fall between 0 and 255
		* the shell may use values above 125 ina  special way
		* exit statuses from shell builtins and compound commands are also limited to this range
		* under certain circumstances the shell will use speciial values to indicate specific failure modes
	* for the shell's purposes a command which exits with a zero exit status has succeeded
		* a non-zero exit status indicates failure
		* this seemingly counter-intuitive shceme is used so there is one well-defined way to indicate success and a variety of ways to indicate various failure modes
		* when a command terminates on a fatal whose number is N bash uses the value 128+N as the exit status
	* if a command is not found the child process created to execute it returns a status of 127
		* if a command is found but is not executable the return status is 126
	* if a command fails because of an error durinf expansion of redirection the exit status is greater than 0
	* the exit status is used by the bash conditional commands and some of the list constructs
	* all of the bash builtins return an exit status of zero if they succeed and a non-zero status on failure so they may be used by the conditional and list constructs 
		* all builtins return an exist status of 2 to indicate incorrect usage, generally invalid options or missing arguments





























