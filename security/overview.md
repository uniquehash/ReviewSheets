# overview of cryptography - 8/22

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

* what are [computational hardness assumptions](https://en.wikipedia.org/wiki/Computational_hardness_assumption)?
	
		
		
		

















































* what is a [risk assessment](https://en.wikipedia.org/wiki/Risk_assessment)

* what is the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)

* what is the [traffic light protocol](https://en.wikipedia.org/wiki/Traffic_Light_Protocol)?

* what is [role-based access control](https://en.wikipedia.org/wiki/Role-based_access_control)?

* what are [group policy objects](https://en.wikipedia.org/wiki/Group_Policy)?

* what is the [kerberos protocol](https://en.wikipedia.org/wiki/Kerberos_(protocol))?

* what is the [radius protocol](https://en.wikipedia.org/wiki/RADIUS)?

* what is the [tacacs protocol](https://en.wikipedia.org/wiki/TACACS)?

* what is an [audit trail](https://en.wikipedia.org/wiki/Audit_trail)?

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

* what is [pretty good privacy (PGP)](https://en.wikipedia.org/wiki/Pretty_Good_Privacy)?

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



