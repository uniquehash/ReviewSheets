# overview - ls - 12/25/2016

* functions to add to libft when done 
	* ft_fstrdup
	* ft_fstrappend
	* ft_strrchr	
	* ft_strmcatf
	* ft_fstrmcatf

	* reimplement strlist with a linked list
		* ft_strlist_build
		* ft_strlist_len	
		* ft_strlist_add
		* ft_fstrlist_add
		* ft_strlist_find
		* ft_strlist_remove
		* ft_strlist_minus
		* ft_strlist_del
		* ft_strlist_print



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


* new plan
	* ls
		* parse arguments
			* detection
			* processing
			* application
		* store context
			* rules
				* don't touch filenames
				* restrict by case
					* invalid chr
					* invalid files
			* presentation path
			* access path
			* filename
		* deal with arguments
			* seperate dir from files
				* for each dir
					* open access path
				* for each file
					* extract access path
					* store filename
					* open access path
		* open access path
			* check if file name is null
			* apply file function
	
	* salvage files
		* algo
			* algo_filesort
			* algo_strsort
		* file
			* file_helper
		* filelist
			* filelist_infa
			* ft_fstrlist_add
		* strlist
			* ft_strlist_add
			* ft_strlist_build
			* ft_strlist_del
			* ft_strlist_findindex
			* ft_strlist_len
			* ft_strlist_minus
			* ft_strlist_print
			* ft_strlist_remove
		* library
			* ft_fstrmcatf
			* ft_strmcatf
			* ft_strsearch_ov
		* ls
			* ls_engine
		* t_clip
			* t_clip_apply_lflags
			* t_clip_apply_sflags
			* t_clip_engine
			* t_clip_infa
			* t_clip_infa_helper
			* t_clip_parse_helper
		* t_context
			* t_context_helper
			* t_context_infa


	* refactoring
		* refactor argument parsing
		* time sort
		* t_clip




