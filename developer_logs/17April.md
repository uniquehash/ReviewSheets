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
 





