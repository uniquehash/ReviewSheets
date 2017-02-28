# notes on operating systems in general

there is a need to differentiate between operating systems as a field and particular operating system implementations which are currently available. this is the first time i run into this problem for my notes!!!! w000000000000. pretty simple plan is outlined below.

* operating_systems <=========[if your reading this you're here]
	* theory
		* contains notes on the theory of operating systems
	* linux
		* contains notes on linux the operating system
	* ect...




* what does [mounting mean in the context of operating systems](https://en.wikipedia.org/wiki/Mount_(computing))?
	* takes place before a computer can use any kind of storage device
	* the user or their operating system must make it accessible through the computers file system
		* user can only access files on mounted media
	* overview
		* mount point
			* a physical location in the partition used as a root filesystem
		* filesystem
			* organization of the means by which information is read and written
			* each filesystem provides the host operating system with metadata so that it knows how to read and write data
		* mounting
			* the act of the operating system reading the metadata of the filesystem stored within some storage space allowing the operating system to use the storage




* what does [disk partitioning mean in the context of operating systems](https://en.wikipedia.org/wiki/Disk_partitioning)?
	* the creation of one or more regions on a hard disk or other secondary storage
		* allows an operating system to manage information in each region separately
	* typically the first step of preparing a newly manufactured disk
		* before any files or directories have been created
	* partition table
		* where the disk stores the information about the partitions' locations and sizes
		* operating system reads before any other part of the disk
	* each partition then appears in the operating system as a distinct logical disk that uses part of the actual disk



















