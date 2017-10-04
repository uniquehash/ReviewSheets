# notes on HAProxy

* what is [HAProxy](https://en.wikipedia.org/wiki/HAProxy)?
  * a free open source software that provides a high availability load balancer and proxy server for TCP and HTTP based applications that spreads request across multiple servers
  * written in C
  * fast and efficient
  * defacto open source solution

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


* how and why is [HAProxy so performent](http://www.haproxy.org/#perf)?
  * 
