# notes on smart cards


* what are [smart cards](https://en.wikipedia.org/wiki/Smart_card)?
	* also known as chip card, or integrated circuit card
	* any pocket-sized card that has embedded integrated circuits
		* can be contact or contactless or both
	* can provide
		* personal identification
		* authentication
		* data storage
		* application processing
	* smart cards may provide strong security authentication for single sign-on within organizations
	* history
		* invention
			* 1968
				* automated chip card patented
			* 1974
				* memory card concept patented
			* 1976
				* smart cards with microprocessor and memory patented
			* 2008
				* dexa systems spun off from schlumberger and acquired enterprise security services business
					* included the smart card solutions division responsible for deploying the first large scale public key infastructure based smart card management systems
		* telephone card
			* first mass use of cards for payment in french pay phones in 1983
		* bank card
			* microchips integrated into all french debit cards in 1992
		* sims
			* subscriber identity modules
			* sim cards in european phones since 1990s
		* EMV
			* the standard debit card system for most of the world
			* USA late to party in 2014
		* contactless systems	
			* are becoming popular for payment and ticketing 
	* design
		* smart cards have following characteristics
			* dimmensions similar to those of a credit card
			* contains tamper-resistant security system and provides security services
			* managed by an administration system which securely 
				* interchanges information and configuration settings with the card 			
				* controlling card blacklisting
				* application-data updates
			* communicates with external services via card-reading devices such as ticket readers

* what is [single sign-on or SSO](https://en.wikipedia.org/wiki/Single_sign-on)?
	* a property of access control of multiple related yet independent software systems
	* a user logs in with a single id and password to gain access to a connected system or systems wihtout using different usernames or passwords or in some configurations seamlessly sign on at each system
	* typically accomplished using 
		* LDAP
			* lightweight directory access protocol
		* and LDAP databases
	* basically single sign-on are systems where a single authentication provides access to multiple applications by passing the authentication token seamlessly to configured application

* what are [security tokens in the context of security and smart cards](https://en.wikipedia.org/wiki/Security_token)?
	* physical devices used to gain access to an electronically restricted resource
	* token is used in addition to or in place of a password
	* password types
		* all tokens contain some secret information that are used to prove identity
		* static password token	
			* the device contains a password which is physically hidden but which is transmitted for each authentication
				* vulnerable to replay attacks
		* synchronous dynamic password token
			* a timer is used to rotate through various combinations produced by a cryptographic algorithm 
				* the token and authentication server must have synchronized clocks
		* asynchronous password token
			* a one time password is generated without the use of a clock either from a one-time pad or cryptographic algorithm
		* challenge response token
			* using public key cryptography it is possible to prove possession of a private key without revealing that key
				* the authentication server encrypts a challenge with a public key
				* the device proves it possesses a copy of the matching private key by providing the decrypted challenge
	* one-time passwords
		* time-synchronized
			* time-synchronized one-time passwords change constantly at a set time interval 
			* to do this some sort of synchronization must exist between the clients token and the authentication server
			* for disconnected tokens this time synchronization is done before the token is distributed to the client
			* other token types do the synchronization when the token is inserted into an input device
			* biggest problem
				* they over time can become unsynchronized
				* some systems allow for re-synchronization
		* complex mathematical algorithm
			* uses things like hash chains to generate a series of one-time passwords from a secret shared key
			* each password is unguessable even with previous passwords are known
	* physical types
		* tokens can contain chips with functions varying from very simple to very complex
		* the simplest security tokens do not need any connection to a computer
			* physical display
			* authenticating user simply enters the displayed number to log in
			* other tokens connect to the computer using wireless techniques like bluetooth
		 * disconnected tokens
			* have neither a physical nor logical connection to the client computer
			* typically do not require a special input device 
				* usa built-in screen to display the generated authentication data which the user enters manually
			* the most common type of security token used in two-factor authentication for online identification
		* connected tokens
			* must be physically connected to the computer with which the user is authenticating
			* tokens automatically transmit the authentication information to the client computer once a physical connection is made
			* smart cards
				* many connected tokens use smart card technology 
				* smart cards are cheap and contain proven security mechanisms
				* computational performance of smart cards is often rather limited 
				* smart-card-based usb tokens 
					* contain a smart card chip inside provide the functionality of both usb tokens and smart cards
		* contactless tokens
			* form a logical connection to the client computer but do not require a physical connection 
			* they are more convenient
			* not as secure
			* battery life of 5-6 years
		* bluetooth tokens
			* another medium for a token
			* mid range contactless
		* NFC tokens
			* short range contactless
		* single sign-on software tokens
			* some SSO solutions use the token to store software that allows for seamless authentication and password filling
	* vulnerabilities
		* loss and theft
			* obviously if you lose your keys there is an issue
		* attacking
			* any system that allows users to authenticate via an untrusted network is vulnerable to man-in-the-middle attacks

* what is [FIPS 201](https://en.wikipedia.org/wiki/FIPS_201)?
	* federal information processing standard publication 201
	* a united states federal government standard that specifies PIV (personal identity verification) requirements for federal employees and contractors
		* developed to satisfy the technical requirements of HSPD-12 
	* FIPS 201 and NIST SP 800-78 are required for U.S. Federal Agencies but do not apply to US national security systems	



















































