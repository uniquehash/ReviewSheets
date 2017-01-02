# research - push_swap - 12/25/2016

* what are the basic requirments of the `ft_ls` project?
	* executable
		* `ft_ls`
	* no segfaults, double free, ect...
		* when in doubt follow `ls`
	* author file
	* allowed functions
		* write
		* opendir
		* readdir
		* closeddir
		* stat
		* lstat
		* getpwuid
		* getgrgrid
		* listxattr
		* time
		* ctime
		* readlink
		* malloc
		* free
		* perror
		* strerror
		* exit
	* any function is allowed for bonus
	* mandatory functionality
		* replicate options
			* `-l`
			* `-R`
			* `-a`
			* `-r`
			* `-t`
		* do not deal with the multiple column format for the exit when the option 	`-l` isn't an argument
		* not required to deal with `ACL` and extended attributes
		* each option should be as identical as possible to the system command
			* liberty on padding and pagination
			* no missing information

* ls the man
	* usage
		* `ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]`
	* description
		* for all non directory `file` operands
			* display
				* name
				* requested information
		* for all directory `file` operands
			* display
				* names of file contained within directory
				* requested information
		* more than one operand
			* non-directory operands are displyed first
			* separate lexicalgraphical ordering for direcotry and non-directory operands
		* no operands
			* contents of current directory are displayed
				* display names
	* options
		* `-@`
			* display extended attribute keys and sizes in long `-l` output
		* `-1`
			* the numeric digit one
			* force output to be one entry per line
			* default when output is not to a terminal
		* `-A`
			* list all entries except for *.* and *..*
			* always set for the super-user
		* `-a`
			* include directory entries whose names begin with a dot *.*
		* `-B`
			* force printing of non-printable characters in file names as *\xxx* where *xxx* is the numeric value of the character in octal
		* `-b`
			* as `-B` but use C escape codes whenever possible
		* `-C`
			* force multi-column output
			* default when output is to a terminal
		* `-c`
			* use time when file status was last changed for sorting (`t`) or long printing (`l`)
		* `-d`
			* directories are listed as plain files (not searched recursively)
		* `-e`
			* print the access control list (ACL) associated with the file if present in long (`-l`) output
		* `-F`
			* display 
				* slash */* immediately after each pathname that is a directory
				* asterisk *** after each that is executable
				* at sign *@* after each symbolic link
				* equal sign *=* after each socket
				* percent sign *%* after each whiteout
				* vertical bar *|* after each that is a FIFO
		* `-f`
			* output is not sorted
			* this turns on the `-a` option
		* `-G`
			* enable colorized output
			* equivalent to defining *CLICOLOR* in the environment
		* `-g`
			* only for compatibility with *POSIX*
			* display group name in long `-l` format output
				* owner name supressed
		* `-H`
			* symbolic links on the command line are followed
			* assumed if none of the `-F`, `-d`, or `-l` options are specified
		* `-h`
			* with `-l`
				* unit suffixes
					* Byte, Kilobyte, Megabyte, Gigabyte, Terabyte, and Petabyte
				* reduces the number of digits to three or less using base 2 for sizes
		* `-i`
			* for each file 
				* print the file's file serial number (inode number)
		* `-k`
			* if the `-s` option is specified
				* print the file size allocation in kilobytes, not blocks
				* overides the environment variable *BLOCKSIZE*
		* `-L`
			* follow all symbolic links to final target and list the file or directory the link references rather than the link itself
			* cancels the `-P` option
		* `-l`
			* list in long format
			* i output is to a terminal a total sum for all the file sizes is output on a line before the long listing
		* `-m`
			* stream output format
			* list files across the page, separated by commas
		* `-n`
			* display user and group IDs numerically, rather than converting to a user or group name in a long `-l` output
			* turns on `-l` option
		* `-O`
			* include the file flags in a long `-l` output
		* `-o`
			* list in long format, but omit the group id
		* `-P`
			* if argument is symbolic link
				* list the link itself rather than the object the link references
			* cancels `-H` and `-L` options
		* `-q`
			* force printing of non-graphic characters in file names as the character *?*
			* default when output is to a terminal
		* `-R`
			* recursively list subdirectories encountered
		* `-r`
			* reverse the order of the sort to get 
				* reverse lexicographical order 
				* the oldest entries first 
				* largest files last
					* sort by size
		* `-S`
			* sort files by size
		* `-s`
			* display the number of file system blocks actually used by each file
				* units of 512 bytes
					* partial units rounded up to next integer value
			* if output is to terminal
				* total sum for all the file sizes is printed on a line before the listing
			* env variable *BLOCKSIZE* overrides the unit size of 512 bytes
		* `-T`
			* with `-l`
				* display
					* complete time information for the file
						* month, day, hour, minute, second, year
		* `-t`	
			* sort by time modified
				* most recently modified first
					* sort by lexicographical order
		* `-u`
			* use time of last access 
				* instead of last modification of the file for sorting `-t` or long output `-l`
		* `-U`
			* use time of file creation
				* instead of last modification for sorting `-t` or long output `-l`
		* `-v`
			* force unedited printing of non-graphic characters
			* this is the default when output is not to a terminal
		* `-W`
			* display whiteouts when scanning directories with `-S` flag
		* `-w`
			* force raw printing of non-printable characters
			* this is the default when  output is not to a terminal
		* `-x`
			* the same as `-C` except that the multi-column output is produced with entries sorted across, ratehr than down the columns

	* order and overrides of arguments
		* arguments are usually additive however
			* `-1`, `-C`, `-x`, `-l`
				* override each other
				* last one specified determines the format used
			* `-c`, `-u`
				* override each other
				* last one specified determines the format used
			* `-B`, `-b`, `-w`, `-q`
				* override each other
				* last one specified determines the format used for non-printable characters
			* `-H`, `-L`, `-P`
				* override each other
				* they are applied in the order specified
	* by default `ls` is one entry per line to stdout
		* exceptions are to terminals or when the `-C` or `-x` options are specified
	* file information is displayed with one or more *<blank>*s separating the information associated with the `-i`, `-s`, and `-l` options

	* the long format
		* if `-l`
			* display
				* file mode
				* number of links
				* owner name
				* group name
				* number of bytes in the file
				* abbreviated month
				* day-of-month was last modified
				* hour file last modified
				* minute file last modified
				* pathname
			* for each directory
				* total number of 512-byte blocks used by files in the directory 
					* line by itself immediately before the information for the files in the directory
				* if file or directory has extended attributes
					* permissions field printed by `-l` option is followed by a `@` character
				* else if the file or directory has extended security information
					* permissions field followed by a '+' character
				* modification time of file is more than 6 months in the past or future
					* year of the last modification is displayed in place of hour and minute field
				* owner or group names are not a known user or group name, or the `-n` option is given
					* numeric id's displayed
				* file is a character special or block special file
					* major and minor devices for the gile are displayed in the size field
				* file is a symbolic link	
					* pathname of the linked-to file is preceded by '->'
		* file mode printed under the `-l` option consists of
			* entry type
				* describes the type of file
					* *b*
						* block special file
					* *c*
						* character special file
					* *d*
						* directory
					* *l*
						* symbolic link
					* *s*
						* socket link
					* *p*
						* FIFO
					* *-*
						* regular file
			* owner permissions
				* three characters
					* *r*
						* file is readable
						* *-* marks not readable
					* *w*
						* file is writable
						* *-* marks not writable
					* the first that applies
						* *S*
							* file is not executable and set-user-ID mode is set
						* *s*
							* file is executable and set-user-ID mode is set
						* *x*
							* the file is executable or the directory is searchable
						* *-*
							* the file is neither readable, writable, executable, nor set-user-ID nor set-group-ID mode, not sticky		
			* group permissions
				* three characters
					* *r*
						* file is readable
						* *-* marks not readable
					* *w*
						* file is writable
						* *-* marks not writable
					* first that applies
						* *S*
							* file is not executable and set-group-ID mode is set
						* *s* 
							* file is executable and setgroup-ID mode is set
						* *x*
							* file is executable or directory is searchable
						* *-*
							* file is neither readable, writable, executable, nor set-user-ID nor set-group-ID mode, not sticky
			* other permissions
				* three characters
					* *r*
						* file is readable
						* *-* marks not readable
					* *w*
						* file is writable
						* *-* marks not writable
					* first that applies
						* *x*
							* file is executable or the directory is searchable
						* *T*
							* the sticky bit is set (mode 1000), but not execute or search permission
						* *t*
							* the sticky bit is set (mode 1000), and is serachable or executable
						* *-*
							* the file is neither readable, writable, nor set-user-ID nor set-group-ID mode, nor sticky

















* what's a FIFO?
* what's an inode number?