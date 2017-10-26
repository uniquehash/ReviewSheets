# overview of security

* what is [cryptography](https://en.wikipedia.org/wiki/Cryptography)?
	* derived from greek 
		* kryptos -> "hidden, secret"
		* graphein -> "writing"
		* logia -> "study"
	* the practice and study if techniques for secure communication in the presence of third parties called adversaries
		* constructing and analyzing protocols that prevent third parties or the public from reading private messages
	* components of information security that are vital to cryptography
		* data confidentiality
		* data integrity
		* authentication
		* non-repudiation
	* modern cryptography exists at the intersection of discplines
		* mathematics
		* computer science
		* electrical engineering
	* modern cryptography is no longer synonymous with encryption
	* modern cryptography is heavily based on mathematical theory and computer science practice
		* cryptographic algorithms are designed around computational hardness assumptions
			* this makes these algorithms hard to break in practice by any adversary
				* theoretically possible, but infeasible to do so by any known practical means		
			* these schemes are known as computationally secure
				* theoritical advances require these solutions to be continually adapted
					* improvements in integer factorization algorithms
					* faster computing technology
		* information-theoretically secure schemes
			* crypto schemes that provably cannot be broken even with unlimited computing power
				* one-time pad
					* an encryption technique that cannot be cracked but requires the use of a one-time pre-shared key the same size as or longer than the message being sent
				* more difficulte to implement than the best theoretically breakable but computationally secure mechanisms
		
* what is [information security](https://en.wikipedia.org/wiki/Information_security)?
	* also known as infoSec
	* the practice of preventing unauthorized manipulation of information
		* access
		* use
		* disclosure
		* disruption
		* modification
		* inspection
		* recording
		* destruction
	* a general term that can be used regardless of the form the data may take
	* it security
		* also known as computer security
		* referes to information security applied to technology
		* it security specialists are almost always found in any major enterprise/establishment due to the nature and value of the data within larger businesses
			* responsible for keeping all of the technology within the company secure from malicious cyber attacks that often attempt to breach into critical private information or gain control of the internal systems
	* information assurance
		* the act of providing trust of the information that the confidentiality, integrity and availability (CIA) of the information are not violated
			* ensuring that data is not lost when critical issues arise
			* issues include 
				* natural disasters
				* computer/server malfunction
				* physical theft
		* most information is stored on computers information assurance is typically dealt with by IT security specialists
			* common method of providing information assurance is to have an off-site backup of the data in case on of the mentioned issues arise
	* threats
		* infoSec threats come in many different forms
		* most common today
			* software attacks
				* the use of software attacks to gain unauthorized access 
			* theft of intellectual property
			* identity theft
				* the attempt to act as someone else usually to obtain that persons personal information or take advantage of their access to vital information
			* theft of equipment or information
				* cell phones are prone to theft and have also become far more desirable as the amount of data capacity increases
			* sabotage
				* usually consists of the destruction of an organizations website in an attempt to cause loss of confidence on the part of its customers
			* information extortion
				* consists of theft of a companys property or information as an attempt to receive a payment in exchange for returning the information or property back to its owner
					* ransomware
		* most people have experienced software attacks of some sort
			* viruses
				* a type of malicious software program that when executed replicates itself by modifying other computer programs and inserting its own code
			* worms
				* a standalone malware computer program that replicates itself in order to spread to other computers 
			* phishing attacks
				* the attempt to obtain sensitive information such as usernames, passwords, and crdit card details, often for malicious reasons, by disguising as a trustworthy entity in an electronic communication
			* trojan horses
				* any malicious computer program which misleads users of its true intent 
		* entities amass a great deal of confidential information about their users
			* goverments
			* military
			* corporations
			* financial institutions
			* hospitals
			* private businesses
		* should confidential information about a business customers of finances or new product line fall into the hands of a competitor or a black hat hacker
			* business and customers can suffer widespread irreparable financial loss as well as damage to the companys reputation
			* information security must be balanced against cost
				* gordon-loeb model provides a mathematical economic approach for addressing this concern
	* responses to threats
		* reduce/mitigate
			* implement safeguards and countermeasures to eliminate vulnerabilities or block threats
		* assign/transfer
			* place the cost of the threat onto another entity or organization such as purchasing insurance or outsourcing
		* accept
			* evaluate if cost of countermeasure outweighs the possible cost of loss due to threat
		* ignore/reject
			* not a valid or prudent due-care response
	* basic principles
		* key concepts
			* the CIA triad is at the heart of information security
				* confidentiality
				* integrity
				* availability
			* this triad is also known as
				* security attributes
				* properties
				* security goals
				* fundamental aspects
				* information criteria
				* critical information characteristics
				* basic building blocks
			* there is continuous debate about expanding the triad
				* 1992 OECD guidelines for the security of information systems and networks
					* nine generally accepted principles
						* awareness
						* responsibility
						* response 
						* ethics
						* democracy
						* risk assessment
						* security design and implementation
						* security management
						* reassessment
					* 2004 NIST engineering principles for information technology security
						* proposed 33 principles built upon OECD
							* each of these derived guidelines and practices
				* 2002 Donn Parker proposed an alternative model for the classic CIA triad 
					* six atomic elements of information
						* confidentiality
						* possession
						* integrity
						* authenticity
						* availability
						* utility
					* the merits of the parkerian hexad are a subject of debate amongst security professionals
				* 2011 the open group published the information security management standard O-ISM3
					* proposed operational definition of the key concepts of security
						* security objectives
							* access control 
							* availability
							* data quality
							* compliance
							* technical
					* this model is not currently widely adopted
		* confidentiality
			* the property that information is not made available or disclosed to unauthorized individuals, entities, or processes
				* excerpt ISO27000
		* integrity
			* maintaining and assuring the accuracy and completeness of data over its entire life-cycle
				* data cannot be modified in an unauthorized or undetected manner
		* availability
			* the information must be available when it is needed
			* the computing systems used to store and process the information, the security controls used to protect it, and the communication channels used to access it must be functioning correctly
			* high availability systems aim to remain available at all times, preventing service disruptions due to power outages, hardware failures, and system upgrades
			* ensuring availability also involves preventing denial-of-service attacks 
				* flooding incoming messages to the target system essentially forcing it to shut down
		* non-repudiation
			* in law 
				* non-repudiation implies ones intention to fulfill their obligations to a contract
				* it also implies that one party of a transaction cannot deny having received a transaction nor can the other party deny having sent a transaction
			* though cryptographic systems can assist in proving non-repudiation in law, the legal concept is not bound to technological probabilities and possibilities
	* risk management
		* the process of identifying vulnerabilities and threats to the information resources used by an organization in achieving business objectives and deciding what countermeasures if any to take in reducing risk to an acceptable level based on the value of the information resource to the organization
		* process of risk management
			* ongoing and iterative, repeated indefinitely
		* choice of countermeasures 
			* must strike a balance 
				* productivity
				* cost
				* effectiveness
				* value of the information asset being protected
			* countermeasures are also known as controls
		* risk analysis and risk evaluation processes have limitations
			* when security incidents occur they emerge in a context and their rarity and even their uniqueness give rise to unpredictable threats
			* these phenomena are characterized by
				* breakdowns
				* suprises
				* side-effects
			* they require a theoretical approach which is able to examine and interpret subjectively the detail of each incident
				* risk
					* the likelihood that something bad will happend that causes harm to an informational asset (or the loss of the asset)
				* vulnerability
					* a weakness that could be used to endanger or cause harm to an informational asset
				* threat
					* anything (man-made or act of nature) that has the potential to cause harm
				* residual risk
					* risk that cannot be identified or eliminated
				* putting it together
					* the liklihood that a threat will use a vulnerability to cause harm creates a risk
					* when a threat does use a vulnerability to inflict harm it has an imapct
					* the impact is a loss of
						* availability
						* integrity
						* confidentiality
						* possibly other losses (income, life, property)
					* it is not possible to identify all risks, nor is it possible to eliminate all risks
						* the remaining risk is called residual risk
		* risk assessment
			* the determination of quantitative or qualitative estimate of risk related to a well-defined situation and a recognized threat
			* generally carried out by a team of people who have knowledge of specific areas of the business 
				* membership of the team may vary over time as different parts of the business are assessed
				* qualitative assessment
					* the assessment may use a subjective qualitative analysis based on informed opinion
				* quantitative assessment
					* when reliable dollar figures and historical information is available it can be used to provide numerical assessment
		* research shows that the most vulnerable point in most information systems is
			* human user
			* human operator
			* human designer
			* all humans
		* code of practice for information security management recommends the following be examined during a risk assessment
			* security policy
			* organization of information security
			* asset management
			* human resources security
			* physical and environmental security
			* communications and operations management
			* access control
			* information systems acquisition, development and maintenance
			* information security incident management
			* business continuity management
			* regulatory compliance
		* risk management process consists of
			* identification of assests and estimating their value
				* people
				* buildings
				* hardware
				* software
				* data (electronic, print, ect...)
				* supplies
			* conduct a threat assessment
				* acts of nature
				* acts of war
				* accidents
				* malicious acts originating from inside or outside the organization
			* conduct a vulnerability assessment and for each vulnerability calculate the probability that it will be exploited
				* policies
				* procedures
				* standards
				* training
				* physical security
				* quality control 
				* technical security
			* calculate the impact that each threat would have on each asset
				* qualitative analysis
				* quantitative analysis
			* identify, select and implement appropriate controls
				* provide proportional response
				* consider
					* productivity
					* cost effectiveness
					* value of the assrt
			* evaluate the effectiveness of the control measures
				* ensure controls provide the required cost effective protection without discernible loss of productivity
			* for any given risk
				* accept the risk
					* relative low value of the asset
					* relative low frequency of occurrence
					* relative low impact on the business
				* mitigate the risk
					* selecting and implementing appropriate control measures to reduce the risk
				* transfer the risk
					* buying insurance or outsourcing to another business
				* deny the risk
					* management may dispute the reality of the risk denying its existance
		* controls
			* selecting proper controls and implementing those will initially help an organization to bring down risk to acceptable levels
				* control selection should follow and should be based on the risk assessment
			* controls can vary in nature but fundamentally they are ways of protecting the confidentiality, integrity, or availability of information
			* topology of controls
				* administrative
					* also called procedural controls
					* approved written
						* policies
						* procedures
						* standards
						* guidelines
						* corporate security policy
						* password policy
						* hiring policies
						* disciplinary policies
					* these form the framework for running the business and managing people
						* inform people on how the business is to be run and how day-to-day operations are to be conducted
					* laws and regulations created by government bodies are also a type of administrative control because they inform the business
						* some industry sectors have policies, procedures, standards, and guidelines that must be followed
					* administrative controls form the basis for the selection and implementation of logical and physical controls
						* logical and physical controls are manifestations of administrative controls
					* administrative controls are of paramount importance
				* logical
					* also called technical controls
					* logical controls monitor and control access to information and computing systems using
						* software
						* data
					* example
						* passwords
						* network and host based firewalls
						* network intrusion detection systems
						* access control lists
						* data encryption
					* principle of least privilege
						* an individual, program, or system process is not granted any more access privileges that are necessary to perform the task
				* physical
					* control and monitor the environment of the work place and computing facilities
					* control and monitor access to and from such facilities
					* example
						* doors
						* locks
						* heating and air conditioning
						* smoke and fire alarms
						* fire suppression systems
					* separation of duties
						* ensures that an individual can not complete a critical task by himself
						* example
							* an employee who submits a request for reimbursement should not be able to authorize payment or print the check
							* an application programmer should not also be the server administrator or the database administrator 
				* defense in depth
					* to fully protect information during its lifetime each component of the information processing system must have its own protection mechanisms
						* information security must protect information throughout the life span of the information
							* from initial creation of the information on through to the final disposal of the information
						* the information must be protected while in motion and while at rest
							* during its lifetime information may pass through many different information processing systems and through many different parts of information processing systems
						* there are many different ways the information and information systems can be threatned
					* the building up layering on and overlapping of security measures is called defense in depth
						* in contrast to a metal chain which is famously only as strong as its weakest link
							* defense-in-depth aims at a structur where should one defensive measure fail other measures will continue to provide protection
					* administrative, logical, and physical controls can be used to form the basis upon which to build a defense-in-depth strategy 
						* with this approach defense-in-depth can be conceptualized as three distinct layers or places laid on top of the other
					* additional insight into defense-in-depth can be gained by thinking of it as forming the layers of an onion
						* data at the core
						* people at the next outer layer of the onion
						* network security, host-based security, and application securiyt forming the outermost layers of the onion
				* security classification for information
					* security classification
						* not all information is equal and so not all information requires the same degree of protection
						* classifying information (security)
							* identify a member of senior management as the owner of the particular information to be classified
							* develop a classification policy
								* should describe the different classification labels
									* labels used in different sectors
										* business sector
											* public
											* sensitive
											* private
											* confidential
										* government sector
											* unclassified
											* unofficial
											* protected
											* confidential
											* secret
											* top secret
										* cross-sectoral formations
											* traffic light protocol
												* a system for the originator to signal how widely they want their information to be circulated beyond the immediate recipient
												* four labels
													* white
														* unlimited	
													* green	
														* community wide
													* amber	
														* limited distribution
													* red
														* personal for named recipients only
							* define the criteria for information to be assigned a particular label
								* how much value that information has to the organization
								* how old the information is
								* whether or not the information has become obsolete
							* list the required security controls for each classification 
							* all employees in the organization must be trained on the classification schema and understand the required security controls and handling procedures for each classification
								* the classification of a particular information asset that has been assigned should be reviewed periodically to ensure the classification is still appropriate for the information and to ensure the security controls required by the classification are in place and are followed in their right procedures
				* access control
					* access to protected information must be restricted to people who are authorized to access the information
						* computer programs and the computers that process the information must also be authorized
					* considered in three steps
						* identification
							* an assertion of who someone is or what something is
						* authentication
							* the act of verifying a claim of identity 
							* types of information that can be used for authentication
								* something you know
									* pin, password, mother maiden name
								* something you have
									* driver license, magnetic swipe card
								* something you are
									* biometrics, palm prints fingerprints, voice prints, retina eye scans
							* strong authentication requires providing more than one type of authentication information
								* two-factor authentication	
						* authorization
							* determining what informational resources they are permitted to access and what actions they will be allowed to perform 	
							* authorization to access information and other computing services begins with administrative policies and procedures
								* describe what information and services can be accessed by whom and under what conditions
							* access control mechanisms are then configured to enforce these policies
								* different systems are equipped with different kinds of access control mechanisms
								* three different approaches which can be combined as needed
									* non-discretionary
										* consolidates all access control under a centralized administration
										* access to information and other resources is usually based on the individuals function in the organization or the tasks the individual must perform
									* discretionary approach
										* gives the creator or owner of the information resource the ability to control access to those resources 
									* mandatory access control approach
										* access is granted or denied basing upon the security classification assigned to the information resource
								* examples of common access control mechanisms
									* role-based access control
										* an approach to restricting system access to authorized users 
											* mandatory access control
											* discretionary access control
										* used by the majority of enterprises with more than 500 employees
									* file permissions
									* group policy objects
										* a feature of the windows NT family OS	
										* controls the working environment of user accounts and computer accounts
										* provides centralized management and configuration in an active directory environment of
											* operating systems
											* applications
											* user settings 
									* kerberos
										* a network authentication protocol that works on the basis of tickets to allow nodes communicating over a non-secure network to prove their identity to one another in a secure manner
									* RADIUS
										* Remote Authentication Dial-In User Service
										* networking protocol that provides centralized management for users who connect and use a network service
											* authentication
											* authorization
											* accounting
									* TACACS
										* Terminal Access Controller Access-Control System
										* refers to a family of related protocols handling remote authentication and related services for networked access control through a centralized server
							* policies and security controls must be enforceable and upheld
								* effective policies ensure that people are held accountable for their actions
							* audit trail
								* all access to information must be logged
								* all failed and successful authentication attempts must be logged
					* need-to-know principle
						* access rights should be allocated to a person to perform their job functions
						* example
							* two employees in different departments have top-secret clearance
							* they must have a need-to-know in order for information to be exchanged
						* within the need-to-know principle network administrators grant the employee the least amount of privileges to prevent employees access and doing more than what they are supposed to 
				* cryptography
					* encryption
						* transforming usable information into a form that renders it unusable by anyone other than an authorized user
					* cryptography is used in information security to protect information from unauthorized or accidental disclosure while the information is in transit and while the information is in storage
	* process 
		* USA federal sentencing guidelines now make it possible to hold corporate officers liable for failing to exercise due care and due diligence in the management of their information systems
		* reasonable and prudent person
			* stockholders, customers, business partners, governments have the expectation that corporate officers will run the business in accordance with accepted business practices and in compliance with laws and other regulatory requirements
			* a prudent person takes due care to ensure that everything necessary is done to operate the business by sound business principles and in a legal ethical manner
			* a prudent person is also diligent in their due care of the business
		* due care
			* steps are taken to show
				* verified
				* measured	
				* produce tangible artifacts
		* due diligence
			* these are continual activities
				* people are actually doing things to monitor and maintain the protection mechanisms	
	* sources of standards
		* ISO
			* International Organization for Standardization
				* a consortium of national standards institutes from 157 countries, coordinated through a secretariat in Geneva, Switzerland
			* the worlds largest developer of standards
		* NIST
			* US National Institute of Standards and Technology
				* a non-regulatory federal agency within the U.S. Department of Commerce
			* NIST computer security division develops
				* standards
				* metrics
				* tests and validation programs
				* publishes standards and guidelines to increase secure IT planning, implementation, management, and operation
			* the custodian of the US Federal Information Processing Standard publications
		* The Internet Society
			* a professional membership society with more than 100 organizations and over 20,000 individual members in over 180 countries
				* provides leadership in addressing issues that confront the future of the internet and is the organization home for the groups responsible for internet infastructure standards
					* IETF
						* Internet Engineering Task Force
					* IAB
						* Internet Architecture Board
		* Information Security Forum
			* a global nonprofit organization of several hundred leading organizations
				* financial services
				* manufacturing
				* telecommunications
				* consumer goods
				* government
				* other areas
			* it undertakes research into information security practices and offers advice in its biannual publications
				* Standard of Good Practice
		* IISP		
			* Institute of Information Security Professionals
				* an independent, non-profit body governed by its members with the principal objective of advancing the professionalism of information security practitioners and thereby the professionalism of the industry as a whole
			* developed the IISP skills framework
				* describes the range of the competencies expected of information security and information assurance professionals in the effective performance of their roles 
		* BSI
			* German Federal Office for Information Security
				* german goverment info sec bureau
			* BSI-Standards a series of standards and guides to follow 


* what is [confidentiality](https://en.wikipedia.org/wiki/Confidentiality)?
	* involves a set of rules or a promise that limits access or places restrictions on certain types of information
	* info sec
		* the property that information is not made available or disclosed to unauthorized individuals, entities, or processes


* what is [data integrity](https://en.wikipedia.org/wiki/Data_integrity)?
	* the maintenance of and the assurance of the accuracy and consistency of data over its entire life-cycle
	* a crtitical aspect to the any system which stores, processes, or retrieves data
		* design
		* implementation
		* usage
	* data corruption
		* the opposite of data integrity
		* a form of data loss
	* intent of data integrity techniques
		* ensure data is recorded exactly as intended
		* upon later retrieval ensure the data is the same as it was when it was originally recorded
		* data integrity aims to prevent unintentional changes to information
	* integrity types
		* physical integrity
			* deals with challenges associated with correctly storing and fetching the data itself
				* may include
					* electromechanical faults
					* design flaws
					* material fatigue
					* corrosion
					* power outages
					* natural disasters
					* acts of war and terrorism
					* other special environmental hazards
						* ionizing radiation
						* extreme temperatures
						* pressures and g-force
			* ensuring physical integrity includes
				* redundant hardware
				* uninterruptible power supply
				* certain types od RAID arrays
				* radiation hardened chips
				* error-correcting memory
				* clustered file system
				* file systems that employ block level checksums
				* storage arrays that compute parity calculations such as exclusive or 
				* cryptographic hash functions
				* watchdog timer 
			* error-correcting codes
				* error detecting algorithm often used for physical integrity
			* human-induced data integrity errors
				* often detected through the use of simpler checks and algorithms
					* damm algorithm
					* luhn algorithm
				* used to maintain data integrity after manual transcription from one computer system to another by humans
			* computer-induced data integrity errors
				* can be detected through hash functions
		* logical integrity
			* concerned with the correctness or rationality of a piece of data given a particular context
			* in databases 
				* referential integrity 
					* a property of data which when satisfied requires every value of one attribute of a relation to exist as a value of another attribute in a different relation
				* entity integrity
					* a basic constraint of database relational model that refers to the morphology of the primary key but afterwards the same format is applied to the foreign key and also to any simple components of any of the two 
					* every relation must have an identifier called a primary key in such way that every row of the same relation be identifiable by its content
			* in robotic systems
				* appropriately ignoring impossible sensor data
			* these make sure that data make senses given its environment
			* challenges
				* software bugs
				* design flaws
				* human errors
			* ensuring logical integrity includes
				* check constraints
				* foreign key constraints
				* program assertions
				* run-time sanity checks
	* databases
		* data retention
			* the policies of persistent data and records management for meeting legal and business data archival requirements
			* data integrity contains guidelines for data retention specifying or guaranteeing the length of time data can be retained in particular database
				* in order to achieve data integrity these rules are consistently and routinely applied to all data entering the system and any relaxation of enforcement could cause errors in the data
		* types of integrity constraints
			* data integrity is normally enforced in database systems by a series of integrity constraints
			* entity integrity
				* every table must have a primary key and that column or columns chosen to be the primary key should be unique and not null
			* referential integrity
				* any foreign-key value can only be in one of two states
					* usual state is that the foreign-key value refers to a primary key value of some table in the database
					* a foreign-key may be null (not usual)
			* domain integrity
				* all columns in a relational database must be declared upon a defined domain
				* the primary unit of data in the relational data model is the data item
				* data items are said to be atomic or non-decomposable
				* a domain is a set of values of the same type
					* domains are pools of values from which actual values appearing in the columns of a table are drawn
			* user-defined integrity
				* a set of rules specified by a user that do not belong to the other three
					* entity
					* domain
					* referential
		* if the database supports the integrity features 
			* it is the responsability of the DB to ensure data integrity as well as the consistency model for the data storage and retrival 
		* else the DB does not support the features
			* it is the responsability of the applications to ensure data integrity while the database supports the consistency model for the data storage and retrieval
		* the benefits of having a single well-controlled and well-defined data-integrity system
			* stability
				* one centralized system performs all data integrity operations
			* performance
				* all data integrity operations are performed in the same tier as the consistency model
			* re-usability
				* all applications benefit from a single centralized data integrity system
			* maintainability
				* one centralized system for all data integrity administration

* what is [authentication](https://en.wikipedia.org/wiki/Authentication)?
	* the act of confirming the truth of an attribute of a single piece of data claimed true by an entity
	* often involves verifying the validity of at least one form of identification
	* authentication can be considered to be of three types
		* accepting proof of identity given by a credible person who has first-hand evidence that the identity is genuine
			* basically maps to "what you know"
		* comparing the attributes of the object itself to what is known about objects of that origin
			* basically maps to "what you are"
		* relies on documentation or other external affirmations 
			* basically maps to "what you have"
	* authenticating people
		* knowledge factors
			* "what you know"
			* something users know
				* password
				* pass phrase
				* pin
				* challenge response
				* security question
		* ownership factors
			* "what you have"
			* something the user has
				* wrist band
				* ID card
				* security token
				* software token
		* inherence factors
			* "what you are"
			* something the user is or does
				* fingerprint
				* retinal pattern	
				* dna sequence
	* authentication styles
		* single-factor authentication
			* the weakest level of authentication
			* only one factor is used to authenticat an individuals identity
			* not recommended for financial or personally relevant transactions that warant a higher level of security
		* two-factor authentication
			* two factors are required for authentication
			* example
				* atm card
					* need card (ownership)
					* need pin (knowledge)
		* multi-factor authentication
			* instead of 2 factors using multiple authentication factors to enhance security
		* strong authentication
			* layered authentication approach relying on two or more authenticators to establish the identity of an originator or receiver of information
		* continuous authentication 
			* conventional systems authenticate users only at the initial log-in session
				* security flaw
			* systems can use continuous user authentication methods to continuously monitor and authenticate users based on some biometric traits
	* digital authentication
		* a group of processes where the confidence for user identities is established and presented via electronic methods to an information system
		* secure digital authentication model according to NIST
			* enrollment
				* an individual applies to a credential service provider to initiate the enrollment process
				* after successfully proving the applicants identity the CSP allows the applicant to become a subscriber
			* authentication
				* after becoming a subscriber the user receives an authentictor
					* token
					* credential
					* username
				* user is then permitted to perform online transactions within an authenticated session with a relying party
					* must provide proof that user possesses one or more authenticators
			* life-cycle maintenance
				* the CSP is charged with the task of maintaining the users credential of the course of its lifetime 
				* the subscriber is responsible for maintaining their authenticators

* what is [non-repudiation](https://en.wikipedia.org/wiki/Non-repudiation)?
	* refers to a state of affairs where the author of a statement will not be able to successfully challenge the authorship of the statement or validity of an associated contract
	* in security example
		* if a key card access system was put in place
			* non-repudiation would be violated if it were not also a stricly enforced policy to prohibit sharing of the key cards and to immediately report lost or stolen cards
	* in digital security
		* non-repudiation means something slightly different
			* a service that provides proof of the integrity and origin of data
			* an authentication that can be asserted to be genuine with high assurance
		* the most common method of asserting the digital origin of data is through digital certificates
			* a form of public key infrastructure to which digital signatures belong
		* verifying the digital origin means that the certified/signed data can be, with reasonable certainty, trusted to be from somebody who possesses the private key corresponding to the signing certificate 
	* TTPs
		* trusted third parties
		* the way a in which a party may attempt to repudiate a signature presents a challenge to the trustworthiness of the signatures themselves
			* standard approach to mitigating these risks is to involve a trusted third party
		* the two most common analog TTPs are
			* forensic analysts
				* specializes in handwriting can look at a signature compare it to a known valid signature and make a reasonable assessment of the legitmacy of the first signature
			* notaries
				* provides witness whose job is to verify the identity of an individual by checking other credentials and affixing their certification that the party signing is who they claim to be 
		* the most common digital TTP
			* repository of public key certificates	
				* provides the recipient with the ability to verify the origin of an item even if no direct exchange of the public information has ever been made

* what is [encryption](https://en.wikipedia.org/wiki/Encryption)?
	* the process of encoding information in such a way that only authorized parties can access it
	* does not prevent interference, but denies the intelligble content to a would-be interceptor
	* generic encryption scheme
		* plaintext is encrypted using an encryption algorithm
			* plaintext is that the intended information or message is referred as
			* encryption algorithms are called ciphers
		*  this generates a ciphertext that can only be read if decrypted
		* for technical reasons encryption schemes usually use a pseudo-random encryption key generated by an algorithm
	* in principle it is possible to decrypt the message without possessing the key but for a well-designed encryption scheme, considerable computational resources and skills are required 
		* an authorized recipient can easily decrypt the message with the key provided by the originator
	* types of encryption
		* symmetric key / private key
			* the encryption and decryption key are the same
			* communicating parties must have the same key before they can achieve secure communication
		* public key
			* the encryption key is published for anyone to use and encrypt messages however only the receiving party has access to the decryption key that enables messages to be read
			* first described in 1973
	* types of attack
		* cryptographic attacks
		* stolen ciphertext attacks
		* attacks on encryption keys
		* insider attacks
		* data corruption or integrity attacks
		* data destruction attacks
		* ransomware attacks
	* message verification
		* encryption can protect the confidentiality of messages 
		* other techniques needed to protect the integrity and authenticity of a message 
		* any error in the system design or execution of a secure system can allow successful attacks
	* data erasure
		* conventional methods for deleting data permanently from a storage device involve overwriting its whole content with 0, 1 or other patterns
			* this can be very slow
		* cryptography allows you to make the erasure almost instantaneous as long as all the data on a device is encryted and the key is stored on the same device
			* just delete the key and then everything is garbage 
			* iOS devices do this by keeping cryptographic key in dedicated effaceable storage

* what is [the structure of a x.509 certificate](https://en.wikipedia.org/wiki/X.509)?
	* structure of a X.509 v3 digital certificate
		* certificate
			* version number
			* serial number
			* signature algorithm ID
			* issuer name
			* validity period
				* not before
				* not after
			* subject name
			* subject public key info
				* public key algorithm
				* subject public key
			* issuer unique identifier
			* subject unique identifier
			* extensions
		* certificate signature algorithm
		* certificate signature
	* extensions informing a specific usage of a certificate
		* basic constraints
			* {id-ce 19}
			* used to indicate whether the certificate belongs to a ca
		* key usage
			* {id-ce 15}
			* provide a bitmap specifying the cryptographic operations which may be performed using the public key contained in the certificate
		* extended key usage
			* {id-ce 37}
			* used typically on a leaf certificate to indicate the purpose of the public key contained in the certificate 
			* contains a list of object identifiers each of which indicate an allowed use
	* certificate filename extensions
		* .pem
			* privacy-enhanced electronic mail
			* base64 encoded der certificate enclosed between "begin certificate" and "end certificate"
		* .cer, .crt, .der
			* usually in binary DER form
		* .p7b, .p7c
			* PKCS#7 SignedData structure without data just certificate or CRL
			* standard for enveloping data
				* enveloping just means signing or encrypting
		* .p12
			* PKCS#12 
			* may contain certificates, public and private keys
		* .pfx
			* PFX
			* predecessor of PKCS#12
	* wikipedias certificate
	```
		Certificate: 
			Data:
				Version: 3 (0x2)
				Serial Number:
					10:e6:fc:62:b7:41:8a:d5:00:5e:45:b6
			Signature Algorithm: sha256WithRSAEncryption
				Issuer: C=BE, O=GlobalSign nv-sa, CN=GlobalSign Organization Validation CA - SHA256 - G2
				Validity
					Not Before: Nov 21 08:00:00 2016 GMT
					Not After: Nov 22 07:59:59 2017 GMT
				Subject: C=US, ST=California, L=San Francisco, O=Wikimedia Foundation,Inc., CN=*.wikipedia.org
				Subject Public Key Info:
					Public Key Alogirthm: id-ecPublicKey
						Public-Key: (256 bit)
						pub:
							04:c9:22:69:31:8a:d6:6c:ea:da:c3:7f:2c:ac:a5:
							af:c0:02:ea:81:cb:65:b9:fd:0c:6d:46:5b:c9:1e:
							ed:b2:ac:2a:1b:4a:ec:80:7b:e7:1a:51:e0:df:f7:
							c7:4a:20:7b:91:4b:20:07:21:ce:cf:68:65:8c:c6:
							9d:3b:ef:d5:c1	
						ASN1 OID: prime256v1
						NIST CURVE: P-256
				X509v3 extensions:
					X509v3 Key Usage: critical
						Digital Signature, Key Agreement
					Authority Information Access:
						CA Issuers  - URI:
							http://secure.globalsign.com/cacert/gsorganizationvalsha2g2r1.crt
						OCSP - URI:
							http://ocsp2.globalsign.com/gsorganizationvalsha2g2
					X509v3 Certificate Policies:
						Policy: 1.3.6.1.4.1.4146.1.20
						  CPS: https://www.globalsign.com/repository/
						Policy: 2.23.140.1.2.2
					X509v3 Basic Constraints:
						CA: FALSE
					X509v3 CRL Distribution Points:
						Full Name:
							URI:http://crl.globalsign.com/gs/gsorganizationvalsha2g2.crl
					X509v3 Subject Alternative Name:
						DNS:*.wikipedia.org, DNS:*.m.mediawiki.org, DNS:*.m.wikibooks.org, DNS:*.m.wikidata.org, DNS:*.m.wikimedia.org, DNS:*.m.wikimediafoundation.org, DNS:*.m.wikinews.org, DNS:*.m.wikipedia.org, DNS:*.m.wikiquote.org, DNS:*.m.wikisource.org, DNS:*.m.wikiversity.org, DNS:*.m.wikivoyage.org, DNS:*.m.wiktionary.org, DNS:*.mediawiki.org, DNS:*.planet.wikimedia.org, DNS:*.wikibooks.org, DNS:*.wikidata.org, DNS:*.wikimedia.org, DNS:*.wikimediafoundation.org, DNS:*.wikinews.org, DNS:*.wikiquote.org, DNS:*.wikisource.org, DNS:*.wikiversity.org, DNS:*.wikivoyage.org, DNS:*.wiktionary.org, DNS:*.wmfusercontent.org, DNS:*.zero.wikipedia.org, DNS:mediawiki.org, DNS:w.wiki, DNS:wikibooks.org, DNS:wikidata.org, DNS:wikimedia.org, DNS:wikimediafoundation.org, DNS:wikinews.org, DNS:wikiquote.org, DNS:wikisource.org, DNS:wikiversity.org, DNS:wikivoyage.org, DNS:wiktionary.org, DNS:wmfusercontent.org, DNS:wikipedia.org
					X509v3 Extended Key Usage:
						TLS Web Server Authentication, TLS Web Client Authentication
					X509v3 Subject Key Identifier:
						28:2A:26:2A:57:8B:3B:CE:B4:D6:AB:54:EF:D7:38:21:2C:49:5C:36
					X509v3 Authority Key Identifier:
						keyid:96:DE:61:F1:BD:1C:16:29:53:1C:C0:CC:7D:3B:83:00:40:E6:1A:7C
			Signature Algorithm: sha256WithRSAEncryption
				8b:c3:ed:d1:9d:39:6f:af:40:72:bd:1e:18:5e:30:54:23:35:
				...
	```
	* example of a self signed root certificate
	```
		Certificate:
			Data:
				Version: 3 (0x2)
				Serial Number:
					04:00:00:00:00:01:15:4b:5a:c3:94
			Signature Algorithm: sha1WithRSAEncryption
				Issuer: C=BE, O=GlobalSign nv-sa, OU=Root CA, CN=GlobalSign Root CA
				Validity
					Not Before: Sep 1 12:00:00 1998 GMT
					Not After: Jan 28 12:00:00 2028 GMT
				Subject: C=BE, O=GlobalSign nv-sa, OU=Root CA, CN=GlobalSign Root CA
				Subject Public Key Info:
					Public Key Algorithm: rsaEncryption
						Public-Key: (2048 bit)
						Modulus:
							00:da:0e:e6:99:8d:ce:a3:e3:4f:8a:7e:fb:f1:8b:
							...
						Exponent: 65537 (0x10001)
				X509v3 extensions:
					X509v3 Key Usage: critical
						Certificate Sign, CRL Sign
					x509v3 Basic Constraints: critical
						CA:TRUE
					X509v3 Subkect Key Identifier:
						60:7B:66:1A:45:0D:97:CA:89:50:2F:7D:04:CD:34:A8:FF:FC:FD:4B
			Signature Algorithm: sha1WithRSAEncryption
				d6:73:e7:7c:4f:76:d0:8d:bf:ec:ba:a2:be:34:c5:28:32:b5:
				...
	```
* what are [secure cookies in the security context](https://en.wikipedia.org/wiki/Secure_cookies)?
	* a type of cookie which is transmitted over encrypted HTTP connection (HTTPS)
	* secure attributes are included that instruct the browser to only return the cookie to the application over encrypted connections
	* to fully protect a cookie HttpOnly and SameSite attribute should be applied to the cookie
		* HttpOnly
			* prevents the cookie from being accessed by JS
		* SameSite
			* only allows the cookie to be sent to the application if the request originated from the same domain
	* cookie theft and hijacking
		* network threats
			* when sent over unencrypted channels cookies can be subject to eavesdropping and the contents can be read by an attacker
		* end system threats
			* cookies can be stolen or copied from the user
				* giving an attacker access to the contents of the cookie and allowing them to impersonate the user
		* cookie harvesting
			* the attacker will try to impersonate a website by accepting cookies from the users
			* once the attacker gets hold og the cookies he can use this harvested cookie for websites which accept them
	
* what is a [cookie in web world](https://en.wikipedia.org/wiki/HTTP_cookie)?
	* a small piece of data sent from a website and stored on the computer of the user by the web browser while the user is using the browser
	* designed to be a reliable mechanism for websites to remember stateful information or to record the browsing activity of the user
	* can be used to remember arbitrary pieces of information
	* two classes of cookies
		* persistent cookies
			* store information in the browser of the user for a long time
		* non-persistent cookies
			* generally expire once the browser is closed
			
* what is a [JWT (json web token)](https://en.wikipedia.org/wiki/JSON_Web_Token)?
	* a json based open standard for creating access tokens that assert some number of claims 
		* example
			* server could generate a token that has the claim "logged in as admin"
			* client could then use that token to prove that it is logged in as admin
			* tokens are signed by the key of the server so the client and server are both able to verify that the token is legitimate
	* tokens are designed to be compact, URL safe and usable especially in web browser single sign on
	* JWT claims can be typically used to pass identity of authenticated users between an identity provider and a service provider or any other type of claim as required by business processes
	* structure
		* three parts
			* header
				* identifies which algorithm is used to generate the signature
			* payload
				* contains claims to make
			* signature
				* calculated by base64url encoding the header and payload and delimiting them with a period
				* the signature is then base64url encoded 
		* the three parts are then deliminated by periods and concatenated
	* use
		* when the user successfully logs in using their credentials a JWT (json web token) will be returned and must be saved locally
			* typically in local or session storage
			* cookies can also be used
		* when the user wants to access a protected route or resource the user agent should send the JWT (json web token) typically in the `Authorization` header using the `Bearer` schema
		* this is a stateless authentication mechanism as the user state is never saved in server memory
		* JWT (json web tokens) are self contained so all necessary information are included within them
	* standard fields
		* `iss` (issuer)
			* identifies principal that issued the JWT (json web token)
		* `sub` (subject)
			* identifies the subject of the JWT (json web token)
		* `aud` (audience)
			* the audience claim identifies the recipients that the JWT (json web token) is intended for
			* each principal intended to process the JWT (json web token) must identify itself with a value in the audience claim
		* `exp` (expiration time)
			* the expiration time claim identifies the expiration time on or after which the JWT (json web token) must not be accepted for processing
		* `nbf` (not before)
			* not before claim identifies the time at which the JWT (json web token) will start to be accepted for processing 
		* `iat` (issued at)
			* the issued at claim identifies the time at which the JWT (json web token) was issued
		* `jti` (JWT ID)
			* case sensitive unique identifier of the token even among different issuers
	* following fields can be used in authentication headers
		* `typ` (token type)
			* if present recommended to set this to `JWT`
		* `cty` (content type)
			* recommended to set to `JWT` or omit this field
		* `alg` (message authentication algorithm)
			* issuer can freely set an algorithm to verify the signature on the token













































* what does [PKCS mean in the security context](https://en.wikipedia.org/wiki/PKCS)?

* what are [computational hardness assumptions](https://en.wikipedia.org/wiki/Computational_hardness_assumption)?
	* major goal of cryptography is to create cryptographic primitives with provable security
		* sometimes protocols have information theoretic security
			* rarely useful or achievable
		* cryptographers fall back on to computational security
			* systems are secure assuming that any adversaries are computationally limited
	
* what does [provable security mean](https://en.wikipedia.org/wiki/Provable_security)?
	* refers to any type or level of security that can be proved
		* used differently in different fields
	* usually refers to mathematical proofs
		* capabilities of the attacker are defined by an adversarial model
		* aim of the proof is to show that the attacker must solve the underlying hard problem in order to break the security of the modelled system
		* they do not consider side-channel attacks or other implementation-specific attacks because they are usually impossible to model without implementing the system
	* security coding / security by design engineers
		* both of these fields rely on proofs to show the security of a particular approach
		* involes attacker model and model of the system
	* security software salesman
		* they are usually selling snakeoil
	* cryptography
		* reduction
			* proof of security
		* system has provable security
			* security requirements can be stated formally in an adversarial model
			* assumption that attcker has access to the system as well as enough computational resources
		* several lines of research in provable security
			* establish the correct definition of security for a given intuitively understood task
			* suggest constructions and proofs based on general assumptions as much as possible 

* what is the [common criteria in security](https://en.wikipedia.org/wiki/Common_Criteria)?
	* known as the Common Criteria for Information Technology Security Evaluation
		* international standard (ISO/IEC 15408) for computer security certification
	* a framework in which computer system users can specify their SFR (security functional requirements) and SAR (security assurance requirements)
		* done through PPs (protection profiles)
		* vendors can implement and/or make claim about the security attributes of their products
		* testing laboratories can evaluate the products to determine if they actually meet the claims
	* common criteria provides assurance that a computer security product has been conducted in a rigorous, standard, and repeatable manner at a level that is commensurate with the target environment for use
		* process of specification
		* implementation
		* evaluation
	* used as the basis for a government driven certification scheme and typically evaluations are conducted for the use of federal government agencies and critical infrastructure
	* key concepts
		* common criteria evaluations are performed on computer security products and systems
		* evaluation serves to validate claims made about the target by verifying the target's security features
		* the evaluation process also tries to establish the level of confidence that may be placed in the products security features through quality assurance processes
		* TOE (target of evaluation)
			* product or system that is the subject of the evaluation
		* PP (protection profiles)
			* a document typically created by a user or use community
			* identifies security requirements for a class of security devices relevant to that user for a particular purpose
			* product vendors can choose to implement products that comply with one or more PPs (protection profiles) and have their products evaluated against those PPs (protection profiles)
			* a PP (protection profile) may serve as a template for the products ST (security target) 
			* customers looking for particular types of products can focus on those certified against the PP (protection profile) that meets their requirements
		* ST (security target)
			* the document identifies the security properties of the target of evaluation
			* ST (security target) may claim conformance with one or more PPs (protection profiles)
			* the TOE (target of evaluation) is evaluated against the SFRs (security functional requirements) established in its ST (security target)
			* allows vendors to tailor the evaluation to accurately match the intended capabilities of their product
			* the ST (security target) is usually published so that potential customers may determine the specific security features that have been certified by the evaluation
		* SFRs (security functional requirements)
			* specific individual security functions which may be provided by a product
				* common criteria presents a standard catalogue of such functions
			* a SFR (security functional requirement) may state how a user acting a particular role might be authenticated
			* the list of SFRs (security functional requirements) can vary from one evaluation to the next 
			* common criteria does not prescribe any SFRs (security functional requirements) to be included in an ST (security target) it identifies dependencies where the correct operation of one function is dependent on another
		* SARs (security assurance requirements)
			* descriptions of the measures taken during development and evaluation of the product to assure compliance with the claimed security functionality
				* common criteria provides a catalogue of these and the requirements may vary from one evaluation to the next
			* requirements for particular target types of products are documented in the ST (security target) and PP (protection profile) respectively
		* EAL (evaluation assurance level)
			* the numerical rating describing the depth and rigor of an evaluation
			* each EAL (evaluation assurance level) corresponds to a package of SARs (security assurance requirements) which covers the complete development of a product with a given level of strictness
			* common criteria lists seven levels
				* EAL 1 being the most basic 
				* EAL 7 being the mose stringent
			* typically an ST (security target) or PP (protection profile) author will not select assurance requirements individually but choose one of these packages
				* possibly augmenting requirements in a few areas with requirements from a higher level
			* higher EALs (evaluation assurance levels) do not imply better security
				* they only mean that the claimed security assurance of the TOE (target of evaluation) has been more extensively verified

* what is [concrete security](https://en.wikipedia.org/wiki/Concrete_security)?
	* a practice-oriented approach that aims to give more precise estimates of the computational complexities of adversarial tasks than polynomial equivalence would allow
	* traditonally asymptotic
		* classifies the hardness of computational problem using polynomial-time reducibility
	* secure schemas are defined to be those in which the advantage of any computational bounded adversary is negligible
	* concrete security parametrizes all the resources available to the adversary	
		* running time
		* memory
		* number of plaintexts
		* number of queries it can make 
	* advantage of the adversary is upper bounded as a function of these resources and of the problem size
		* often possible to also give a lower bound matching the upper bound making it "concrete" or "exact"

* what is a [computationally bounded adversary problem](https://en.wikipedia.org/wiki/Computationally_bounded_adversary)?
	* a way of looking at the problem of sending data over a noisy channel
	* adversary is restricted to only being able to perform a reasonable amount of computation to decide which bits of the code word need to change
		* only considers how many errors could possibly be introduced given a reasonable amount of computing power
		* with this restriction it becomes possible to construct codes that are both faster to encode and decode compared to previous methods that can also handle a large number of errors

* what is an [audit trail](https://en.wikipedia.org/wiki/Audit_trail)?
	* security-relevant chronological record, set of records, and/or destination and source of records that provide documentary evidence of the sequence of activities that have affected at any time a specific operation, procedure, or event
	* typically result from activities such as
		* financial transactions
		* scientific research
		* health care data transactions
		* communications by individual people, systems, accounts, or other entities
	* process that creates an audit trail is typically required to always run in privileged mode
		* so it can access and supervise all actions from all users
		* normal user should not be allowed to stop/change it
		* for the same reason, trail file or database table with a trail should not be accessible to normal users
	* another way of handling this issue is
		* role-based security model in software
	* industry uses of the audit trail
		* telecommunications
			* record of both completed and attempted accesses and service
			* data forming a logical path linking a sequence of events used to trace the transaction that have affected the contents of a record
		* information or communications security
			* means a chronological record of system activities to enable the reconstruction and examination of the sequence of events and/or changes in an event
		* nursing research
			* refers to the act of maintaining a running log or journal of decisions relating to a research project thus making clear the steps taken and changes made to the original protocol
		* accounting
			* refers to documentation of detailed transaction supporting summary ledger entries
			* may be on paper or electronic
		* online proofing
			* pertains to the version history of a piece of artwork, design, photograph, video, or web design proof in a project
		* clinical research
			* server based systems call clinical trial management systems require audit trails
			* anything regulatory or QA/QC related also requires audit trails
		* voter-verified paper audit trails
			* a method of providing feedback to voters using a ballotless voting system

* what is [role-based access control](https://en.wikipedia.org/wiki/Role-based_access_control)?
	* also known as role-based security
	* an approach to restricting system access to authorized users
		* used by the majority of enterprises with more than 500 employees
		* can implement 
			* mandatory access control
			* discretionary access control
	* a policy neutral access control mechanism defined around roles and privileges
	* some components make it simple to perform user assignment
		* role-permissions
		* user-role relationships
		* role-role relationships
	* design
		* within an organization roles are created for various job functions
		* permissions to perform certain operations are assigned to specific roles
		* members or staff are assigned particular roles
			* through those role assignments acquire the computer permissions to perform particular computer-system functions
		* management of individual user rights becomes a matter of simply assigning appropriate roles to the user's accoun
		* simplifies common operations adding a user or changing a users department 
		* primary rules defined for RBAC (role based access control)
			* role assignment
				* subject can exercise a permission only if the subject has selected or been assigned a role
			* role authorization
				* subject's active role must be authorized for the subject
				* subject can only take roles for which they are authorized
			* permission authorization
				* subject can exercise a permission only if the permission is authorized for the subject's active role
				* ensures that users can exercise only permissions for which they are authorized 
		* additional constraints may be applied and roles can be combined into a hierarchy
			* RBAC (role based access control) can be made to simulate LBAC (lattice-based access control)
				* RBAC can be considered a superset of LBAC
		* constraint places a restrictive rule on the potential inheritance of permissions from opposing roles
			* can be used to achieve appropriate separation of duties
		* conventions and DSL
			* S (subject)
				* a person or automated agent
			* R (role)
				* job function or title which defines an authority level
			* P (permissions)
				* an approval of a mode of access to a resource
			* SE (session)
				* a mapping involving S, R, and/or P
			* SA (subject assignment)
				* subject assignment
			* PA (permission assignmnet)
				* permission assignment
			* RH (partially ordered role hierarchy)
				* can also be written with >=
					* x >= y
						* means that x inherits the permissions of y
				* subject can have multiple roles
				* role can have multiple subjects
				* role can have many permissions
				* permission can be assigned to many roles
				* operation can be assigned many permissions
				* permission can be assigned to many operations
	* NIST recognizes 3 levels of RBAC (role based access control)
		* core RBAC (role based access control)
		* hierarchical RBAC (role based access control)
			* adds support for inheritnce between roles
		* constrained RBAC (role based access control)
			* adds separation of duties
	* relation to other models
		* RBAC (role based access control) can implement
			* DAC (discretionary access control)
				* DAC with groups is implemented in the POSIX file system
					* can emulate RBAC (role based access control)
			* MAC (mandatory access control)
				* can simulate RBAC (role based access control)
					* if the role graph is restricted to a tree rather than a partially ordered set
		* RBAC (role based access control) differs from ACLs (access control lists) used in traditional discretionary access-control systems	
			* RBAC (role based access control) assigns permissions to specific operations with meaning in the organization
			* ACLs (access control list) assigns permissions to low-level data objects

* what is [lattice-based access control](https://en.wikipedia.org/wiki/Lattice-based_access_control)?
	* a complex access control model based on the interaction between any combination of objects and subjects
	* label-based mandatory access control model
	* a lattice is used to define the levels of security that an object may have and that a subject may have access to
		* subject is only allowed to access an object if the security level of the subject is greater than or equal to that of the object

* what is a [lattice in the context of mathematics](https://en.wikipedia.org/wiki/Lattice_(order))?
	* an abstract structure studied in the mathematical subdisciplines of order theory and abstract algebra
	* consists of a partially ordered set in which every two elements have a unique supremum and a unique infimum
	* can also be characterized as algebraic structures satisfying certain axiomatic identities
	* i don't even know, but math is cool
	
* what is [role hierarchy in the context of access control](https://en.wikipedia.org/wiki/Role_hierarchy)?
	* in RBAC (role based access control) role hierarchy defines an inheritance relationship among roles
	* RBAC (role based access control) model treats role hierarchy as either a tree or a partially ordered set
		* tree based is single inheritance
		* partially ordered set allows multiple inheritance
	* complications arise when constraints such as separation of duties exist between roles 

* what is [access control list](https://en.wikipedia.org/wiki/Access_control_list)?
	* a list of permissions attached to an object 
	* specifies which users or system processes are granted access to objects as well as what operations are allowed on given objects
	* each entry in a typical ACL (access control list) specifies a subject and an operation
	* filesystem ACLs (access control lists)
		* a data structure containing entries that specify individual user or group rights to specific system objects such as programs, processes, or files
			* known as ACEs (access control entries)
	* networking ACLs (access control lists)
		* on some types of proprietary computer-hardware an ACL (access control list) provides rules that are applied to port numbers or IP addresses that are available on a host or other layer 3 each with list of hosts and/or networks permitted to use the service
			* routers and switches
		* device enforcing the a ACL (access control list) must separately resolve names to numeric addresses
			* additional attack surface for an attacker who is seeking 
	* sql implementations
		* relational databases have these features as well now

* what is [DAC (discretionary access control)](https://en.wikipedia.org/wiki/Discretionary_access_control)?
	* a type of access control defined as a means of restricting access to objects based on the identity of subjects and/or groups to which they belong
	* discretionary
		* a subject with certain access permission is capable of passing that permission on to any other subject 
	* with owner
		* DAC (discretionary access control) is commonly used in contexts that assume that every object has an owner that controls the permissions to access the object 
		* owners have the ability to make policy decisions and/or assign security attributes 
		* unix is an example of this
	* with capabilities
		* capability-based security is fundamentally not about restricting access based on identity of subject
			* permit subjects to transfer their access to other subjects
			* subject seeking to pass permission must have access to the receiving subject 
				* subjcts do not generally have access to all subjects in the system

* what is [MAC (mandatory access control)](https://en.wikipedia.org/wiki/Mandatory_access_control)?
	* a type of access control by which operating system constrains the ability of a subject or initiator to access or generally perform some sort of operation on an object or target
		* in practice 
			* subject is usually a process or thread
			* object are constructs such as files, directories, TCP/UDP ports, shared memory segments, ect...
	* subjects and objects each have a set of security attributes 
	* whenever a subject attempts to access an object an authorization rule enforced by the operating system kernel examines these security attributes and decides whether the access can take place
		* any operation by any subject on any object is tested against the set of authorization rules to determine if the operation is allowed
	* security policy is centrally controlled by a security policy administrator
	* historically and traditionally MAC (mandatory access control) have been closely associated with MLS (multi-level security) and specialized militatry systems

* what is [capability-based security](https://en.wikipedia.org/wiki/Capability-based_security)?
	* refers to the principle of designing user programs such that they directly share capabilities with each other according to the principle of least privilege and to the operating system infrastructure necessary to make such transactions efficient and secure
	* capability
		* a communicable unforgeable token of authority 
		* refers to a value that references an object along with an associated set of access rights
	* designed with the goal of allowing the exchange of capabilities among possibly mutually untrusting entities to be the primary means of granting and distributing access rights throughout the system
	* in theory a system with capabilities removes the need for any access control list of similar mechanism by giving all entities all and only the capabilities they will actually need
	* less susceptible to the confused deputy problem

* what is a [protection ring](https://en.wikipedia.org/wiki/Protection_ring)?
	* also known as hierarchical protection domains
	* mechanisms to protect data and functionality from faults and malicious behaviour
	* a protection ring is one of two or more hierarchical levels or layers of privilege within the architecture of a computer system
	* generally hardware enforced
	* rings are arranged in a hierarchy from most privileged to least privileged
	* special gates between rings are provided to allow an outer ring to access an inner rings resources in a predefined manner
		* correctly grating access between rings can improve security by preventing programs from one ring or privilege level from misusing resources intended for programs in another

* what is the [confused deputy problem](https://en.wikipedia.org/wiki/Confused_deputy_problem)?
	* a computer program that is innocently fooled by some other party into misusing its authority
	* a specific type of privilege escalation
	* cited as an example of why capability-based security is important 
	* examples
		* CSRF (cross-site request forgery)
			* uses web browser to perform sensitive actions against a web application 
			* when a web application uses a cookie to authenticate all request transmitted by the browser
				* an attacker can use JS to force a browser into transmitting authenticated HTTP requests
		* clickjacking
			* user thinks they are on harmlessly browsing a website but they are infact tricked into performing sensitive actions on another website
		* FTP bounce attacks
			* allow an attacker to connect indirectly to TCP ports to which the attackers machine has no access using remote FTP server as the confused deputy

* what is [multilevel security](https://en.wikipedia.org/wiki/Multilevel_security)?
	* the application of a computer system to process information with incompatible classifications at different security levels
		* permit access by users with different security clearances and needs to know
		* prevents users from obtaining access to information for which they lack authorization 
	* two contexts for the use of multilevel security 
		* a system that is adequate to protect itself from subversion and has robust mechanisms to separate information domains
			* system that is trustworthy
		* an application of a computer that will require the computer to be strong enough to protect itself from subversion and possess adequate mechanisms to separate information domains
			* a system we must trust
	* problem areas
		* sanitization
			* MLS (multilevel security) systems only allow sharing when it does not obviously violate security restrictions
				* restrictions must be broken to pass information up and down security hierarchy
		* covert channels
			* for the system to keep secrets there must be no possible way for a top secret process to transmit signals of any kind to a secrete or lower process
				* this is impossible in practice
		* bypass
			* you can abuse privileges to bypass the intense restrictions
	* existential existance
		* MLS (multilevel security) as an implementation is currently impossible
		* MLS (multilevel security) as a design is theoritically possible

* what is the [bell-lapadula model](https://en.wikipedia.org/wiki/Bell%E2%80%93LaPadula_model)?
	* state machine model used for enforcing access control in government and military applications
		* a formal state transition model of computer security policy that describes a set of access control rules which use security labels on objects and clearances for subjects

* what is [TCSEC (trusted computer system evaluation criteria)](https://en.wikipedia.org/wiki/Trusted_Computer_System_Evaluation_Criteria)?
	* a DoD standard that sets basic requirements for assessing the effectiveness of computer security controls built into a computer system
		* frequently referred to as the orange book 
	* was used to evaluate, classify and select computer systems being considered for the processing, storage and retrieval of sensitive or classified information
	* replaced by common criteria in 2005

* what is a [risk assessment](https://en.wikipedia.org/wiki/Risk_assessment)

* what is the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)

* what is the [traffic light protocol](https://en.wikipedia.org/wiki/Traffic_Light_Protocol)?

* what are [group policy objects](https://en.wikipedia.org/wiki/Group_Policy)?

* what is the [kerberos protocol](https://en.wikipedia.org/wiki/Kerberos_(protocol))?

* what is the [radius protocol](https://en.wikipedia.org/wiki/RADIUS)?

* what is the [tacacs protocol](https://en.wikipedia.org/wiki/TACACS)?

* what is [referential integrity](https://en.wikipedia.org/wiki/Referential_integrity)?

* what is [entity integrity](https://en.wikipedia.org/wiki/Entity_integrity)?

* what are [check constraints](https://en.wikipedia.org/wiki/Check_constraint)?

* what is [data retention](https://en.wikipedia.org/wiki/Data_retention)?

* what is a [consistency model](https://en.wikipedia.org/wiki/Consistency_model)?

* what is a [trusted third party](https://en.wikipedia.org/wiki/Trusted_third_party)?

* what are [public key certificates](https://en.wikipedia.org/wiki/Public_key_certificate)?

* what are [ciphers](https://en.wikipedia.org/wiki/Cipher)?

* what is a [symmetric-key algorithm](https://en.wikipedia.org/wiki/Symmetric-key_algorithm)?

* what is [public-key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)?

* what are a bunch of first principles in security?
	* the CIA triad
	* risk, vulnerability, threat, residual risk
	* risk management
	* controls / countermeasures
	* principle of least privilege
	* separation of duties
	* need-to-know principle
	* kerckhoff principle for cryptosystems
	* cryptographic attacks
	* single sign-on



