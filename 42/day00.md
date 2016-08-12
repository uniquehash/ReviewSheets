# day 00 - starting 


the intranet is the most important tool 


#### questions 

* i did not get a manual, where is the manual?

* what the fuck is a `kerberos` ticket?

* what does the `^` symbol stand for?
	* it stands for the 'control' key on the keyboard

* why does he refer to both the emacs and vim screens as buffers? what is a buffer in this context?

* what is the difference between `.viminfo` and `.vimrc`?
	* unix thing 
	* there is a difference 
	* `.vimrc` 
		* a file you edit to change vims behavior 
	* `.viminfo` 
		* a cache that stores shit from vim like buffers, marks ect...

* what is `Moulinette`?

* what does span the file system means in the context of unix?

* what is a Root DSE in the context of ldap?

* what does the number at the end of functions in man pages mean?
	* corresponds to what section of the manual that page is from 
		* manual sections 
			* 1
				* user commands 
			* 2 
				* system calls
			* 3
				* c library functions 
			* 4 
				* devices and special files 	
			* 5 
				* file formats and conventions 
			* 6
				* games et. al. 
			* 7 
				* miscellanea 
			* 8 
				* system administration tools and daemons 
	* use `man -k '^command_to_search'` 
		* substring searches for all similar commands 



#### explore 

* piscine c - pedagogy 
	* how shit works 
	* tips 
		* reformat input into a format you understand 
		* test everything and edge cases 
		* look back at what you did - review 
	* peer-evaluation 
		* read the document of peer-correcting
		* you start piscine with 5 correction points 
			* earn 1 by correcting 
			* lose 1 for being correcting 
		* set slot on profile page 
			* if you slot a spot and miss it you will be marked missed 
	* the art of peer-evaluation 
		* community based 

* piscine c - turn in system 
	* vogsphere 	
		* repo made when you subscribe 
		* server contains all the repo 
			* shortcut: `vgs: ....`
		* add a different clone name to ease conflicts 
		* only shit in the repo will be admitted for evalutation 
		* there is 100mb limit on repos 
			* passing this limit is considered a resource abuse 
				* you fuck it up there will be problems 
		* write privileges to vogosphere are checked at push start
			* timelimit kills privileges at submission time 
		* due to traffic you may be put on a git waiting line
		 	* chill out its cool just wait for it to go through
		* authentication on the serve is done with a `kerberos` ticket 
			* experies after a certain amount time 
			* `klist`
				* list all tickets 
			* to make a new ticket 
				* `kinit $username`
	* intro to vogsphere 
		* basically the turn in system 
			* eveything is turned in from the vogsphere 
									
* subscribing to projects
	* must suscribe everyday 
		* time limited 

* emacs 
	* the `^` symbol stands for the 'control' key on keyboard
	* quit emacs 
		*  `^x^c`
	* save emacs 
		* `^x^s`
	* beggining of a line 
		* `^e`
	* end of a line 
		* `^a`
	* search for something in the file 
		* `^s string_you_are_looking_for`
	* open another file from emacs 
		* `^x^f` 
		* will open a small bar at the bottom 
			* enter a file name 
	* split screen vertically  
		* `^x 3`
	* split screen horizontally 
		* `^x 2`
	* move cursor between screens 
		* `^x o`
	* insert 42 header 	
		* `^c^h`

* vim 
	* two modes 
		* command mode 
			* allows us to use commands
			* switch to command mode with the escape button 
		* insertion mode
			* allows to insert text 
			* switch to insert mode with `i`
			* once in insert mode you can enter text freely 


	* in command mode 
		* quit
			* `:q`
		* save  
			* `:w`
		* end of line 
			* `:$`
		* beginning of line 
			* `:^`
		* open new file from vim 
			* `:e`
				* opens a small bar at the bottom 
				* enter file name 
		* split screen vertically 
			* `:vs` 
		* split screen horizontally 
			* `sp` 
		* move between screens 
			* `^w` 
				* use arrow keys to select screen 
		* insert 42 header 
			* `:std header`
	
* shell and terminal  
	* change permissions 
		* `chmod`
			* options 
				* 0 
					* no permissions 
				* 1
					* execute permissions 
				* 2 
					* write permissions 
				* 3 
					* write and execute permissions 
				* 4 
					* read permissions 
				* 5
					* read and execute permissions
				* 6 
					* read and write permissions 
				* 7 
					* read, write, and execute permissions 
		* symbols
			* d 
				* directory 
			* l 
				* symlink 
			* r
				* read permission
			* w	
				* write permission
			* x
				* execute permission
		* order of symbols
			* first bit 
				* whether it is a directory or not  
			* first set 
				* permission for you 
			* second set 
				* permissions for group 
			* third set 
				* permissions for world 

* rules of engagement 
	* must have appropriate permissions on files and directories 
	* exercises in shell must be executable with `/bin/sh`
	* cannot have any additional files in the directory other than those specified by the project 

* email spoofing 
	* the creation of an email message with a forged sender address 
	* technical detail 
		* when smtp email is sent the initial connection provides two pieces of address information 
		* can be referred to as the envelop address
			* mail from
				* generally presented as the return-path: header but not normally visible to the end user 
				* by default no checks are done for authorization 
			* rcpt to 
				* specifies which email address the email is delivered to 
				* not normally visible to the end user but may be present in theheaders as part of the received header 
		* the sending system send the data command and typically sends several header items
			* from 
				* the address visible to the recipient 
					* no checks are done that the sending system is authorized to send on behalf of address
			* reply-to 
				* who to reply to?
			* sender 
				* who is sending 

* ln 
	* makes links 
	* by default `ln` makes hard links 
		* hardlinks 
			* they are the same as the original file
			* may not refer to directory 
			* may not span file system 
		* symlink 
			* a reference to the path of the original filesystem object 
			* may refer to directories 
			* may span the file system
	* options 
		* -s 
			* create a symbolic link 

* ldap 
	* a rudimentary digital phonebook thing 
	* all users at the school are on it 
	* basic interactions 
		* the underlying session is established
			* session handle is created 
				* ldap_initialize(3)
					* initialize the ldap library without opening a connection to a server 
			* the protocol version is set to 3 
				* ldap_set_options(3)
		* the first operation is issued 
			* can be any of the three 
				* start TLS
					* ldap_start_tls_s(3)
				* Bind operation
					* ldap_sasl_bind(3)
						* asynchronously bind to the directory 
				* Search operation 
					* ldap_search_ext_s(3)
						* synchronously search the directory 
		* additional operations performed by either synchronous or async routines 
			* like 
				* ldap_compare_ext_s(3)
					* synchronously compare to a directory entry 
				* ldap_compare_ext(3)
					* asynchronously compare to a directory entry 
				* ldap_result(3)
					* wait for the result from an asynchronous operation 
		* results returned from routines are interpreted 
			* using ldap parsing routines 
				* ldap_parse_result(3)
		* the ldap association and underlying connection is terminated 
			* ldap_unbind_ext(3)
				* synchronously unbind from the ldap server and close the connection 
	* displaying results 
		* results from search routines can be outputed by hand 
			* step through the entries returned
				* ldap_first_entry(3)
					* return first entry in a chain of search results
				* ldap_next_entry(3)
					* return next entry in a chain of search results 
			* step through an entrys attributes 
				* ldap_first_attribute(3)
					* return first attribute name in an entry 
				* ldap_next_attribute(3)
					* return next attribute name in an entry 
			* retrieve a given attributes values 
				* ldap_get_values(3)

* ldap search filters 
	* check [rfc 4515](https://tools.ietf.org/search/rfc4515#section-3) for full details 
	* string search filter definition 
		* filter 
			* LPAREN filtercomp RPAREN
		* filtercomp	
			* and / or / not / item 
		* and 
			* AMPERSAND filterlist 
		* or 
			* VERTBAR filterlist 
		* not 
			* EXCLAMATION filterlist 
		* filterlist 
			* 1 * filterlist 
		* item 
			* simple / present / substring / extensible
		* simple 
			* attr filtertype assertionvalue 
		* filtertype
			* equal / approx / greaterorequal / lessorequal 
		* equal 
			* EQUALS 
		* approx 
			* TILDE EQUALS
		* greaterorequal
			* RANGLE EQUALS
		* lessorequals
		 	* LANGLE EQUALS 
		* extensible 
			* ( attr [dnattrs] [matchingrule] COLON EQUALS assertionvalue ) ( [dnattrs] matchingrule COLON EQUALS assertionvalue)
		* present 
			* attr EQUALS ASTERISK 
		* substring 
			* attr EQUALS [initial] any [final]
		* initial 
			* assertionvalue 
		* any 
			* ASTERISK *(assertionvalue ASTERISK)
		* final 
			* assertionvalue 
		* attr 
			* attributedescription
				* rule described in [section 2.5 of rfc4512](https://tools.ietf.org/search/rfc4512#section-2.5)
		* dnattrs 
			* COLON "dn"
		* matchingrule 
			* COLON oid 
		* assertionvalue 
			* valueencoding 
				* described in [section 4.1.6 of rfc4511](https://tools.ietf.org/search/rfc4511#section-4.1.6)
		* valueencoding 
			* 0 * (normal / escaped) 
		* normal 
			* UTF1SUBSET / UTFMB
		* escaped 
			* ESC HEX HEX 
		* UTF1SUBSET 
			* %x01-27 / %x2B-5B / %x5D-7F
		* EXCLAMATION 
			* %x21 -> `!`
		* AMPERSAND 
			* %x26 -> `&`
		* ASTERISK 
			* %x2A -> `*`
		* COLON 
			* %x3A -> `:`
		* VERTBAR
			* %x7C -> `|`
		* TILDE
			* %x7E -> `~`
	* escaping sequences are down via there ACII characters 
			
* patch 
	* takes a patch file (patchfile) and applies it to one or more original files 
		* patchfile 
			* a difference listing produced by the diff program 
		* default behavior 
			* patched versions replace the originals 
	* lifecycle 
		* on startup patch attempts to determine the type of the diff listing 
			* can be overruled by 
				* -e (--ed)
					* fed to the `ed(1)` editor via a pipe
				* -c (--context)
					* applied by patch itself
				* -n (--normal)
					* applied by patch itself
				* -u (--unified)
					* applied by patch itself
		* patch tries to skip any leading garbage, apply the diff, and then skip any trailing garbage 
			* after removing indentation and encapsulation lines beginning with `#` are ignored 	
				* considered comments 
		* with context diff and to a lesser extent normal diffs patch can detect when the line numbers mentioned in the patch are incorrect, and attempt to find the correct place to apply each hunk of the patch 
		* as each hunk is completed you are told if the hunk failed and if so which line in the new file patch thought the hunk should go 
		* if no original file (origfile) is specified on the command line patch tries to figure out from the leading garbage what the name of the file to edit is 
			* patch takes an ordered list of candidate file names as follows 
				* if the header is a context diff 
					* takes the old and new file names in the header 
						* name ignored if it does not have enough slashes to satisfy the -pnum, --strip=num option and /dev/null is also ignored 
				* if there is an index line in the leading garbage and if either the old and new names are both absent or if patch is conforming to posix 
					* patch takes the name in the index line 
				* candidate file names are considered in the order (old, new, index) regardless of headers
			* patch selects a file name from the candidate list as follows 
				* if some named files exist 
						* selects first name if conforming to posix 
						* selects best name otherwise 
				* if patch is not ignoring RCS, ClearCase, Perforce, and SCCS (something to do with the -g num option) and no named files exist but an RCS, ClearCase. Perforce, or SCCS master is found 
					* patch selects the best name requiring the creation of the fewest directories 
				* if no named file exist, no RCS, ClearCase, Perforce, or SCCS master was found, some names are given, patch is not conforming to posix and the patch appears to create a file 
					* patch selects the best name requiring the creation of the fewest directories 
				* if no file name results from the above heuristics 
					* you are asked for the name of the file to patch 
						* patch selects that file 
	* options
		* -pnum 
			* strip the smallest prefix containing num leading slashes from each file name found in the patch file 
				* a sequence of one or more adjacent slashes is counted as a single slash 
				* controls how file names in the patch file are treated 

* diff 
	* compare files line by line 

* find 
	* walk a file hierarchy 
	* description
		* recursively descends the directory tree for each path listed 
		* evaluates an expression 
			* composed of the primaries and operands 
			* in terms of each file in the tree 
	* primaries 
		* all primaries which take a numeric argument allow the number to be preceded by a plus sign or a minus sign 
			* + 
				* more than n 
			* - 
				* less than n 
			* neither 
				* exactly n 
	* operand 
		* the primaries may be combined using the following operators 
			* listed in decreasing precedence 
	* [tutorial](http://www.oracle.com/technetwork/articles/calish-find-087766.html)
		* basic structure 
			* `find start_directory test options criteria_to_match action_to_perform_on_result`

* file 
	* determine file type 
	* description 
		* file test each argument in an attempt to classify it 
			* three sets of test in order
				* filesystem tests 
				* magic tests 	
					* used to check for files with data in a particular fixed format 
				* language tests 
				* first test to succeed causes the file type to be printed 
	* magic files 
		* have a magic number stored in a particular place near the beginning of the file that tells the UNIX operating system that the file is a binary executable 
		* any file with some invariant identifier at a small fixed offset into the file 
		* the information identifying these files is read from 
			* compiled magic file: `/usr/share/file/magic.mgc`
			* directory: `/usr/share/file/magic` 
				* if compiled file does not exist 
















