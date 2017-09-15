# basics of crypto

* any intro resources into [understanding an overview and basic intro to cryptography](https://www.tutorialspoint.com/cryptography/index.htm)?
	* [origin](https://www.tutorialspoint.com/cryptography/origin_of_cryptography.htm)
		* humans have two inherit needs
			* communicate and share information
			* communicate selectively
		* cryptography
			* the art and science of concealing the messages to introduce secrecy in information security 
			* two greek words
				* krypto
					* hidden
				* graphene
					* writing
		* history
			* hieroglyph
				* oldest cryptographic technique
				* hieroglyph writing only known by select people
			* ciphers
				* caesar shift cipher
					* relies on shifting the letters of a message by an agreed number
					* recipient then shifts the letters back by the same number to obtain the original message
			* steganography
				* people not only want to protect the secrecy of information but also make sure unauthorized people have no evidence that the information exists	
					* invisible watermarking
				* this can be data encoded into an image 
		* evolution
			* vigenere coding
				* 15th century
				* offered moving letters in the message with a number of variable places instead of moving them the same number of places
			* enigma rotor machine
				* 20th century
				* mechanical and electromechanical machines 
				* provided more advanced and efficient means of coding information
			* WWII
				* cryptography and cryptoanalysis become excessively mathematical
	* [modern cryptography](https://www.tutorialspoint.com/cryptography/modern_cryptography.htm)
		* difference between classic cryptography and modern cryptography
			* classic
				* manipulates traditional characters like letters and digits
				* mainly based on security through obscurity
				* requires the entire cryptosystem for communicating confidentially
			* modern
				* operates on binary bit sequences
				* relies on publicly known mathematical algorithms
					* the attacker knowing how it works does not make it any less secure
				* requires parties interested in secure communication to possess the secret key only
		* context of cryptography
			* cryptology can be divided into two branches
				* cryptography
					* the art and science of making a cryptosystem that is capable of providing information security
					* deals with actual securing of digital data
					* refers to the design of mechanisms based on mathematical algorithms that provide fundamental information secruity services
				* cryptoanalysis
					* the art and science of breaking the cipher text
					* the study of cryptographic mechanisms with the intention to break thme
		* security services of cryptography
			* CIA triad and non-repudiation
				* confidentiality
					* ensures that only authorized entity have and had accessed the data
				* data integrity
					* ensures that the data is as originally intended and has not been modified by any unauthorized entity
				* authentication
					* ensures the identity of the originator
					* message authentication
						* identifies the originator of the message without any regard router or system that has sent the message
					* entity authentication
						* is assurance that data has been received from a specific entity, say a particular website
				* non-repudiation
					* an entity cannot refute the ownership of a previous commitment or an action
		* cryptography primitives
			* the tools and techniques in cryptography
				* encryption
					* confidentiality
				* hash functions
					* 50/50 integrity
				* (MAC) message authentication codes
					* integrity
					* authentication
					* 50/50 non-repudiation
				* digital signatures
					* integrity
					* authentication
					* non-repudiation
	* [cryptosystems](https://www.tutorialspoint.com/cryptography/cryptosystems.htm)
		* a cryptosystem is an implementation of cryptographic techniques and their accompanying infastructure to provide information security services
			* can also be referred to as a cipher system
		* simple model
			* ![simple cryptosystem](https://www.tutorialspoint.com/cryptography/images/cryptosystem.jpg "simple cryptosystem")
				* this simpe system shows a sender sending information to a receiver
					* even though it is intercepted because it is encrypted confidentiality is preserved
		* components of a cryptosystem
			* plaintext
				* the data to be protected during transmission
			* encryption algorithm
				* a mathematical process that produces a ciphertext for any given plaintext and encryption key
				* takes plain text as input and produces ciphertext as output
			* ciphertext
				* the scrambled version of the plaintext produced by the encryption algorithm using a specific encryption key
				* can be intercepted or compromised by anyone who has access to the communication channel with no consequences
			* decryption algorithm
				* a mathematical process that produces unique plaintext for any given ciphertext and decryption key
				* takes ciphertext and decryption key as input and produces plaintext as output
			* encryption key
				* a value that is known to the sender
				* sender inputs the encryption key into the encryption algorith along with plaintext to compute the ciphertext
			* decryption key
				* a value that is known to the receiver
				* reciever inputs the decryption key into the decryption algorithm along with the cipher text in order to compute the plaintext
			* key space
				* for a given cryptosystem a collection of all possible decryption keys
			* interceptor
				* also known as attacker
				* an unauthorized entity who attempts to determine the plaintext
				* he can see the ciphertext and may know the decryption algorith but without the decryption key can do nothing
		* types of cryptosystems
			* symmetric key encryption
				* the same keys are used for encrypting and decrypting 
				* secret key cryptosystems
					* a synonym for symmetric cryptosystems
				* symmetric cryptography
					* the study of symmetric cryptosystems
				* examples
					* DES
						* digital encryption standard		
					* 3DES	
						* triple-DES
					* IDEA
					* BLOWFISH
					* simple symmetric cryptosystem example
						* ![simple symmetric cryptosystem](https://www.tutorialspoint.com/cryptography/images/symmetric_key_encryption.jpg "simple symmetric cryptosystem")
				* history
					* prior to 1970 all cryptosystems employed symmetric key encryption
				* features of symmetric cryptosystems
					* entities using symmetric key encryption must share a common key prior to exchange of information
					* keys are recommended to be changed regularly to prevent any attack on the system
					* robust mechanism needs to exist to exchange the key between the communicating parties
					* in a group of n people
						* enabling two-party communication between any two people requires
							* n X (n - 1) / 2
					* length of key in bits of this encryption is smaller making the encryption-decryption process faster than asymmetric key encryption
					* processing power of computer system required to run symmetric algorithms is less
				* challenge of symmetric key cryptosystems
					* key establishment
						* before any communication can take place both the sender and receiver need to agree on a secret symmetric key
						* requires a secure key establishment mechanism in place
					* trust issue
						* since the sender and receiver us the same key there is an implicit requirement that the sender and receiver trust each other
					* these two challenges are extremely restraining for modern day communication
			* asymmetric key encryption
				* also called public key encryption
				* different keys are used for encrypting and decrypting information
				* simple asymmetric cryptosystem example
					* ![simple asymmetric cryptosystem](https://www.tutorialspoint.com/cryptography/images/asymmetric_key_encryption.jpg "simple asymmetric cryptosystem")
				* features of asymmetric cryptosystems
					* every user needs have a pair of mathematically related dissimilar keys
						* private key
							* used for decryption
							* well-guarded secret
						* public key
							* used for encryption
							* publicly available
					* though the public and private key are related it is computationally not feasible to find one from another
					* how it works
						* Host1 needs to send data to Host2 
						* Host1 obtains the public key of Host2
						* Host1 encrypts the plaintext  using Host2 public key and transmits it to Host2
						* Host2 uses private key to decrypt ciphertext into original plaintext
					* length of keys in bits are large
						* the process of encryption-decryption is slower than symmetric key encryption
					* processing power of computer system required to run asymmetric algorithm is higher
				* challenge of public key cryptosystems
					* the user needs to trust that the public key used in communication with an entity really is the public key of that entity 
					* PKI
						* public key infastructure
					* this trust is usually accomplished through a PKI consisting a trusted third party
						* third party securely manages and attests to the authenticity of public keys
						* third party satisfies itself about user identity by 
							* attestation
							* notarization
					* the most common method of making verified public keys available is to embed them in a certificate which is digitally signed by the trusted third party
		* kerckhoff principle for cryptosystems
			* 19th century cryptographer Kerckhoff declared the requirements for a good cryptosystem
				* everything should be secure even if everything about the system except the key is public knowledge
			* six design principles defined by Kerckhoff for cryptosystems
				* the cryptosystem should be unbreakable practically, if not mathematically
				* falling of the cryptosystem in the hands of an intruder should not lead to any compromise of the system preventing any inconvenience to the user
				* the key should be easily communicable, memorable, and changeable
				* the ciphertext should be transmissible by telegraph, an unsecure channel
				* the encryption apparatus and documents should be portable and operable by a single person					* it is necessary that the system be easy to use, requiring neither mental strain nor the knowledge of a long series of rules to observe
			* Kerckhoff principle
				* falling of the cryptosystem in the hands of an intruder should not lead to any compromise of the system preventing any inconvenience to the user	
					* all contemporary encryption algorithms employ this principle
	* [attacks on cryptosystems](https://www.tutorialspoint.com/cryptography/attacks_on_cryptosystems.htm)
		* attacks are typically categorized based on the action performed by the attacker
			* passive attacks
				* passive in nature
					* affect neither the information nor disrupt the communication channel
				* objective
					* gain unauthorized access to the information
				* often seen as stealing information
				* simple example
					* passive evesdropper
			* active attacks
				* changes the information in some way by conducting some process on the information
					* modifying the information in an unauthorized manner
					* initiating unintended or unauthorized transmission of information
					* alteration of authentication data such as originator name or timestamp associated with information
					* unauthorized deletion of data
					* denial of access to information for legitimate users (DOS)
			* assumptions of attacker
				* in order to break cryptosystems attackers must make a series of assumptions 
					* the attackers assumptions and knowledge about cryptosystem environment decide his capabilities
				* three assumptions are made about the security environment and the attackers capabilities
					* the encryption algorithm is known to the attacker
						* details of the encryption scheme
							* public algorithms
								* all the details of the algorithm are in public domain known to everyone
							* proprietary algorithms
								* the details of the algorithm are only known by the system designers and users
								* security is ensured through obscurity
								* generally not the strongest algorithms since they have not been ripped apart by the public domain
								* allow communication within closed groups only
						* Kerckhoff principle dictates that public algorithms are preferred 
					* the attacker has access to the ciphertext generated by the cryptosystem 
						* availability of ciphertext
							* once the plaintext is encrypted into ciphertext it is put through unsecure public channels for transmission
							* anyone and everyone has access to it
					* the attacker can gain access to plaintext and corresponding ciphertext
						* avilability of plaintext and cipertext
							* the attacker may gain access to plaintext and ciphertext by
								* influencing the sender to convert plaintext of his choice and obtain the ciphertext
								* receiver may divulge the plaintext to the attacker inadvertently
								* in public-key cryptosystems
									* encryption key is open domain and is known to any potential attacker 
									* attacker can generate pairs of corresponding plaintexts and ciphertexts
		* cryptographic attacks
			* objective of attacker
				* break cryptosystem and find the plaintext from the ciphertext
				* attacker must only need to find out the secret decryption key
				* once the attacker is able to determine the key the attacked system is considered broken or compromised
			* types of attacks on cryptosystems
				* COA
					* ciphertext only attacks
					* attacker has access to a set of ciphertexts
					* does not have access to corresponding plaintext
					* when corresponding plaintext can be determined from a given set of cipher text then the attack is successful
						* occasionally the encryption key can be determined from this attack
					* modern cryptosystems are guarded against ciphertext-only attacks
				* KPA
					* known plaintext attack
					* the attacker knows the plaintext for some parts of the ciphertext
					* must decrypt the rest of the ciphertext using this information
					* best example
						* linear cryptoanalysis against block ciphers
				* CPA
					* chosen plaintext attack
					* the attacker has the text of his choice encrypted
						* has the ciphertext-plaintext pair of his choice
					* this simplifies his task of determining the encryption key
					* best example
						* differential cryptoanalysis applied against block ciphers 
						* RSA is vulnerable to chosen-plaintext attacks
				* dictionary attack
					* involves compiling a dictionary
						* many variants
					* simplest example
						* attacker builds a dictionary of ciphertexts and corresponding plaintexts that he has learnt over a period of time
						* when an attacker gets the ciphertext he refers to the dictionary to find the corresponding plaintext
				* BFA
					* brute force attack
					* attacker tries to determine the key by attempting all possible keys						* if the key is 8 bits long
						* number of possible keys is 256
					* the attacker knows the ciphertext and the algorithm 
						* attempts all 256 keys one by one for decryption
						* large keys take forever to compute
				* birthday attack
					* a variant of the brute-force technique
					* used against cryptographic hash functions
					* if the attacker is able to find two different inputs that give the same hash value and thus a collision that hash function is determined to be broken
				* MIM
					* man in the middle attack
					* targets of this attack are mostly public key cryptosystems
						* HostA wants to communicate to HostB and requests public key of HostB
						* an attacker intercepts this request and sends his public key instead
						* thus whatever HostA sends to HostB the attacker is able to read
						* in order to maintain communication the attacker re-encrypts the data after reading with his public key and sends to HostB
						* the attacker sends his public key as HostA public key so that HostB takes it as if it is taking it from HostA
				* SCA
					* side channel attack
					* not against any particular type of cryptosystem or algorithm
						* launched to exploit the weakness in physical implementation of the cryptosystem
				* timing attacks
					* exploit the fact that different computations take different times to compute on processor
					* by measuring such timings it is possible to know about a particular computation the processor is carrying out
					* example
						* if the encryption takes a longer time it indicates that the secret key is long
				* power analysis attacks
					* uses the amount of power that a cryptosystem consumes to obtain information about the nature of the underlying computations
				* fault analysis attacks
					* errors are induced in the cryptosystem and the attacker studies the resulting output for useful information
			* practicality of attacks
				* most of the attacks above are highly academic and must are practically difficult for an attacker to pull off
	* [traditional ciphers](https://www.tutorialspoint.com/cryptography/traditional_ciphers.htm)
		* earlier cryptographic systems
	
























































	* [public key infastructure](https://www.tutorialspoint.com/cryptography/public_key_infrastructure.htm)
		* the most distinct feature of public key infastructure is that it uses a pair of keys to achieve the underlying secruity services
			* private key
			* public key
		* since public keys are in open domain they are likely to be abused
			* it is necessary to establish and maintain some kind of trusted infrastructure to manage these keys
		* key management
			* cryptographic schemes are often compromised through poor key management
			* important aspects of key management
				* cryptographic keys are nothing but special pieces of data
					* key management refers to the secure administration of cryptographic keys
				* key management deals with entire key lifecycle
					* key lifecycle
						* ![key lifecycle](https://www.tutorialspoint.com/cryptography/images/key_management_life_cycle.jpg "key lifecycle")
						* key generation
						* key establishment
						* key storage
						* key usage
						* key archival
						* key destruction
				* there are two specific requirements of key management for public key cryptography
					* secrecy of private keys
						* throughout the key lifecycle secret keys must remain secret from all parties except those who are owner and are authorized to use them
					* assurance of public keys
						* the public keys are in open domain
						* by default there is no assurances of whether a public key
							* is correct
							* with whom it can be associated
							* what it can be used for
						* key management of public keys needs to focus much more explicitely on assurance of purpose of public keys
						* can be achieved through the public-key infrastructure 
							* a key management system for supporting public-key cryptography
		* PKI
			* public key infrastructure
			* provides assurance of public key
			* provides the identification of public keys and their distribution
			* an anatomy of PKI comprises of the following components
				* Public Key Certificate
					* also known as digital certificate
				* private key tokens
				* certification authority
				* registration authority
				* certificate management system
		* digital certificate
			* a certificate can be considered as the ID cards
			* they are issued to people, computers, software packages, or anything else that needs to prove their identity in the electronic world
			* digital certificates are based on the ITU standard X.509 which defines a standard certificate format for public key certificates and certification validation 
				* digital certificates are also known as X.509 certificates
				* public key pertaining to the user client is stored in digital certificates by the Certification Authority along with other relevant information 
					* client information
					* expiration date
					* usage
					* issuer
					* ect..
			* Certificate Authority digitally signs this entire information and includes digital signature in the certificate 
			* anyone who needs assurance about the public key and associated information of client can carry out the signature validation process using Certificate Authority public key
				* successful validation assures that the public key given in the certificate belongs to the person whose details are given in the certificate
			* process of obtaining Digital Certificate by an entity
				* ![obtain digital certificate](https://www.tutorialspoint.com/cryptography/images/digital_certificate.jpg "obtain digital certificate")
					* client generates a key pair
						* keeps the private key safe
					* submit a certificate signing request to the certificate authority
						* provides the public key and identity information that authenticates the clients identity
					* the certificate authority issues a X.509 or digital certificate to the client
					* the client now has a digital certificate
		* CA
			* Certifying Authority
			* the CA issues certificates to a client and assist other users to verify the certificate
				* takes responsibility for identifying correctly the identity of the client asking for a certificate to be issued
				* ensures that the information contained within the certificate is correct and digitally signs it
			* key functions of CA
				* generating key pairs
					* CA may generate a key pair jointly or independently with the client
				* issuing digital certificates
					* the CA could be thought of as the PKI equivalent of a passport agency
					* CA issues a certificate after client provides the credentials to confirm his identity
					* CA signs the certificate to prevent modification of the details contained in the certificate
				* publishing certificates
					* CA need to publish certificates so that users can find them
					* two ways to achieve this
						* publish certificates in the equivalent of an electronic telephone directory
						* send your certificate out to those people you think might need it by one means or another
				* verifying certificates
					* CA makes it public key available in environment to assist verfication of its signature on clients digital certificate
				* revocation of certificates
					* at times CA revokes the certificate issued due to some reason such as compromise of private key by user or loss of trust in client
					* after revocation CA maintains the list of all revoked certificates taht are available to the environment
			* classes of certificates
				* class 1
					* can easily be acquired by supplying an email address
				* class 2
					* require additional personal information to be supplied
				* class 3
					* can onlu be purchased after checks have been made about the requestos identity
				* class 4
					* they may be used by goverments and financial organizations needing very high levels of trust
			* RA
				* registration authority
				* CA may use a third-party registration authority (RA) to perform necessary checks on the person or company requesting the certificate to confirm their idenity
				* the RA may appear to the client as a CA but they do not actually sign the certificate that is issued
			* CMS
				* certificate management system
				* it is the management system through which certificates are 
					* published
					* temporarily or permanently suspended	
					* renewed
					* revoked
				* certificate management systems do not normally delete certificates because it may be necessary to prove their status at a point in time
				* a CA along with associated RA runs certificate mangement systems to be able to track their responsibilities and liabilities
			* private key tokens
				* while the public key of a client is stored on the certificate
				* the associated private key can be stored on the key owners computer
					* generally not adopted 
					* if attacker gains access to the computer they can easily gain access to private key
				* private key is stored on secure removable storage token access to which is protected through a password
				* different vendors use different and sometimes proprietary storage formats for storking keys
					* entrust
						* proprietary .epf format
					* verisign, globalsign, baltimore
						* standard .p12 format
		* hierarchy of CA
			* there are many CA and they have their own organization methodology
				* allows public key certificates to be used in environmnets where two communicating parties do not have trust relationships with the same CA
			* hierarchy certification model
				* root CA is at the top of the CA hierarchy and the root CA certificate is a self-signed certificate
				* the CAs which are directly surbordinate to the root CA have CA certificates that are signed by the root CA
				* the CAs under the subordinate CAs in the hierarchy have their CA certificates signed by the higher-level subordinate CAs
			* certificate chains 
				* traces a path of certificates from a branch in the hierarchy to the root of the hierarchy
			* verifying a certificate chain 
				* the process of ensuring that a specific certificate chain is 
					* valid
					* correctly signed
					* trustworthy
				* procedure
					* a client whose authenticity is being verified supplies his certificate
						* along with the chain of certificates up to root CA
					* verifier takes the certificate and validates by using public key of issuer
						* issuers public key is found in the issuers certificate which is in the chain next to clients certificate
					* now if the higher CA who has signed the issuers certificate is trusted by the verifier 	
						* verification is successful and stops 
					* else the issuers certificate is verified in a similar manner as done for the client above
						* process continues till either trusted CA is found in between or else continues till root CA	






















































* what is [(PKI) public key infastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure)?
	* public key infastructure
		* a set of roles, policies, and procedures needed for digital certificates and public-key encryption
			* create
			* manage
			* distribute
			* use
			* store
			* revoke
		* facilitates the secure electronic transfer of information for a range of network activities
			* e-commerce
			* internet banking
			* confidential email
		* required for activities where simple passwords are inadequate authentication method and more rigorous proof is required to confirm the identity of the parties involved in the communication and to validate the information being transfered
	* cryptography
		* an arrangement that binds public keys with respective identities of entities
			* people or organizations
		* binding is established through a process of registration and issuance of certificates at and by a CA (certificate authority)
			* depending on the assurance level of the binding this may be carried out by an automated process or under human supervision
	* RA
		* registration authority
		* the PKI role that assures valid and correct registration 
		* responsible for accepting requests for digital certificates and authenticating the entity making the request
		* Microsoft PKI
			* RA are called subordinate CA
	* VA
		* validation authority
		* an entity must be uniquely identifiable within each CA domain on the basis of information about that entity
			* VAs can provide this entity information on behalf of the CA
	* design
		* PKI consists
			* CA (Certificate Authority) 
				* stores, issues, and signs digital certificates
			* RA (Registration Authority)
				* verifies the identity of entities requesting their digital certificates to be stores at the CA
			* CD (Central Directory)
				* secure location to which to store and index keys
			* CMS (Certificate Management System)
				* managing things like access to stored certificates or the delivery of the certificates to be issued
			* CP (Certificate Policy)
	* methods of certification
		* there have been three approaches to verify that a particular public key belongs to a certain entity
		* CA (Certificate Authorities)
			* the primary role of the CA is to digitally sign and publish the public key bound to a given user using the private key of the CA
			* issuer market share
				* in this model of trust relationships CA is a trusted third party
				* Symantec, Comodo, GoDaddy account for three-quarters of all issued TLS certificates
			* temporary certificates and single sign-on
				* involves a server that acts as an offline certificate authority within a single sign-on system
					* single sign-on server will issue digital certificates into the client system but never stores them
					* users can execute programs, ect... with the temporary certificate 
					* common to find this solution variety with X.509-based certificates
		* web of trust
			* uses self-signed certificates and third party attestations of those certificates
			* examples
				* PGP (Pretty Good Privacy)
				* GnuPG
			* benefits
				* can interoperate with a PKI CA fully trusted by all parties in a domain that willing to guarantee certificates as a trusted introducer
				* tursting one certificate is granting trust to all certificates in that web
			* creators own words (Phil Zimmermann)
				* as time goes on, you will accumulate keys from other people that you may want to designate as trusted introducers
				* everyone else will each choose their own trusted introducers
				* and everyone will gradually accumulate and distribute with their key a collection of certifying signatures from other people, with the exception that anyone receiving it will trust a least one or two of the signatures 
				* this will cause the emergence of a decentralized fault-tolerant web of confidence for all public keys
		* SPKI (Simple Public Key Infastructure)
			* does not deal with authentication of public key information 
			* grew out of the efforts to overcome the complexities of X.509 and PGP web of trust 
			* does not associate users with persons since the key is what is trusted rather than the person
			* does not use any notion of trust as the verifier is also the issuer
		* blockchain-based PKI
			* Emercoin 
				* a blockchain-based cryptocurrency that supports the storage of different public key types and provides open source software that directly supports PKI for OpenSSH servers		
	* uses
		* encryption and/or sender authentication of email messages
			* OpenPGP, S/MIME
		* encryption and/or authentication of documents 
			* XML signature, or XML encryption standards if documents are encoded as XML
		* authentication of users to applications
			* smart card logon, client authentication with SSL
		* bootstrapping secure communication protocols 
			* IKE (Internet Key Exchange)
			* SSL
		* mobile signatures
			* electronic signatures that are created using a mobile device and rely on a signature or certifiation service in a location independent telecommunication environment
		* IoT
			* require secure communication between mutually trusted devices 
	* open source implementations
		* OpenSSL
			* the simplest form of CA and tool for PKI
			* toolkit in C that is included in all major Linux distro
			* used to build your own CA and to PKI-enable applications
		* EJBCA
			* full featured enterprise grade CA implementation developed in Java
			* can be used to set up a CA both for internal use and as a service
		* OpenCA
			* is a full featured CA implementation using a number of different tools
			* OpenCA uses OpenSSL for the underlying PKI operations
		* XCA
			* a graphical interface and database
			* uses OpenSSL for the underlying PKI operations
		* XiPKI
			* CA and OCSP responder
			* with SHA3 support 
			* OSGi-based 
		* IoT_pki
			* a simple PKI built using the python cryptography library
	* criticism
		* purchasing certificates for securing websites by SSL and securing software by code signing is a costly venture for small businesses
		* Lets Encrypt
			* free CA
		* major browsers will support HTTP/2 only over a PKI secured TLS connection
		* goverments can force certificate providers to give their root certificate keys 
			* goverment can now perform man-in-the-middle attack

* what is the [DISA (Defense Information System Agency)](https://en.wikipedia.org/wiki/Defense_Information_Systems_Agency)?
	* Defense Information System Agency
		* a united states department of defense combat support agency composed of military, federal civilians, and contractors
		* provides IT and communication support to the president, vice president, secretary of defense, the military services, the combatant commands, and any individual or system contributing to the defense of the united states
	* mission statement
		* DISA provides, operates, and assures command and control, information sharing capabilities, and a globally accessible enterprise information infastructure in direct support to joint warfighters, national level leaders, and other mission and coalition partners across the full spectrum of operations
	* DISA vision
		* information superiority in defense of our nation
	* services
		* C2 (Command and Control)
			* provides military commanders with the information to make effective decisions and provide the warfighter the capability to access the information necessary to complete their mission
		
* what is the [CAC (Common Access Card)](https://en.wikipedia.org/wiki/Common_Access_Card)?
	* Common Access Card
		* a smart card about the size of a credit card
		* the standard identification for Active Duty United States Defense personnel including
			* Selected Reserve
			* National Guard
			* United States Department of Defense civilian employees
			* United States Coast Guard civilian employees
			* eligible DoD and USCG contractor personnel
		* the principle card used to enable physical access to buildings and controlled spaces
			* provides access to defense computer networks and systems
	* serves as an identification card under the Geneva Conventions
	* CAC is a controlled item
		* 2008 
			* DoD issued 17 million smart cards
			* 3.5 million active CACs in circulation
		* DoD has deployed an issuance infrastructure at over 1000 sites in more than 25 countries around the world and is rolling out more than one million card readers and associated middleware
	* common problems
		* ICC is fragile and regular wear can make the card unusable
		
* what is [SPKI (Simple Public Key Infrastructure)](https://en.wikipedia.org/wiki/Simple_public-key_infrastructure)?
	* an attempt to overcome the complexity of tradition X.509 public key infrastructure
	* not used
	* specification defined an authorization certificate format, providing for the delineation of privileges, rights or other such attributes and binding them to a public key
	* merged with SDSI (Simple Distributed Security Infastructure)
	* history and overview
		* SPKI 
			* identified principals only as public keys but allowed binding authorizations to those keys and delegation of authorization from one key to another
		* SDSI 
			* bound local names to public keys but carried authorization only in Access Control Lists and did not allow for delegation of subsets of a principals authorization 
		* combined SPKI/SDSI
			* allows the naming of principals
			* creation of named groups of principals
			* delegation of rights or other attributes from one principle to another
			* includes a language for expression of authorization
				* includes a definition of intersection of authorizations
			* threshold subject
				* grants authorizations or delegations only when K of N of the listed subjects concur in a request for access or a delegation of rights
			* uses S-expression encoding but specifies a binary form that is extremely easy to parse 
				* an LR(0) grammar called Canonical S-expressions
			* does not define a role for a commercial CA
				* commercial CA serve no useful purpose
			* deployed primarily in closed solutions and in demonstration projects of academic interest
			* difficult to monetize SPKI/SFSI by itself

* what is a [(VA) validation authority](https://en.wikipedia.org/wiki/Validation_authority)?
	* an entity that provides a service used to verify the validity of a digital certificate per the mechanisms described in the X.509 standard and RFC 5280
	* methods
		* host a certification revocation list for download via the HTTP or LDAP protocols 
		* use the OCSP protocol
	* VA is capable of responding to a network-based request for a CRL it lacks the ability to issue or revoke certificates
		* must be continuously update with current CRL information from a CA with issued the certificates contained within the CRL
	* a dedicated validation authority allows for dynamic validation of certificates issued by an offline root certificate authority
		* the root CA itself will be unavailable to network traffic
		* certificates issued by it can always be verified via the validation authority and the protocols mentioned above

* what is an [offline root certificate authority](https://en.wikipedia.org/wiki/Offline_root_certificate_authority)?
	* a CA which has been isolated from network access
		* often kept in a powered-down state
	* in PKI the chain of trusted authorities begins with the root CA
		* once the root CA is installed and its root certificate is created subordinate CAs can be created 
	* the consequences of a compromised root CA are so great that all CAs must be kept safe from unauthorized access
		* common method is to keep the root CA in an offline state
		* only brought online when needed for specific infrequent tasks
	* since it is offline it must use a VA

* what is a [(CRL) certification revocation list](https://en.wikipedia.org/wiki/Certificate_revocation_list)?
	* certification revocation list
		* a list containing revoked certificates
	* revocation states
		* revoked
			* a certificate is irreversibly revoked
			* if
				* it is discovered that the CA had improperly issued a certificate
				* private key is thought to have been compromised
					* this is the most common reason
				* failure of identified entity to adhere to policy requirements
		* hold
			* reversible status used to note the temporary invalidity of the certificate
			* if reinstated the certificate is removed from future CRLs
	* reasons for revocation according to RFC 5280
		* unspecified - 0
		* keyCompromise - 1
		* CACompromise - 2
		* affiliation Changed - 3
		* superseded - 4
		* cessationOfOperation - 5
		* certificateHold - 6
		* removeFromCRL - 8
		* privilegeWithdrawn - 9
		* AACompromise - 10
	* publishing revocation lists
		* CRLs are generated and published periodically
			* often at a defined interval
			* can also publish immediately after a certificate has been revoked
			* always issued by the CA which issues the corresponding certificates
		* CRLs have a lifetime during which they are valid
			* often 24 hours or less
		* to prevent spoofing or DOS attacks
			* CRL usually carry a digital signature associated with the CA by which they are published 
			* to validate a specific CRL prior to relying on it the certificate of its corresponding CA is needed
	* revocation vs. expiration
		* expiration dates are not a substitute for a CRL
		* CRL and other certificate validation techniques are a necessary part of any properly operated PKI
			* mistakes in certificate vetting and key management are expected to occur in real world operations
	* problem with CRLs
		* best practices require that whenever and however certificate status is maintained it must be checked whenever one wants to rely on a certificate
		* to use a PKI effectively one must have access to current CRLs
			* requirement of on-line validation negates one of the original major advantages of PKI over symmetric cryptography protocols
				* no longer self-authenticating
				* symmetric systems such as kerberos also depend on the existence of on-line services
					* for kerberos a key distribution center is necessary
		* the existence of CRL implies the need for some entity to enforce policy and revoke certificates deemed counter to operational policy
			* mistakenly revoked certificates pose a significant problem
			* CA is tasked with enforcing the operational policy for issuing certificates 
				* typically are responsible for determining if and when revocation is appropriate by interpreting the operational policy
		* necessity of consulting a CRL prior to accepting a certificate raises a potential DOS attack against PKI
			* if acceptance of a certificate fails in the absence of an available calid CRL then no operations depending upon certificate acceptance can take place
			* workarounds have been found, no silver bullet
		* OCSP
			* online certificate status protocol
			* alternative to using CRLs for certificate validation
			* requires less network bandwidth
				* enables real-time and near real-time status checks for high volume or high value operations
		* authority revocation lists
			* a form of CRL containing certificates issued to CAs 

* what is a [(KDC) key distribution center](https://en.wikipedia.org/wiki/Key_distribution_center)?
	* key distribution center
		* part of a cryptosystem intended to reduce risks inherent in exchanging keys
	* often operate in systems within which some users may have permission to use certain services at some times and not at others
	* mostly operate with symmetric encryption
		* in most cases the KDC shares a key with each of all the other parties
	* operation
		* typical flow
			* request from a user to use some service
			* cryptographic technique is used to authenticate requesting users as themselves
			* check whether an individual user has the right to access the service requested
			* if authenticated user meets all prescribed conditions
				* KDC can issue a ticket permitting access
		* ticket mechanism
			* produces a ticket based on a server key
			* client receives the ticket and submits it to the appropriate server
			* server can verity the submitted ticket and grant access to user submitting it
	* systems using KDC
		* kerberos

* what is [(OCSP) Online Certificate Status Protocol](https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol)?
	* Online Certificate Status Protocol
		* an internet protocol used for obtaining the revocation status of an X.509 digital certificate
		* on the internet standards track
		* built to address certain problems associated with CRL as a PKI certification validation technique
	* messages communicated are encoded in ASN 1 over HTTP
	* OCSP servers are termed
		* OCSP responders
	* comparison to CRLs
		* OCSP responses contains less information than a typical CRL it puts less burden on network and client resources
		* OCSP response has less data to parse making client-side libraries that handle it less complex than those that handle CRLs
		* OCSP discloses to the responder that a particular network host used a particular certificate at a particular time
			* does not mandate encryption
			* other parties may intercept this information
	* basic KPI implementation
		* Alice and Bob have public key certificates issued by Carol, the CA
		* Alice wishes to perform a transaction with Bob and sends him her public key certificate
		* Bob is concerned that Alice may have a compromised private key
			* creates an OCSP request that contains the certificate serial number provided by Alice
			* sends the request to Carol
		* Carol has an OCSP responder ready to receive information
			* responder reads the certificate serial number from the request Bob sent
			* responder uses the certificate serial number to look up the revocation status of the certificate assigned to Alice
			* responder looks in a CA database maintained by Carol
				* in this example the CA database maintained by Carol is the only trusted location where a compromise to the certificate assigned to Alice would be recorded
			* responders determines that the certificate assigned to Alice is still OK
			* responders sends to Bob a signed successful OCSP response
		* Bob cryptographically verifies the signed response sent by Carol
			* Bob had stored the public key assigned to Carol before this transaction
			* Bob uses that public key to verify the response received from Carol
		* Bob completes the transaction with Alice
	* protocol details
		* responder may return a signed response signifying that the certificate specified in the request is
			* good
			* revoked
			* unknown
			* may return error if request cannot be processed
		* request format supports additional extensions
			* enabling customization to particular PKI schemes
		* vulnerable to replay attacks
			* signed good response is captured by a malicious intermediary and replayed to the client at a later date after the subject certificate may have been revoked
		* can support more than one level of CA
			* requests may be chained between peer responders to query the issuing CA appropriate for the subject certificate with responders validating each responce against the root CA using their own OCSP requests
		* responder may be queried for revocation information by (DPV) delegated path validation servers
			* OCSP does not perform any DPV of supplied certificates natively
	* critisims
		* OCSP-based revocation is not an effective technique to mitigate against the compromise of the private key of an HTTPS server 
			* attacker typically needs to be in a man-in-the-middle position on the network to abuse the private key and impersonate a server
			* attacker in this position is typically also in a position to interfere with the OCSP queries of the client	
			* most clients will silently ignore OCSP if the query times out making OCSP not a reliable means of mitigating HTTPS server key compromise
			* MustStaple TLS extension in a certificate can requires that the certificate be verified by a stapled OCSP response mitigating this problem
		* valid defense against sittuations where the attacker is not a man-in-the-middle

* what is [(DPV) Delegated Path Validation](https://en.wikipedia.org/wiki/Delegated_Path_Validation)?
	* a method of offloading to a trusted server the work involved in validating a public key certificate
	* combining certificate information supplied by the DPV client with two elements a DPV server is able to apply complex validation policies that are prohibitive for each client to perform
		* certificate path 
		* revocation status information obtained by itself 

* what is [OCSP stapling](https://en.wikipedia.org/wiki/OCSP_stapling)?
	* formally known as the TLS certificate status request extension
	* an alternative approach for checking the revocation status of X.509 digital certificates
	* allows presenter of a certificate to bear the resource cost involved in providing OCSP responses by appending a time-stamped OCSP response signed by the CA to the initial TLS handshake
		* eliminated the need for clients to contact the CA
	* motivation
		* addresses most issues with the original OCSP implementation
			* original introduced significant cost for the CA because it requires them to provide a response to every client of a given certificate in real time
			* OCSP checking potentially impairs users privacy and slows down browsing since it requires the client to contact a third party to confirm the validity of each certificate that it encounters
			* if the client fails to connect to the CA for an OCSP response it is forced to decide between two options
				* connect anyway
				* terminate the connection based on the assumption that there is an attack
	* solution
		* resolves the problems in a fashion reminiscent of the Kerberos ticket
		* certificate holder queries OCSP responder themselves at regular intervals optaining a signed time-stamped OCSP response
			* visitors of the site attempt to connect to the site this response is included with the TLS/SSL handshake via the Certificate Status Request extension response
		* if the client does not receive a stapled response it will just contact the OCSP responder by itself
		* if the client receives an invalid stapled response it will abort the connection
		* only increased risk of OCSP stapling is that the notification of revocation for a certificate may be delayed until the last-signed OCSP response expires
	
* what is a [web of trust](https://en.wikipedia.org/wiki/Web_of_trust)?
	* a concept used in PGP, GnuPG, and other OpenPGP compatible systems to establish the authenticity of the binding between a public key and its owner
	* decentralized trust model
		* there are many independent webs of trust and any user can be a part of and a link between multiple webs
	* operation of a web of trust
		* OpenPGP identity certificates can be digitally signed by other users who, by that act, endorse the association of that public key with the person or entity listed in the certificate 
		* commonly done at key signing parties
		* vote counting scheme which can be used to determine which public key - owner association a user will trust while using PGP
			* example	
				* trust the association if 
					* three partially trusted endorsers have vouched for a certificate
					* one fully trusted endorser has done so 
			* these parameters are user-adjustable and can be completely bypassed if desired
	* problems
		* losing keys
			* users who lose track of a private key can no longer decrypt messages sent to them produced using the matching public key found in the certificate
		* breaking into the web is hard
			* new users will not be readily trusted and will take to time to earn that trust
		* network starvation
			* is is possible to not be able to find people to endorse you
		* vulnerable to 3rd-party middle-man attack
	* mean shortest distance
		* a mathamatical way to determine how strongly trusted a key is in the web of trust

* what is a [key signing party](https://en.wikipedia.org/wiki/Key_signing_party)?
	* an event at which people present their public keys to other in person who if they are confident the key actually belongs to the person who claims it digitally sign the certificate containing that public key and the person name 
	* common within the PGP and GnuPG community
		* PGP public key infastructure does not depend on a central key certifying authority
	* the event generally does not involve computers 
		* attack opportunity
		* participants write down their public key finger print
	* participants exchange these fingerprints as they verify each others identification then after the party they obtain the public keys corresponding to the fingerprints they received and digitally sign them

* what is a [public key fingerprint](https://en.wikipedia.org/wiki/Public_key_fingerprint)?
	* a short sequence of bytes used to identify a longer public key
	* created by applying a cryptographic hash function to a public key
	* since fingerprints are shorter than the keys they refer to they can be used to simplify certain key management tasks

* what is a [digital signature](https://en.wikipedia.org/wiki/Digital_signature)?
	* a mathematical scheme for demonstrating the authenticity of digital messages or documents 
	* a valid digital signature 
		* give a recipient reason to believe that the message was created by a known sender
		* that the sender cannot deny having sent the message
		* that the message was not altered in transit
	* standard element of most cryptograoghic protocol suites
	* digital signatures employ asymmetric cryptography
		* provide a layer of validation and security to messages sent through non-secure channel
	* definition of digital signature
		* an authentication mechanism that enables the creator of the message to attach a code that acts as a signature
		* schemes typically consists of 3 algorithms
			* key generation algorithm 
				* selects a private key uniformly at random from a set of possible private keys
				* outputs the private key and a corresponding public key
			* signing algorithm 
				* given a message and a private key
				* produces a signature
			* signature verifying algorithm 
				* given the message, public key and signature
				* either accepts or rejects the claim to authority of the message
		* two requires properties
			* authenticity of a signature generated from a fized message and a fixed private key can be verified by using the corresponding public key
			* should be computationally infeasible to generate a valid signature for a party wihtout knowing the private key of that party
		* DSA (Digital Signature Algorithm)
			* developed by NIST
			* an example of a signing algorithm
	* notions of security
		* hiearchy of attack models agains digital signatures
			* key-only attack
				* attacker is only given the public verification key
			* known message attack
				* the attacker is given valid signatures for a variety of messages known by the attacker but not chosen by the attacker
			* adaptive chosen message attack
				* the attacker first learns signatures on arbitrary messages of the attackers choice
		* hierarchy of attack results
			* total break
				* results in recovery of the signing key	
			* universal forgery attack
				* results in the ability to forge signatures for any message
			* selective forgery attack
				* results in a signture on a message chosen by  the adversary
			* existential forgery attack
				* results in some valid message/signature pair not already known to the adversary
	* additional security precautions
		* putting the private key on a smart card
			* all asymmetric cryptosystems depend entirely on keeping the private key secret
			* private key can be stored on a users computer and protected by a local password
				* disadvantages
					* user can only sign documents on that particular computer
					* security of the private key depends entirely on the security of the computer
			* storing the private key on a smart card is more secure
				* designed to be tamper-resistant
				* typically smart cards must be activated using a PIN before use
				* it can be arranged such that the private key never leaves the smart card
					* if stolen the theif will need the PIN code to generate a digital signature
			* private keys if generated and stored on smart cards are regarded as difficult to copy and are assumed to exist in exactly one copy
		* smart card readers with a separate keyboard
			* entering a PIN code to activate the smart card commonly requires a numeric keypas
			* some card readers have their own keyboard which is safer than using a pc integrated solution
	* digital signature algorithms
		* RSA-PSS
			* RSA based signature schemes
		* DCA and ECDSA	
			* ECDSA is elliptic curve
		* Edwards-curve Digital Signature Algorithm
		* ElGamal signature scheme
			* predecessor to DSA
		* Rabin signature algorithm
		* BLS
			* Pairing based schemes
		* Undeniable signatures
		* Aggregate signature
			* a signature scheme that supports aggregation
				* given N signatures on N messages from N user
				* aggregate all these signatures into a single signature whose size is constant in the number of users
				* this single signature will convince the verifier that the N users did indeed sign the N original messages
		* signatures with efficient protocols
			* signatures schemes that facilitate efficient cryptographic protocols 
				* zero-knowledge proofs
				* secure computation
	* industry standards
		* some industries have tougher standards than others
			* automobile industry
				* automotive network exchange
			* healthcare industry
				* SAFE-BioPharma Association

* what is [TLS (Transport Layer Security)](https://en.wikipedia.org/wiki/Transport_Layer_Security)?
	* Transport Layer Security
		* successor of SSL (Secure Sockets Layer)
		* both are referred to as SSL in common vernacular
	* cryptographic protocols that provide communications security over a computer network
	* widespread use in applications
		* web browsing
		* email
		* internet faxing
		* instant messaging
		* voice-over-IP
	* websites are able to use TLS to secure all communications between their servers and web browsers
	* aims to provide privacy and data integrity between two communicating computer applications 
		* when secured by TLS connections between a client and a server have one or more of the following properties
			* the connection is private / secure because symmetric cryptography is used to encrypt the data transmitted
				* keys for this symmetric encryption are generated uniquely for each connection and are based on a shared secret negotiated at the start of the session
				* the server and client negotiate the details of which encryption algorithm and cryptographic keys to use before the first byte of data is transmitted
				* the negotiation of a shared secret is both secure and reliable
			* identity of the communicating parties can be authenticated using public-key cryptography
				* authentication can be made optional but is generally required for at least one of the parties
			* connection ensures integrity because each message transmitted includes a message integrity check using a message authentication code to prevent undetected loss or alteration of the data during transmission
		* careful configuration of TLS can provide additional privacy-related properties
			* forward secrecy
				* ensures that any future disclosure of encryption keys cannot be used to decrypt any TLS communciations recorded in the past
		* supports many different methods for
			* exchanging keys
			* encrypting data
			* authenticating message integrity
		* two layers
			* TLS record protocol
			* TLS handshake protocol
		* description
			* client-server applications use the TLS protocol to communicate across a network in a way designed to prevent eavesdropping and tampering
			* client must indicate to the server the setup of a TLS connection
				* use a different port number for TLS connections
					* HTTPS - 443
				* client can make protocol-specific request to the server to switch the connection to TLS
			* once client and server have agreed to use TLS they negotiate a stateful connection by using a handshaking procedure
				* handshake with an asymmetric cipher to establish not only cipher settings but also a session-specific shared key with which further communication is encrypted using a symmetric cipher
				* client and server agree on various parameters used to establish the connections security
					* handshake begins when a client connects to a TLS-enabled server requesting a secure connection
						* client presents a list of supported cipher suites
							* ciphers and hash functions
					* server picks a cipher and hash function that is also supports and notifies the client of the decision
					* server usually then sends back its identification in the form of a digital certificate
						* certificate contains
							* server name
							* CA vouching for authenticity of the certificate
							* servers public encryption key
					* the client confirms the validity of the certificate before proceeding
					* to generate session keys used for the secure connection the client either
						* encrypts a random number with the servers public key and sends the result to the server
							* both parties use that random number to generate a unique session key for subsequent encryption and decryption of data during the session
						* uses Diffie-Hellman key exchange to securely generate a random and unique session key for encryption and decryption that has the additional property of forward secrecy
							* if server private key is disclosed in the future it cannot be used to decrypt the current session even if the session is intercepted and recorded by a third party
					* any step above fails the connection is not created
					* handshake is concluded and secure connection is started 
						* encrypted and decrypted with the session key until connection closes
			* OSI model
				* applications treat TLS as though it were part of the transport layer
			* security
				* TLS security measures
					* protection against a downgrade of the protocol to a previous version or a weaker cipher suite
					* numbering subsequent application records with a sequence number and using this sequence number in the MACs
					* using a message digest enhanced with a key
						* only key-holder can check the MAC
					* message that ends the handshake sends a hash of all the exchanged handshake messages seen by both parties
					* the pseudorandom function splits the input data in half and processes each one with a different hashing algorithm
						* MD5 and SHA-1
						* performs XOR on them to create the MAC
				* attacks against TLS/SSL
					* renegotiation attack
						* vulnerability of renegotiation procedure
						* allows an attacker who can hijack an HTTPS connection to splice their own requests into the beginning of the conversation the client has with the web server
						* attacker cannot actually decrypt the client-server communication
						* proposed fix
							* RFC 5746
								* renegotiation indication extension requires the client and server to include and verify information about previous handshakes in any renegotiation handshakes
					* downgrade attacks -> FREAK attack and Logjam attack
						* also called a version rollback attack
						* FREAK attack
							* a security exploit of a cryptographic weakness in TLS protocols introduced decades earlier for compliance with US cryptographic export regulations
							* involved limiting exportable software to use only public key pairs with RSA moduli of 512 bits or lesss with the intention of allowing them to be broken easily by the NSA but not by other organizations with lesser computing resources
						* Logjam attack
							* a security vulnerability against a Diffie-Hellman key exchange ranging from 512-bit to 1024-bit keys
						* tricks a web server into negotiating connections with a previous version of TLS that have long since been abandoned as insecure
					* cross-protocol attacks
						* DROWN attack
							* cross-protocol security bug that attacks the servers supporting modern TLS protocol suites by using their support for the obsolete, insecure, SSL v2 protocol to leverage an attack on connections using up-to-date protocols that would otherwise be secure
						* exploits a vulnerability in the protocols used and the configuration of the server
					* BEAST attack
						* java applet to violate same origin policy constraints for a long-known cipher block chaining vulnerability in TLS 1.0
						* Apple fixed BEAST vulnerability by implementing 1/n-1 split and turning it on by default in OS X Mavericks 
					* CRIME and BREACH attacks
						* allow an attacker to recover the content of web cookies when data compression is used along with TLS 
							* used to recover the content of secret authentication cookies 
							* allow an attacker to perform session hijacking on an authenticated web session
						* known limitation of TLS as it is susceptible to chosen-plaintext attack against application-layer data it was meant to protect
					* timing attacks on padding
						* early TLS versions were vulnerable against padding oracle attack
					* there are lots of attacks that i dont have enough data to understand
				* forward secrecy
					* ensures that a session key derived from a set of public and private keys will not be compromised if one of the private keys is compromised in the future
						* without if the servers private key is compromised not only will all future TLS-encrypted sessions using that server certificate be compromised but also any past sessions that used it as well
					* in practice unless a web service uses Diffie-Hellman key exchange to implement forward secrecy all of the encrypted web traffic to and from that service can be decrypted by a third party if it obtains the servers master private key
			* dealing with MITM attacks
				* certificate pinning
					* add an extra step beyond normal X.509 certificate validation
					* after obtaining the servers certificate in the standard way client checks the public keys in the servers certificate chain against a set of public keys for the server name
					* typically the public keys are bundled with the application
					
				* perspectives project
					* operates network notaries that clients can use to detect if a sites certificate has changed
					* by their nature MITM attacks place the attacker between the destination and a single specific target
					* perspectives would warn the target that the certificate delivered to the web browser does not match the certificate seen from other perspectives
						* the perspective of other users in different time and place
					* this makes it possible for a target to detect an attack even if a certificate appears to be completely valid
				* DNSChain
					* relies on the security that blockchains provide to distribute public keys
					* uses one pin to secure the connection to the DNSChain server itself
						* all other public keys become accessible over a secure channel
			* protocol details
				* the TLS protocol exchanges records
					* encapsulate the data to be exchanged in a specific format 
					* depending on the state of the connection records can be 
						* compressed
						* padded
						* appended with a MAC
						* encrypted
					* each record has a content type field
						* designates the type of data encapsulated
						* a length field 
						* TLS version field
				* TLS handshake
					* when connection starts the record encapsulates the handshake messaging protocol (content type 22)
					* protocol used to exchange all the information required by both sides for exchange of the actual application data by TLS
					* defines the format of messages and the order of their exchange
					* basic TLS handshake
						* negotiation phase
							* client sends a *ClientHello* message specifying
								* the highest TLS protocol version it supports
								* a random number
								* a list of suggested cipher suites
								* suggested compression methods
							* server responds with a *ServerHello* message containing
								* the chosen protocol version
								* a random number
								* cipher suite from the choices offered by the client
								* compression method from the choices offered by the client
								* the chosen protocol version should be the highest that both the client and server support
							* server sends its *Certificate* message
								* may be omitted by server
							* server sends its *ServerKeyExchange* message
								* may be omitted by server
							* server sends a *ServerHelloDone* message
								* indicates it is done with handshake negotiation
							* client responds with a *ClientKeyExchange* message which may contain
								* PreMasterSecret
									* encrypted using the public key of the server certificate
								* public key
								* nothing
							* client and server then use the random numbers and the PreMasterSecret to comput a common secret called master secret
								* all other key data for this connection is derived from this master secret
									* passed through a carefully designed pseudorandom function
						* the client now sends a *ChangeCipherSpec* record 
							* tells the client that everything sent from this point forward will be authenticated and encrypted
							* ChangeCipherSpec content type 20
						* client sends an authenticated and encrypted *Finished* message containing a hash and MAC over the previous handshake messages
							* server will attempt to decrypt the clients finished message and verify the hash and MAC
							* if the decryption or verification fails the handshake is considered to have failed and connection is shutdown
						* server sends a *ChangeCipherSpec* record
							* tells the client everything i tell you from now on will be authenticated
							* server sends its authenticated and encrypted *Finished* message
							* client performs the same decryption and encryption
						* application phase
							* handshake is complete and application protocol is enabled
							* messages exchanged between client and server will be authenticated and encrypted exactly like their Finished message									* otherwise the content type is 25 and client will not authenticate
				* client-authenticated TLS handshake
					* also known as mutual authentication
					* clients can be authenticated too
				* resumed TLS handshake
					* also known as an abbreviated handshake, or restart handshake
					* public key operations are relatively expensive in terms of computational power
					* TLS provides a secure shortcut in the handshake mechanism to avoid these operations
						* implemented using session IDs or session tickets
					* can also be used for single sign-on 
						* gurantees that both the original session and any resumed session originate from the same client
				* session IDs
					* in an ordinary full handshake the server sends a session id as part of the *ServerHello* message
					* client
						* associates this session id with the servers ip address and TCP port
						* when the client connects again to that server it can use the session id to shortcut the handshake
					* server
						* session id maps to the cryptographic parameters previously negotiated, specifically the master secret
					* both sides must have the same master secret or the resumed handshake will fail
					* process
						* negotiation phase
							* client sends a *ClientHello* message specifying 
								* the highest TLS protocol version it supports
								* a random number
								* list of suggested cipher suites
								* compression methods
								* the session id from the previous TLS connection
							* server responds with a *ServerHello* message containing
								* chosen protocol version
								* random number
								* cipher suite from the choices offered by the client
								* compression method from the choices offered by the client
								* if server recognizes the session id sent by the client 
									* responds with the same session id
									* client uses this to recognize that a resumed handshake is being performed
								* else the server does not recognize the session id
									* sends a different value for its session id
									* client uses this to recognize that a resumed handshake will not be performed
								* both client and server have the master secret and random data to generate the key data to be used
						* server now sends a *ChangeCipherSpec* record
							* tells the client that everything will be encrypted from this point forward
							* server sends an encrypted *Finished* message containing a hash and MAC over the previous handshake messages
							* client will attempt to decrypt the servers finnished message and verify the hash and MAC
								* if decryption verification fails the handshake is considered to have failed
						* client sends a *ChangeCipherSpec* record
							* tells the server that everything will be encrypted from this point forward
							* server performs the same decryption and verification
						* application phase
							* at this point the handshake is complete and the application protocol is enabled
							* application messages exchanged between client and server will also be encrypted exactly like in their Finished messages
				* session tickets
					* RFC 5077
						* extends TLS via the use of session tickets instead of session ids
						* a way to resume a TLS session without requiring that session-specific state is stored at the TLS server
					* TLS server stores its session-specific state in a session ticket and sends the session ticket to the TLS client for storing
						* client resumes a TLS session by sending the session ticket to the server
						* sessiont ticket is encrypted and authenticated by the server
						* server verifies the validity of the session ticket before using its contents
						* server resumes the TLS session according to the session-specific state in the ticket
				* TLS record structure
					* content type
						* identifies the Record Layer Protocol Type contained in this record
							* ChangeCipherSpec
								* 20
							* Alert
								* 21
							* Handshake
								* 22
							* Application
								* 23
							* Heartbeat
								* 24
					* version
						* identifies the major and minor version of TLS for the contained message
						* ClientHello message this need not be the highest version supported by the client
					* length	
						* length of protocol messages, MAC and Padding not to exceed 2^14 bytes (16KiB)
					* protocol messages
						* one or more messages identified by the protocol field
						* this field may be encrypted depending on the state of the connection
					* MAC and Padding
						* a MAC is computed over the protocol message with additional key material included
				* Handshake protocol
					* message type
						* HelloRequest
							* 0
						* ClientHello
							* 1
						* ServerHello
							* 2
						* NewSessionTicket
							* 4
						* Certificate
							* 11
						* ServerKeyExchange
							* 12
						* CertificateRequest
							* 13
						* ServerHelloDone
							* 14
						* CertificateVerify
							* 15
						* ClientKeyExchange
							* 16
						* Finished
							* 20
					* handshake message data length
						* 3 byte field indicating the length of the handshake data not including the header
						* multiple handshake messages may be combined within one record
				* alert protocol
					* this record should normally not be sent during normal handshaking or application exchanges
					* sent at any time durint the handshake and up to the closure of the session
					* if used to signal fatal error
						* session closed immediately after sending record
					* properties
						* level
							* identifies the level of alert
							* fatal
								* connection or security may be compromised or an unrecoverable error has occurred
								* 2
							* warning
								* connection or security may be unstable
								* 1
						* description
							* identifies which type of alert is being sent
							* close notify
								* 0
								* warning/fatal
							* unexpected message
								* 10
								* fatal
							* bad record MAC
								* possibly a bad SSL implementation or payload has been tampered with 
								* 20
								* fatal
							* decryption failed
								* TLS only reserved
								* 21
								* fatal
							* recent overflow
								* TLS only 
								* 22
								* fatal	
							* decompression failure
								* 30
								* fatal
							* handshake failure
								* 40
								* fatal
							* no certificate
								* ssl 3.0 only reserved
								* 41
								* warning fatal
 	
* what is a [MAC (Message Authentication Code)](https://en.wikipedia.org/wiki/Message_authentication_code)?
	* Message Authentication Code
		* sometimes known as a tag
		* a short piece of information used to authenticate a message
			* confirm that the message came from the stated sender and has not been changed
		* protects both a message data integrity as well as its authenticity 
			* allows verifiers to detect any changes to the message content
	* definitions
		* consists of
			* key generation algorithm selects a key from the key space uniformly at random
			* signing algorithm efficiently returns a tag given the key and the message
			* verifying algorithm efficiently verifies the authenticity of the message given the key and the tag
				* accepted when the message and tag are not tampered with or forged
				* rejected otherwise
	* security
		* though similar to cryptographic hash function possess different security requirements
			* must resist existential forgery under chosen-plaintext attacks
				* existential forgery
					* the creation of at least one message/signature pair by an adversary where the adversary where the signature was not produced by the legitimatr signer
				* chosen-plaintext attacks
					* adversary has choice of message/signature pairs 
				* even if an attacker has access to an oracle which possesses the secret key and generates MACs for messages of the attackers choosing the attacker cannot guess the MAC for other messages without performing infeasible amounts of computation
		* differ from digital signatures
			* MAC values are both generated and verified using the same secret key
				* symmetric
				* sender and receiver of a message must agree on the same key before initiating communications
			* does not provide the property of non-repudiation offered by digital signatures
				* specifically in the case of a network-wide shared secret key
				* any user who can verify a MAC is also capable of generating MACs for other messages 
				* non-repudiation can be provided
					* systems that securely bind key usage information to the MAC key
					* key in possession of two people
						* one has key that can be used for MAC generation
						* other has copy of the key in a hardware security module that only permits MAC verification
						* commonly done in the finance industry
		* MIC (Message Integrity Codes)
			* frequently a substiture for MAC accronym especially in communications where MAC stands for Media Access Control address
			* some use MIC to refer to a message digest 
				* do not use secret keys
			* other possible names for MAC
				* checksum
				* error detection code
				* hash
				* keyed hash
				* Message Authentication Code
				* protected checksum
		* implementation
			* can be constructed from other cryptographic primitives 
				* cryptographic hash functions 
				* block cipher algorithm
				* universal hashing
			* can combine two or more cryptographic primitives to maintain protection even if one of them is later found to be vulnerable
				* TLS (Transport Layer Security)
					* input data is split in halves that are each processed with a different hashing primitive
						* MD5
						* SHA-1
					* then a XOR operation is performed to create the MAC output
		* one-time MAC
			* universal hashing and in particular pairwise independent hash functions provide a secure message authentication code as long as the key is used at most once
				* can be seen as the one-time pad for authentication
			* k-independent hashing functions provide a secure MAC as long as the key is used less than 
				* k-times for k-wise independent hashing functions

* what is a [HMAC (keyed-Hash Message Authentication Code)](https://en.wikipedia.org/wiki/HMAC)?
	* keyed-hash message authentication code
		* a specific type of message authentication code involving a cryptographic hash function and a secret cryptographic key
		* used to simultaneously verify both the data integrity and the authentication of a message
		* uses two passes of hash computation
			* the secret key is first used to derive two keys
				* inner
				* outer
			* the first pass of the algorithm produces an internal hash derived from the message and the inner key
			* the second pass produces the final HMAC derived from the inner hash result and the outer key
			* better immunity against length extension attacks

* what is [universal hashing](https://en.wikipedia.org/wiki/Universal_hashing)?
	* refers to selecting a hash function at random from a family of hash functions with certain mathematical properties
		* gurantees a low number of collisions in expectation even if the data is chosen by an adversary
	* many universal families are known and their evaluation is often very efficient
		* for hashing integers, vectors, strings

* what is [pairwise independence in probability theory](https://en.wikipedia.org/wiki/Pairwise_independence)?
	* a pairwise independent collection of random variables is a set of random variables any two of which are independent
		* any collection of mutually independent random variables is pairwise independent
		* some pairwise independent collections are not mutually independent
	* math is super cool

* what is a [OTP (One-Time Pad)](https://en.wikipedia.org/wiki/One-time_pad)?
	* One-Time Pad
		* an encryption technique that cannot be cracked but requires the use of a one-time pre-shared key the same size as or longer than the message being sent
	* plaintext is paired with a random secret key
		* each bit or character of the plaintext is encrypted by combining it corresponding bit or character from the pad using modular addition
		* ciphertext impossible to break so long that
			* the key is truly random
			* at least as long as the plaintext
			* never reused in whole or in part
			* kept completely secret
	* any cipher with the perfect secrecy property must use keys with effectively the same requirements as OTP keys
	* OTP is inpractical
	* name comes from its use by spies in the cold war
	* problems
		* key distribution
			* distributing very long OTP keys is inconvenient and usually posses a security risk
			* high risk of compromise in transit
		* authentication
			* no system for message authentication
		* true randomness
			* high quality random numbers are difficult to generate
			* must be one-time use

* what is [k-independent hashing](https://en.wikipedia.org/wiki/K-independent_hashing)?
	* also known as k-universal
	* selecting a function at random from the family gurantees that the hash codes of any designated k keys are independent random variables
		* allow good average case performance in randomized algorithms or data structures even if the input data is chosen by an adversary
	* basically better universal hashing
		* gurantees random behavior to families of k designated keys
		* adds a gurantee on the uniform distribution of hash codes
	* math is seriously super cool

* what is a [shared secret in cryptography](https://en.wikipedia.org/wiki/Shared_secret)?
	* a piece of data known only to the parties involved in a secure communication
	* can be
		* password
		* passphrase
		* big number
		* array of randomly chosen bytes
	* pre-shared key
		* shared before the communications between parties
	* shared secret
		* created at the start of the communication session by using a key-agreement protocol
	* shared secret can be used for
		* authentication using challenge-response
		* fed to a key derivation function to produce one or more keys to use for encryption and/or MACing of messages
	* to make unique session and message keys the shared secret is usually combined with an initialization vector
		* example of this is the derived unique key per transaction method

* what is a [key-agreement protocol](https://en.wikipedia.org/wiki/Key-agreement_protocol)?
	* a protocol whereby two or more parties can agree on a key in such a way that both influence the outcome 
		* if properly done this preculdes undesired third parties from forcing a key choice on the agreeing parties
	* protocols that are useful in practice also do not reveal to any eavesdropping party what key has been agreed upon
	* many key exchange systems have one party generate the key and simply send that key to the orther party
		* other party has no influence on the key
		* using key-agreement protocol avoids some of the key distribution problems associated with such systems
	* protocols where both parties influence the final derived key are the only way to implement perfect forward secrecy
	* exponential key exchange
		* diffie-hellman key exchange
			* first public-key agreement protocol that meets the criteria
			* two parties jointly exponentiate a generator with random numbers in such a way that an eavesdropper cannot feasibly determine what the resultant value used to produce a shared key is
		* exponential key exchange
			*  in and of itself does not specify any prior agreement or subsequent authentication between the participants 
			* described as anonymous key agreement protocol
	* authentication
		* does not provide authentication of the parties 
			* vulnerable to man-in-the-middle
		* this problem is being addressed
			* public keys
				* use digitally signed keys that must be integrity-assured
				* example
					* Bob has a key signed by a trusted third party vouching his identity
					* Alice can have considerable confidence that a signed key she receives is not an attempt to intercept by Eve
					* when Alice and Bob have a PKI they may digitally sign an agreed Diffie-Hellman agreed key or exchanged Diffie-Hellman public keys
						* such signed keys sometimes signed by a CA are one of the primary mechanisms used for secure web traffic protocols
							* HTTPS, SSL, TLS
			* hybrid systems
				* use public-key cryptography to exchange secret keys which are then used in a symmetric-key cryptographic systems
				* most practical applications of cryptography use a combination of cryptographic functions to implement an overall system that provides secure communication
			* passwords
				* password-authenticated key agreement protocols require the separate establishment of a password in a manner that is both private and integrity-assured

* what is an [IV (Initialization Vector)](https://en.wikipedia.org/wiki/Initialization_vector)?
	* a fixed-size input to a cryptographic primitive that is typically required to be random or pseudorandom
		* randomization is crucial for encryption schemes to achieve semantic security
			* a property whereby repeated usage of the scheme under the same key does not allow an attacker to infer relationships between segments of the encrypted message
	* some cryptographic primitives require the IV only to be non-repeating and the required randomness is derived internally
		* in this case the IV is commonly called a nonce
			* number used once
		* and primitives are described as stateful as opposed to randomized
			* IV need not be explicitely forwarded to a recipient but may be derived from a common state updated at both sender and receiver side

* what is [semantic security](https://en.wikipedia.org/wiki/Semantic_security)?

* what is a [cryptographic nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce)?

* what is [perfect forward secrecy](https://en.wikipedia.org/wiki/Forward_secrecy)?

* what is the [TLS handshake protocol](https://en.wikipedia.org/wiki/Transport_Layer_Security#TLS_handshake)?

* what are [digital signature forgeries](https://en.wikipedia.org/wiki/Digital_signature_forgery)?

* what is an [oracle machine](https://en.wikipedia.org/wiki/Oracle_machine)?

* what is the [OSI model](https://en.wikipedia.org/wiki/OSI_model)?
	* Open Systems Interconnection model
		* a conceptual model that characterizes and standardizes the communication functions of a telecommunication or computing system without regard to their underlying internal structure and technology
		* its goal is the interoperability of diverse communication systems with standard protocols
		* the model partitions a communication system into abstraction layers
			* original defined 7 layers
		* layer serves the layer above it and is served by the layer below it
	* description of OSI layers
		* structure
			* application layer
				* function
					* high-level APIs, including resource sharing, remote file access
				* protocol data unit
					* data
			* presentation
				* function
					* translation of data between a networking service and an application 
						* character encoding
						* data compression
						* encryption/decryption
				* protocol data unit
					* data
			* session
				* function
					* managing communication sessions
						* continuous exchange of information in the form of multiple back-and-forth transmissions between two nodes
				* protocol data unit
					* data
			* transport
				* function
					* reliable transmission of data segments between points on a network
						* segmentation
						* acknowledgement
						* multiplexing
				* protocol data unit
					* TCP
						* segment
					* UDP
						* datagram
			* network
				* function
					* structuring and managing a multi-node network
						* addressing
						* routing
						* traffic control
				* protocol data unit
					* packet
			* data link
				* function
					* reliable transmission of data frames between two nodes connected by a physical layer
				* protocol data unit
					* frame
			* physical
				* function
					* transmission and reception of raw bit streams over a physical medium
				* protocol data unit
					* bit
		* communication between layers
			* at each level N	
				* two entities at the communicating devices (layer N  peers) exchange PDUs (protocol data units) by means of a layer N protocol
				* each PDU contains a payload called the SDU (service data unit)
				* each PDU contains protocol-related headers or footers
			* data processing by two communicating OSI compatible devices
				* data to be transmitted is composed at the topmost layer of the transmitting device (layer N) into a PDU
				* PDU is passed to layer N-1 where it is known as the SDU
				* layer N-1 concatenates the SDU with a header, a footer, or both producing a layer N-1 PDU, this PDU is passed to layer N-2
				* the process continues until reaching the lowermost level
					* the data is transmitted to the receiving device
				* receiving device passes the data from the lowest to the highest level as a series of SDUs while successively stripping each layers headers and footers until reaching the topmost layer
					* the last of the data is consumed
		* some aspects involve all of the layers
			* management
			* security
	* indepth breakdown
		* layer 1
			* physical layer
				* low-level networking equipment
					* network adapters, repeaters, network hubs, modems, fiber media converters
			* defines the electrical and physical specifications of the data connection
			* defines the relationship between a device and a physical transmission medium
				* pins
				* voltages
				* line impedance
				* cable specifications
				* signal timing and similar characteristics
			* responsible for transmission and reception of unstructured raw data in a physical medium
			* bit rate control is done at the physical layer
			* define transmission mode
				* simplex
					* a communication channel that sends information in one direction only
				* half duplex
					* a communication channel that provides information in both directions but only one direction at a time
				* full duplex
					* a communication channel that provides information in both directions
			* defines the network topology
				* bus
				* mesh
				* ring
		* layer 2
			* data link layer
				* provides node-to-node data transfer
			* a link between two directly connected nodes
			* detects and possibly corrects errors that may occur in the physical layer
			* defines the protocol to establish and terminate a connection between two physically connected devices
				* defines the protocol for flow control between them
			* two sub layers
				* MAC (Media Access Control) layer
					* responsible for controlling how devices in a network gain access to a medium and permission to transmit data
				* LLC (Logical Link Control)
					* responsible for identifying and encapsulating network layer protocols and controls error checking and frame synchronization
			* PPP (point-to-point protocol
				* a data link layer protocol that can operate over several different physical layers 
					* synchronous serial lines
					* asynchronous serial lines
		* layer 3
			* network layer
				* provides functionality and procedural means of transferring variable length data sequences called datagrams from one node to another connected in different networks 
					* network is a medium to which many nodes can be connected on
						* every node has an address
						* permits nodes connecting to it to transfer messages to other nodes connected to it by
							* providing the content of a message and the address of the destination node
							* let the network find the way to deliver the message to the destination node
								* possibly route through intermediate nodes
			* if the message is too large to be transmitted from one node another on the data link layer between those nodes
				* network may implement message delivery by splitting the message into several fragments at one node
				* sending the fragments independently
				* reassembling the fragments at another node 
				* may but not obligated to report delivery errors
			* message delivery at the network layer is not necessarily guaranteed to be reliable
			* protocols
				* routing protocol
				* multicast group management
				* network-layer information and error
				* network-layer address assignment
		* layer 4
			* transport layer
				* provides the functional and procedural means of transferring variabl-length data sequences from a source to a destination host via one or more networks while maintaining the quality of service functions 
			* controls the reliability of a given link 
				* flow control
				* segmentation/desegmentation
				* error control
				* provides acknowledgement of successful data transmission and sends the next data if no errors occured
			* creates packets out of the message received from the application layer
				* divide long messages into smaller messages
			* protocols
				* TCP
				* UDP
		* layer 5
			* session layer
				* controls the connections between computers
					* establishes
					* manages
					* terminates
				* provides for
					* full-duplex
					* hald-duplex
					* simplex
				* establishes
					* checkpointing
					* adjournment
					* termination
					* restart procedures
				* responsible for 
					* graceful close of sessions
					* session checkpointing and recovery
		* layer 6
			* presentation layer
				* establishes context between application-layer entities
			* application-layer entities may use different syntax and semantics
				* presentation service provides a mapping between them
				* if available presentation service data units are encapsulated into session protocol data units and passed down the protocol stack
			* provides independence from data representation by translating between application and network formats
				* transforms data into the form that the application accepts
		* layer 7
			* application layer
				* layer closest to the end user
				* both the application layer and the user interact directly with the software application
				* functions typically include
					* identifiying communication partners
					* determining resource availability
					* synchronizing communication
				* when identifying communication partners the application layer determines the identity and availability of communication partners for an application with data to transmit
	* cross-layer functions
		* services not tied to a given layer
		* security services
		* management functions
		* multiprotocol label switching
		* ARP
		* DHCP
		* domain name service
		* cross MAC and PHY scheduling









































* what are the most important concepts in basic crypto?
	* PKI
	* web of trust


