# capture the flag

* what is are [code injection technique](https://en.wikipedia.org/wiki/Code_injection)?
	* the exploitation of a bug that is caused by processing invalid data
	* used by an attacker to inject code into a vulnerable computer program and change the course of the execution
	* these vulnerabilities occur when an application sends untrusted data to an interpreter
		* often found in SQL, LDAP, XPath, NoSQL queries, OS commands, XML parsers, SMTP headers, program arguments
	* injection flaws are easier to discover when examining source code than pen testing
		* scanners and fuzzers can help attackers find injection flaws

* what is an [sql injection](https://en.wikipedia.org/wiki/SQL_injection)?
	* a code injection technique used to attack data-driven applications
		* nefarious sql statements are inserted into an entry field for execution
	* must exploit a security vulnerability in an applications software
		* user input is incorrectly filtered for string literal escape characters embedded in sql statements
		* user input is not strongly typed and unexpectedly executed
	* allows attackers to
		* spoof identity
		* tamper with existing data
		* cause repudiation issues 
			* voiding transaction or changing balances 
			* complete disclosure of all data on the system 
			* destroy the data or make it otherwise unavailable 
			* become administrators of the db server

* what is a [cracker in the context of security](http://searchsecurity.techtarget.com/definition/cracker)?
	* someone who breaks into someone elses computer system often on a network
	* bypasses passwords or licenses in computer programs

* what is [port scanning](https://en.wikipedia.org/wiki/Port_scanner)?
	* an application designed to probe a server or host for open ports 
		* used by administrators to verify security policies of their networks 
		* used by attackers to identify network services running on a host and exploit vulnerabilities
	* portscan
		* sending clients requests to a range of server port addresses on a host
			* the goal is to find an active port
	* portsweep
		* scanning multiple hosts for a specific listening port
		* if you know the default port of particular services you can search for those in particular
	* basics of scanning
		* network services are referenced using two components
			* host address
			* port number
		* result of a scan on a port is usually generalized into three categories
			* open or accepted
				* host sent a reply indicating that a service is listening on the port
			* closed or denied or not listening
				* the host sent a reply indicating that connections will be denied to the port
			* filtered, dropped, or blocked
				* there was no reply from the host
		* open ports present two vulnerabilities of which administrators must be wary
			* security and stability concerns associated with the program responsible for delivering the services on open ports
			* security and stability concerns associated with the operating system that is running on the host whether open or closed
	* tcp scanning
		* use the operating systems network functions
	* syn scanning
		* the port scanner generates raw IP packets itself and monitors for responses 
			* "half-open scanning"
	* udp scanning
		* recieving system responds with a port unreachable message 
		* the absence of a response is infered that a port is open

* md5
	* a widely used hash function that produces a 128-bit hash value
	* designed to be used as a cryptographic hash function
		* suffers from extensive vulnerabilities
	* can be used as a checksum to verify data integrity
		* only against unintentional corruption
	* neither encryption nor encoding
		* can be reversed by brute-force attacks 
	* vulnerabilities
		* reversed by brute-force attacks
		* collision attack can find collisions
		* chosen-prefix collision attack

* SHA-256
	* a cryptographic hash function 
	* by comparing computed hashes to a known and expected hash value a person can determine the data integrity
	* collision resistance
		* nobody should be able to find different input values that result in the same hash output

* hashing in general


* what [session hijacking](https://en.wikipedia.org/wiki/Session_hijacking)?
	* also known as cookie hijacking
	* exploitation of a valid computer session to gain unauthorized access to information or services in a computer system
	* used to refer to the theft of a magic cookie used to authenticate a user to a remote server
	* popular methods
		* source-routed ip packets
			* allows attacker at point b on the network to participate in a conversation between A and C by encouraging the ip packets to pass through Bs machine





* what is [CRIME](https://en.wikipedia.org/wiki/CRIME_(security_exploit))?
	* security exploit against secret web cookies over connections using the https protocols that use data compression
	* when used to recover the content of secret authentication cookies
		* allows attackers to perform session hijacking on a authenticated web session 


* compression
	* reduces length

* bit shifting
* bit masking
* decompression
* reading source code

* brute force
	* an attacker trying many passwords with hope of eventually guessing correct 
		* attempts every possible alternative
	* can try to guess the key which is typically created from the password using a key derivation function
		* known as exhaustive key search

* [file system permissions and security](http://tldp.org/HOWTO/Security-HOWTO/file-security.html)
	
* phishing

* using [wireshark](http://www.howtogeek.com/104278/how-to-use-wireshark-to-capture-filter-and-inspect-packets/)
	* used to intercept packets
	

* javascript injection
	* [so](http://stackoverflow.com/questions/9987248/what-is-javascript-injection-and-how-it-could-be-use-in-software-testing)
	
* dictionary attacks
	* a technique for defeating a cipher or authentication mechanism by trying to determine its decryption key or passphrase by trying hundreds or sometimes millions of likely possibilities

* Cross Site Scripting
* Cross Site Request Forgery
* security misconfiguration
* binary logic
* reading technical documents
* filesystem (including hidden directories)
