# notes on docker the magic container store

* [what the fuck is docker in the field of vitrualization](https://en.wikipedia.org/wiki/Docker_(software))?
	* an [open-source project](https://en.wikipedia.org/wiki/Open-source_software) that automates the deployment of applications inside software containers
		* guarantees that it will always run the same regardless of the environment it is running in
	* allows independent containers to run within a single linux instance avoiding the overhead of starting and maintaining virtual machines
		* additional layer of abstraction and automation in operating-system-level virtualization
			* isolation features of the linux kernel
				* cggroups
					* provide the ability to limit resources
						* cpu
						* memory
						* block I/O
						* network
				* kernel namespaces
					* isolates an application's view of the operating environment
						* process trees
						* network
						* user IDs
						* mounted file systems
			* union-capable file system
	* `libcontainer`
		* a library to directly use virtualization facilities provided by the linux kernel
	* in addition uses abstracted virtualization interfaces
		* libvirt
			* open source api, daemon and management tool for managing platform virtualization
		* LXC
			* an operating-system-level virtualization method for running multiple isolated linux containers on a control host using a single linux kernel
		* systemd-nspawn
			* fully virtualizes 
				* file system hierarchy 
				* process tree
				* various IPC subsystems
	* overview
		* as actions are done to a Docker base image
			* union file system layers are created and documented
				* each layer fully describes how to recreate an action
			* this enables Docker's lightweight images
				* only layer updates need to be propagated
		* Docker basically implements a high-level api to provide lightweight containers that run processes in isolation
			* each container can be constrained to only use a defined amount of resources

* what is a [union-capable file system in the field of virtualization](https://en.wikipedia.org/wiki/Union_mount)?
	* a way of combining multiple directories into one that appears to contain their combined contents
		* supported
			* Linux
			* BSD (and successors)
			* Plan 9
				* similar but subtly different behavior
	* Linux
		* multiple iterations of implementations	
			* inheriting file system - 1993
				* abandoned by its developler because of its complexity
			* UnionFS
				* FiST project at Stony Brook University
			* aufs - 2006
				* attempt to replace UnionFS
			* OverlayFS - 2009
				* added to the standard Linux kernel source code in 2014
		* GlusterFS offers the possibility to mount different filesystems distributed across a network
			* rather than being located on the same machine
	* Unix and BSD
		* due to traditional Unix file system behavior their implementation of unions is complicated
			* problems
				* duplicate file names within a directory are not acceptable
					* would break applications' expectations of how a Unix file system works
					* compromised by using a stack-like precedence ordering on the unix's constituents
						* requires memory to record which files need to be skipped over during a directory listing
							* would be nearly stateless operation otherwise
				* deletion requires special support if
					* files with the same name exists in several of the union directory's constituents
						* deleting these files causes a file from one of the others to reappear in its stead
				* insertion of a directory into the stack can cause incoherency in the kernel's file name cache
				* renaming a file within a single mounted file system (using the `rename` system call) should be an atomic operation
					* renaming within a union mount can require changes to multiple of the union's constituent directories
						* possible solution is to disallow `rename` in such sittuations and require implementations to copy-and-delete instead
				* stable inode numbers are hard to implement correctly for
					* files
					* hard links
					* memory-mapped I/O (mmap)
		* this concept is super janky on this operating system but doable
	* Plan 9
		* union mounting is a central concept
			* replaces several older Unix conventions
				* several directories containing executables, unioned together at a single `/bin` directory 
					* replace the `PATH` variable for command lookup in the shell
						* this is badass
		* union semantics are greatly simplified compared to the implementations for POSIX-style operating systems
			* union of two directories is simply the concatenation of their contents
				directory listing of the union may display duplicate names
			* no effort is made to recursively merge subdirectories
				* extremely simple implementation
			* directories are unioned in a controllable order
			* `u/name` where `u` is a union directory
				* denotes the file called `name` in the first constituent directory that contains such a file

* what are [namespaces in linux](https://en.wikipedia.org/wiki/Linux_namespaces)?
	* a feature of the Linux kernel that isolates and virtualizes system resources of a collection of processes
		* resources that can be virtualized
			* process IDs
			* hostnames
			* user IDs
			* network access
			* interprocess communication
			* filesystems
	* a fundamental aspect of containers on Linux
	* Linux developers use the term namespace to refer to both the namespace kinds as well as to specific instances of these kinds
	* a Linux system is initialized with a single instance of each namespace type
		* after initialization additional namespaces can be created or joined
	* namespaces
		* namespace functionality is the same across all kinds
		* each process is associated with a namespace and can only see or use the resources associated with that namespace and descendant namespaces where applicable
			* each process or group of can have a unique view on the resources
	* namespace kinds
		* (mnt) mount
			* mount namespaces control mount points
			* uppon creation the mounts from the current mount namespace are copied to the new namespace
				* mount points created afterwards do not propagate between namespaces
		* (pid) process ID
			*





* what is the [cgroups feature in linux](https://en.wikipedia.org/wiki/Cgroups)?

* what is [Docker, Inc the company](https://en.wikipedia.org/wiki/Docker,_Inc.)?
	* the company behind the development of the docker software open source project
	* 120 employees based in SF
	* history
		* october, 2013
			* dotCloud, Inc is renamed to Docker, inc
		* september, 2013
			* Docker and Red Hat announce alliance
		* august, 2014
			* Docker sells the doCloud platform and brand to cloudControl
		* october, 2014
			* Docker and Microsoft partner to help drive adoption of distributed applications
		* november, 2014
			* AWS announces EC2 container service
		* november, 2015
			* Docker passes 1.2 billion container downloads
		* march, 2016
			* Docker announces Docker Cloud
	* acquisitions
		* july, 2014	
			* Orchard
		* october, 2014
			* Koality
		* february, 2015
			* SocketPlane
		* march, 2015
			* Kitematic
		* october, 2015
			* Tutum
		* january, 2016
			* Unikernel Systems
		* march, 2016
			* Conductant
		* december, 2016
			* Infinit

* what is [Docker cloud](https://docs.docker.com/docker-cloud/getting-started/intro_cloud/)?

* what is an [abstracted virtualization interface in the field of virtualization]()?

* what is the [libvirt api](https://en.wikipedia.org/wiki/Libvirt)?

* what is [LXC in operating-system-level virtualization](https://en.wikipedia.org/wiki/LXC)?

* what is [systemd in linux](https://en.wikipedia.org/wiki/Systemd)?

* what does [systemd-nspawn do towards virtualization](https://en.wikipedia.org/wiki/Docker_(software))?





















