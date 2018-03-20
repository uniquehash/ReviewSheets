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









