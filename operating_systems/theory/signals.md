# signals

* roughy how do [signals work](http://stackoverflow.com/questions/4208004/how-do-signals-work)?
	* signal delivery
		* OS kernal has a data structure called a process control block for each process running which has data about that process
			* can be looked up by PID
			* includes a table of signal actions and pending signals
		* when a signal is sent to a process
			* kernel looks up that process control block and examines the signal action table to locate the action for particular signal being sent
				* if signal action value
					* `SIG_IGN` 
						* new signal is forgotten by the kernel
					* `SIG_DFL`
						* kernel looks up the default signal handling action for that signal
						* performs action
					* anything else
						* value is assumed to be a function address within the process that the signal is being sent to which should be called
						* basically here the signal is being handled by the process itself
	* signal handling
		* if a signal is being handled by the process 
			* an entry in the pending signal table is made for that signal and that process is marked as ready to RUN
			* next time that the process is run the OS kernel will first add some data to the stack and changes the instruction pointer for that process so that it looks almost like the process itself has just called the signal handler
				* the kernel needs to make the process tell it that it has finished executing the signal handler function
					* one way
						* map a section of RAM into the process's address space which contains code make this system call
							* make the return address for the signal handler function be the address of this code
					* another way
						* make the return address for the signal handler function be an invalid address (NULL perhaps)
							* will cause an interrupt on most systems
								* this will give OS kernel control again								
			* signal handler can do whatever it does when the signal handler returns then the regular code for the process begins executing again

* what are [some gotchas of signals](http://stackoverflow.com/questions/4208004/how-do-signals-work)?
	* what if the kernel needs to stop the process from running on a different core
		* the kernel knows that a signal needs to be delivered to process X which is running on CPU_X, but the kernel learns about it while running on CPU_Y
			* if the process is running on another CPU the kernel, via cross CPU communication, will deliver an interrupt to the other CPU and a message for it
			* the other CPU will, in hardware, save state and jump to the kernel on the other CPU and then will do the delivery of the signal on the other CPU
			* this is trying not to execute the signal handler of the process on another CPU which will break cache locality
	* what if the process is running in kernel space while receiving a signal? 
		* every time a process makes a system call it enters kernel space and tinkers with data structures and memory allocations in kernel space. does all of this hacking take place in kernel space too?
			* if the process is running in kernel space it is not interrupted 
			* it is recorded that this process has received a signal 
			* when the process exits kernel space the kernel will setup the trampoline to execute the signal handler
	* what if the process is sleeping in kernel space waiting for some other event?
		* read, write, signal, poll, mutext ect...
			* the process, while running in kernel space, after having received a signal, reaches a sleep function
			* the sleep function will check if the process has a signal pending
				* if yes
					* process is not put to sleep
					* cancel all that has been done while coming down into the kernel
					* will exit to user space while setting up a trampoline to execute the signal handler
					* then restarts the system call
			* if the process is already sleeping/waiting in kernel space it is woken from the sleep
				* kernel code cleans up after itself
				* jumps to signal handler on return to user space 
				* system call is automatically restarted if the user desires it 
	* why is this shit so complicated?
		* processes in kernel space cannot simply be stopped
			* since the kernel developer
				* allocates memory
				* interacts with data structures
				* other shit
			* if you just take the control away you will corrupt the kernel state and cause a machine hang
			* the kernel code must be notified in a controlled way that it must
				* stop its running
				* return to user space
				* allow user space to handle the signal
			* this is done with the return value of the majority of sleeping functions in the kernel
			* kernel programmers are expected to treat those return values with resepect and act accordingly
		* signals are asynchronous
			* they should be delivered as soon as possible
			* imagine a process that has only one thread
				* went to sleep for an hour and is delivered a signal
					* kernel code must
						* wake up 
						* clean up after itself
						* return to user space
						* execute the signal handler
						* restart the system call after the signal handler finished
				* it would not be okay for the kernel to chill and not execute the signal handler until it's sleep is finished 
		* signals are like interrupt handlers but for user space
	* what is the latency of signal handling?

* what is a [trampoline in the context of signal processing](https://en.wikipedia.org/wiki/Trampoline_(computing))?
	* also referred to as indirect jump vectors
	* memory locations holding addresses pointing to 
		* interrupt service routines
		* I/O routines
		* ect...
	* execution jumps into the trampoline and then immediately jumps out
	* uses
		* CPUs
			* trampoline can be used to overcome the limitations imposed by a CPU architecture that expects to always find vectors in fixed locations
			* when an operating system is booted on a symmetric multiprocessing machine, only one processor, the boot-strap processor, will be active
				* after the operating system has configured itself, it will instruct the other processors to jump to a piece of trampoline code that will initialize the processors and wait for the operating system to start scheduling threads on them


/nfs/2016/o/obelange/Desktop/offence/projects/hercules/mares_diomedes




