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


















