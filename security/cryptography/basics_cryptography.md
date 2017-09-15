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
























































