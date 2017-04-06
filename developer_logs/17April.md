# April, 2017

### April, 1st, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion <- 
		* long print 
		* timesort
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files

time to implement the recursion flag. should be fun. working on recursion, make sure it works right.

### April, 2nd, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
		* - alone should be passed as argument
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion <- 
		* long print <- 
		* timesort
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files <-

need to do some testing on the recursion flag but it looks to be working appropriately.

my printing isn't the same as theirs. i need to change how print for args.

when i pass file args, the directory of the file also ends up getting printed which is not right.

done with recursion. on to long print.

i'm having these issues with the block size need to ask someone about it. 

finished the hidden files stuff.

all that's left is the reverse sort, the time sort and the sticky bit thing.

4096	/	512	= 8 	%0 		tot no round: 8		tot round: 8	tot up: 8
3248	/	512	= 6 	%176	tot no round: 14	tot round: 14	tot up: 15
14		/	512	= 0 	%14		tot no round: 14	tot round: 14	tot up: 16
9		/	512	= 0		%9		tot no round: 14	tot round: 14	tot up: 17
4096	/	512	= 8 	%0 		tot no round: 22	tot round: 22	tot up: 25
4096	/	512	= 8 	%0 		tot no round: 30	tot round: 30	tot up: 33
64876	/	512	= 126 	%364 	tot no round: 156	tot round: 157	tot up: 160
4096	/	512	= 8 	%0 		tot no round: 164	tot round: 165	tot up: 168
4096	/	512	= 8 	%0 		tot no round: 172	tot round: 173	tot up: 176
4096	/	512	= 8 	%0 		tot no round: 180	tot round: 181	tot up: 184
4096	/	512	= 8 	%0 		tot no round: 188	tot round: 189	tot up: 192
196608	/	512	= 384	%0		tot no round: 572	tot round: 573	tot up: 576

woooooo i figured out the fucking thing with the block size. 

all that's left is sorts and the sticky bit and then i'm ready for extensive testing. 

fuccccccck. i need to redo how my program executes on files. you know what. fuck it. hopefully no one will notice.

### April, 5th, 2017

* refactoring plan
	* refactor t_clip
	* handle arguments within the program
		* - alone should be passed as argument
	* handle basic ls functionality without arguments or flags
	* introduce arguments
	* introduce flags
		* recursion 
		* long print  
		* timesort <-
			* for arguments sorting, write a wrapper and sort the files
		* reverse sort
		* hidden files 

the dreaded time sort is here. fuckkkkkk. okay so the order is seconds, then nano-seconds, then lexical. i honestly need to redo the whole thing cause it's bad.

got it pretty much done just need to apply it to the strlist.

found a solution that is better for all of this. it will also allow me to fix the column issue that was bound to come up during corrections.

i will treat files and directories seperately. do the same thing i'm doing now to seperate them. on files i check to see if it ends with a slash, if so it's not a valid file or directory. i attempt to extract it's access path and find the file. if the file is not found then it's not a valid file. i add the file to a file list as i go. then i sort the filelist by the appropriate sorting method, and execute the ls like function on them. basically completely different pipeline than for directories.

for directories. i sort them approriately lexically, and then if it's a time sort i'm not sure what i do. this basically should be my focus tomorrow. if i figure this out i'm pretty much done. 










