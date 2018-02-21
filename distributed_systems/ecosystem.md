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
            * sends SCSI commands over an IP network to a target
            * two types
                * software initiators
                    * uses network card and network stack to emulate SCSI devices for a computer by speaking the iSCSI protocol
                * hardware initiators
                    * uses hardware to optimize the shit out of this process
        * target
            * storage resource located on an iSCSI server
            * often a dedicated network-connected hard disk storage device
                * storage array
                    * often using in data centers or enterprise environment
                * software target
                    * nearly all modern server operating systems can provide iSCSI target functionality either as a buit-in feature or with supplemental software
                * LUN (Logical Unit)
                    * specified by LUN numbers
                    * LUN represents an individual addressable logical SCSI device that is part of a physical SCSI device target
                    * essentially numbered disk drives
                    * initiator negotiated with a target to establish connectivity to a LUN
                        * results in an iSCSI connection that emulates a coonection to a SCSI hard dist
                    * in enterprise deployments LUNs usually represent subsets of large RAID disk arrays often allocated one per client 
                    * no rules or restrictions on multiple computers sharing individual LUNs 
        * addressing
            * iSCSI uses TCP typically port 860 and 3260 for the protocol itself with higher-level names used to address the objects within the protocol 

* what is [Fibre Channel](https://en.wikipedia.org/wiki/Fibre_Channel)?
    * is a high-speed network technology primarily used to connect computer data storge to servers
    * mainly used in SAN in commercial data centers
    * Fibre Channel networks form a switched fabric because they operate in unison as one big switch

* what is a [routing table](https://en.wikipedia.org/wiki/Routing_table)?
    * a data table stored in a router or a networked computer that lists the routes to particular network destinations and in some cases metrics associated with those routes
    * contains information about the topology of the network immediately around it
    * the construction of routing tables is the primary goal of routing protocols
    * static routes are entries made in a routing table by non-automatic means and which are fixed rather than being the result of some network topology discovery procedure
    * the primary function of a router is to forward a packet toward its destination network by searching the routing information stored in its routing table

* what is [classless inter-domain routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)?
    * a method for allocating ip addresses and ip routing 
    * ip addresses are described as consisting of two groups of bits in the address
        * the most significant bits are the network prefix
            * identifies a whole network or subnet
        * the least significant set forms the host identifier
            * specifies a particular interface of a host on that network
    * based on VLSM (variable-length subnet masking) technique
        * allows the specification of arbitraty-length prefixes
    * CIDR notation
        * an address or routing prefix is written with a suffix indicating the number of bits of the prefix
            * 192.168.2.0/24
            
        














