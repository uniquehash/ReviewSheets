# notes on the security ecosystem and products

* what is [AD (Active Directory)](https://en.wikipedia.org/wiki/Active_Directory)?
	* a directory service that Microsoft developed for Windows domain networks
	* included in most Windows server operating systems as a set of processes and services
	* originally only in charge of centralized domain management
		* now an umbrella title for a broad range of directory-based identity-related services
	* server running AD DS (Active Directory Domain Services) is called a domain controller
		* authenticates and authorizes all users and computers in a Windows domain type network
			* assigns and enforces security policies for all computers and installing or updating software
	* features
		* allows management and storage of information
		* provides authentication and authorization mechanisms
		* establishes a framework to deploy other related services
			* certificate servers
			* federated services
			* lightweight directory services
			* rights management services
	* dependencies
		* LDAP (Lightweight Directory Access Protocol)
		* Microsoft version of Kerberos
		* Microsoft version of DNS
	* services
		* domain services
			* AD DS (Active Directory Domain Services) is the cornerstone of every Windows domain network
				* stores information about members of the domain, including devices and users
				* verifies their credentials and defines their access rights
			* server running this service is called a domain controller
			* other Active Directory services excluding LDS rely on Domain Services
				* Group Policy
				* Encrypting File System
				* BitLocker
				* Domain Name Services
				* Remote Desktop Services
				* Exchange Server
				* SharePoint Server
		* lightweight directory services
			* AD LDS (Active Directory Lightweight Directory Services)
				* a light-weight implementation of AD DS
				* runs as a service on Windows server
				* shares the code base with AD DS and provides the same functionality including an identical API
					* does not require the creation of domains or domain controllers
			* provides a data store for storage and directory data and a directory service with an LDAP Directory Service Interface
				* multiple AD LDS instances can run on the same server
		* certificate services
			* AD CS (Active Directory Certificate Services)
				* establishes an on-premises PKI
					* create
					* validate
					* revoke 
			* certificates can be used to encrypt
				* files
				* emails
				* network traffic
			* AD CS requires an AD DS infrastructure
		* federation services
			* AD FS (Active Directory Federation Services)
				* single sign-on service
			* users may use several web-based services or network resources using only one set of credentials stored at a central location
			* AD FS works based on the concept of federated identity
			* requires an AD DS infrastructure
		* rights management services
			* AD RMS (Active Directory Rights Management Services)
				* a server software for information rights management shipped with Windows server
			* uses encryption and a form of selective functionality denial for limiting access to documents and the operations that can be performed on them such as 
				* corporate emails
				* word documents
				* web pages
	* logical structure
		* Active Directory instance consists of a database and corresponding executable code responsible for servicing requests and maintaining the database
			* Directory System Agent
				* a collection of Windows services and processes that run on Windows 2000 and later
			* objects in Active Directory databases can be accessed via LDAP, ADSI, messaging API and security accounts manager services
		* objects
			* Active Directory structures are arrangements of information about objects
				* resources
				* security principals
					* assigned unique SID (Security IDentifier)
			* each object represents a single entity and its attributes
				* whether a user, a computer, a printer, or a group
			* certain objects can contain other objects
			* an object is uniquely identified by  its name and has a set of attributes
				* the characteristics and information that the object represents
					* defined by a schema
						* also determines the kinds of objects that can be stored in AD
			* schema objet
				* allows administrators to extend or modify the schema when necessary
				* doing so can fundementally change or disrupt a deployment
				* once created an object can only be deactivated not deleted
		* forests, trees, and domains
			* AD framework that holds the objects can be viewed at a number of levels
				* forest
					* a collection of trees that share a common 
						* global catalog
						* directory schema
						* logical structure
						* directory configuration
					* represents the security boundary within which users, computers, groups, and other objects are accessible
				* trees
					* a collection of one or more domains and domain tree in a contiguous namesapce linked in a transitive trust hierarchy
				* domain
					* a logical group of network objects that share the same AD database
					* objects are grouped into domains
					* objects for a domain are stored in a single database
					* domains are identified by their DNS name structure, the namespace
			* OUs (Organizational Units)
				* provide hierarchy to a domain
				* ease its administration
				* can resemble the organizations structure in managerial or geographical terms
				* OUs can contain other OUs
					* microsoft recommends using OUs rather than domains for structure and to simplify the implementation of policies and administration
					* the recommended level at which to apply group policies 
			* shadow groups
				* OUs do not confer access permissions 
					* objects placed within OUs are not automatically assigned access privileges based on their containing OU
				* AD requires a separate step for an administrator to assign an object in an OU as a member of a group also within that OU
					* relying on OU location alone to determine access permissions is unreliable
					* object may not have been assigned to the group object for that OU
				* shadow groups the ill workaround
					* custom script to automatically create and maintain a user group for each OU in their directory
					* script runs periodically to update the group to match the OUs account membership
					* unable to instantly update the security groups anytime the directory changes 
			* partitions
				* AD database is organized in partitions
					* each holding specific object types and following a specific replication pattern
				* referred to as naming contexts
				* schema partition
					* contains the definition of object classes and attributes within the forest 
					* replicate to all domains in the forest
				* configuration partition
					* contains information on the physical structure and configuration of the forest
					* replicate to all domains in the forest
				* domain partition
					* holds all objects created in that domain and replicates only within its domain
	* physical structure
				
				
				








































* what is a [federated identity](https://en.wikipedia.org/wiki/Federated_identity)?
	* the means of linking a persons electronic identiy and attributes, stored across multiple distinct identity management systems

* what is a [security principal in computer security](https://en.wikipedia.org/wiki/Principal_(computer_security))?
	* an entity that can be authenticated by a computer system or network
		* can be individuals, computers, services, computational entities such as processes and threads, or any group of such things
	* they need to be identified and authenticated before they can be assigned rights and privileges over resources in the network
	* priciplals typically have an associated identifier that allows it to be referenced for identification or assignment of properties and permissions

* what are [SID (Security IDentifiers) in computer security](https://en.wikipedia.org/wiki/Security_Identifier)?
	* in windows stuff a SID (Security IDentifier) is a unique, immutable identifier of a user, user group, or other security principal
	* a security principal has a single SID for life in a given domain
	* all properties of the principal are associated with the SID
		* including name





