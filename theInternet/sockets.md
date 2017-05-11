# research and notes on sockets

sockets are like the fundation of network programming or something...


* [what is a socket](http://beej.us/guide/bgnet/output/html/multipage/theory.html)?
	* a way to speak to other programs using standard Unix file descriptors
	* everything is a file, sockets are a particular type of file
		* these files are designed for end point communication

* [what is an internet socket](http://beej.us/guide/bgnet/output/html/multipage/theory.html)?
	* stream socket
		* `SOCK_STREAM`
		* reliable two-way connected error-free communication
		* TCP
	* datagram socket
		* `SOCK_DGRAM`
		* connectionless sockets
		* unreliable and error-free
		* UDP

* what is the [OSI model](https://en.wikipedia.org/wiki/OSI_model)?
	* application layer
		* interacts with software applications that implement a communicating component
	* presentation layer
		* context between application-layer entities
			* application layer may use different syntax and semantics if the presentation service provides a mapping between them
	* session layer
		* connections between computers
	* transport layer
		* functional and procedural means of transferring variable-length data sequences from a source to a destination host via one or more networks
	* network layer
		* functional and procedural means of transfering variable length data sequences from one node to another conncected to the same network
	* data link layer
		* node-to-node data transfer 
		* a link between two directly connected nodes
	* physical layer
		* electrical and physical specifications of the data connection


