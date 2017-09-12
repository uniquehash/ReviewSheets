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

	




































































