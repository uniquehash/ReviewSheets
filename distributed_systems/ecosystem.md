# notes on the distributed system ecosystem

* what is [oracle RAC (Real Application Clusters)](https://en.wikipedia.org/wiki/Oracle_RAC)?
    * provides software for clustering and high availability in oracle database environments
        * an option for the oracle database software produced by oracle corporation and introduced in 2001
    * functionality
        * allows multiple computers to run oracle RDBMS software simultaneously while accessing a single database
        * allows an application or user to connect to either computer and have access to a single coordinated set of data
    * implementation
        * depends on the infrastructure component oracle clusterware to coordinate servers and their sharing of data storage
        * FAN (Fast Application Notification) technology detects down-states
        * can use the `srvctl` tool to manage RAC configurations
        * cache fusion
            * the ability of oracle RAC to fuse the in-memory data cached physically separately on each computer into a single global cache

* what is [SCSI (Small Computer System Interface)](https://en.wikipedia.org/wiki/SCSI)?
    * a set of standards for physically connecting nd transferring data between computers and peripheral devices
    * commonly used for hard disk drives and tape drives, but it cannot connect a wide range of other devices
    * protocol
        * communication takes place between an initiator and a target
        * initiator sends a command to the target, which then responds
        * SCSI commands are sent in a CDB (Command Descriptor Block)
        * CDB consists of a one byte operation code followed by five or more bytes containing command-specific parameters
        * at the end of the command sequence the target returns a status code byte such as
            * 00h for succes
            * 02h for an error (called a check condition)
                * when initator receives a check condition it usually issues a SCSI Request Sense command in order to obtain a key code qualifier from the target                
            * 08h for busy
        * four categories of SCSI commands
            * N 
                * non-data
            * W 
                * writing data from initiator to target
            * R
                * reading data
            * B
                * bidirectional
        * most common commands
            * test unit ready: queries device to see if it is ready for data transfers
            * inquiry: returns basic device information
            * request sense: returns any error codes from the previous command that returned an error status
            * send diagnostic and receive diagnostic results: runs a simple self-test or a speciailized test defined in a diagnostic page
            * start/stop unit: spins disks up and down, or loads/unloads media 
            * read capacity: returns storage capacity
            * format unit: prepares a storage medium for use 
            * read: reads data from a device, 4 variants
            * write: writes data to a device, 4 variants
            * log sense: returns current information from log pages
            * mode sense: returns current device parameters from mode pages
            * mode select: sets device parameters in a mode page

* what is [iSCSI (internet Small Computer Systems Interface)](https://en.wikipedia.org/wiki/ISCSI)?
    * an IP based storage networking standard for linking data storage facilities
        * standardized in march 2000
    * provides block-level access to storage devices by carrying SCSI commands over a TCP/IP network
    * can be used to transmit data over LANs, WANs or the internet and can enable location-independent data storage and retrieval
    * it is a SAN (storage area network) protocol allowing organizations to consolidate storage into storage arrays while providing clients with the illusion of locally attached SCSI disks
    * objectives
        * storage consolidation
        * disaster recovery
    * concepts
        * iSCSI takes a popular high performance local storage bus and emulates it over a wide range of networks, creating a SAN
        * unlike some SAN protocols it requires no dedicated cabling, running on existing IP infrastructure
            * performance of an iSCSI SAN deployment can be severely degraded if not operated on a dedicated network or subnet due to competition for a fixed amount of bandwidth
        * initiator
            * 













