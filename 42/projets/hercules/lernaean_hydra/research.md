# research - lernaean_hydra - 12/25/2016

* what does man say for sockets?
	* `man socket`
		* `#include <sys/socket.h>`
		* `int socket(int domain, int type, int protocol)`
			* creates an endpoint for communication and returns a descriptor
			* the *domain* parameter specifie a communication domain within which communication will take place
				* selects a protocol family which should be used
				* defined in `<sys/socket.h>`
					* `PF_LOCAL`
						* host-internal protocols, formerly called PF_UNIX
					* `PF_UNIX`
						* host-internal protocols, deprecated, use PF_LOCAL
					* `PF_INET`
						* internet version 4 protocols
					* `PF_ROUTE`
						* internal routing protocol
					* `PF_KEY`
						* internal key-management function
					* `PF_INET6`
						* internet version 6 protocol
					* `PF_SYSTEM`
						* system domain
					* `PF_NDRV`
						* raw access to network device
			* the *socket* has an indicated type which specifies the semantics of communication
				* `SOCK_STREAM`
					* provides sequenced, reliable, two-way connection based byte streams
					* out-of-band data transmission mechanism may be supported
				* `SOCK_DGRAM`
					* supports datagrams (connectionless, unreliable messages of a fixed maximum length)
				* `SOCK_RAW`
					* provides access to internal network protocols and interfaces
					* only available to super-user
			* the *protocol* specifies a particular protocol to be used with the socket
				* normally only a single protocol exists to support a particular socket type within a given protocol family
					* it is possible that many protocols may exist in which case a particular protocol must be specified in this manner
				* the protocol number to use is particular to the communication domain in which communication is to take place
			* `SOCK_STREAM` sockets are full-duplex byte streams, similar to pipes
				* a stream socket must be in a connected state before any data may be sent or received on it
				* a connection to another socket is created with a `connect(2)` call
					* once connected data may be transferred using `read(2)` and `write(2)` calls or some variant of the `send(2)` and `recv(2)` calls
					* when a session has been completed a `close(2)` may be performed
					* out-of-band data may also be transmitted as described in `send(2)` and received in `recv(2)`
				* the communication protocols used to implement a SOCK_STREAM insure that data is not lost or duplicated
					* if a piece of data for which the peer protocol has buffer space cannot be successfully transmitted within a reasonable length of time, then the connection is considered broken and calls will indicate an error with -1 returns and with ETIMEDOUT as the specific code in the global variabl errno
					* the protocols optionally keep sockets warm by forcing transmissions roughly every minute in the absence of other activity
						* an error is then indicated if no response can be elicited on an otherwise idle connection for a extended period
					* a `SIGPIPE` signal is raised if a process sends on a broken stream
						* this causes naive processes, which do not handle the signal to exit
			* `SOCK_DGRAM` and `SOCK_RAW` sockets allow sending of datagrams to correspondents named in `send(2)` calls
				* datagrams are generally received with `revcfrom(2)` which returns the next datagram with its return address
			* a `fcntl(2)` call can be used to specify a process group to receive a SIGURG signal when the out-of-band data arrives
				* it may also enable non-blocking I/O and synchronous notification of I/O events via SIGIO
			* the operation of sockets is controlled by socket level options
				* these options are defined in `<sys/socket.h>`
					* `setsockopt(2)` and `getsockopt(2)` are used to set and get options
			* returns the descriptor referencing the socket
				* returns -1 if an error occurs



* what does the man say about daemons?
	* `man daemon`
		* `#include <stdlib.h>`
		* `int daemon(int nochdir, int noclose)`
			* the daemon() function is for programs wishing to detach themselves from the controlling terminal and run in the background as system daemons
			* the `fork(2)` system call is used
				* there are limits to what you can do in the child process
					* restrict yourself to only executing async-signal safe operations until one of the exec functions is called
					* all apis including global data symbols, in any framework or library should be assumed to be unsafe after a fork() unless explicitly documented to be safe or async-signal safe
					* to use these frameworks in the child process you must exec
						* in this situation it is reasonable to exec yourself
			* unless the argument *nochdir* is non-zero daemon() changes the current working directory to the root `/`
			* unless the argument *noclose* is non-zero daemon() will redirect standard input, standard output, and standard error to `/dev/null`
				* really daemon closes the first three file descriptors and redirects them to `/dev/null` 
					* usually means stdin, stdout, stderr
				* if anyone of those file descriptors refer to something else they will still be closed resulting in weird behavior of the calling program
				* this can happen if any of the stdin, stdout, stderr have been closed before the program was run
				* programs using daemon() should therefor either call daemon() before opening any files or sockets, or verify that any file descriptors obtained hhave values greater than 2
			* the daemon() function temporarily ignores SIGHUP while calling `setsid(2)` to prevent a parent session group leader's calls to `fork(2)` and then `_exit(2)` from prematurely terminating the child process
			* returns the value 0 if successful
			* returns the value -1 and sets errno if unsuccessful

* what are [system daemons](https://en.wikipedia.org/wiki/Daemon_(computing))?
	* a computer program that runs as a background process rather than being under the direct control of an interactive user
		* traditionally the process names of a daemon end with the letter `d` for clarification that the process is a daemon
	* in unix environments the parent process of a daemon is often but not always the init process 
	* alternative term for daemons is service (windows environment for example)






* how does fork work?

* what exactly is a protocol in the context of sockets?
	* `man 5 protocols`
		* the *protocols* file contains information regarding the known protocols used in the DARPA internet
		* for each protocol a single line should be present with the following information
			* official protocol name
			* protocol number
			* aliases
		* items are separated by any number of blanks and/or tabs 
		* a `#` indicates the beginnning of a coment
			* characters up to the end of the line are not interpreted by routines which search the file
		* protocol names may contain any printable character other than a field delimiter, newline, or comment character
		* file location
			* `/etc/protocols`

* how does connect work in the sockets context?
	* `man 2 connect`
		* `#include <sys/types.h>`
		* `#include <sys/socket.h>`
		* `int connect(int socket, const struct sockaddr *address, socklen_t address_len)`
			* the parameter *socket* is a socket
				* if *socket* type SOCK_DGRAM
					* this call specifies the peer with which the socket is to be associated
						* this address is that to which datagrams are to be sent, and the only address from which datagrams are to be received
				* if *socket* type SOCK_STREAM
					* this call attempts to make a connection to another socket
						* the other socket is specified by *address* which is an address in the communication space of the socket
			* each communications space interprets the *address* parameter in its own way
				* generally stream sockets may successfully connect() only once
				* datagram sockets may use connect() multiple times to change their association
					* datagram sockets may dissolve the association by calling disconnect() or by connecting to an invalid address such as null address or an address with the address family set to AF_UNSPEC
			* return upon success a value of 0 is returned
			* return on error a value of -1 and set errno to indicate error


* how does send work in the context of sockets?

* how does recv work in the context of sockets?

* what is a fcntl call?

* what are async-signal safe operations?
	* `man 2 sigaction`

* what is the ping command and how does it work?
	* `man ping`

* af_unix is for placing sockets in the filesystem
































