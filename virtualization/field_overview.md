# notes on virtualization as a high level topic



* what is [virtualization](https://en.wikipedia.org/wiki/Virtualization)?
	* the act of creating a virtual or simulated instance of something
		* can include
			* hardware
			* storage devices
			* networks
	* history
		* 1960's
			* method for logically dividing the system resources provided by mainframe computers between different applications
	* major uses of virtualization
		* hardware virtualization
			* the virtualization of 
				* computers as complete hardware platforms
				* certain logical abstractions of computers componetry
				* only the functionality required to run various operating systems
		* snapshots
		* migration
		* failover
		* video game console emulation
		* licensing
		* desktop virtualization
		* nested virtualization
		* software
			* operating system-level virtualization
			* application virtualization
			* workspace virtualization
			* service virtualization
		* memory
			* virtual memory
			* memory virtualization
		* storage
			* storage virtualization
			* distributed file system
			* virtual file system
			* storage hypervisor
			* virtual disk drive
		* data
			* data virtualization
			* database virtualization
		* network
			* network virtualization
			* virtual private network



* what is [nested virtualization](https://en.wikipedia.org/wiki/Virtualization#Nested_virtualization)?
	* the ability to run a virutual machine within a virtual machine
		* extendable to an arbitrary depth
	* running one or more hypervisors inside other hypervisors
	* nature of a neste virtual machine does not need to be homogenous with its host virtual machine
		* application virtualization can be deployed within a virtual machine created by using hardware virtualization
	* hardware-assisted virtualization eases the process, but even without it there are software techniques to deal with it

* what is a [hypervizor in the virtualization context](https://en.wikipedia.org/wiki/Hypervisor)?
	* (VMM) also known as a virtual machine monitor
	* also known as control program
	* a system that creates and runs virtual machines
		* can be software, firmware, or hardware
	* host machine
		* the computer running one or more virtual machines	
	* guest machines
		* each virtual machine running in the host machine
	* presents the guest operating system with a virtual operating platform and manages the execution of the guest operating system
		* multiple instances of a variety of operating systems may share the virtualized hardware resources
	* different from operating-system-level virtualization 
		* all instances must share a single kernel
	* classification
		* formalized by Popek and Goldberg (these homies are everywhere in this shit)
		* type-1
			* native or bare-metal hypervisors
				* run directly on the host's hardware to control the hardware and to manage guest operating system
		* type-2
			* hosted hypervisors
				* run on conventional OS just as other computer programs do
					* guest OS runs as a process on the host


* what is [hardware virtualization](https://en.wikipedia.org/wiki/Hardware_virtualization)?
	* also known as platform virtualization
	* the virtualization of 
		* computers as complete hardware platforms
		* certain logical abstractions of computers componetry
		* only the functionality required to run various operating systems
	* virtualization hides the physical characteristics of a computing platform from the users
		* presents a abstract computing platform
	* guest machines are usually restricted with the degree of control they can have over the host machine's resources and devices
		* therefor there are often performance penalties
	* reasons for hardware virtualization
		* (P2V) physical-to-virtual transformation
			* basically server consolidation 
				* larger more powerful physical servers are more cost effective than many small physical servers
					* cpu usage
					* energy consumption
				* virtual machines are easier to configure, use, and mantain than physical ones
				* new virtual machines can be provisioned as needed without up-front hardware purchase
				* virtual macines can be easily relocated to a new physical machine as needed
				* larger server then hosts many guest machines
	* multiple guest machines running on one host machine can cause them to have an impact on each others performance
		* proper techniques are required to prevent this from happening
			* temporal isolation or performance isolation among virtual machines
	* example virtualization scenarios
		* running one or more applications that are not supported by the host OS
			* virtualizing a guest machine with the appropriate OS to run the application solves the problem without altering the host machine
		* evaluating an alternate operating system
			* basically trying it out before committing fully
		* physical-to-virtual server consolidation
			* more effeciently use server resources
		* duplicating specific environments
			* depending on the virtualization software a virtual machine can be duplicated and installe on multiple hosts, or restored to a previously backed-up system state
		* creating a protected environment
			* allows you to do work that can damage the environment since you can just burn it if it goes to far without causing any real problems
	* types of hardware virtualization
		* full virtualization
			* the virtual machine simulates enough hardware to allow an unmodified guest OS to be run in isolation
		* hardware-assisted virtualization
			* the hardware provides architectural support that facilitates building guest machines and allows guest OSes to be run in isolation
			* rarely offer performance advantages over software virtualization
		* paravirtualization
			* virtual machine does not necessarily simulate hardware
				* offers a special API that can only be used by modifying the guest OS
					* the guest OS's source code must be available
					* replaces sensitive instructions with calls to the host's hypervizor api
						* recompile the OS with the new binaries
						* the system calls to the hypervisor are called hypercalls
		* hybrid virtualization
			* hardware-assisted virtualization and paravirtualization simultaniously
		* operating-system-level virtualization
			* a physical server is virtualized at the operating system level
				* enables multiple isolated and secure virtualized servers to run on a single physical server
			* the guest operating system environments share the same running instance of the operating system as the host system
				* the same operating system kernel is also used to implement the guest environments
					* applications running in a given guest environment view it as a stand-alone system
			* this is what docker is
	* hardware virtualization disaster recovery
		* hardware virtualization DR environment involves hardware and software protection solutions based on business continuity needs
			* tape backup for software data long-term archival needs
				* this common method can be used to store data offsite 
					* lengthy and difficult process to recover data
			* whole-file and application replication
				* requires control software and storage capacity for application and data file storage replication typically on the same site
			* hardware and software redundancy
				* ensures the highest level of disaster recovery protection for a hardware virtualization solution by providing duplicate hardware and software replication in two distinct geographic areas

* what is [temporal isolation or performance isolation in virtual machines](https://en.wikipedia.org/wiki/Temporal_isolation_among_virtual_machines)?
	* the capability of isolating temporal behavior or limiting temporal interferences of multiple guest machines among each other, despite them running on the same physical host and sharing a set of physical resources
		* processors
		* memory
		* disks
	* when there are many guest machines on a single host the performance natrually becomes less predictable
		* multiple guest machines could request use of the same resource at the same time
	* multiple techniques to solve problem
		* aim to achieve temporal isolation across the concurrently running guest machines at critical levels of scheduling
			* cpu scheduling
				* proper scheduling techniques at the hypervizor level to contain the amount of computing each guest machine may impose on a shared physical cpu or core
					* must use non-work conserving scheduling
				* on multiprocessor physical hosts
					* possible to deploy each guest machine on a separate processor or core to temporally isolate the performance of various guest machine
			* network scheduling
				* traffic shapin techniques can be used to limit the amount of traffic that each guest machine can impose on the host
				* multiple network adapters on the same physical host
					* configure the virtualization layer so that each guest machine may get exclusive access to each one of them
				* multi-queue network adapters
					* support multiple guest machines at the hardware level
						* different packet queues are associated to each guest machines 
				* real-time scheduling of the cpu may also be used for enhancing temporal isolation of network traffic from multiple guest machines deployed on the same cpu
			* disk scheduling
				* shrug

* what is [temporal isolation in the context of computers](https://en.wikipedia.org/wiki/Temporal_isolation)?
	* the capability of a set of processes running on the same system to run without interferences concerning their temporal constraints among each other
		* whenever the ability of each process to respect its own timing constraints does not depend on the temporal behavior of other unrelated processes running on the same system
			* operating systems able to provide such guarantees to running processes are suitable for hosting real-tim applications
	* look into operating systems if you want to get knee deep

* what is a [work-conserving scheduler](https://en.wikipedia.org/wiki/Work-conserving_scheduler)?
	* a scheduler that always tries to keep the scheduled resource busy if there are submitted jobs ready to be scheduled 
		* a non-work conserving scheduler may leave the scheduled resource idle despite the presence of jobs ready to be scheduled

* what is [traffic shaping in computer networks](https://en.wikipedia.org/wiki/Traffic_shaping)?
	* also known as packet shaping
	* a computer network traffic management technique which delays some or all datagrams to bring them into compliance with a desired traffic profile
		* optimize or gurantee performance
		* improve latency
		* increase usable bandwidth for some packets by delaying other kinds
	* application-based traffic shaping
		* fingerprinting tools are first used to identify applications of interest
			* subject to shaping policies
		* controversial cases
			* bandwidth throttling of peer-to-peer file sharing traffic
	* route-based traffic shaping
		* based on previous-hop or next-hop information

* what does [physical-to-virtual transformation really mean](https://en.wikipedia.org/wiki/Physical-to-Virtual)?
	* the process of decoupling and migrating a physical server's resources to a virtual machine guest hosted on a physical host machine through a hypervizor
		* operating system
		* applications
		* data
	* methods of P2V migration
		* manual P2V
			* user manually creates a virtual machine in a virtual host environment
			* copies all the files from the source machine
				* OS
				* applications
				* data
		* semi-automated P2V
			* using a tool that assists the user in moving the servers from physical state to virtual machine
				* VMware provides a semi-automated too called VMware vCenter Converter for moving physical servers running windows or linux into virtual environments while they are powered on
				* for more check source
		* fully automated P2V
			* using a tool that migrates the server over the network without any assistance from the user
				* check source for more

* what is [disaster recovery](https://en.wikipedia.org/wiki/Disaster_recovery)?

* what is [full virtualization](https://en.wikipedia.org/wiki/Full_virtualization)?
	* a virtualization technique used to provide a virtual machine environment that simulates the underlying hardware completely
		* every salient feature of the hardware be reflected into the virtual machine
			* full instruction set
			* input/output operations
			* interrupts
			* memory access
			* everything else that is used by software on the bare machine
	* any software capable of execution on the raw hardware can be run in the virtual machine and in particular any operating system
	* classic virtualization or trap-and-emulate is not considered full virtualization
	* key challenges
		* interception and simulation of privileged operations
			* I/O instructions
		* the effects of every operation performed within a given guest machine must be kept within that guest machine
			* virtual operations cannot be allowed to alter the state of
				* any other guest machine
				* control program
				* hardware
		* some machine instructions can be executed directly by the hardware
			* effects are entirely contained within the elements managed by the control program
				* memory locations 
				* arithmetic registers
		* instructions that either access or affect state information that is outside the virtual machine 
			* known as piercing the virtual machine
				* cannot be allowed to execute directly
				* must be trapped and simulated
	* highly successful for
		* sharing a computer system among multiple users
		* isolating users from each other 
			* and from the control program
		* emulating new hardware to improve
			* reliability
			* security
			* productivity
	* the computers in the labs are using full virtualization for example

* what is [hardware-assisted virtualization](https://en.wikipedia.org/wiki/Hardware-assisted_virtualization)?
	* also known as accelerated virtualization
	* a platform virtualization approach that enables efficient full virtualization using help from hardware capabilities
		* primarily the host processors
	* advantages
		* reduces the maintenance overhead of paravirtualization as it reduces or eliminates the changes needed in the guest operating system
		* considerally easier to obtain better performance
			* article by VMware engineer on [graphics and i/o virtualization](http://x86vmm.blogspot.com/2005/12/graphics-and-io-virtualization.html)
	* disadvantages
		* require explicit support in the host cpu
			* not available on all x86/x86_64 processors
		* pure hardware-assisted virtualization approach using entirely unmodified guest operating systems involves many VM traps
			* high cpu overheads
			* limiting scalability
			* limiting efficiency of server consolidation
			* performance can be mitigated by the use of paravirtualized drivers
				* the combination is called hybrid virtualization

* what is [paravirtualization](https://en.wikipedia.org/wiki/Paravirtualization)?
	* presents a software interface to guest machines that is similar but not identical to that of the underlying hardware
	* reduce the portion of the guest machines execution time spent performing operations which are substantially more difficult to run in a virtual environment compared to non-virtualized environment
		* provides specially defined hooks to allow the guests and host to request and acknoweldege these tasks
			* would otherwise be executed in the virtual domain 
				* execution performance is worse
	* successful paravirtualization 
		* may allow a simpler hypervizor 
			* execute critical tasks on the host domain instead of the virtual domain
		* reduce the overall performance degradation of machine-execution inside the guest
	* requires the guest operating system to be explicitely ported to the para-api
		* conventional OS distributions that are not paravirtualization-aware cannot be run on top of a paravirtualizating hypervizor
		* even when the operating system cannot be modified there are other ways to cheat
	* hypercalls
		* old school name "DIAGNOSE code"
		* these are system calls to the hypervizor below
			* require support in the guest operating system
				* has to have hypervizor-specific code to make such calls

* what is [operating-system-level virtualization](https://en.wikipedia.org/wiki/Operating-system-level_virtualization)?
	* a virtualization method in which the kernel of an operating system allows the existence of multiple isolated user-space instances instead of just one
		* these instances are known as
			* containers
			* software containers
			* virtualization engines
			* jails
	* these feel and look like a real server from the point of view of its oweners and users
	* on Unix-like systems
		* this can be seen as an advanced implementation of the standard chroot mechanism
	* in addition to isolating mechanisms
		* kernel often provides resource-management features to limit the impact of one container's activities on other containers
	* uses
		* securely allocating finite hardware resources amongst a large number of mutually-distrusting users
		* consolidating server hardware by moving services on separate hosts into containers on the one server
		* separating several applications to separate containers for
			* improved security
			* hardware independence
			* added resource management features
		* if capable of live migration can also be used for dynamic load balancing of containers between nodes in a cluster
	* overhead
		* imposes little to no overhead
			* programs in containers use the operating systems normal system call interface and do not need to be subjected to emulation or be run in an intermediate virtual machine
				* unlike full virtualization or paravirtualization
		* does not require support in hardware to perform efficiently
	* flexibility
		* not as flexible as other virtualization approaches since it cannot host a guest operating system different from the host one or a different guest kernel
	* storage
		* some implementations provide file-level copy-on-write mechanisms
			* usually a standard file system is shared between containers
				* those containers change the files automatically create their own copy
		* easier than full virtualization for
			* backing data up
			* more space efficient
			* simpler to cache

* what is a [user-space in the context of operating systems](https://en.wikipedia.org/wiki/User_space)?
	* modern operating systems usually segregate virtual memory into kernel space and user space
		* provides protextion from malicious or errant software behaviour
			* memory protection
			* hardware protection
	* user space
		* memory area where applications software and some drivers execute
	* kernel space is strictly reserved for running
		* a privileged operating system kernel
		* kernel extensions
		* most device drivers


* what is the [chroot command in the unix context](https://en.wikipedia.org/wiki/Chroot)?
	* an operation that changes the apparent root directory for the current running process and its children
	* a program that is run in such a modified environment cannot name files outside the designted directory tree
	* the modified environment is called a chroot jail
	* man
		* chroot (2) system call 
		* chroot (8) wrapper program

* what is [live migration in the virtualization context](https://en.wikipedia.org/wiki/Live_migration)?
	* refers to the process of moving a running guest machine or application between different physical machines without disconnecting the client or application
		* transfers from the original guest machine to destination 
			* memory 
			* storage
			* network connectivity

* what is a [copy-on-write mechanism](https://en.wikipedia.org/wiki/Copy-on-write)?
	* also known as implicit sharing or shadowing
	* resource management technique used to efficiently implement a copy operation on modifiable resoureces
		* if a resource is duplicated bu not modified it is not necessary to create a new resource
			* resource can be shared between the copy and the original
			* modifications must still create a copy
				* copy operation deferred to first write
	* significantly reduce the resource consumption of unmodified copies while adding small overhead to resource modifying operations

* what are [Popek and Goldberg virtualization requirements](https://en.wikipedia.org/wiki/Popek_and_Goldberg_virtualization_requirements)?
	* a set of conditions sufficient for a computer architecture to support system virtualization efficiently
		* 1974 article Formal Requirements for Virtualizable Third Generation Architectures
			* developed by Gerald J. Popek and Robert P. Goldberg
	* three properties of interest when analyzing the environment created by a hypervizor
		* equivalence / fidelity
			* a program runnning under the hypervizor should exhibit a behavior essentially identical to that demonstrated when running on an equivalent machine directly
		* resource control / safety
			* the hypervizor must be in complete control of the virtualized resources
		* efficiency / performance
			* a statistically dominant fraction of machine instructions must be executed without hypervizor intervention		
	* (ISA) instruction set architecture
		* the characteristics that the (ISA)instruction set architecture of the physical guest machine must possess in order to run the hypervizor which possess the above properties
			* classification 
				* privileged instructions
					* those that trap if the processor is in user mode and do not trap if it is in system mode
				* control sensitive instructions
					* those that attempt to change the configuration of resources in the system
				* behavior sensitive instructions
					* those whose behavior or result depend on the configuration of resources 
						* the content of the relocation register or the processor's mode
	* virtualization theorems
		* the formal conditions for virtualization
			* theorem 1
				* for any conventional third-generation computer an effective hypervizor may be constructed if the set of sensitive instructions for that computer is a subset of the set of privileged instructions
					* to build a hypervizor
						* it is sufficient that all instructions that could affect the correct functioning of the hypervizor (sensitive instructions) always trap and pass control to the hypervizor
						* guarantees the resource control property
						* non-privileged instructions must instead be executed natively and efficiently
							* this holds the equivalence property
				* this theorem also provides a simple technique for implementing a hypervizor
					* trap-and-emulate virtualization
						* also known as classic virtualization
							* because all sensitive instructions behave nicely all the hypervizor has to do is trap and emulate everyon single one of them
			* theorem 2
				* sufficient conditions for recursive virtualization
					* a conventional third-generation computer is recursively virtualizable if	
						* it is virtualizable
						* a hypervizor wihtout any timing dependencies can be constructed for it
			* theorem 3
				* a hybrid hypervizor may be constructed for any third generation machine in which the set of user sensitive instructions are a subset of the set of priveleged instructions



































