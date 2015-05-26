#Learn Linux one mistake at a time
Think of this as a working journal of my experience going through 
####**The Linux Command Line** Second Internet Edition by **_William E. Shotts, Jr._**
#####Note: I have read, or at least skimmed every link posted.
#####Note: I will link to extra resources every time a new term is mentioned, however when transitioning to a new chapter it will be assumed that you no longer need the link and I will cease to link. 

##Contents 
- [Preface](#preface)
- [Learning the shell](#learning-the-shell)
	- [What is the Shell: Background](#what-is-the-shell-background)
	- [What is the Shell: Simple Commands](#what-is-the-shell-simple-commands)
	- [Navigation: Background](#navigation-background)
	- [Navigation: Simple Commands](#navigation-simple-commands)


## Preface 

Just downloaded Ubuntu, and got my **wifi** working wooooooooo!!!!!! [More details about transitioning to Linux/GNU](https://docs.google.com/document/d/19kndLz7T1OYaKNly9aNF880eBuECQFKQMKMmvUgof3U/edit?hl=en&forcehl=1)

###Brushing up on history

**[Linus Benedict Torvalds](http://en.wikipedia.org/wiki/Linus_Torvalds)**: 
* Principle force behind development of the Linux kernel.
* Created git (distributed revision control system)
* Tux the penguin is his personal mascot and has been adopted to be the Linux kernel mascot by the community 
* He uses the Fedora distro 
* Look him up on [wikipedia](http://en.wikipedia.org/wiki/Linus_Torvalds) interesting read

**[Richard Stallman](http://en.wikipedia.org/wiki/Richard_Stallman)**: 
* Launched the GNU Project and founded the Free Software Foundation 
* Developed the GNU Compiler Collection (gcc), GNU Emacs, and GNU General Public Liscense
* I was to engrossed to take notes sorry.... hahaha look him up on [wikipedia](http://en.wikipedia.org/wiki/Richard_Stallman)
* There is a bit of a naming contreversy on what to call this operating system, whether it be GNU/Linux, Linux/GNU, or Linux
	* GNU has a [FAQ on their perspective](http://www.gnu.org/gnu/gnu-linux-faq.html)
* [Stallman's take](http://www.gnu.org/gnu/why-gnu-linux.html) on why to call it GNU/Linux
 
**[GNU General Public License](http://en.wikipedia.org/wiki/GNU_General_Public_License)**:
* Most widely used free software license which gurantees end users the freedoms to use, study, share, and modify the software
* Includes [Copyleft](http://en.wikipedia.org/wiki/Copyleft) = Any derived work can only be distributed under the same license terms
* Look this up on [wiki](http://en.wikipedia.org/wiki/GNU_General_Public_License) too really interesting 

**[Free Software Foundation](http://en.wikipedia.org/wiki/Free_Software_Foundation)**:
* 501(c)(3) non-profit organization founded by Richard Stallman to support the free software movement 
* Basically a non-profit to promote and finance all aspects of the free software movement, if you digested the other wiki's this is less interesting
* The [Free Software Foundation has a website](http://www.fsf.org/)
* The [GNU also has a website](http://www.gnu.org/), i'm including them here because from a novices perspective they seem rather tied together

## Learning the Shell

### What is the Shell Background

**[the shell](http://en.wikipedia.org/wiki/Shell_(computing))**:
* a program that takes keyboard commands as inputs and passes them to the operating system.
* Most Linux/GNU ditributions use [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)), a program developed and supplied by the GNU Project. Ubuntu is no different.
* [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) stands for "Bourne Again SHell" which is play on words on the original Unix shell program written by [Steven Bourne](http://en.wikipedia.org/wiki/Stephen_R._Bourne) called the [Bourne shell (sh)](http://en.wikipedia.org/wiki/Bourne_shell).
	* [Shellshock](http://en.wikipedia.org/wiki/Shellshock_(software_bug)) is a family of security bugs discovered in September 2014. Essentially [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) was vulnerable to [executing arbitary commands](http://en.wikipedia.org/wiki/Arbitrary_code_execution), allowing aggressors unauthorized access to computer systems. 
	* [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) is mostly [POSIX](http://en.wikipedia.org/wiki/POSIX) complient.
	* Wanna know if you are running [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell))? type the command `echo $BASH_VERSION` into [terminal](http://en.wikipedia.org/wiki/GNOME_Terminal) it will return your [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) version number, if it comes back empty or blank you are not running [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)).

**[POSIX](http://en.wikipedia.org/wiki/POSIX)**:
* Stands for Portable Operating System Interface.
* Standards specified by [IEEE Computer Society](http://en.wikipedia.org/wiki/IEEE_Computer_Society) for maintaining compatibility between operating systems.
	* [IEEE Computer Society](http://en.wikipedia.org/wiki/IEEE_Computer_Society) is essentially a worldwide organization that establishes standards and is importante, it's structurally similar to the [WHO](http://en.wikipedia.org/wiki/World_Health_Organization), but for Computer and Information Science.

**[terminal](http://en.wikipedia.org/wiki/GNOME_Terminal)**:
* Actually called [gnome-terminal](http://en.wikipedia.org/wiki/GNOME_Terminal), but generally shortened to [terminal](http://en.wikipedia.org/wiki/GNOME_Terminal).
* This is our interface to interact with the [the shell](http://en.wikipedia.org/wiki/Shell_(computing)).
* basically [terminal](http://en.wikipedia.org/wiki/GNOME_Terminal) interacts with the [the shell](http://en.wikipedia.org/wiki/Shell_(computing)) which in turn interacts with the operating system.

**shell prompt**:
* in your terminal it should looks like this `helpless@hh-machine:~$`
	* in this example **helpless** is the **username**.
	* *hh-machine* is the name of the machine.
	* the $ indicates where the cursor should be and where user input starts 
		* if instead of a $ you see a # then the [terminal](http://en.wikipedia.org/wiki/GNOME_Terminal) session has [superuser](http://en.wikipedia.org/wiki/Superuser) privileges
			* a [superuser](http://en.wikipedia.org/wiki/Superuser) is a user account with the ability to make system-wide changes, i.e. change and potentially fuck up your configuration for good, be careful.
* this is a shell prompt within a directory `helpless@hh-machine: ~/Desktop$`
	* **helpless** is still the **username**.
	* *hh-machine* is still the name of the machine.
	* __*/Desktop*__ indicates the current directory we are in, which in this case is Desktop.
	* the $ still indicates where the cursor should be and where user input starts 
* copy-paste: select something you wish to copy with the mouse left click and then press the center button (likely to be your scroll wheel) to paste directly at the cursor location.

**directory**:
* We will go over this in more detail later. For right now think of it as a folder you put stuff in, like files and other folders.

#### What is the Shell Simple Commands
* Type the commands below in your terminal window and see what they do!

 | Command | Description | Syntex |
 | ------: | ---------- | ------ | 
 | date    | displays the current time and date | `helpless@hh-machine:~$ date` |
 | cal     | displays the calendar of the current month | `helpless@hh-machine:~$ cal` |
 | df      | displays the current amount of free space on your disk drives | `helpless@hh-machine:~$ df` |
 | free    | displays the amount of free memory your machine has | `helpless@hh-machine:~$ free` |
 | exit    | end's the terminal session and closes the terminal window | `helpless@hh-machine:~$ exit` |

* Woah you just issued your first commands through the command line, congrats you're on the road to mastering the CLI and Linux/GNU

### Navigation Background 

**the File System Tree**:
* I could not find a good graphical explanation of general hierarchical directory structure so I made my own. 
* The Linux file system is organized in a tree like pattern of directories.
* The file system is divised in parent, children and sibling relationships. 
	* All parents have children.
	* Children can have siblings, but are not required to. 
	* Children can be parents, but are not required to. 
	* All parents are in turn children of other parents.
	* The analogy here is that of a family tree.
		* You have parents.
		* You may have siblings, or you may not.
		* One day you may have children, or you may not (or maybe you already do have children).
		* Your parents have parents, and may or may not have siblings with no children. 
* All of this is a lot clearer in the graphical explanation if you click the link.
* [Ubuntu like all Linux systems also has a hierarchical tree structure](https://help.ubuntu.com/community/LinuxFilesystemTreeOverview).
* The File System Tree is also known as a hierarchical file system.

**directory**:
* A directory simply put is a container with an identifier. 
* You put files in them to make it easy to find and retrieve the files at a later date by using the identifier.
* They allow to organize files in a way that makes sense. 
* You can nest directories in other directories, which creates a hierarchy of directory, which can be represented with a tree like diagram, hence The File System Tree.

**current working directory**:
* We navigate the file system by moving up and down directories to access, retrieve, and edit file at different locations in the File Sytstem Tree. 
* At any time during navigation we can only see the directory above us, and the directories below us. 
	* In other words we only have access to the parent and children of the directory we are in. 
* We must then have a method for figuring out which directory in the File System Tree we are in. 
```
	helpless@hh-machine:~$ pwd
	/home/helpless
```	
* The `pwd` command outputs something called a [path](http://en.wikipedia.org/wiki/Path_(computing)) to the terminal, more info below.
* The path that the `pwd` command outputs is called the current working directory, and is always whatever directory we are currently in.
* This particular directory is the one we find ourselves in when we first log in and is known as the home directory.

**[path](http://en.wikipedia.org/wiki/Path_(computing))**:
* Is a specific location in the file system.
* absolute path:
	* a path that shows how to get from the [root directory](http://en.wikipedia.org/wiki/Root_directory) to a specified location or file, more info below.
	* For example: ` /home/helpless` is an absolute path from the root directory to our home directory.
* relative path:
	* a path that shows how to get from the current working directory to a specific location or file.
	* For example `helpless/Desktop` is the relative path from the home directory to your Desktop directory, which if you are following us using Ubuntu, will be the file system directory that contains everything you see on your desktop.
	* The `.` symbol refers to the working directory and the `..` symbol refers to the working directories parrent directory.

**[root directory](http://en.wikipedia.org/wiki/Root_directory)**: 
* The first and top-most directory in the file system tree.
* It is the ancestor of all the directories and files in the system, the eve of the File System Tree.
* [The root directory is nameless](http://teaching.idallen.com/cst8207/12f/notes/160_pathnames.html#the-root-directory-has-no-name) and is represented as an emoty space before a /. 
* Lets break down the absolute path ` ``/home/helpless`
	* ` ` before the `/` is an empty string representing the [root directory](http://en.wikipedia.org/wiki/Root_directory).
	* `/` is a deliminator showing that `home` is a child of ` `([the root directory](http://en.wikipedia.org/wiki/Root_directory)). 
		* `home` is a directory that contains the home directories of every user registered with the linux machine, in this case there is only one registered user and we have chosen to call this user "helpless"
		* `/` is a deliminator showing that `helpless` is a child of `home`. 
			* `helpless` is the home directory of the user "helpless", it contains all the configurations and files associated with this user.
* **Be careful**, one of the childreen of the [nameless root directory](http://teaching.idallen.com/cst8207/12f/notes/160_pathnames.html#the-root-directory-has-no-name) ` ` is called "root".
	* This "root" directory contains the home directory of the superuser and it's absolute path is `/root`.
	* To avoid confusion in the future we will refer to the [nameless root directory](http://teaching.idallen.com/cst8207/12f/notes/160_pathnames.html#the-root-directory-has-no-name) as ` ``/` and the "root" directory as ` /root`.

**[superuser](http://en.wikipedia.org/wiki/Superuser)**: 
* A special user account used for system administration. 
* Has the ability to make system-wide changes. 
* Can be known as root, administrator, admin, or supervisor. 
* Generally recomended to not mess around with it and to do most work under a normal user account.
	* Any valid command run by the superuser will be run without question, meaning that typological issues can cause irreversable dammage. As such it is recomended to work using a normal user account and to carefully use the superuser account when system-wide changes must be done. 
* The command `sudo` is used to run commands as a superuser 
```
	helpless@hh-machine:~$ sudo pwd
	[sudo] password for helpless: [enter user password here]
	 /home/helpless
```
* In this case there is no difference in using `sudo` for the `pwd` command because the pwd does not need superuser privaleges to run, but a different command which needs superuser privilages would not run without it. 
	* If a command that needs superuser privaleges is run from a regular user without using sudo the system will output `Permission denied`.

### Navigation Simple Commands 
* Type the commands below in your terminal window and see what they do!

 | Command | Description | Syntex |
 | ------: | ---------- | ------ | 
 | pwd    | outputs the current working directory | `helpless@hh-machine:~$ pwd` |
 | [ls](#ls)     | outputs a list of all the files and directories in the current working directory | `helpless@hh-machine:~$ ls` |
 | cd      | changes the working directory to the directory of the path provided| `helpless@hh-machine:~$ cd Desktop` |
 
 ###### **ls**:

 











