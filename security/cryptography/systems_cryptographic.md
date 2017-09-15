# notes on cryptographic systems

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
                            * messages exchanged between client and server will be authenticated and encrypted exactly like their Finished message                                  * otherwise the content type is 25 and client will not authenticate
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

* what is a [HOTP (HMACK based one-time password algorithm)](https://en.wikipedia.org/w/index.php?title=HMAC-based_One-time_Password_Algorithm&oldid=784464634)?
	* HMACK-based One-Time Password
		* exactly what it sounds like, a one time password based on the HMAC protocol
	* applications
		* can be used to authenticate a user in a system via an authentication server
		* with extra steps the user can also authenticate the validation server

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
	* a cryptosystem is semantically secure if any probabilistic polynomial-time algorithm that cannot determine any partial information on the message with probability non-negligibly higher than all other PPTAs that only have access to the message length and no ciphertext given
		* the ciphertext of a certain message m (taken from any distribution of messages)
		* the message length
		* knowledge of the cipher text of some unknown message does not reveal any additional information on the message that can be feasibly extracted
			* implies that the ciphertext practically speaking reveals no information about the plaintext

* what is a [cryptographic nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce)?
	* an arbitrary number that may only be used once
	* often a random or pseudo-random number issued in an authentication protocol to ensure that old communications cannot be reused in replay attacks
	* can also be useful as IV (initialization vectors) and in cryptographic hash functions

* what is [perfect forward secrecy](https://en.wikipedia.org/wiki/Forward_secrecy)?
	* also known as perfect forward secrecy
	* a property of secure communication protocols in which compromise of long-term keys does not compromise past session keys
	* protects past sessions against future compromises of secret keys or passwords
	* forward secrecy
		* a public-key system has the property of forward secrecy if it generates one random secret key per session to complete a key agreement without using a deterministic algorithm
		* compromise of one message cannot compromise others as well
	* protocols
		* present in several major protocol implementations
			* SSH
			* optional feature in IPsec
			* Off-the-Record Messaging
			* TLS
				* diffie-hellman key exchange PFS is available
			* OpenSSL supports forward secrecy using elliptic curve diffie-hellman 
			* signal protocol
				* uses double ratchet algorithm

* what are [digital signature forgeries](https://en.wikipedia.org/wiki/Digital_signature_forgery)?
	* the ability for a adversary to forge or create a message signature pair where the original message was never signed by the legitimate signer
	* types of digital signature forgery
		* total break
			* adversary can compute the signers private key and therefor forge any possible signature on any message
		* existential forgery
			* the creation by an adversary of at least one message/signature pair (m, theta) where theta was not produced by the legitimate signer
			* adversary need not have any control over m
			* m need not have any particular meaning
				* message content is irrelevant
			* as long as the pair (m, theta) is valid the adversary has succeeded in constructing an existential forgery
			* existential forgery is essentially the weakest adversarial goal
				* strongest schemes are those that are existentially unforgeable
		* selective forgery
			* the creation by an adversary of a message/signature pair (m, theta) where m has been chosen by the adversary prior to the attack
				* m may be chosen to have mathematical properties with respect to the signature algorithm
				* m must be fixed before the start of the attack
			* ability to successfully conduct a selective forgery attack implies the ability to successfully conduct an existential forgery attack
		* universal forgery
			* the creation by an adversary of a valid signature theta for any given message m
			* adversary capable of universal forgery is able to sign messages
				* self-chosen
				* messages chosen at random
				* specific messages provided by opponent

* what is an [oracle machine](https://en.wikipedia.org/wiki/Oracle_machine)?
	* topologically part of complexity theory and computability theory
	* an abstract machine used to study decision problems
	* visualized as a turing machine with a black box called an oracle 
		* able to solve certain decision problems in a single operation
		* problem can be of any complexity class
			* even undecidable problems

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

* what is [MFA (Multi-Factor Authentication)](https://en.wikipedia.org/wiki/Multi-factor_authentication)?
	* a method of computer access control in which a user is granted access only after successfully presenting several pieces of evidence to an authentication mechanism
		* knowledge
			* something they know
		* possession
			* something they have
		* inherence
			* something they are

* what are [OTP (One-Time Passwords)](https://en.wikipedia.org/wiki/One-time_password)?
	* One-Time Password
		* a password that is valid for only one login session or transaction on a computer system or other digital device
	* avoid a number of shortcomings that are associated with traditional static password-based authentication
		* number of implementations also incoroporate two factor authentication by ensuring that the one-time password requires access to
			* possesion security element
			* knowledge security element
	* advantages over static passwords
		* not vulnerable to replay attacks
			* potential intruder who manages to record an OTP that was already used to log into a service or to conduct a transaction will not be able to abuse it
		* users who use the same or similar password for multiple systems is not vulnerable on all of them if the password for one of these is gained by an attacker
		* number of OTP systems also aim to ensure that a session cannot easily be intercepted or impersonated without knowledge of unpredictable data created during the previous session
			* reducing the attack surface area further
	* how OTPs are generated and distributed
		* generation algorithms typically make use of 
			* pseudorandomness or randomness
				* makes prediction of successor OTPs by an attacker difficult
			* hash functions
				* derive a value but hard to reverse 
				* this protects the pseudorandomness algorithm
			* various approaches
				* time-synchronization between the authentication server and the client providing the password
				* mathematical algorithm to generate a new password based on the previous password
				* mathematical algorithm where the new password is based on a challenge and/or a counter
		* distribution
			* special electronic security tokens
				* generate OTPs and show them using a small display
			* software running on the users mobile phone
			* server-side generation of OTPs sent to the user using an out-of-band channel such as sms messaging	
			* printed on paper and the user is required to carry them
	* methods of generating the OTP
		* time-synchronized
			* time synchronized OTP is usually related to a piece of hardware called a security token
			* might look like a small calculator or keychain charm with an LCD that shows a number that changes occasionally
			* inside the token is an accurate clock that has been synchronized with the clock on the proprietary authentication server
			* on these OTP systems time is an important part of the password algorithm 
				* algorithm is based on the current time
		* mathematical algorithms
			* generated from previous
				* each new OTP is created from the past OTPs used
					* seed value S is chosen
					* hash function f(S) is applied repeatedly to the seed
						* this value f^1000(S) is stored on the target system
					* the users first login uses a password P derived by applying f 999 times to the seed (f^999(S))
						* the target system can authenticat that this is the correct password because f(P) is f^1000(S) which is the value stored
						* value stored is then replaced by P and the user is allowed to log in
					* the next login must be accompanied by f^998(S)
						* validated because hashing it gives f^999(S) which is P
						* again the new value replaces P and the user is authenticated
					* this can be repeated another 997 times
						* each time the password will be f applied one fewer times and is validated by checking that when hashed it gives the value stored during the previous login
					* new seed value is chosen after the set for S is exhausted
			* challenge-response
				* one time passwords requires a user provide a response to a challenge
					* can be done by inputting the value that the toke has generated into the token itself
					* to avoid duplicates an additional counter is usually involved so if one happens to get the same challenge twice this still results in different OTPs
	* methods of delivering the OTP
		* phones
			* SMS is often used to deliver OTPs
				* bad idea
			* smartphones
				* OTPs can be delivered directly through mobile apps including dedicated authentication apps such as Authy, Duo, and Google Authenticator or within a services existing app such as steam
				* fewer vulnerabilities than SMS
		* proprietary tokens
			* OTPs can be generated on proprietary tokens
		* web-based methods
			* authentication as a service providers offer various web-based methods for delivering OTPs wihtout the need for tokens
			* one method relies on the users ability to recognize pre-chosen categories from a randomly generated grid of pictures 
			* when first registering on a website the user chooses several secret categories of things
			* each time the user logs into the website they are presented with a randomly generated grid of picaltphanumeric character overlaid on it
		* hardcopy
			* OTPs are printed on paper

* what is [out-of-band data](https://en.wikipedia.org/wiki/Out-of-band_data)?
	* a logically independent transmission channel between a pair of connected stream sockets
		* data transfered through a stream that is independent from the main in-band data stream
	* out-of-band data mechanism should be provided as an inherent characteristic of the data channel and transmission protocol, rather than requiring a separate channel and endpoints to be established

* what is [OAuth](https://en.wikipedia.org/wiki/OAuth)?
	* an open standard for access delegation
		* commonly used as a way for internet users to grant websites or applications access to their information on other websites without giving them the passwords
	* provides to clients a secure delegated access to server resources on behalf of a resource owner
		* specifies a process for resource owners to authorize third-party access to their server resources without sharing their credentials
		* desiged specifically to work with HTTP
			* allows access tokens to be issued to third-party clients by an authorization server with approval of the resource owner
			* third party then uses the access token to access the protected resources hosted by the resource server
	* OAuth 2.0
		* not backwards compatible with OAuth 1.0
		* provides specific authorization flows for 
			* web applications
			* desktop applications
			* mobile phones
			* living room devices
	* security
		* OAuth2.0 does not support any security, relies on TLS entirely

* what are the most important concepts in basic crypto?
    * PKI
    * web of trust





