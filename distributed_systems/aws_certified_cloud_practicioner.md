# notes for the aws certified cloud practicioner a cloud guru course

* what are 6 advantages of cloud computing?
    * trade capital expense for variable expense
        * instead of investing into physical servers just pay for your consumption
    * benefit from massive economies of scale
        * take advantage of amazons economies of scale
    * stop guessing about capacity
        * cloud scales with business needs
    * increase speed and agility
        * using serverless architecture and other architecture 
    * stop spending money running and maintaining data centers
        * managing infrastrucutre isn't your businesses point
    * go global in minutes
        * deploy application around the world extremely quickly
        
* what types of cloud computing infrastructure are there?
    * IAAS (infrastructure as a service)
        * you manage the server which can be phsyical or virtual, as well as the operating system 
        * usually data center provider will have no access to your server
    * PAAS (platform as a service)
        * someone else manages the underlying hardware and operating system
        * you focus on your application
        * someone else worries about security, patching, updates, maintenance ect...
    * SAAS (software as a service)
        * all you worry about is the software itself and how you want to use it

* what are the basics of s3?
    * a bucket is a place to store objects
        * object storage
    * s3 is a unique global namespace
        * no two buckets with the same name exist
    * successful uploads will generate http 200 status
    * encrypt objects in transit using ssl
    * encrypt objects at rest on s3
    * s3 vs glacier 
        * s3 is for current data
        * glacier is for archived data where 3-5 hour retrieval time is acceptable
    * to restrict access to an entire bucket 
        * use bucket policy
    * to restrict access to an individual object
        * use access control list
    * you can replicate buckets of one bucket to another bucket automatically
        * using cross region replication
    * you can change storage classes and encryption of your objects on the fly
    * you can use bucket policies to make entire s3 buckets public
    * you can use s3 to host static websites 
    * s3 scales automatically to meet your demand many enterprises serve static websites from s3

* what are the basics of cloudfront?
    * a CDN (Content Delivery Network) basically a masive caching distribution network
    * edge location
        * the location where content will be cached
    * origin
        * the origin of all the files that the CDN will distribute
        * can be
            * s3 bucket
            * ec2 instance
            * elastic load balancer
            * route53
    * distribution
        * the name given to the CDN which consist of a collection of edge locations
    * web distribution
        * used for websites
    * RTMP
        * used for media streaming

* what are the basics of ec2?
    * server provision as a service
        * EC2 is a server
    * use a private key to connect to server
    * security groups are virtual firewalls in the cloud
        * you need to open ports in order to use them
            * ssh   -> port 22
            * http  -> port 80
            * https -> port 443
            * rdp   -> port 3389
    * pricing models
        * on demand
            * pay a fixed rate by the hour with no commitment        
            * useful for applications with short term, spiky, or unpredictable workloads that cannot be interrupted
            * useful for developer testing
        * spot  
            * bid whatever price you want for instance capacity
            * useful for applications that have flexible start and end times
            * useful for applications that are only feasible at very low compute prices            
        * reserved instances
            * reserve capacity up front for a significant discount on the hourly charge for an instance 
            * 1 year or 3 year terms of service
            * useful for applictions with steady state or predictable usage
        * dedicated hosts
            * physical ec2 server dedicated for your use 
            * useful for regulatory requirements that may not support multi-tenant virtualization
    * instance types
        * D2
            * specialized for dense storage
            * useful for fileservers, data warehousing, and hadoop
        * R4
            * specialized for memory optimized
            * useful for memory intensive apps/dbs
        * M4
            * specialized for general purpose
            * useful for application servers
        * C4
            * specialized for compute optimized
            * useful for CPU intensive apps/dbs
        * G2
            * specialized for graphics intensive
            * useful for video encoding, 3D application streamming
        * I2
            * specialized for high speed storage
            * useful for nosql dbs, data warehousing, ect...
        * F1
            * specialized for field programmable gate array
            * useful for hardware accelerating your code
        * T2
            * specialized for lowest cost, general purpose
            * useful for web servers, small dbs
        * P2
            * specialized for graphics, general purpose gpu
            * useful for machine learning, bitcoin mining, ect...
        * X1
            * specialized for memory optimized
            * useful for sap hana, apache spark, ect...

    
* what are the basics of EBS (Elastic Block Storage)?
    * storage volumes that are attached to EC2 instances
    * once attached can create file system, run db, or anything else block storage allows you to do 
    * placed in specific availability zones and are automatically replicated
    * volume types
        * GP2 (General Purpose SSD)
            * general purpose balances price and performance 
            * 3 iops per GB with up to 10,000 IOPS 
        * IO1 (Provisioned IOPS SSD)
            * designed for I/O intensive applications such as large relational or nosql databases
            * used for more than 10,000 IOPS
        * ST1 (Throughput Optimized HDD)
            * used for big data
            * log processing
            * cannot be a big volume
        * SC1 (Cold HDD)
            * lowest cost storage for infrequently accessed workloads
            * file server
        * Magnetic (Standard)
            * lowest cost per gb of all EBS volume types 
            * ideal for infrequent access where storage cost is important

* what are the basics of roles?
    * they are much more secure than using access key id's and secret access keys
        * and they are easier to manage
    * you can apply roles to EC2 instances at any time
    * roles are universal
        * no need to specify regions or az
        
    


