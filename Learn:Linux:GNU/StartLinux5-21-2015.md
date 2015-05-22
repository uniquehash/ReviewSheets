#Learn Linux one mistake at a time
Think of this as a working journal of my experience going though 
####**The Linux Command Line** Second Internet Edition by **_William E. Shotts, Jr._**
#####Note: I have read, or at least skimmed every link posted.


##Contents 
- [Preface](#preface)
- [Learning the shell](#learning-the-shell)

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

**[The shell](http://en.wikipedia.org/wiki/Shell_(computing))**:
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
* appears in your terminal looks like this [```<span style="color:red">helpless</span>```@hh: ~]$



