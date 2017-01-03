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

* what does opendir do and how does it work?	
	* `man opendir`
		* `#include <dirent.h>`
		* `dir	*opendir(const char *filename)`
			* opens the directory named by string `filename`
			* associates a directory stream with `filename`
			* returns a pointer to be used to identify the directory stream
		* errors
			* pointer returned `NULL` if `filename` cannot be accessed or if cannot malloc enough memory to hold the whole thing
			* sets `errno` to indicate error

* what does readdir do and how does it work?
	* `man readdir`
		* `#include <dirent.h>`
		* `struct dirent *readdir(DIR *dirp)`
			* returns a pointer to the next directory entry
				* returns `NULL` upon reaching the end of the directory or on error
				* sets `errno` to any value documented for the `getdirentries(2)` system call

* what does closedir do and how does it work?
	* `man closedir`
		* `#include <dirent.h>`
		* `int closedir(DIR *dirp)`
			* closes the named `directory stream` and frees the structure associated with the `dirp` pointer, returning 0 on success
			* return -1 on error
			* sets `errno` to indicate error

* what does stat do and how does it work?
	* `man 2 stat`
		* `#include <sys/stat.h>
		* `int stat(const char *restrict path, struct stat *restrict buf)`
			* obtains information abput the file pointed to by `path`
				* read, write, nor execute permissions is required for the file `path`
				* all directories listed in the path name leading to the file must be searchable
			```
				struct stat 
				{
					dev_t		st_dev;		/* device inode resides on */
					ino_t		st_ino;		/* inode's number */
					mode_t		st_mode;	/* inode protection mode */
					nlink_t		st_nlink;	/* number of hard links to the file */
					uid_t		st_uid;		/* user-id of owner */
					gid_t		st_gid;		/* group-id of owner */
					struct timespec st_atimespec;	/* time of last access */
					struct timespec st_mtimespec;	/* time of last data modification */
					struct timespec st_ctimespec;	/* time of last file status change */
					off_t		st_size;	/* file size, in bytes */
					quad_t		st_blocks;	/* blocks allocated for file */
					u_long		st_blksize;	/* optimal file sys I/O ops blocksize */
					u_long		st_flags;	/* user defined flags for file */
					u_long		st_gen;		/* file generation number */
				}
			```

* what does lstat do and how does it work?
	* `man 2 lstat`
		* `#include <sys/stat.h>`
		* `int lstat(const char *restrict path, struct stat *restrict buf)`
			* like `stat()` except when named file `path` is a symbolic link
				* `lstat()`
					* returns information about the link
					* only reliable attributes are	
						* file type `S_IFLNK`
						* size
						* blocks
						* link count
				* `stat()`
					* returns information about the file the link references

* what does getpwuid do and how does it work?
	* `man getpwuid`
		* `#include <pwd.h>`
		* `#include <sys/types.h>`
		* `#include <uuid/uuid.h>`
		* `struct passwd *getpwuid(uid_t uid)`
			* searches the password database for the given user uid returning the first one encountered. 
			* returns a valid pointer to a passwd structure on success
			* returns `NULL` if the entry is not found or if an error occurs
				* sets `errno`
				* explicitely set `errno` to zero to distuinguis between non-existing entry and an error
			```
				struct passwd
				{
					char	*pw_name;		/* user name */
					char	*pw_passwd;		/* encrypted password */
					uid_t	pw_uid;			/* user uid */
					gid_t	pw_gid;			/* user gid */
					time_t	pw_change;		/* password change time */
					char	*pw_class;		/* user access class */
					char	*pw_gecos;		/* honeywell login info */
					char	*pw_dir;		/* home directory */
					char	*pw_shell;		/* default shell */
					time_t	pw_expire;		/* account expirtation */
					int		pw_fields;		/* internal: fields filled in */
				}
			```

* what does getgrgid do and how does it work?
	* `man getgrgid`
		* `#include <grp.h>`
		* `#include <uuid/uuid.h>`
		* `struct group *getgrgid(gid_t gid)`
			* search the group database for the given `gid` choosing the first one encountered
			* returns a pointer to a group structure on success
			* returns `NULL` if the entry is not found or if an error occurs
				* sets `errno`
				* explicitely set `errno` to 0 to differentiate between not found programs and errors
			```
				struct group 
				{
					char	*gr_name;		/* group name */
					char	*gr_passwd;		/* group password */
					gid_t	gr_gid;			/* group id */
					char	**gr_mem;		/* group members */
				}
			```

* what does listxattr do and how does it work?
	* `man listxattr`
		* extended extend the basic attributes associated with files and directories in the file system
			* stored as key : value pairs associated with file system objects
		* `#include <sys/xattr.h>`
		* `ssize_t listxattr(const char *path, char *namebuf, size_t size, int options)`
			* retrieves a list of names of extended attributes associates with the given `path` in the file system
				* `namebuf`
					* a data buffer of `size` bytes for the keys of the extended attributes associated with `path`
					* extended attribute keys are simple NULL-terminated *UTF-8* strings and are returned in arbitrary order
					* no padding is provided between keys in the buffer
					* list only includes keys of extended attributes to which the calling process has acces
					* returns the size of the list of keys on success
					* returns 0 if no extended attributes are associated with the given `path` 
					* returns -1 for failure 
						* sets `errno`

* what does time do and how does it work?
	* `man 3 time`
		* `#include <time.h>`
		* `time_t time(time_t *tloc)`
			* returns the value of time in seconds since 0 hours, 0 minutes, 0 seconds, january 1, 1970, coordinated universal time without including leap seconds
			* returns (time_t)-1 on failure
			* return value also stored in `*tloc` if `*tloc` is not `NULL`

* what does ctime do and how does it work?
	* `man 3 ctime`
		* `#include <time.h>`
		* `char *ctime(const time_t *clock)`
			* takes an argument a time value representing the time in seconds since the Epoch
			* adjusts the time value for the current timezone
				* returns a pointer to a 26-character string of the form
					* `Thu Nov 24 18:22:48 1986\n\0`
				* all fields have constant width
			* if error 
				* return `NULL`
					* sets `errno` to an appropriate value


* what does readlink do and how does it work?
	* `man readlink`
		* `#include <unistd.h>`
		* ssize_t readlink(const char *restrict path, char *restrict buf, size_t bufsize)`
			* places the contents of the symbolic link `path` in the buffer `buf` which has a size `bufsize`
			* no terminating `\0` appended to `buf`
			* returns the count of characters placed in buffer `buf` on success
			* returns -1 if an error occurs 
				* sets `errno`

* what does strerror do and how does it work?

* what does perror do and how does it work?

* what's does FIFO mean in the context of ls?

* what's an inode number?

* how do you change the color of text in the terminal?

* what is all this talk about devices and stuff?

* what is a [directory stream in the context of unix](http://www.gnu.org/software/libc/manual/html_node/Accessing-Directories.html)?
	* a stream whose elements are directory entries

* what is a [stream in the context of unix](http://www.gnu.org/software/libc/manual/html_node/I_002fO-on-Streams.html#I_002fO-on-Streams)?
	* a abstract high-level concept representing a communications channel to a file, device, or process
	* there are many streams used in unix

* how are [streams implemented in C](http://www.gnu.org/software/libc/manual/html_node/Streams.html#Streams)?
	* it's called a `FILE` because history
	* `FILE`
		* holds all the internal state information about the connection to the associated file
			* file position indicator
			* buffering information
			* ect...
		* has error and eof status indicators
			* tested with 
				* `ferror`
				* `feof`

* what is opendirectoryd(8)?
	* `man 8 opendirectoryd`
		* its a directory system used on our operating systems for client access to local or remote directory systems

* what is [coordinated universal time](https://en.wikipedia.org/wiki/Coordinated_Universal_Time)?
	* the time standard which regulates clocks and time








