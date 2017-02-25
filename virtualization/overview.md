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

* *nested > hypervizor > virtual operating platform > hardware virtualization*
	* what is [nested virtualization](https://en.wikipedia.org/wiki/Virtualization#Nested_virtualization)?
		* 
	* what is a [hypervizor in the virtualization context](https://en.wikipedia.org/wiki/Hypervisor)?
		* (VMM) also known as a virtual machine monitor
		* a system that creates and runs virtual machines
			* can be software, firmware, or hardware
		* host machine
			* the computer running one or more virtual machines
			
		* guest machines
			* each virtual machine running in the host machine

	* what is [hardware virtualization](https://en.wikipedia.org/wiki/Hardware_virtualization)?
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

	* what does [physical-to-virtual transformation really mean](https://en.wikipedia.org/wiki/Physical-to-Virtual)?

	* what is [disaster recovery](https://en.wikipedia.org/wiki/Disaster_recovery)?


	* what is [full virtualization](https://en.wikipedia.org/wiki/Full_virtualization)?
	* what is [hardware-assisted virtualization](https://en.wikipedia.org/wiki/Hardware-assisted_virtualization)?
	* what is [paravirtualization](https://en.wikipedia.org/wiki/Paravirtualization)?
	* what is [operating-system-level virtualization](https://en.wikipedia.org/wiki/Operating-system-level_virtualization)?
	
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



































