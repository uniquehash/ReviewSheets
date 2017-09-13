# notes on AWS

* what is [AWS](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_cloud_computing.htm)?
	* a cloud computing vendor
	* started in 2006
	* it ousources IT infrastructure allowing users to spin up hundreds or thousands of servers in minutes 
	* pay per use no up-front expenses
	* cloud computing
		* an internet-based computing service in which large groups of remote servers are networked to allow centralized data storage and online access to computer services or resources
		* features
			* users can provision and release resources on-demand
			* resources can be scaled up or down automatically depending on the load
			* resources are accessible over a network with proper security
			* cloud service providers can enable a pay-as-you-go model
				* customers are charged based on the type of resources and per usage
	* types of cloud
		* public cloud
			* third-party service providers make resources and services available to their customers via internet
			* customers data and related security is with the service providers owned infrastructure
		* private cloud
			* data and services are managed by the organization or by the third party only for the customers organization
			* client has major control over the infastructure so security related issues are minimized
		* hybrid cloud
			* combination of both private and public cloud
			* the decision to run on private or public cloud usually depends on various parameters
				* sensitivity of data and applications
				* industry certifications and required standards
				* regulations
	* cloud service models
		* IaaS
			* infrastructure as a service
			* provides users with the capability to provision on demand
				* processing
				* storage
				* network connectivity
			* customer can develop their own applications on these resources
		* PaaS
			* platform as a service
			* provides various services
				* databases
				* queues
				* workflow engines
				* e-mails
			* the customer can then use these components for building their own applications
			* the services, availability of resources and data backup are handled by the service provider that helps the customers to focus more on their applications functionality
		* SaaS
			* software as a service
			* provides end-user applications to their customers with some administrative capability at the application level
				* ability to create and manage their users
			* some level of customizability is possible 
	* advantages of cloud computing
		* cost-efficient
			* building your own infastructure is expensive and inefficient
			* only pay for the amount of computing resources used
		* reliability
			* much more reliable, managed and consistent service than in-house infrastructure
		* unlimited storage
			* provides almost unlimited storage capacity
		* backup & recovery
			* storing data in the cloud, backing it up and restoring the same is relatively easier than storing it on a physical device
		* easy access to information	
			* once you register yourself in the cloud you can access your account from anywhere in the world provided there is internet connection at that point
	* disadvantages of cloud computing
		* security issues
			* major issue
			* cloud service providers implement the best security standards and industry certifications
				* storing data and important files on external service providers always bears a risk	
			* AWS cloud infrastructure is designed to be the most flexible and secured cloud network
		* technical issues
			* clous service providers offer services to large number of clients each day
			* sometimes the system can have some serious issues leading to business processes temporarily being suspended
		* vendor lock-in
			* switching between service providers is very difficult 

* what is [the basic architecture of AWS EC2](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_basic_architecture.htm)?
	* EC2 stands for Elastic Compute Cloud
	* allows users to use virtual machines of different configurations as per their requirement
		* allows various configuration options, mapping of individual server, various pricing options
	* S3 stands for Simple Storage Service
	* basic architecture diagram
		* ![basic architecture EC2](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_basic_architecture.htm "basic architecture EC2")
		* everything is encapsulated within a AWS region that receives data from the open internet
		* will circle back?
	* load balancing
		* distribute hardware or software load over web servers improving the efficiency of the server as well as the application
		* hardware load balancer is a very common network appliance used in traditional web application architectures
		* AWS provides the Elastic Load Balancing service 
			* distributes traffic to EC2 instances across multiple available sources
			* dynamically adds and removes Amazon EC2 hosts from the load-balancing rotation
			* can dynamically grow and shring the load-balancing capacity to adjust to traffic demands and also support sticky sessions to address more advanced routing needs
	* Amazon Cloud-front
		* responsible for content delivery
		* uses a global network of edge location to deliver
			* dynamic
			* static
			* streaming content
		* request for content at the users end are automatically routed to the nearest edge location improving performance
		* optimized to work with other Amazon web services 
			* S3
			* EC2
		* works with any non-AWS origin server and stores the original files in a similar manner
		* no contracts or monthly commitments
			* pay onlys for as much or as little content delivered through the service
	* Security Management
		* EC2 provides a feature called security groups
			* similar to an inbound network firewall allows to specify what is allowed to reach your EC2 instances
				* protocols
				* ports
				* source IP ranges
		* each EC2 instance can be assigned one or more security groups
			* each routes the appropriate traffic to each instance
		* security groups can be configured using specific subnets or IP addresses which limits access to EC2 instances
	* Elastic Caches
		* manages the memory cache in the cloud
			* helps reduce the load on the service
			* improves performance and scalability on the database tier by caching frequently used information
	* Amazon RDS
		* stands for Amazon Relational Database Service
		* similar access as that of MySQL, Oracle, ect..
		* the same queries, applications and tools can be used with Amazon RDS
		* automatically patches the database software and manages backups as per users instruction
		* supports point-in-time recovery 
		* service provider manages the storage
			* user only focuses on managing the data
	* hosting RDMS on EC2 instances
		* can install other RDBMS system on EC2 instance
	* Amazon EBS
		* Amazon Elastic Block Storage
		* similar to network attached storage
		* all data and logs running on EC2 instances should be placed on Amazon EBS volumes 
			* will be available even if the database host fails
		* automatically provide redundancy within the availability zone
		* if volume is not sufficient DB needs 
			* volume can be added to increase the performance of DB
	* Storage & Backups
		* provides various options for web applications data and assets
			* storing
			* accessing
			* backing up
		* S3
			* provides a simple web-services interface that can be used to store and retrieve any amount of data at any time anywhere on the web
			* stores data as objects within resources called buckets
				* user can store as many objects as per requirement within the bucket
					* can read, write, and delete objects from the bucket
		* EBS
			* effective for data that needs to be accessed as block storage and requires persistence beyond the life of the running instance
				* database partitions and application logs
			* can be maximized up to 1TB 
				* can be striped for larger volumes and increased performance
			* provisioned IOPS volumes are designed to meet the needs of database workloads that are sensitive to storage performance and consistency
			* currently supports up to 1,000 IOPS per volume
				* string multiple volumes together to deliver thousands of IOPS per instance to an application
	* auto scaling
		* the difference between AWS cloud architecture and the traditional hosting model is that AWS can dynamically scale the web application fleet on demand to handle changes in traffic
		* can create capacity groups of servers that can grow or shring on demand
	* key considerations for web hosting in AWS
		* no physical network devices needed
		* no security concerns 
		* availability of data centers

* how to use an [AWS account](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_account.htm)?
	* AWS account identifiers
		* AWS Account ID
			* a 12-digit number used to construct ARNs
				* Amazon Resource Names
			* helps to distinguish our resources from resources in other AWS accounts
		* conical string user ID
			* a long string of aplhanumeric characters
			* used in S3 bucket policy for cross-account access
	* Account Alias
		* the url for your sign-in page
		* contains the account ID by default
	* multi factor authentication
		* provides additional security by authenticating the user to enter a unique authentication code from an approved authentication device or SMS text message 
		* SMS mfa device
			* requires us to configure IAM user with the phone number of the users SMS-compatible mobile device
			* when user signs on AWS sends a six-digit code by SMS text message to the users mobile device
			* the user is required to enter the same code on a second web page during sign-in to authenticat the right user
			* cannot be used with AWS root account
		* hardware mfa device
			* requires us to assign a hardware MFA device to the IAM user o rthe AWS root account
			* device generates a six-digit numeric code based upon a time synchronized one-time password alogrithm
			* the user has to enter the same code from the device on a second web page during sign-in to authenticat the right user
		* virtual mfa device
			* requires us to assign a virtual MFA device to the IAM user or the AWS root account
			* a virtual device is a software application running on a mobile device that emulates a physical device
			* the device generates a six-digit numeric code based upon a time-synchronized one-time password algorithm
			* user has to enter the same code from the device on a second web page during sign-in to authenticate the right user
	* IAM
		* AWS Identity and Access Management
		* a user entity which we create in AWS to represent a person that uses it with limited access to resource
		* do not use the root account in day-to-day activities

* how does [AWS EC2 work](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_elastic_compute_cloud.htm)?
	* Elastic Compute Cloud
	* a web service interface that provides resizable compute capacity in the AWS cloud
		* designed for developers to have complete control over web-scaling and computing resources
	* AZ
		* availability zones
		* each region comprises of several AZs at distinct locations connected by low latency networks in the same region
	* EC2 components
		* operating system support
			* Red Hat Enterprise
			* SUSE Enterprise
			* Oracle Enterprise Linux
			* UNIX
			* Windows Server
			* must be implemented in conjunction with Amazon Virtual Private Cloud
		* security
			* uses have complete control over the visibility of their AWS account
			* allows to create groups and place running instances into it as per the requirement
			* specify the groups with which other groups may communicate
			* specify the groups with which ip subnets on the internet may communicate
		* pricing
			* users are charge according to the resources they use
		* fault tolerance
			* allows the users to access it resources to design fault-tolerant applications
			* comprises geographic regions and isolated locations (AZ) for fault tolerance and stability
			* when users launch an instance 
				* must select an Amazon Machine Image in the same region where the instance will run
			* instances are distributed across multiple availability zones to provide continuous services in failures
			* EIPs
				* Elastic IP
				* used to quickly map failed instance addresses to concurrent running instances in other zones to avoid delay in services
		* migration
			* allows users to move existing applications into EC2
			* costs $80.00 per storage device and $2.49 per hour of data loading
	* features
		* reliable
			* highly reliable environment where replacement of instances is rapidly possible
			* service level agreement commitment is %99.9 availability for each EC2 region
		* designed for AWS
			* works well with S3, RDS, DynamoDB, SQS
			* provides a complete solution for computing, query processing, and storage across a  wide range of applications
		* secure
			* works in (VPC) virtual private cloud 
				* provides a secure and robust network to resources
		* flexible tools
			* provides the tools for developers and system administrators to build failure applications and isolate themselves from common failure situations
		* inexpensive
			* multiple purchase plans
			* on-demand instances
			* reserved instances
			* spot instances

* how does [AWS auto-scaling work](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_auto_scaling.htm)?
	* auto scaling allows you to scale EC2 instances up or down automatically as per the instructions set by the user
	* parameters like minimum and maximum number of instances are set by the user 
	* the number of EC2 instances used increases automatically as the demand rises to maintain the performance and decreases automatically as the demand decreases to minimize the cost
	* particularly effective for those applications that fluctuate usage
		* hourly
		* daily
		* weekly 
	* enabled by Amazon CloudWatch
		* can be used to measure
			* CPU utilization
			* network traffic
	* ELB
		* Elastic Load Balancing
		* automatically distributes incoming request traffic across multiple EC2 instances and results in achieving higher fault tolerance
		* detects unfit instances and automatically reroutes traffic to fit instances until the unfir instances have been restored in a roud-robin manner
		* for more complex routing algorithms use Amazon Route53
		* load balancer
			* includes monitoring and handling the requests incoming throught the internet/intranet and distributes them to EC2 instances registered with it
		* control service
			* includes automatically scaling of handling capacity in response to incoming traffic by adding and removing load balancers as required
			* performs fitness check of instances
		* SSL termination
			* saves precious CPU cycles, encoding and decoding SSL within your EC2 instances attached to the ELB
			* X.509 certificate is required to be configured within the ELB 
			* SSL connection in the EC2 instance is optional 
		* features
			* designed to handle unlimited requests per second with gradually increasing load pattern
			* can configure EC2 instances and load balancers to accept traffic
			* can add/remove load balancers as per requirement without affecting the overall flow of information
			* it is not designed to handle sudden increase in requests like online exams, online trading
			* customers can enable Elastic Load Balancing within a single availability zone or across multiple zones for even more consistent application performance

* what are [AWS WorkSpaces](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_workspaces.htm)?
	* a fully managed desktop computing service in the cloud
		* allows its customers to provide cloud-based desktops to their end-users
	* end users can access resources using any device
		* documents
		* applications
		* resources
	* launched to meet the demand for DaaS 
		* Desktop as a Service
	* features
		* network health check-up
			* verifies if the network and internet connection are working
			* checks if WorkSpaces and their associated registration services are accessible
			* checks if port 4172 is open for UDP and TCP access
		* client reconnect
			* allows users access to their WorkSpace without entering their credentials every time when they disconnect
				* application installed on the clients device saves an access token in a secure store which remains valid for 12 hours
			* can be disabled at anytime
		* auto resume session
			* allows the client to resume a session that was disconnected due to any reason in network connectivity within 20 minutes
				* can be extended for 4 hours
			* can disable the feature at any time in the group policy section
		* console search
			* allows administrators to search for WorkSpaces by
				* user name
				* bundle type
				* directory
	* value of WorkSpaces
		* easy to set up
		* choice of devices and applications
		* cost effective

* what are [AWS lambdas](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_lambda.htm)?
	* a responsibe cloud service that inspects actions within the application and responds by deploying the user-defined codes
	* functions
		* user-defined code deployed by AWS lambda
	* automatically manages the compute resources across multiple availability zones and scales them when new actions are triggered
	* languages supported
		* Java
		* Python
		* Node.js
	* can launch processes in languages supported by Amazon Linux
		* Bash
		* Go
		* Ruby
	* recommended tips
		* write functions code in a stateless style
		* never declare any function variable outside the scope of the handler
		* make sure to have a set of +rx permissions on your files in the uploaded zip to ensure lambda can execute code on your behalf
		* delete old functions when no longer required
	* value of lambda
		* lambda tasks need not to be registered like Amazon SWF activity types
		* we can use any existing lambda functions that you have already defined in workflows
		* functions are called directly by Amazon SWF
			* no need to design a program to implement and execute them
		* provides us the metrics and logs for tracking function executions
	* lambda limits
		* throttle limit
			* 100 concurrent lambda function exectutions per account 
				* applied to the total concurrent executions across all functions within a region
			* formula to calculate number of concurrent executions for a function
				* (average duration of the function execution) X (number of requests or events processed by AWS lambda)
			* when throttle limit is reached
				* returns a throttling error code 429
				* after 15 - 30 minutes you can start to work again
			* can be increased by contacting AWS support center
		* resources limit
			* ephemeral disk capacity "tmp" space
				* 512 mb
			* number of file descriptors
				* 1024
			* number of processes and threads (total)
				* 1024
			* maximum execution duration per request
				* 300 seconds
			* invoke request body payload size
				* 6 mb
			* invoke response body payload size
				* 6 mb
		* service limit
			* lambda function deployment package size (.zip/.jar)
				* 50 mb
			* size of code/dependencies that you can zip into a deployment package (uncompressed zip/jar size)
				* 250 mb
			* total size of all the deployment packages that can be uploaded per region
				* 1.5 gb
			* number of unique event sources of the scheduled event source type per account
				* 50
			* number of unique lambda functions you can connect to each scheduled event
				* 5

* what is the [AWS Virtual Private Cloud (VPC)](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_virtual_private_cloud.htm)?
	* allows the user to use aws resources in a virtual network
		* the users can customize their virtual network environment as they like
			* selecting own IP address range
			* creating subnets
			* configuring route tables and network gateways
	* AWS services that can be used with VPC
		* EC2
		* Route 53
		* WorkSpaces
		* Auto Scaling
		* Elastic Load Balancing
		* AWS Data Pipeline
		* Elastic Beanstalk
		* Elastic Cache
		* EMR
		* OpsWorks
		* RDS
		* Redshift
	* features
		* many connectivity options
			* connect VPC directly to the internet via public subnets
			* connect to the internet using network address translation via private subnets
			* connect securely to your corporate datacenter via encrypted IPsec hardware VPN connection
			* connect privately to other VPCs in which we can share resources across multiple virtual networks through AWS account
			* connect to S3 without using an internet gateway and have good control over
				* S3 buckets
				* its user requests
				* groups
			* combine connection of VPC and datacenter is possible by configuring VPC route tables to direct all traffic to its destination
		* easy to use
			* Amazon provides a wizard to create the virtual private cloud automatically creating and configuring
				* subnets
				* IP ranges
				* route tables
				* security groups
		* easy to backup data
			* periodically backup data from the datacenter into EC2 instances by using EBS volumes
		* easy to extand network using cloud
			* connecting to a VPC allows to
				* move applications
				* lanch additional web servers 
				* increase storage capacity

* what is a [virtual private cloud](https://en.wikipedia.org/wiki/Virtual_private_cloud)?
	* an on-demand configurable pool of shared computing resources allocated within a public cloud environment
		* provides a certain level of isolation between the different organizations using the resources
		* thses organizations are known as VPC users
	* isolation between one VPC user and all other users of the same cloud (both VPC and public cloud users) is achieved normally through allocation for each user of
		* private IP subnet
		* virtual communication construct
			* VLAN or encrypted communication channels
	* each VPC user also gets a VPN function
		* secures by means of authentication and encryption the remote access of the organization to its VPC cloud resources
	* basically enables all the software control of a traditional network but using IaaS components and tooling

* why does [AWS Virtual Private Cloud (VPC) exist](https://en.wikipedia.org/wiki/Amazon_Virtual_Private_Cloud)?
	* Amazon Virtual Private Cloud
		* a commercial cloud computing service that provides users a virtual private cloud by provisioning a logically isolated section of AWS cloud
	* comparison to private clouds
		* its the same thing just built virtually using public infastructure making it cheaper but less secure to some threats
	* the point
		* this is a hybrid approach
		* public cloud is cheap, easy to use and maintain but lacks control and has some important secruity considerations
		* private cloud provides complete and total control and thus allows for theoritically better security, but is expensive and difficult to maintain
		* VPC is a private cloud built on top of the public cloud logically isolated through virtualization
			* significantly simpler to maintain and cheaper than private cloud
			* significantly greater control than public cloud, and thus the possibility for greater secruity
			* still has some of the unique security threats that private cloud does not posses
				* goverment snooping
				* hardware access
				* residual risk from being in contact with public

* what is [AWS Route 53](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_route_53.htm)?
	* a highly available and scalable domain name system web service
	* designed for developers and corporates to route the end users to internet applications by translating human readable names into numeric IP addresses 
	* features
		* easy to register your domain
		* highly reliable
		* scalable
			* automatically handles large volume queries without the users interaction
		* can be used with other AWS services
			* can be used to map domain names to 
				* EC2 instances
				* S3 buckets
				* other AWS resources
		* easy to use
			* simple DNS configuration
		* health check
			* monitors the health of the application 	
			* if outage is detected
				* automatically redirects the users to a healthy resource
		* cost-effective
			* pay only for the domain service and the number of queries that the service answers for each domain
		* secure
			* integrated with AWS IAM
				* allows complete control over every user within the AWS account 

* what is a [DNS](https://en.wikipedia.org/wiki/Domain_Name_System)?	
	* Domain Name System
	* a hierarchical decentralized naming system for computers, services, or other resources connected to the internet or a private network
		* associates various information with domain names assigned to each of the participating entitites
		* generally translates more readily memorized domain names to their numerical IP addresses needed for locating and identifying computer services and devices with the underlying network protocols

* why does [Route 53 exist](https://cloudacademy.com/blog/route53-dns-migration/)?
	* the point
		* gives you greater cost effective and programmatic control over your routing 
	* compelling reasons
		* simple routing policy
			* allows the same simple DNS mappings that every other DNS does
		* weighted routing policy
			* assign different numeric weights to multiple servers providing a web service
				* can direct higher or lower percentage of your incoming traffic to one particular server over another 
				* useful for load balancing or A|B testing
		* latency based routing policy
			* directs traffic requests to the server that will be able to respond with the lowest possible latency
				* run your application in multiple AWS regions
				* Route 53 will automatically route users to those that will deliver the quickest
		* failover routing policy
			* will send all traffic to the server you set as primary for as long as the server is healthy
			* when it fails will divert traffic to a designated backup resource
		* geolocation routing policy
			* designate resource targets based on your users geolocation

* what is [AWS Direct Connect](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_direct_connect.htm)?
	* permits to create a private network connection from our network to AWS locations
		* uses 802.1q VLANs
		* can be partitioned into multiple virtual interfaces to access public resources using the same connection
			* reduced network cost and increased bandwidth
		* virtual interfaces can be reconfigured at any time as per the requirement
	* requirements to use
		* network should be in the AWS Direct Connect location
		* should be working with a AWS Direct Connect partner who is a member of the AWS Partner Network
		* service provider must be portable to connect to AWS Direct Connect
		* connections to AWS Direct Connect require
			* auto negotiation for the port must be disabled
			* support for 802.1Q VLANs across these connections should be available
		* network must support BGP (Border Gateway Protocol) and BGP MD5 authentication
			* optionally can configure to BFD (Bidirectional Forwarding Detection)
	* features
		* reduces bandwidth costs
			* transfers data to and from AWS directly
			* data transfered over dedicated connection is charged at reduces AWS Direct Connect data transfer rate rather than internet data transfer rates
		* compatible with all AWS services
		* private connectivity to Amazon VPC
		* elastic 
			* provides 1 Gbps and 10 Gbps connections
		* easy and simple	

* what are the use cases for [AWS Direct Connect](https://aws.amazon.com/directconnect/details/)?
	* working with large data sets
		* transferring large data sets over the internet can be time consuming and expensive
	* real-time data feeds
		* control of how data is routed allows for the possibility of low latency
	* hybrid environments
		* some regulation require the use of private connectivity
	* the point
		* basically exactly what it sounds like
		* its a direct connection to AWS from your network (it available locations) giving you
			* speed
			* control
			* reliability
			* lower cost

* what is [AWS S3](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_s3.htm)?
	* Simple Storage Service
	* scalable, high-speed, low-cost web-based service designed for online backup and archiving of data and application programs
		* for any type of files up to 5 gb in size
			* upload
			* store
			* download 
	* subscriber has control over the accessibiity of data
	* features
		* low cost and easy to use
			* user can store a large amount of data at very low charges
		* secure
			* S3 supports data transfer over SSL and the data gets encrypted automatically once it is uploaded
			* user has complete control over data by configuring bucket policies using IAM
		* scalable
			* no need to worry about storage concerns
			* can store as much data that you can pay for
		* higher performance
			* integrated with Amazon CloudFront
				* distributes content to the end user with low latency and provides high data transfer speed 
		* integrated with AWS services
	
* what is [AWS Elastic Block Store (EBS)](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_elastic_block_store.htm)?
	* Elastic Block Store
	* a block-level storage system used to store persistent data 
	* EBS is suitable for EC2 instances by providing highly available block-level storage volumes
	* IOPS
		* Input Output Operations per Second
	* types of volume
		* general purpose (SSD)
			* suitable for 
				* small and medium workloads like root disk EC2 volumes
				* small and medium database workloads
				* frequent logs accessing workloads
			* by default
				* supports 3 IOPS/GB
				* 1 GB volume will give 3 IOPS
				* 10 GB volumw will give 30 IOPS
		* provisioned IOPS (SSD)
			* suitable for
				* demanding I/O intensive transactional workloads
				* large relational databases
				* EMR and Hadoop workloads
			* by default
				* supports 30 IOPS/GB
				* storage capacity ranges from 10GB to 1TB
		* magnetic
			* formerly known as standard volumes
			* suitable for
				* infrequently access data
					* backups for recovery
					* log storage
			* by default
				* storage capacity from 10GB to 1TB
		* volumes attached to one instance
			* EC2 instances can store data in local storage
			* available while instance is running
				* data lost when instance stopped
			* each account will be limited to 20 EBS volumes
			* can attach up to 20 volumes on a single instance 
	* benefits
		* reliable and secure storage
			* each of the EBS volume will automatically respond to its availability zone to protect from component failure
		* secure
			* flexible access control policies allows to specify who can access which EBS volumes
			* access control plus encryption offers strong defense-in-depth
		* higher performance
			* uses SSD technology to deliver data results with consistent I/O performance of application
		* easy data backup
			* data backup can be saved by taking point-in-time snapshots of EBS volumes

* what is a [block-level storage](https://en.wikipedia.org/wiki/Block-level_storage)?
	* in cloud-hosted data persistence where cloud services emulate the behavior of a traditional block device (hard drive)
	* a form of NAS
		* network attached storage
	* filesystem must be the top level abstraction
		* storage is organized as blocks
			* emulates the type of behaviour seen in a traditional disk or tape storage
		* blocks are identified by an arbitrary and assigned identifier by which they may be stored and retrieved
			* this has no obvious meaning in terms of files or documents
		* filesystem maps files onto a sequence of blocks
	* Amazon EBS
		* Elastic Block Store
		* example of a cloud block store
	* block-level storage is in contrast to object store/bucket store or to a database
		* S3 is a bucket store 
		* these operate on a higher level of abstraction
			* able to work with entities
				* files, documents, images, videos, db records
	* instance stores
		* another form of cloud-hosted block-level storage
			* provided as part of an instance such as EC2
				* EC2 instances are primarily provided as compute resources rather than storage resources, their storage is less robust
				* their contents will be lost if the cloud instance is stopped
				* these stores are part of the instances virtual server
				* offer higher performance and bandwidth to the instance
				* best used for temporary storage such as caching or temporary files
					* persistent storage held on a different type of server
	* history
		* in the past block-level storage was provided by SAN and NAS provided file-level storage
		* shift from on-premises hosting to cloud services this distinction shifted
		* block-storage is now seen as dinstinct servers (thus NAS), rather than the previous arrays of bare dics
		* basically NAS and SAN have more or less combined and maintained the NAS interface, working as SAN underthe hood

* what is [(NAS) network attached storage](https://en.wikipedia.org/wiki/Network-attached_storage)?
	* network attached storage
	* a file-level compute data storage server connected to a computer network providing data access to a heterogeneous group of clinets
	* specialized for serving files either by its hardware, software, or configuration
	* NAS systems are networked appliences which contain one or more storage drives often arranged into logical, redundant storage containers
		* known as RAID
	* removes the responsibility of the file serving from the other servers on the network
	* typically provide access to files using network file sharing protocols
		* NFS
		* SMB/CIFS
		* AFP
	* benefits
		* faster data access
		* easier administration
		* simple configuration
	* description
		* NAS unit
			* a computer connected to a network that provides only file-based data storage services to other devices on the network
			* full-featured operating system is generally not needed
			* contains one or more hard disk drives arranged into RAID
			* rarely limit clients to a single protocol
	* NAS vs SAN
		* NAS 
			* provides both storage and a file system
			* appears to the client OS as a file server		
		* SAN 
			* provides only block-based storage
			* appears to the client OS as a disk
		* not mutually exclusive
			* SAN-NAS hybrid exist
	* implementation
		* computer based NAS
		* embedded system based NAS
		* ASIC based NAS
	* uses
		* can provide storage services to simpler and lower cost systems such as 
			* load-balancing 
			* fault-tolerant email 
			* web server systems 
	
* what is [(DAS) direct-attached storage](https://en.wikipedia.org/wiki/Direct-attached_storage)?
	* direct-attached storage
		* digital storage directly attached to the computer accessing it as opposed to storage accessed over a computer network
			* hard drives
			* solid-state drives
			* optical disk drives

* what is does [RAID mean in distributed systems](https://en.wikipedia.org/wiki/RAID)?
	* redundant array of independent disks
	* a data storage virtualization technology that combines multiple physical disk drive components into a single logical unit for the purposes of
		* data redundancy
		* performance improvement
	* data is distributed across the drives in one of several ways depending on the required level of redundancy and performance
		* RAID levels
		* each scheme/data distribution layout are named by the word RAID followed by a number
			* provides a different balance among the key goals
				* reliability
				* availability 
				* performance
				* capacity
		* RAID levels greater than 0 provide protection against unrecoverabl sector read errors as well as against failures of whole physical drives
	* overview
		* many RAID levels employ an error protection scheme called parity
			* a widely used method in information technology to provide fault tolerance in a given set of data
			* most use simple XOR
				* RAID 6 uses two separate parities based respectively on addition and multiplication in a particluar Galois field or Reed-Solomon error correction
		* can also provide data security with solid-state drives without the expense of an all-SSD system
			* a fast SSD can be mirrored with a mechanical drive
			* hybrid RAID
				* controller is needed that uses SSD for all read operations
	* standard levels
		* RAID 0
		* RAID 1
		* RAID 2
		* RAID 3
		* RAID 4
		* RAID 5
		* RAID 6
	* nested hybrid RAID
		* many storage controllers allow RAID levels to be nested 
			* elements of a RAID may be either individual drives or arrays themselves 
			* arrays are rarely nested more than one level deep
	* weaknesses
		* correlated failures
			* in practice the drives are often the same age with similar wear and subject to the same environment
				* many drive failures are dure to mechanical issues 
				* violates the assumption of independent, identical rate of failure amongst drives
					* failures are statistically correlated
		* unrecoverable read errors during rebuild
			* sector read failures
				* also known as latent sector errors
		* increasing rebuild time and failure probability
			* drive capacity has grown much faster than transfer speed and error rates have only fallen slightly
			* large drives may take hours if not days to rebuild 
				* during this time more errors and failures may occur
		* atomicity including parity inconsistency due to system crashes
			* interuption of a write operation can result in states where the parity is inconsistent with the data due to non-atomicity of the write process
				* parity cannot be used for recovery in the case of a disk failure
		* write-cache reliability
			* if system experiences a power loss or other major failure the data may be irrevocably lost from the cache before reaching the non-volatile storage

* what is [storage virtualization in computer science](https://en.wikipedia.org/wiki/Storage_virtualization)?
	* uses virtualization to enable better functionality and more advanced features in computer data storage systems
	* storage systems
		* also known as
			* storage array
			* disk array
			* filer
		* typically use special hardware and software along with disk drives in order to provide very fast and reliable storage
		* special purpose computers designed to provide storage capacity along with advanced data protection features
		* block accessed storage
			* protocols
				* Fibre Channel
				* iSCSI
				* SAS
				* FICON
		* file accessed storage
			* protocols
				* NFS
				* SMB
	* virtualization types
		* block virtualization
			* refers to the abstraction of logical storage from physical storage
				* may be accessed without regard to physical storage or heterogeneous structure
			* allows the administrators of the storage system greater flexibility in how they manage storage for end users
		* file virtualization
			* addresses the NAS challenges by eliminating the dependencies between the data accessed at the file level and the location where the files are physically stored
			* provides opportunities to optimize storage use and server consolidation and to perform non-disruptive file migrations
	* block virtualization
		* address space remapping
			* location independence by abstracting the physical location of the data
			* system presents to the user a logical space for data storage and handles the process of mapping it to the actual physical location
			* possible to have multiple layers of virtualization or mapping
			* the ouput of one layer of virtualization can be used as the input for a higher layer of virtualization
			* granularity
				* single physical disk -> small subset of physical disk
			* block-based storage environment
				* sinlge block of information is addressed using a LUN (Logical Unit Number) identifier and an offset within that LUN known as a LBA (Logical Block Addressing)
		* meta-data
			* virtualization software or device is responsible for maintaining a consistent view of all the mapping information for the virtualized storage
				* this is called meta-data
			* stored as a mapping table
			* address space may be limited by the capacity needed to maintain the mapping table
			* granularity and total addressable space both directly impact the size of the meta-data
			* common to have trade-offs between amount of addressable capacity and granularity
			* using multiple levels of virtualization can allow you to address these limits
				* many storage systems today utilize three layers of virtualization
			* some implementations do not use a mapping table
				* on access calculate locations using an algorithm
		* I/O redirection
			* virtualization software or device uses the meta-data to re-direct I/O requests
				* receives incoming I/O request containing information about the location of the data in terms of logical disk
					* vdisk
				* translates this into a new I/O request to the physical disk location
		* capabilities
			* most implementations allow for heterogeneous management of multi-vendor storage devices within the scope of a given implementations support matrix
				* capabilities are not limited to a single vendor device and can be used across many different vendor devices
		* replication
			* replication services must be implemented above the software or device that is performing the virtualization
				* only above the virtualization layer can a consistent image of the vdisk be copied
			* if virtualization is implemented in the network or higher
				* renders any replication services provided by the underlying storage controller useless
			* remote data replication for disaster recovery
				* synchronous mirroring
					* I/O completion is only returned when the remote site acknowledges the completion
					* applicable for shorter distances
						* < 200 km
				* asynchronous mirroring
					* I/O completion is returned before the remote site has acknowledged the completion
					* applicable for much greater distances
						* > 200 km
			* point-in-time snapshots to copy or clone data for diverse uses
				* when combined with thin provisioning enables space-efficient snapshots
		* pooling
			* the physical storage resources are aggregated into storage pools from which the logical storage is created
			* more storage systems which may be heterogeneous in nature can be added as and when needed and the virtual space will scale up by the same amount
				* fully transparent to the applications using the storage infastructure
		* disk management
			* virtualization software becomes a common disk manager in the virtualized environment
				* vdisks are created by the virtualization software and are mapped to the required host or server
				* provides a common place or way for managing all volumes in the environment
			* enhanced features are easy to provide in this environment
				* thin provisioning to maximize storage utilization
					* relatively easy to implement as physical storage is only allocated in the mapping table when it is used
				* disk expansion and shrinking
					* more physical storage can be allocated by adding to the mapping table
					* disks can be reduced in size by removing some physical storage from the mapping
		* benefits
			* non-disruptive data migration
				* ability to migrate data while maintaining concurrent I/O access
					* the host only knows about the logical disk (mapped LUN) 
					* any changes to the meta-data is transparent to the host
					* meta-data can simply be updataed to point to the new location when the data has been copied or moved
				* mapping granularity dictates how quickly the meta-data can be updated
		* improved utilization
			* utilization can be increased by virtue of the pooling, migration, and thin provisioning services
		* fewer points of management
			* multiple independent storage devices even if scattered across a network appear to be a single monolithic storage device and can be managed centrally
			* traditional stroage controller management is still required
				* creation and maintenance of RAID arrays
				* error and fault management
		* risks
			* backing out a failed implementation
			* interoperability and vendor support
			* complexity
				* management of environment
				* infrastructure design
				* software or device itself
			* meta-data management
			* performance and scalability
		* implementation approaches
			* host-based
				* requires additional software running on the host as a prvileged task or process
					* volume management may be built into the operating system
					* or offered as a separate product
				* volumes (LUNs) presented to the host system are handled by a traditional physical device driver 
					* a software layer (volume manager) resides above the disk device driver intercepts the I/O requests and provides the meta-data lookup and I/O mapping
				* most operating systems have some form of logical volume management built-in that perform virtualization tasks
				* host based volume managers were in use long before "storage virtualization" had been coined
				* pros
					* simple to design and code
					* supports any storage type
					* improves storage utilization without thin provisioning restrictions
				* cons
					* storage utilization optimized only on a per host basis
					* replication and data migration only possible locally to that host
					* software is unique to each operating system
					* no easy way of keeping host instances in sync with other instances
					* traditional data recovery following a server disk drive crash is impossible
			* storage device-based
				* has existed for years and only been recently classified as virtualization
				* even the simplest disk array provides a logical to physical abstraction as they use RAID schemes to join multiple disks in a single array
				* concept
					* a primary storage controller provides the services and allows the direct attachment of other storage controllers
					* depending on the implementation these may be from the same or different vendors
					* primary controller provides pooling and meta-data management services
				* pros
					* no additional hardware or infastructure requirements
					* provides most of the benefits of storage virtualization
					* does not add latency to individual I/Os
				* cons
					* storage utilization optimized only across the connected controllers
					* replication and data migration only possible across the connected controllers and same vendors device for long distance support
					* downstream controller attachment limited to vendors support matrix
					* I/O latency, non cache hits require the primary storage controller to issue a secondary downstream I/O request
					* increase in storage infrastructure resource the primary storage controller requires the same bandwidth as the secondary controllers to maintain the same throughput
			* network-based
				* storage virtualization operating on a network based device (typically a standard server or smart switch) and using iSCSI or FC Fibre channel networks to connect as a SAN
				* most commonly available and implemented form of storage virtualization
				* pros
					* true heterogeneous storage virtualization
					* caching of data (performance benefit) is possible when in-band
					* single management interface for all virtualized storage
					* replication services across heterogeneous devices
				* cons
					* complex interoperability matrices 
						* limited by vendors support
					* difficult to implement fast meta-data updates in switched-based devices
					* out-of-band requires specific host based software
					* in-band may add latency to I/O 
					* in-band the most complicated to design and code
				* appliance-based vs switch-based
					* both models can provide the same services
						* disk management
						* metadata lookup
						* data migration 
						* replication
					* both models require some processing hardware to provide these services
					* appliance-based
						* dedicated hardware devices that provide SAN connectivity of one form or another
						* sit between the hosts and storage and in the case of in-band symmetric appliances can provide all of the benefits and services discussed in this article 
						* I/O requests are targeted at the appliance itself
							* it performs the meta-data mapping before redirecting the I/O by sending its own I/O requestto the underlying storage
						* the in-band appliance can also provide caching of data and most implementations provide some form of clustering of individual appliances to maintain an atomic view of the metadata as well as cache data
					* switch-based
						* resides in the physical swithc hardware used to connect the SAN devices
						* sits between the hosts and storage but may use different techniques to provide the metadata mapping
							* packet cracking to snoop on incoming I/O requests and perform I/O redirection 
						* much more difficult to ensure atomic updates of metadata in a switched environment and services requiring fast updates of data and metadata may be limited in switched implementations
				* in-band vs out-of-band
					* in-band
						* also known as symmetric
						* devices sit in the path between the host and storage
						* all I/O requests and their data pass through the device
						* host perform I/O to the virtualization device and never interact with the actual storage device
						* the virtualization device in turn performs I/O to the storage device 
						* easy to implement
							* caching of data
							* statistics about data usage
							* replications services
							* data migration
							* thin provisioning
					* out-of-band
						* also known as asymmetric
						* virtualization devices sometimes called meta-data servers
							* only perform the meta-data mapping functions
						* requires additional software in the host which knows to first request the location of the actual data 
						* I/O request from the host is intercepted before it leaves the host
						* meta-data lookup is requested from the meta-data server
							* returns the physical location of the data to the host
						* information is then retrieved through an actual I/O request to the storage
						* caching is not possible as the data never passes through the device
	* file based virtualization
		* a synonym used for NAS virtualization

* what is [thin provisioning in computing](https://en.wikipedia.org/wiki/Thin_provisioning)?
	* using virtualization technology to give the appearance of having more physical resources than are actually available
	* in a shared-storage environment provides a method for optimizing utilization of available storage
		* relies on on-demand allocation of block of data versus the traditional method of allocating all the blocks in advance
		* eliminates all whitespace helping avoid the poor utilization rates that occur in the traditional storage allocation method where large pools of storage capacity are allocated to individual servers but remain unused 
	* storage capacity utilization efficiency can be automatically driven up towards 100% with very little administrative overhead
	* the point
		* so basically you got 3 vm that each are allocated "100 gb" of disk space
		* in thick provisioning you allocate 300 gb of disk space (1 for each vm) and that space sits there unused for ever
		* in thin provisioning you allocate as you write meaning that of the 300 gb "allocated" initially only enough for the OS is actually used lets say 60 gb (20 gb each)
			* now even though you have 300 gb "allocated" only 60 gb is actually used and the remaining disk space can be used for other things until needed

* what is a [SAN in networking](https://en.wikipedia.org/wiki/Storage_area_network)?
	* storage area network
		* a network which provides access to consolidated, block level data storage
	* primarily used to enhance storage devices accessible to servers so that the devices appear to the operating system as locally attached devices
		* disk arrays
		* tape libraries
		* optical jukeboxes
	* a SAN typcially has its own network of storage devices that are generally not accessible through the LAN by other devices
	* doesn not provide file abstraction only block level operations
	* SAN compared to NAS
		* in both various computers in a network can share a more centralized collection of storage devices via a network connection
		* conceptual difference
			* NAS
				* appears to the client OS as a file server
			* SAN 
				* appears to the client OS as a disk

* what is [AWS storage gateways](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_storage_gateway.htm)?
	* provides integration between the on-premises IT environment and the AWS storage infastructure
	* user can store data in the AWS cloud for scalable, data security features and cost-efficient storage
	* two types of storage
		* volume based
			* provides cloud-based storage volumes which can be mount as iSCSI devices from on-premises application servers
				* Internet Small Computer System Interface
			* gateway-cached volumes
				* AWS storage gateway stores all the on-premises application data in a storage volume in S3
				* storage volume ranges from 1gb to 32gb
				* these can be attached with iSCSI devices from on-premises application servers
					* cache storage disk
						* used to initially store data when it is to be written to the storage volume in AWS
						* the data from the cache storage disk is waiting to be uploaded in S3 from the upload buffer
						* cache storage disk keeps the most recently accessed data for low-latency access
							* when application needs data this is checked first before checking S3
						* allocate at least 20% of the existing file store size as cache storage 
							* should be more than the upload buffer
						* upload buffer disk	
							* used to store data before it is uploaded to S3 over SSL connection
							* storage gateway uploads data from upload buffer over an SSL connection to AWS
						* snapshots
							* sometimes we need to back up storage volumes in S3
							* these backups are incremental and are known as snapshots
								* only the data that has changed since the last snapshot is backed up
							* stored in S3 as EBS snapshots
							* taken either at a scheduled interval or as per the requirement
					* gateway-stored volumes
						* when the VM is activated gateway volumes are created and mapped to the on-premises direct-attached storage disk
						* when the application write/read the data from the gateway storage volumes it reads and writes the data from the mapped on premises disk
						* allows to store primary data locally and provides on-premises applications with low-latency access to entire datasets
							* mount them as iSCSI devices to the on-premises application servers
		* gateway-virtual tape library (VTL)
			* provides a virtual tape infrastructure that scales seamlessly with your business needs and eliminates the operational burden of physical tape infastructure
				* provisioning
				* scaling
				* maintaining 
			* each gateway-VTL is preconfigured with media changes and tape drives that are available with existing client backup applications as iSCSI devices
			* vocabulary
				* virtual tape
					* similar to a physical tape catridge
						* stored in the AWS cloud
					* can create using console or API
				* virtual tape library (VTL)
					* each gateway-VTL comes with one VTL
						* similar to a physical tape library available on-premises with tape drives
					* gateway first stores data locally then asynchronously uploads it to virtual tapes of VTL
				* tape drive
					* a VTL tape drive is similar to a physical tape drive that can perform I/O operations on tape
				* media changer
					* a VTL media changer is similar to a robot that moves tapes around in physical tape librarys storage slot and tape drives
					* each VTL comes with one media changer that is used for backup applications as iSCSI device
				* virtual tape shelf (VTS)
					* a VTS is used to archive tapes from gateway VTL to VTS and vice versa
				* archiving tapes
					* when the backup software ejects a tape the gateway moves the tape to the VTS for storage
				* retrieving tapes
					* tapes archived to the VTS cannot be read directly so to read an archived tape we need to retrieve the tape from gateway VTL either by using the AWS storage gateway console or API

* what is [AWS CloudFront](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_cloudfront.htm)?
	* retrieves data from S3 bucket and distributes it to multiple datacenter locations
	* delivers the data through a network of data centers called edge locations
	* the nearest edge location is routed when the user requests for data, resulting in lowest latency, low network traffic, fast access to data
	* features
		* fast
			* the broad network of edge locations and CloudFront caches copies of content close to the end users that result in lowering latency, high data transfer rates and low network traffic 
		* simple
		* can be used with other AWS services
		* cost-effective
		* elastic
		* reliable 
		* global
			* uses a global network of edge locations located in most of the regions

* what is [AWS (RDS) Relational Database Service](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_relational_database_service.htm)?
	* AWS Relational Database Service
		* a fully managed SQL database cloud service that allows to create and operate relational databases
		* access files and databases anywhere in a cost-effective and highly scalable way
	* features
		* scalable
			* scale the relational database by using AWS management console or RDS-specific API
			* increase or decrease RDS requirements within minutes
		* host replacement
			* sometimes the RDS hardware fails 
			* automatically replaced by Amazon
		* inexpensive
		* secure
		* automatic backups
			* RDS backs up everything in the database including transaction logs up to last five minutes and also manages automatic backup timings
		* software patching
			* automatically gets all the latest patches for the database software
			* specify when the software should be patched using DB Engine Version Management
	* cost
		* instance class
			* pricing is based on the class of DB instances consumed
		* running time
			* price is calculated by the instance-hour
			* equivalent to a single instance running per hour
		* storage
			* bill is calculated as per teh storage capacity plan chosen in terms of per GB
		* I/O requests per month
			* billing structure also includes total number of storage I/O requests made in a billing cycle
		* backup storage
			* there is no additional charges for backup storage up 100% of database
			* free service only for active DB instances

* what is [Amazon DynamoDB](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_dynamodb.htm)?
	* a fully managed NoSQL database service that allows the user to create database tables that can store and retrieve any amount of data
		* automatically manages the data traffic of tables over multiple servers and maintains performance
		* relieves the customer from the burden of operating and scaling a distributed database
	* benefits
		* managed service
			* you pay amazon people to manage your stuff
		* scalable
		* fast
			* high throughput
			* low latency
		* durable and highly available
			* replicates data over at least 3 different data centers results
		* flexible
			* allows creation of dynamic tables
				* table can have any number of attributes including multi-valued attributes
		* cost-effective

* what is [AWS Redshift](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_redshift.htm)?
	* a fully managed data warehouse service in the cloud
		* datasets range from 100s of GB to petabytes
	* initial process to create a data warehouse is to launch a set of compute resources called nodes
		* nodes are organized into groups called clusters
	* features
		* supports VPC
			* can launch Redshift within VPC and control access to the cluster through the virtual networking environment
		* encryption
			* data stored in Redshift can be encrypted and configured while creating tables in Redshift
		* SSL
			* SSL encryption is used to encrypt connections between clients and Redshift
		* scalable
			* the number of nodes can easily be scaled as per requirement
			* allows to scale over storage capacity without any loss in performance
		* cost-effective

* what is [AWS Kinesis](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_kinesis.htm)?
	* a managed, scalable, cloud-based service that allows real-time processing of streaming large amount of data per second
		* designed for real-time applications
		* allows developers to take in any amount of data from several sources
		* used to capture, store, and process data from large, distributed streams
			* event logs
			* social media feeds
		* after processing the data Kinesis distributes it to multiple consumers simultaneously
	* how to use Amazon KCL
		* used in situations where we require rapidly moving data and its continuous processing
			* data log and data feed intake
				* push data to KCL stream as soon as the data is produced
				* protects data loss in case of data producer fails
				* system and application logs can be continuously added to a stream and can be available in seconds when required
			* real-time graphs
				* we can extract graphs/metrics using KCL stream to create results reports
			* real-time data analytics
				* we can run real-time streaming data analytics 
	* limits of KCL
		* records of a stream can be accessible up to 24 hours by default and can be extended up to 7 days by enabling extended data retention	
		* maximum size of a data blob in one record is 1 mb
			* data blob is the data payload before Base64 encoding
		* one shard supports up to 1000 PUT records per second
	* features
		* real-time processing
			* allows to collect and analyze information in real-time like stock trade prices 
		* easy to use
		* high throughput and elastic
		* integrate with other Amazon services
		* build Kinesis applications
			* provides developers with client libraries that enable the design and operation of real-time data processing applications
		* cost-efficient

* what is [AWS (EMR) Elastic MapReduce](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_elastic_mapreduce.htm)?
	* a web service that provides a managed framework to run data processing frameworks in an easy cost-effective and secure manner
		* Apache Hadoop
		* Apache Spark
		* Presto
	* use cases
		* data analysis
		* web indexing
		* data warehousing
		* financial analysis
		* scientific simulation
	* benefits
		* easy to use
			* cluster
			* hadoop configuration
			* node provisioning
		* reliable
			* retries failed tasks and automatically replaces poorly performing instances
		* elastic
		* secure
			* automatically configures EC2
				* firewall settings
				* controls network access to instances
				* launch clusters in an Amazon VPC
		* flexible
			* complete control over clusters and root access to every instance 
		* cost-efficient

* what is [AWS Data Pipeline](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_data_pipeline.htm)?
	* a web service designed to make it easier for users to integrate data spread across multiple AWS services and analyse it from a single location
		* data can be accessed from the source, processed, and then the results can be efficiently transferred to the respective AWS services
	* features
		* simple and cost-efficient
			* drag and drop features makes it easy to create a pipeline on console
			* visual pipeline creator provides a library of pipeline templates 
				* templates make it easier to create pipelines for tasks like 
					* processing log files
					* archiving data to Amazon S3
		* reliable
			* designed for fault tolerant execution activities
				* failure occur in the activity logic or data sources
					* automatically retries the activity
					* failure continues
						* send a failure notification
			* notification alerts can be configured
		* flexible  
			* scheduling
			* tracking
			* error handling
			* can be configured to take actions like 
				* run Amazon EMR jobs
				* execute SQL queries directly against databases
				* execute custom applications running on Amazon EC2

* what is [AWS Machine Learning](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_machine_learning.htm)?
	* a service that allows to develop predictive applications by using algorithms, and mathematical models based on the users data
		* reads data through Amazon S3, Redshift, and RDS
		* visualizes the data through the AWS Management Console and Amazon Machine Learning API
		* data can be imported or exported to other AWS services via S3 buckets
		* uses industry-standard logistic regression algorithm to generate models
	* types of task performed 
		* binary classification model can predict one of the two possible results
		* multi-class classification model can predict multiple conditions
		* a regression model results in an exact value
	* features 
		* easy to create machine learning models
			* create ML models from data stored in Amazon S3, Redshift, RDS
			* query these models for predictions 
		* high performance
			* Amazon ML prediction API can be used further to generate billions of predictions for the application 
		* cost-efficient

* what is [AWS Simple WorkFlow Service](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_simple_workflow_service.htm)?
	* a task based API that makes it easy to coordinate work across distributed application components
		* provides a programming model and infastructure for coordinating distributed components and maintaining their execution state in a reliable way
		* focus on building the aspects of applications that differentiates it
	* workflow
		* a set of activities that carry out some objective including logic that coordinates the activities to achieve the desired output
	* workflow history
		* consists of complete and consistent record of each event that occurred since the workflow execution started
	* Application Services Section
		* Amazon CloudSearch
		* Amazon Simple Queue Services
		* Amazon Simple Notification Services
		* Amazon Simple Email Services
		* Amazon SWF
	* benefits
		* enables applications to be statelss because all information about a workflow execution is stored in its workflow history
		* for each workflow execution the history provides a record of which activities were scheduled, their current statuses and results 
		* the history provides steps in detail that can be used to monitor running workflow executions and verify completed workflow executions

* what is [AWS WorkMail](https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_workmail.htm)?
	* formerly known as Zocalo
	* a managed email and calendaring service that runs in cloud
	* provides security controls and is designed to work with your existing PC and Mac-based outlook clitens 

 























































