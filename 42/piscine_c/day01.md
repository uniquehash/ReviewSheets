# day 01 - August 9

#### questions 

is there a difference between ft_user and user?




#### explore 

* file content processing 
	* display command line 
		* echo 
			* writes arguments to standard output 
		* cat 
			* takes a file as an argument and displays the file to standard output 
			* options 
				* -e 
					* display non-printing characters 
		* more 
			* browse a file 
			* with search 
			* only goes down 
		* less 
			* more advanced allows bi-directional movement 
			* man uses less
	* filter display 
		* head 
			* display first line of file 
		* tail 
			* display last line of file 
			* options 
				* -n 
					* numer of lines to display 
		* grep 
			* will display all lines that contain a substring passed 
			* options 
				* -v 
					* not matching the passed substring 
				* -i 
					* case icensetive matching 
	* redirection 
		* the idea is to redirect standard input and output 
		* need to look deeper into this 
	
* commands
	* sort 
		* sorts what you give it as arguments 
			* lexicalgraphic 
				* uppercase before lowercase 
	* cut 
		* cut each line depending on a delimeter 
	* sed 
		* make modifications on data flow
	* tr 
		* takes two arguments 
			* a character to replace 
			* the replacing character 
	* wc 
		* calculates the number lines, characters, and words in a file 
		* reads on the standard input 
	* file 
		* gives info on a file passed as a parameter 
	* ifconfig 
		* gives info on a network config 
	* bc 
		* calculator 
			* powerful calculator 
			* reads on standard input 
	* find 
		* lists all files in a directory as default 
			* searches recursively 
		* can filter by options 
		* can perform actions on files 
	* env 
		* list of variables in shells automatically sent to all scripts and programs 
		* variables 
			* path:
				* tell the shell where to look for binaries 
			* user 
				* local 
			* terminal 
				* xterm 
			* used to configure shell script 
				
* output
	* two types 
		* stdout
			* can not be piped 
		* stderror
			* cannot be piped by default 
				* redirect stderror to stdoutput 
					* `2>&1`
				* redirect stderror	
					* `2`
	* `/dev/null` 
		* doesnt exist returns an error guranteed 

* groups 
	* show group memberships 
	* obselete see id
		* equivilent to `id -Gn [user]`

* env 
	* set environment and execute command, or print environment

* head 
	* display first lines of a file 
	* description 
		* displays the first count lines or bytes of each specified files or standard input if no files supplied 
			* defaults to 10 	

* id 
	* return user identity 
	* description 
		* displays the user and group names and numeric ids, of the calling process, to the standard output 
		* if the real and effective ids are different both are displayed otherwise only the real id is displayed 
		* options 
			* -A
				* display the process audit user ID and other process audit properties which requires privilege 
			* -F 
				* display the full name of the user 
			* -G 
				* display the different group IDs (effective, real and supplementary) as white-spaced separated numbers, in no particular order 
			* -M 
				* display the MAC label of the current process 
			* -P 
				* display the id as a password file entry 
			* -a 
				* ignored for compatibility with other id implementations 
			* -g 
				* display the effective group id as a number 
			* -n 
				* display the name of the user or group ID for the -G, -g, and -u options instead of the number 
					* if any of the ID numbers cannot be mapped into names the number will display as usual 
			* -p 
				* make the output human readable 
			* -r 
				* display the real ID for the -g and -u options instead of the effective ID 
			* -u 
				* display the effective user ID as a number 

* regex 
	* what is a regular expression 
		* a set of characters that specify a pattern 
			* a grammar and formal language 
		* used to search for specific lines of text containing a particular pattern 
		* distinct from file name matching patterns 
	* structure of a regular expression 
		* 3 major components of a regular expression 
			* anchors 
				* used to specify the position of the pattern in relation to a line of text
				* end of line character not included in search text ($)
			* character sets 
				* match one or more characters in a single position 
			* modifiers 
				* specify how many time the previous character set is repeated 
		* 2 types of regular expressions 
			* basic 
			* extended 
			* most use basic
	* anchors 
		* regular expressions examine the text between the separators 
		* to search text on one end or the other we use anchors 
		* ^
			* the starting anchor 
			* example: 
				* `^A` 
					* match all lines that start with a capital A
		* $ 
			* the end anchor 
			* example: 
				* `A$` 
					* match all lines that end with a capital A
		* if anchors are not used at teh proper end of the pattern than they no longer act as anchors 
			* ^ is only an achor at the beginning of a regex
			* $ is only an achor at the end of a regex 
	* matching a character with a character set 
		* the simplest characterset is a character 
			* regex: `the`
				* three character sets 
				* will match any line with the string "the" inside it 
		* escape special characters with a `\`
	* match any character with `.`
		* alone it will match any character except end-of-line characters 
	* specifying a range of characters with [...]
		* to match specific characters use the square brackets to identify the exact characters you are searching for 
		* match any line of text that contains on number 
			* `^[012345789]$`
		* use a hyphen between two characters to specify a range 
			* `^[0-9]$`
		* you can intermix explicit characters with character ranges 
			* `[A-Za-z0-9_]`
		* character sets can be combined by placing them next to each other 
	* exception in a character set 
		* search for all characters except those in square brackets by putting a `^` as the first character inside the brackets 
		| regular expression | matches 										   |
		| ------------------ | ----------------------------------------------- |
		| []				 | the characters "[]" 							   |
		| [0]				 | the character "0"							   |
		| [0-9]				 | any number 									   |
		| [^0-9]			 | any character other than a number 			   |
		| [-0-9]			 | any number or a "-"							   |
		| [0-9-]			 | any number or a "-" 							   | 
		| [^-0-9]			 | any character except a number or a "-" 		   |
		| []0-9]			 | any number number or a "]" 					   |
		| [0-9]]			 | any number followed by a "]"					   |
		| [0-9-z]			 | any number or any character between "9" and "z" |
		| [0-9\-a\]]		 | any number or a "-", a "a", or a "]" 		   |
	* modifier 
		* the modifier is used to specify how many times you expect to see the previous character set 
		* repeating character sets with * 
			* `*`
				* matches zero or more copies 
		* using `\` with `<`, `>`, `{`, `}`, `(`, `)` will add special meaning 
		* matching a specific number of sets with `\{` and `\}`
			* used to specify the minimum and maximum number of repeats 
				* put the min , max between `\{` and `\}` 
					* any number between 0 and 255 can be used 
					* the second number can be omitted to remove max 
					* the comma and second number can be omitted to force exact number of duplicates 
				* example: 
					* `[a-z]\{4,8\}`
		* matching words with `\<` and `\>` 
			* anchors the expression between word boundaries 
			* example: 
				* `\<[tT]he\>`
		* backreferences - remembering patterns with \(,\) and \1
			* searching for repeated words 
				* i do  ont get how this works 
	* potential problems 
		* regular expressions match the longest possible pattern 
		
* ifconfig 
	* configure network interface parameters 
	* description 
		* the ifconfig utility is used to assign an address to a network interface and/or configure network interface parameters 
			
* awk 
	* patten-directed scanning and processing language 
	* description
		* scans each input file for lines that match any of a set of patterns specified literally in prog or in one or more files specified as -f progfile
			* with each pattern there can be an associated action that will be performed when a line of a file matches the pattern 
		* each line is matched against the pattern portion of every pattern-action statement 
			* associated action performed for each matched pattern 

* sed
	* s
		* means subsitute 
	* description 
		* normal behavior 
			* cyclically copies a line of input without its terminating newline character into a pattern space 
			* applies all of the commands with addresses that select that pattern spce 
			* copies the pattern space to the standard output by appending a newline and deletes the pattern space 
	* [addresses and ranges of text](http://www.grymoire.com/Unix/Sed.html#uh-25)
		* every command in sed can be preceeded by an address, range, or restriction 
			* the restriction or address immediately precedes the command 
		* restricting to a line number 
			* preceed the command by a line number 
				* example setup - delete the first number on line 3 
				* example: 
					* `sed '3 s/[0-9][0-9]*//' <file> new`
		* patterns 
			* enclose a regex in a pair of slashes `/` to search a regular expression to select a line 
				* examples: 
					* delete the first number on all lines that start with `#`
						* `sed '/^#/ s/[0-9][0-9]*//'`
					* if the pattern expression starts with a backslash the next character is a delimeter 
						* to use a comma instead of a slash to enclose a pattern regex
						* useful to search for slashes 
						* delete the first number on all lines that start with `#`
						* `sed '\,^#, s/[0-9][0-9]*//'`
		* ranges by line number 
			* specify a range on line numbers by inserting a comma between the numbers 
			* restrict a substitution to the first 100 lines 
				* `sed '1,100 s/A/a/'`
			* substiture to the end of file 
				* `sed '101,$ s/A/a/'`
		* ranges by patterns 
			* specify two regular expressions as the range
				* assuming `#` starts a comment, search for a keyword remove all comments until you see the second keyword the keywords are start and stop
					* `sed '/start/,/stop/ s/#.*//'`
					* the first pattern turns on a flag that tells sed to perform the substitute command on every line 
					* the second pattern turns off the flag
						* if the start and stop pattern happen twice the substitution is done both times 
							* if stop is missing the flag is never turned off
						* flags are line oriented 
				* using `-e` you can combine line numbers and regular expressions 
					* remove comments from the beginning of the file until it finds the keyword start 
						* `sed -e '1,/start/ s/#.*//'`
					* remove comments everywhere except the line between two keywords 
						* `sed -e '1,/start/ s/#.*//' -e '/stop/,$ s/#.*//'`
	* options 	
		* -n 
			* the default is to echo each line to stdout
			* this supresses that behavior 






















