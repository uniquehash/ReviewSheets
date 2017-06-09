# research and notes on the imap protocol




* [what is the imap protocol](https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol)?
	* short for internet message access protocol
	* an internet standard protocol used by e-mail clients to retrieve e-mail messages from a mail server over a tcp/ip connection
		* in other words it serves the same purpose as pop but has far more capabilities
	* designed to permit the complete management of an email box by multiple email clients
		* messages are left until explicitely deleted by user
	* imap typically listens on port number 143
		* over ssl port 993

* [why is it better than pop](https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol)?
	* connected and disconnected modes of operation
		* when using imap4 clients often stay connected as long as the user interface is active and download message content on demand
		* those with lots of data have a higher response time streaming rather than downloading
	* multiple clients simultaneously connected to the same mailbox
		* imap specifically allows simultaneous access by multiple clients and provides mechanisms for clients to detect changes made to the mailbox by other concurrently connected clients
	* access to MIME message parts and partial fetch
		* usually all internet e-mail is transmitted in MIME format 
			* allows messages to have a tree structure 
				* leaf nodes are any of a variety of single part content types and 
				* non-leaf nodes are any of a variety of multipart types
		* imap can
			* retrieve any of the individual MIME parts seperately
			* retrieve portions of either individual parts or the entire message
		* allows clients to retrieve the text portion without retrieving attached files or to stream content as it is being fetched
	* message state information
		* through the use of flags defined in the protocol clients can keep track of message state
			* read
			* replied to
			* deleted
		* flags are stored on the server
			* different clients accessing the same mailbox at different times can detect changes made by other clients
		* imap protocol supports both predefined system flags and client-defined keywords
	* multiple mailboxes on the server
		* clients can manipulate mailboxes on the server
			* create
			* rename
			* delete 
		* clients can copy messages between mailboxes
		* rudimentary access control with private and public mailboxes
	* server-side searches
		* provides a mechanism for a client to ask the server to search for messages meeting a variety of criteria
			* avoids downloading everything
	* built-in extension mechanism
		* reflecting the experience of earlier internet protocols imap defines an explicit mechanism by which it may be extended



