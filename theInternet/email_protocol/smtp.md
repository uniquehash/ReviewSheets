# research and notes on the smtp protocol


* what is the [smtp protocol](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol)?
	* Simple Mail Transfer Protocol
	* smtp is generally only used for sending messages to a mail server for relaying
		* communication between mail servers is on TCP port 25
		* mail clients usually submit outgoing emails to mail servers on port 587
			* deprecated port 465

* what are the [differences between an smtp server and an smtp relay](https://superuser.com/questions/1098413/whats-the-difference-between-smtp-server-and-smtp-relay)?
	* smtp server
		* generic term that refers to any server utilizing the smtp protocol
			* the server to which a mail client connects to to send mail
	* smtp relay
		* it ensures and properly distributes traffic to the appropriate place 







