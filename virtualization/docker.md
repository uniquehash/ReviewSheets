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
			* LXC
			* systemd-nspawn


* what is a [union-capable file system in the field of virtualization](https://en.wikipedia.org/wiki/Union_mount)?

* what are [namespaces in linux](https://en.wikipedia.org/wiki/Linux_namespaces)?

* what is the [cgroups feature in linux](https://en.wikipedia.org/wiki/Cgroups)?

* what is [Docker, Inc the company](https://en.wikipedia.org/wiki/Docker,_Inc.)?

* what is an [abstracted virtualization interfacein the field of virtualization]()?

* what is the [libvirt api](https://en.wikipedia.org/wiki/Libvirt)?

* what is [LXC in operating-system-level virtualization](https://en.wikipedia.org/wiki/LXC)?

* what is [systemd in linux](https://en.wikipedia.org/wiki/Systemd)?

* what does [systemd-nspawn do towards virtualization](https://en.wikipedia.org/wiki/Docker_(software))?