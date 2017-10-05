# notes on HAProxy

* what is [HAProxy](https://en.wikipedia.org/wiki/HAProxy)?
  * a free open source software that provides a high availability load balancer and proxy server for TCP and HTTP based applications that spreads request across multiple servers
  * written in C
  * fast and efficient
  * defacto open source solution
  * [HAProxy technical breakdown](http://cbonte.github.io/haproxy-dconv/1.7/intro.html#chapter-3.2)
    * HAProxy is a single-threaded, event-driven, non-blocking engine combining a very fast I/O layer with a priority-based scheduler
    * architected to move data as fast as possible with the least possible operations
    * implements a layered model offering bypass mechanisms at each level ensuring data does not reach higher levels when not needed
    * most of the processing is performed in the kernel and data is preprocessed as much as possible to make this faster
    * no need to run more than one instance
    * only requires haproxy executable and a configuration file to run
  * [technical features]((http://cbonte.github.io/haproxy-dconv/1.7/intro.html#chapter-3)
    * TCP proxy
      * can accept a TCP connection from a listening socket
      * connect to a server and attach these sockets together allowing traffic to flow in both directions
    * HTTP reverse-proxy (also known as a gateway)
      * presents itself as a server
      * receivtes HTTP requests over connections accepted on a listening TCP socket
      * passes the requests from these connections to servers using different connections
    * SSL terminator/initiator/offloader
      * SSL/TLS may be used on the
        * connection coming from the clinet
        * connection going to the server
        * both connections
    * TCP normalizer
      * connections are locally terminated by the operating system 
        * no relation between both sides
        * abnormal traffic will not be passed to the other side
          * invalid packets
          * flag combinations
          * window advertisements
          * sequence numbers
          * incomplete connections (SYN floods)
    * HTTP normalizer
      * when configured to process HTTP traffic only valid complete requests are passed
      * protects against protocol-based attacks
    * HTTP fixing tool
      * can manipulate the url or any request or response header
        * modify
        * fix
        * add
        * remove
        * rewrite
      * helps fixing interoperability issues in complex environments
    * content-based switch
      * can consider any element from the request to decide what server to pass the request or connection to 
      * it is possible to handle multiple protocols over a same port
    * server load balancer
      * can load balance TCP connections and HTTP requests
      * in TCP mode load balancing decisions are taken for the whole connection
      * in HTTP mode decisions are taken per request
    * traffic regulator
      * can apply some rate limiting at various points
      * protect the servers agains overloading
      * adjust traffic priorities based on the contents
      * pass information to lower layers and outer network components by marking packets
    * protection against DDoS and service abuse
      * can maintain a wide number of statistics and detect when an abuse is happening
        * IP address
        * URL
        * cookie
        * etc
      * can take action
        * slow down offenders
        * block them 
        * send them to outdated contents
    * observation point for network troubleshooting
      * logged information is very precise
        * often used to narrow down some network-related issues
    * HTTP compression offloader
      * can compress responses which were not compressed by the server
        * reduces page load time for clients with poor connectivity, or using high-latency, mobile networks

* what is [load balancing and how do load balancers work](http://cbonte.github.io/haproxy-dconv/1.7/intro.html#chapter-2)?
  * load balancing consists in aggregating multiple components in order to achieve a total processing capacity above the individual capacity of each component
    * requires no intervention from the end user
    * must be scalable
    * single operations are still performed on a single component
    * requires at least as many operations as available components and an efficient load balancing mechanism to make use of all components and to fully benefit from the load balancing
  * examples of load balancing
    * process scheduling in multi-processor systems
    * link load balancing
    * ip address load balancing
    * server load balancing
  * the mechanism or component which performs the load balancing operation is called a load balancer
    * network load balancer are in reference to web environments
  * network load balancers can act at many levels 
    * link level
      * called link load balancing
      * consists in chosing what network link to send a packet to
    * network level
      * called network load balancing
      * consists in chosing what route a series of packets will follow
    * server level
      * called server load balancing
      * consists in deciding what server will process a connection or request
  * two distinct technologies exist and address different needs
    * packet-based
      * acts at the packet level and processes packets more or less individually
      * 1-1 relation between input and output packets
        * possible to follow the traffic on both sides of the load balancer using a regular network sniffer
      * usually implemented in hardware
      * usually stateless 
        * can be stateful
        * may support direct server return
      * very well suited to network-level load balancing
    * proxy-based
      * acts on session contents
      * requires that the input stream is reassembled and processed as a whole
      * contents may be modified
      * the ouptut stream is segmented into new packets
      * often performed by proxies, often called layer 7 load balancers
      * two distinct connections on each side
        * no relation between input and output packets sizes nor counts
      * clients and servers not required to use same protocol
      * operations are stateful
      * return traffic must pass through the load balancer 
      * can be achieved pure software
  * load balancers mush check health of their components
    * health checks
      * periodically sending probes to ensure the component is still operational
      * must be representative of the type of failure to address
      * involve a few retries to cover occasional measuring errors
      * period between checks must be small enough to ensure the faulty component is not used for too long after an error occurs
    * sampling
      * sampling the production traffic sent to a destination to observe if it is processed correctly or not, and to evince the components which return inappropriate responses
        * sacrifice a part of the production traffic and this is not always acceptable 
    * centralized reporting
      * central monitoring agent periodically updates all load balancers about all components state
      * gives a global view of the infrastructure to all components though sometimes with less accuracy or responsiveness 
        * suited for environments with many load balancers and many servers
  * layer 7 load balancers stickiness/persistence
    * must generally have to direct multiple subsequent requests or connections from a same origin to the same target
      * must persist the context of the user 
      * layer 4 cannot do this

* how does [HAProxy work](http://cbonte.github.io/haproxy-dconv/1.7/intro.html#chapter-3.2)?
  * startup
    * configuration files are parsed before starting
    * HAProxy tries to bind all listening sockets
      * refuses to start if anything fails
    * no runtime failures, it will work until it is stopped
  * runtime
    * processes incoming connections
      * accept incoming connections from listening sockets that belong to a configuration entity known as a frontend
        * references one or multiple listening addresses
      * apply the frontend-specific processing rules to these connections that may result 
        * in blocking them
        * modifying some headers
        * intercepting them to execute some internal applets such as the statistics page or the CLI
      * pass these incoming connections to another configuration entity representing a server farm known as a backend
        * backend contains the list of servers and the load balancing strategy for this server farm
      * apply the backend-specific processing rules to these connections
      * decide which server to forward the connection to according to the load balancing strategy
      * apply the backend-specific processing rules to the response data
      * apply the frontend-specific processing rules to the response data
      * emit a log to report what happened in fine details
      * in HTTP
        * loop back to the second step to wait for a new request
        * otherwise close the connection
    * periodically check the servers status (health checks)
    * exchange information with other haproxy nodes

* how and why is [HAProxy so performent](http://www.haproxy.org/#perf)?
  * a load balancers performance is generally announced for the best case 
    * expect an average practical performance of half of maximal session and data rates for average sized objects
  * measuring the performance of a load balancer  
    * session rate
      * directly determines when the load balancer will not be able to distribute all the requests it receives
      * CPU-bound
    * session concurrency
      * session rate will drop when the number of concurrent sessions increases
      * if load balancer receives 10,000 sessions per second and the servers respond in 100ms then the load balacner will have 1,000 concurrent sessions
      * limited by the amount of memory and file descriptors the system can handle
        * with 16kb buffers HAProxy will need 34kb per session
          * 30,000 sessions per GB of ram
          * in practice 20,000 per GB of ram
    * data forwarding rate
      * the opposite of the session rate
      * measured in mb/s or gbps
      * highest data rates are achieved with large objects to minimise the overhead cause by session setup and teardown
        * large objects generally increase session concurrency
      * high data rates butn a lot of CPU and bus cycleson software load balancers because the data has to be copied from the input interface to memory and then back to the output device
  * techniques to achieve absolute maximal performance
    * a single-process, event-driven model cosiderably reduces the cost of context switch and the memory usage
      * processing several hundreds of tasks in a milisecond is possible and the memory usage is in the order of a few kb per session while memory consumed in preforked or threaded servers is more in the order of mb per process
    * O(1) event checker on systems that allow it
      * allows instantaneous detection of any event on any connection among tens of thousands
    * delayed updates to the event checker using lazy event cache
      * ensures that we never update an event unless absolutely required
        * saves a lot of system calls
    * single-buffering without any data copy between reads and writes whenever possible
      * saves a lot of CPU cycles and useful memory bandwidth
        * often the bottleneck will be the I/O busses between the CPU and the network interfaces
    * zero-copu forwarding is possible using the splice() system call under linux    
    * MRU memory allocator using fixed size memory pools for immediate memory allocation
      * favors hot cache regions over cold cache ones
      * dramatically reduces the time needed to create a new session
    * work factoring such as multiple accept() at once and the ability to limit the number of accept() per iteration when running in multi-process mode
      * load is evenly distributed among processes
    * CPU-affinity is supported when running in multi-process mode
      * or simply adapt to the hardware and be the closest possible to the CPU core managing the NICs while not conflicting with it
    * tree-based storage
      * making heavy use of the elastic binary tree, O(log(N)) cost to
        * keep timers ordered
        * keep the runqueue ordered
        * manage round-robin and least-conn queues
        * look up ACLs or keys in tables
    * optimized timer queue
      * timers are not moved in the tree if they are postponed 
        * likeliness that they are met is close to zero since they're mostly used for timeout handling
    * optimized HTTP header analysis
      * headers are parsed and interpreted on the fly and the parsing is optimized to avoid an re-reading of any previously read memory area
      * checkpointing is used when an end of buffer is reached with an incomplete header so that the parsing does not start again from the beginning when more data is read
    * careful reduction of the number of expensive system calls 
      * most work is done in user space by default 
        * time reading
        * buffer aggregation
        * file-descriptor enabling/disabling
    * content analysis is optimized to carry only pointers to original data and never copy unless the data needs to be transformed
      * ensures that very small structures are carried over and that contents are never replicated when not absolutely necessary
        
    
    
    
    
    
    
