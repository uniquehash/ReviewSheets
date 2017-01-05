# overview - push_swap - 12/25/2016



* allowed functions
	* write
	* opendir
	* readdir
	* closedir
	* stat
	* lstat
	* getpwuid
	* getgrgid
	* listxattr
	* time
	* ctime
	* readlink
	* malloc
	* free
	* perror
	* strerror
	* exit

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

* ls man
	* `-l`
		* list in long format
		* if output is terminal a total sum for all the file sizes is output on a line before the long listing
	* `-R`	
		* recursively list subdirectories encountered
	* `-a`
		* include directory entries whose names begin with a dot *.*
	* `-r`
		* reverse the order of the sort
	* `-t`
		* sort by time modified before sorting the operands by lexicalgraphic order

* planned practice
	* list a directory
	* obtain information for a file
	* different colored text in terminal 





