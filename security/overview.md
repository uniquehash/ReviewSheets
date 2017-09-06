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
												* white	
												* green	
												* amber	
												* red
							* define the criteria for information to be assigned a particular label
								* how much value that information has to the organization
								* how old the information is
								* whether or not the information has become obsolete
							* list the required security controls for each classification 
							* all employees in the organization must be trained on the classification schema and understand the required security controls and handling procedures for each classification
								* the classification of a particular information asset that has been assigned should be reviewed periodically to ensure the classification is still appropriate for the information and to ensure the security controls required by the classification are in place and are followed in their right procedures
					









































* what is [confidentiality](https://en.wikipedia.org/wiki/Confidentiality)?

* what is [data integrity](https://en.wikipedia.org/wiki/Data_integrity)?

* what is [authentication](https://en.wikipedia.org/wiki/Authentication)?

* what is [non-repudiation](https://en.wikipedia.org/wiki/Non-repudiation)?

* what is [encryption](https://en.wikipedia.org/wiki/Encryption)?

* what are [computational hardness assumptions](https://en.wikipedia.org/wiki/Computational_hardness_assumption)?

* what is a [risk assessment](https://en.wikipedia.org/wiki/Risk_assessment)

* what is the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)

* what are a bunch of first principles in security?
	* the CIA triad
	* risk, vulnerability, threat, residual risk
	* risk management
	* controls / countermeasures
	* principle of least privilege
	* separation of duties
