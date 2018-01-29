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
		* sites
			* physical rather than logical groupings defined by one or more IP subnets
			* connections
				* holds the definition of connections and distinguishes low-speed connections from high-speed connections
			* independent of the domain and OU structure 
				* common across the forest
			* used to control network traffic generated by replication and also to refer clients to the nearest domain controlers
			* policies can be defined at the site level
		* Active Directory information is held on one or more peer domain controllers
			* each DC has a copy of Active Directory
			* member servers
				* servers joined to Active Directory that are not domain controllers
			* global catalogs
				* provide a global listing of all objects in the forest
				* replicate to themselves all objects from all domains
					* provide a global listing of objects in the forest
					* to minimize replication traffic and keep the GC database small only selected attributes of each object are replicated
				* replication
					* a subset of objects in the domain partition replicate to domain controllers that are configured as global catalogs
			* PAS (Partial Attribute Set)
				* can be modified by modifying the schema and marking attributes for replication to the GC
		* replication
			* synchronizes changes using multi-master replication
				* replication by default is pull rather than push
				* replicas pull changes from the server where the change was effected 
			* KCC (Knowledge Consistency Checker)
				* creates a replication topology of site links using the defined sites to manage traffic
			* intrasite replication is frequent and automatic as a result of change notification 
				* triggers peers to begin a pull replication cycle
			* intersite replication intervals are typically less frequent and do not use change notification 
				* configurable and can be made identical to intrasite replication
			* uses RPC (Remote Procedure Calls) over IP
				* between sites SMTP can be used for replication but only for changing the Schema, Configuration, or PAS (Partial Attribute Set) GCs
					* cannot be used for replicating the default Domain partition
	* trusting
		* to allow users in one domain to access resources in another Active Directory uses trusts 
		* trusts inside a forest are automatically created when domains are created
			* forest sets the default boundaries of trust and implicit trust is automatic for all domains within a forest
		* one-way trust
			* one domain allows access to users on another domain
			* other domain does not allow access to users on the first domain
		* two-way trust
			* two domains allow access to users on both domains
		* trusted domain
			* domain that is trusted
			* users have access to the trusting domain
		* transitive trust
			* a trust that can extend beyond two domains to other trusted domains in the forest
		* intransitive trust
			* a one way trust that does not extend beyond two domains
		* explicit trust
			* a trust that an admin creates
				* not transitive and is one way only
		* cross-link trust
			* an explicit trust between domains in different trees or in the same tree when a descendant/ancestor relationship does not exist between the two domains
		* shortcut
			* joins two domains in different trees
				* transitive
				* one or two-way
		* forest trust
			* applies to the entire forest
				* transitive
				* one or two-way
			* authentication across this type of trust is kerberos-based
			* transitive for all domains within the trusted forests
				* not transitive between forests
		* realm 
			* can be transitive or nontransitive 
			* one or two-way
		* external
			* connect to other forests or non-AD domains
			* nontransitive
			* one or two-way
		* PAM trust
			* a one-way trust used by Microsoft identity manager from a (possibly low-level) production forest to a 'bastion' forest which issues time-limited group memberships
	* Microsoft Active Directory management tools include
		* Active Directory Users and Computers
		* Active Directory Domains and Trusts
		* Active Directory Sites and Services
		* ADSI Edit
		* Local Users and Groups
		* Active Directory Schema snap-ins for MMC (Microsoft Management Console)

* what is [multi-master in database replication](https://en.wikipedia.org/wiki/Multi-master_replication)?
	* a method of database replication which allows data to be stored by a group of computers and updated by any member of the group
	* all members are responsive to client data queries
	* system is
		* responsible for propagating the data modifications made by each member to the rest of the group
		* resolving any conflicts that might arise between concurrent changes made by different members
	* multi-master replication can be contrasted with master-slave replication
		* a single member of the group is designated as the master for a given piece of data and is the only node allowed to modify that data item
		* other members wishing to modify the data item must first contact the master node
			* easier to achieve consistency among the members of the group 
			* less flexible
	* multi-master replication can also be contrasted with failover clustering
		* passive slave servers are replicating the master data in order to prepare for takeover in the event that the master stops functioning 
		* master is only server active for client interaction
	* advantages
		* increased availability
		* faster server response time
		* masters can be located in several physical sites
		* if one master fails other masters continue to update the database
	* disadvantages
		* most multi-master replication systems are only loosely consistent
			* violates ACID properties
		* eager replication systems are complex and increase communication latency
		* issues such as conflict resolution can become intractable as the number of nodes involved rises and latency increases
	* implementations
		* directory services
			* active directory
			* CA directory
			* openDS/openDJ
			* openLDAP
		* DMS (Database Management Systems)
			* apache couchDB
			* cloudant
			* eXtremeDB cluseter
		* oracle
		* microsoft SQL
		* mysql/mariaDB
		* postgreSQL
			* various options for synchronous multi-master replication exist
			* postgres-XL 
				* which is available under the mozilla public license
			* postgresXC
				* same license as postgreSQL itself
		* PostgreSQL BDR
			* aimed at eventual inclusion in PostgreSQL core
		* ingres

* what is [master/slave in database replication](https://en.wikipedia.org/wiki/Master/slave_(technology))?
	* a model of communication where one device or process has unidirectional control over one or more other device or process has unirectional control over one or more other devices
	* in some systems a master is selected from a group of eligible devices with other devices acting in the role of slaves

* what is a [high-availability cluster](https://en.wikipedia.org/wiki/High-availability_cluster)?
	* also known as HA clusters or fail-over clusters
	* groups of computers that support server applications that can be reliably utilized with a minimum amount of downtime
	* operate using high availability software to harness redundant computers in groups or clusters that provide continued service when system components fail

* what is [LDAP (Lightweight Directory Access Protocol)](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)?
	* an open vendor-neutral industry standard application protocol for accessing and maintaining distributed directory information services oveer an IP network
	* directory services play an important role in developing intranet and internet applications by allowing the sharing of information throughout the network
		* users
		* systems
		* networks
		* services
		* applications
	* directory services may provide any organized set of records often with hierarchical structure 
		* corporate email directory
	* common use of LDAP is to provide a central place to store usernames and passwords
		* single-sign on and federated identity is connected to this
	* based on simpler subset of standards contained within the X.500 standard
		* LDAP sometimes call X.500-lite
	* has influenced many internet protocols
		* XED (XML Enabled Directory)
		* DSML (Directory Service Markup Language)
		* SPML (Service Provisioning Markup Language)
		* SLP (Service Location Protocol)
	* protocol overview
		* starts an LDAP session by connecting to an LDAP server by default on TCP and UDP port 389 or port 636 for LDAPS
			* called DSA (Directory System Agent)
		* GC (Global Catalog)
			* available by default on ports 3268 and 3269 for LDAPS
		* all information is transmitted using BER (Basic Encoding Rules)
		* client sends an operation request to the server
			* does not need to wait for a response before sending the next request, server may send the response in any order
		* server sends responses in return
		* client may request the following operations
			* StartTLS
				* use the LDAPv3 TLS extension for a secure connection
			* Bind
				* authenticate and specify LDAP protocol version
			* Search
				* search for and/or retrieve directory entries
			* Compare
				* test if a named entry contains a given attribute value
			* Add a new entry
			* Delete an entry
			* Modify an entry
			* Modify Distinguished Name
				* move or rename an entry
			* Abandon
				* abort a previous request
			* Extended Operation
				* generic operation used to define other operations
			* Unbind
				* close the connection 	
				* not the inverse of Bind
	* directory structure
		* provides an interface with directories that follow the 1993 edition of the X.500 model
			* an entry consists of a set of attributes
			* an attribute has a name and one or more values
			* attributes are defined in a Schema
			* each entry has a unique identifier
				* DN (Distinguished Name)
					* consists of its RDN (Relative Distinguished Name) constructed from some attributes in the entry followed by the DN (Distinguished Name) of the parent entry
					* may change over the lifetime of the entry
					* to reliably and unambiguously identify entries a UUID might be provided in the set of operational attributes in a entry
		* LDAP is a binary protocol
		* represented in LDIF (LDAP Data Interchange Format)
	* operations
		* add
			* inserts a new entry into the directory-server database
			* LDAP-compliant servers will never dereference the DN transmitted in the add request when attempting to locate the entry
				* DNs are never dealiased
			* LDAP-compliant servers will ensure that the DN and all attributes conform to naming standards
			* the entry to be added must not exist and the immediate superior must exist
		* bind (authenticate)
			* when an LDAP session is created the authentication state of the session is set to anonymous
			* the bind operation establishes the authentication state for a session
			* simple bind and sasl plain can send the users DN and password in plaintext so the connections utilizing either Simple or SASL PLAIN should be encrypted using TLS 
			* the server typically checks the password against the userPassword attribute in the named entry
			* anonymous bind resets the connection to anonymous state
			* SASL bind 
				* simple authentication and security layer bind
				* provides authentication services through a wide range of mechanisms
				* kerberos or the client certificate sent with TLS
			* bind also sets the LDAP protocol version by sending a version number in the form of an integer
		* delete
			* LDAP client transmits a properly formed delete request to the server
			* a delete request must contain the DN of the entry to be deleted
			* request controls may also be attached to the delete request
			* servers do not dereference aliases when processing a delete request
			* only leaf entries may be deleted by a delete request 
			* some servers support an operational attribute hasSubordinates whose value indicates whether an entry has any subordinate entries
			* some servers support an operational attribute numSubordinates indicating the number of entries subordinate to the entry containing the numSubordinate attribute
			* some servers support the subtree delete request control permitting deltion of the DN and all objects subordinate to the DN 
			* delete requests are subject to access controls 
		* search and compare
			* search
				* search operation is used to both search and read entries
				* parameters
					* baseObject
						* name of the base object entry relative to which the search is to be performed
					* scope
						* what elements below the baseObject to search
						* baseObject
							* search just the named entry, typically used to read one entry
						* singleLevel
							* entries immediately below the base DN
						* wholeSubtree
							* the entire subtree starting at the base DN
					* filter
						* criteria to use in selecting elements within scope
						* not case-sensitive
							* matching and ordering rules determine matching, comparisons, and relative value reltionships	
						* example
							* `(&(objectClass=person)(|(givenName=John)(mail=john*)))`
								* will select "persons" where the matching rules for givenName and mail determine whether the values for those attributes match the filter assertion 
					* derefAliases
						* whether and how to follow alias entries
							* alias entries
								* entries that refer to other entries
					* attributes
						* which attributes to return in result entries
					* sizeLimit, timeLimit
						* maximum number of entries to return and maximum time to allow search to run
						* these values however cannot override any restrictions the server places on size limit and time limit
					* typesOnly
						* return attribute types only not attribute values
			* compare
				* takes a DN, an attribute name and an attribute value
				* checks if the named entry contains that attribute with that value
		* modify
			* used by LDAP clients to request that the LDAP server makes changes to existing entries
			* attempts to modify entries that do not exist will fail
			* subject to access control 
			* requires that the DN (distinguished name) of the entry be specified and a sequence of changes
			* each change in the sequence must be one of
				* add
					* add a new value which must not already exist in the attribute
				* delete
					* delete an existing value
				* replace
					* replace an existing value with a new value
			* LDIF example of adding a value to an attribute
			```
				dn: dc=example,dc=com
				changetype: modify
				add: cn
				cn: the-new-cn-value-to-be-added
				-
			```
		* modify DN
			* move/rename entry
			* takes the new RDN (Relative Distinguished Name), optionally the new parents DN and a flag that indicates whether to delete the values in the entry that match the old RDN
			* update operation is atomic
				* other operations will see either the new entry or the old one 
		* abandon
			* requests that the server abort an operation named by a message ID
			* server need not honor the request
			* neither Abandon nor a successfully abandoned operation sends a response
			* does not send a response
		* unbind
			* abandons any outstanding operations and closes the connection
			* the name is of historical origin and is not the opposite of the bind operation
			* clients can abort a session by simply closing the connection but they should use unbind
			* unbind allows the server to gracefully close the connection and free resources that it would otherwise keep for some time until discovering the client had abandoned the connection
			* also instructs the server to cancel operations that can be canceled and to not send responses for operations that cannot be canceled
	* schema
		* the contents of the entries in a subtree are governed by a directory schema 
			* a set of definitions and constraints concerning the structure of the directory information tree
		* attribute syntaxes
			* provide information about the kind of information that can be stored in an attribute
		* matching rules
			* provide information about how to make comparisons against attribute values
		* matching rules uses
			* indicate which attribute types may be used in conjunction with a particular matching rule
		* attribute types
			* define an object identifier (OID) and a set of names that may be used to refer to a given attribute and associates that attribute with a syntax and a set of matching rules
		* object classes
			* define named collections of attributes and classify them into sets of required and optional attributes
		* name forms
			* define rules for the set of attributes that should be included in the RDN for an entry
		* content rules
			* define additional constraints about the object classes and attributes that may be used in conjunction with an entry
		* structure rules
			* define rules that govern the kinds of subordinate entries that a given entry may have 
		* attributes are the elements responsible for storing information in a directory and the schema defines the rules for 
			* which attributes may be used in a an entry
			* the kinfs of values that those attributes may have
			* how clients may interact with those values
		* defines object classes
			* each entry must have an objectClass attribute containing
				* named classes defined in the schema
			* the schema definition of the classes of an entry defines what kind of object the entry may represent
			* the object class definition also define the list of attributes that must contain values and the list of attributes which may contain values
			* objectClasses can be inherited
			* single entry can have multiple objectClasses values

* what is [LDIF (LDAP Data Interchange Format)](https://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format)?
	* a standard plain text data interchange format for representing LDAP directory content and update requests
	* LDIF conveys directory content as a set of records
		* one record for each object or entry
	* represents update requests as a set of records
		* add
		* modify
		* delete
		* rename
	* content record format
		* each content record is represented as a group of attributes with records separated from one another by blank lines
		* individual attributes of a record are represented as single logical lines comprising "name: value" pairs
			* value data that do not fit within a portable subset of ASCII characters are marked with "::" after the attribute name and encoded into ASCII using base64 encoding
	* tools that employ LDIF
		* openLDAP utilities include tools for 
			* exporting data from LDAP servers to LDIF content records
			* importing data from LDIF content records to LDAP servers 
			* applying LDIF change records to LDAP servers
	* LDIF fields
		* DN (Distinguished Names)
			* refers to the name that uniquely identifies an entry in the directory
		* DC (Domain Component)
			* refers to each component of the domain
		* OU (Organizational Unit)
			* refers to the organizational unit or sometimes the user group that the user is part of
			* if user is part of more than one group may be specified
		* CN (Common Name)
			* refers to the individual object for whom/which you are querying
	* examples of LDIF
		* simple directory entry with several attributes
		```
			dn: cn=The Postmaster,dc=example,dc=com
			objectClass: organizationalRole
			cn: The Postmaster
		```
		* example of an LDIF record that modifies multiple single-valued attributes for two different directory entries
		```
			dn: CN=John Smith,OU=Legal,DC=example,DC=com
			changetype: modify
			replace:employeeID
			employeeID: 1234
			-
			replace:employeeNumber
			employeeNumber: 98722
			-
			replace: extensionAttribute6
			extensionAttribute6: JSmith98
			-

			dn: CN=Jane Smith,OU=Accounting,DC=example,DC=com
			changetype: modify
			replace: employeeID
			employeeID: 5678
			-
			replace:employeeNumber
			employeeNumber: 76543
			-
			replace: extensionAttribute6
			extensionAttribute6: JSmith14
			-
		```

* what is [BER (Basic Encoding Rules)](https://en.wikipedia.org/wiki/X.690#BER_encoding)?
	* format for Basic Encoding Rules specifies a self-describing and self-delimiting format for encoding ASN.1 data structures
	* each data element is encoded as 
		* a type identifier 
		* length description
		* actual data elements
		* end-of-content marker
	* these types of encodings are commonly called type-length-value or TLV encodings
		* allows a receiver to decode the ASN.1 information from an incomplete stream without requiring any pre-knowledge of the size, content or semantic meaning of the data
	* encoding structure
		* encoding of data does generally consist of four components which appear in the following
			* identifier octets
				* type
				* can be tagged with a unique tag number to distinguish that data from other members
				* can be implicit
			* length octets
				* length
			* contents octets
				* value
			* end-of-contents octets

* what is [keycloak](https://www.google.com/search?q=what+is+keycloak&oq=what+is+keycloak)?
	* [keycloak.org about](http://www.keycloak.org/about.html)?
		* an open source Identity and Access Management solution aimed at moder applications services
		* features
			* single-sign on
				* users authenticate with keycloak rather than individual applications
				* kerberos bridge
					* if users authenticate to workstations with kerberos (LDAP or active directory)
						* can also be automatically authenticated to keycloak without having to provide their username and password again after login on to the workstation
			* identity brokering and social login
				* enable login with social networks through admin console
					* select networks you wish to add
				* can authenticate users with existing OpenID Connect or SAML 2.0 identity providers
			* user federation
				* keycloak has built-in support to connect to existing LDAP or Active Directory servers
				* implement your own provider if you have users in other stores 
			* client adapters
				* keycloak client adapters are available for a number of platforms and programming languages
				* built on standard protocols so you can use any OpenID Connect Resource Library or SAML 2.0 service provider library out there
				* can also opt to use a proxy to secure your applications which removes the need to modify your application at all
			* admin console
				* centrally manage all aspects of the keycloak server
				* enable and disable various features 
				* configure identity brokering and user federation
				* create and manage applications and services
				* define fine-grained authorization policies
				* manage users including permissions and sessions 
			* account management console
				* users can manage their own accounts
				* update the profile 
				* change passwords
				* setup two-factor authentication
				* manage sessions
				* view history for account
				* enabled social login or identity brokering users can also link their accounts with additional providers to allow them to authenticate to the same account with different identity providers
			* standard protocols
				* keycloak is based on standard protocols and provides support for OpenID Connect, OAuth 2.0, SAML
			* authorization services
				* provides fine-grained authorization services as well
				* allows you to manage permissions for all your services from the keycloak admin console
				* gives you the power to define exactly the policies you need 
	* [keycloak intro video](https://www.youtube.com/watch?v=lUO4hjA6bME) 















































* what is [OpenID Connect](https://en.wikipedia.org/wiki/OpenID_Connect)?
	* an authentication layer on top of OAuth 2.0
	* standard is controlled by the OpenID foundation
	* description
		* a simple identity layer on top of the OAuth 2.0 protocol
		* allows computing clients to verify the identity of an end-user based on the authentication performed by an authorization server
		* allows computing clients to obtain basic profile information about the end-user in an interoperable and REST-like manner 
		* specifies a RESTful HTTP API using JSON as a data format
		* allows a range of clients to request and receive information about authenticated sessions and end-users
			* is extensible

* are there any good resources to learn more about OpenID Connect?
	* [white paper by ping identity](https://web.archive.org/web/20170918213848/https://www.pingidentity.com/content/dam/ping-6-2-assets/Assets/white-papers/en/openid-connect-white-paper.pdf?id=b6322a80-f285-11e3-ac10-0800200c9a66&id=b6322a80-f285-11e3-ac10-0800200c9a66&id=b6322a80-f285-11e3-ac10-0800200c9a66&id=b6322a80-f285-11e3-ac10-0800200c9a66)
	* [the actual spec](http://openid.net/connect/)

* what is [SAML 2.0 (Security Assertion Markup Language)](https://en.wikipedia.org/wiki/SAML_2.0)?
	* a version of the SAML standard for exchanging authentication and authorization data between security domains
	* an XML-based protocol that uses secruity tokens containing assertions to pass information about a principal between SAML authority named an identity provider and a SAML consumer named a service provider 
		* enables web-based cross-domain single sign-on (SSO)
			* helps reduce the administrative overhead of sitributing multiple authentication tokens to the user
	* SAML 2.0 assetions
		* a package of information that supplies zero or more statements made by a SAML authority
		* usually made about a subject represented by that subject element
		* the same as SAML basically

* what is [SAML (Security Assertion Markup Language)](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language)?
	* an open standard for exchaning authentication and authorization data between parties in particular between a identity provider and a service provider
		* an XML-based markup language
		* a set of XML-based protocol messages
		* a set of protocol message bindings
		* a set of profiles utilizing all of the above
	* origin
		* single sign-on is relatively easy to accomplish within a security domain
		* extending SSO across security domains is more difficult and resulted in the proliferation of non-interoperable proprietary technologies
			* SAML web browser SSO profile was specified and standardized
	* principles
		* three roles
			* the principal
				* typically a user
				* requests a service from the service provider
			* the identity provider
				* receives request for identity assertions
				* may request some information from the principal to authenticate
			* the service provider
				* requests and obtains an identity assertion from the identity provider
				* based on assertion makes an access control decision
	* design 
		* XML
			* most SAML exchanges are expressed in a standardized dialect of XML which is the root for the name SAML
		* XML Schema	
			* SAML assertions and protocols are specified in part using XML Schema
		* XML signature
			* both SMAL1.1 and SAML 2.0 use digital signatures for authentication and message integrity
		* XML Encryption
			* provides elements for encrypted name identifiers, encrypted attributes, and encrypted assertions
		* HTTP
			* communication protocol
		* SOAP
			* fuck you 
		* Assertions
			* contains a packet of security information
			* SAML defines XML-based assertions and protocols, bindings, and profiles
			* SAML Core refers to the general syntax and semantics of SAML assertions as well as the protocol used to request and transmit those assertions from one system entity to another
			* SAML protocols refers to what is transmitted not how
			* SAML binding
				* determines how SAML requests and responses map onto standard messaging or communications protocols
			* SAML profile 	
				* a concrete manifestation of a defined use case using a particular combination of assertions, protocols and bindings
			* relying party interprets an assertion as follows
				* Assertion A was issued at time t by issuer R regarding subject S provided conditions C are valid
			* contain statements that service providers use to make access-control decisions
				* authentication statements
					* assert to the service provider that the principal did indeed authenticate with the identity provider at a particular time using a particular method of authentication
				* attribute statements
					* assers that a subject is associated with certain attributes
					* relying parties use attributes to make access-control decisions
				* authorization decision statement
					* asserts that a subject is permitted to perform action A on resource R given evidence E
					* the expressiveness of authorization decision statements is intentionally limited
		* protocols
			* describe how certain SAML elements are packaged within SAML request and response elements and gives the processing rules that SAML entities must follow when producing or consuming these elements
			* the most important type of SAML protocol request is called a query
				* makes a query directly to an identity provider over a secure back channel
				* three types of queries that correspond to the types of statement
					* authentication query
					* attribute query
						* the most important
					* authorization decision query
			* SAML 2.0 expands the notion of protocols considerably 
				* assertion query and request protocol
				* authentication request protocol
				* atrifact resolution protocol
				* name identifier management protocol
				* single logout protocol
				* name identifier mapping protocol
		* bindings
			* a mapping of a SAML protocol message onto standard messaging formats and/or communications protocols
		* profiles
			* describes in detail how SAML assertions, protocols, and bindings combine to support a defined use case
			* the web browser SSO profile is the most important SAML profile
			* SSO profiles
				* web browser SSO profile
				* enhanced client or proxy profile
				* identity provider discovery profile
				* single logout profile
				* name identifier management profile
			* artifact resolution profile
			* assertion query/request profile
			* name identifier mapping profile
			* SAML attribute profiles
	* use
		* request the target resource at the service provider
		* redirect to the SSO service at the identity service provider
		* requests the SSO service at the identity service provider
		* respond with an XHTML form
		* request the assertion consumer service at the service provider
		* redirect to the target resource
		* request the target resource at the service provider again
		* respond with requested resource

* what is a [SAML identity provider](https://en.wikipedia.org/wiki/Identity_provider_(SAML))?
	* a system entity that issues authentication assertions in conjunction with a single sign-on profile of the SAML
	* in SAML domain model
		* SAML authority is any system entity that issues SAML assertions 
	* two important examples of SAML authorities are
		* authentication authority
		* attribute authority
	* SAML authentication authority 
		* is a system entity that produces SAML authentication assertions
	* SAML attruibute authority
		* a system entity that produces SAML attribute assertions
	* SAML identity provider
		* SAML authentication authority that participates in one or more SSO profiles of SAML

* what is a [SAML service provider](https://en.wikipedia.org/wiki/Service_provider_(SAML))?
	* a system entity that receives and accepts authentication in conjunction with a single sign-on profile of SAML
	* in SAML domain model
		* SAML relying party is any system entity that receives and accepts information from another system entity

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

* what is [PGP (Pretty Good Privacy)](https://en.wikipedia.org/wiki/Pretty_Good_Privacy)?
	* an encryption program that provides cryptographic privacy and authentication for data communication
	* used for signing encrypting and decrypting
		* texts
		* emails
		* files
		* directories
		* whole disk partitions
	* follow the OpenPGP standard
		* RFC 4880
	* design
		* uses a serial combination
			* hashing
			* data compression
			* symmetric-key cryptography
			* asymmetric-key cryptography
		* each public key is bound to a user name or email address
		* includes both web of trust and x.509
		* compatibility
			* as PGP evolves versions that support newer features and algorithms are able to create encrypted messages that older PGP systems cannot decrypt
				* even with a valid private key
		* confidentiality
			* PGP can be used to send messages confidentially
			* messages encrypted using symmetric encryption
				* symmetric key used once and known as a session key
			* the message and session key is sent to receiver 
				* enveloped with asymmetric encryption
		* digital signatures
			* PGP supports message authentication and integrity checking
				* integrity checking is used to detect whether a message has been altered since it was completed
				* message authentication is used to determine whether it was actually sent by the person or entity claimed to be the sender 
		* web of trust
			* networks of trusted users are created each authenticating the identity of the other
		* certificates
			* trust signatures
				* can be used to support creation of certificate authorities
				* indicates that both that the key belongs to its claimed owner and that the owner of the key is trustworthy to sign other keys at one level below their own
			* PGP always included ways to revoke identity certificates
				* now supports certificate expiration dates
		* security quality
			* no known method which will allow a person or group to break PGP encryption by cryptographic or computational means
			* depends on the assumption that the algorithms used are unbreakable by direct cryptanalysis
	* history
		* PGP was exported out of the USA via books because free speach is america but software is war tool

* What does [Group Policy refer to in the security ecosystem](https://en.wikipedia.org/wiki/Group_Policy)?
	* a feature of microsoft windows NT family of operating systems that controls the working environment of user accounts and computer accounts
	* provides centralized management and configuration in an Active Directory environment for
		* operating systems
		* applications
		* user settings
	* part of microsofts IntelliMirror technologies
		* aims to reduce the cost of supporting users
	* IntelliMirror technologies
		* relate to the management of disconnected machines or roaming users and include
			* roaming user profiles
			* folder redirection
			* offline files	
	* Local Group Policy
		* a version of Group Policy that allows Group Policy Object management on standalone and non-domain computers
	* operation
		* in part controls what users can and cannot do on a computer system
			* enforce password complexity policy
			* allow or prevent unidentified users from remote computers to connect to a network share
			* block access to windows task manager
			* restrict access to certain folders	
	* GPO (Group Policy Object)
		* a set of group policy configurations
	* enforcement
		* GPO (Group Policy Object) that resides on a single machine only applies to that computer
		* to apply a GPO to a group of computers Group Policy relies on Active Directory for distribution
		* Active Directory can distribute GPOs to computers which belong to a windows domain
		* by windows refreshes its policy setting every 90 minutes with a random 30 minutes offset
		* on domain controllers windows does so every 5 minutes
		* for all GPOs that apply to the machine and to logged-on users during refresh it
			* discovers
			* fetches
			* applies
		* some settings only apply during startup or user logon
	* Group Policy Objects processing order
		* local
			* any settings in the computers local policy
			* individual group policies per user accounts
		* site
			* any group policies associated with the Active Directory site in which the computer resides
			* if multiple policies are linked to a site they are processed in the order set by the admin
		* domain
			* any group policies associated with the windows domain in which the computer resides
			* if multiple policies are set they are processed in the order set by the admin
		* OU (Organizational Unit)
			* group policies assigned to the Active Directory OU (Organizational Unit) in which the computer or user are placed
			* if multiple policies are linked to OU they are processed in the order set by the admin
	* RSoP (Resultant Set of Policy)
		* the resulting Group Policy settings applied to a given computer or user
	* inheritance
		* policy set inside a hierarchical structure is ordinarily passed from parent to children
		* can be blocked or enforced to control what policies are applied at each level
		* if higher level admin creates a policy that has inheritance blocked by a lower level admin this policy will still be processed
	* filtering
		* WMI filtering is the process of customizing the scoper of the GPO (Group Policy Object) by choosing a WMI (Windows Management Instumentation) filter to apply
		* allows admins to apply a GPO only to for example computers of specific models, RAM, installed software, ect...
		
* what is [privacyIDEA](https://en.wikipedia.org/wiki/PrivacyIDEA)?
	* a opensource enterprise ready two factor authentication system which is multi-tenency and multi-instance-capable
	* field of use
		* provides an authentication backend for various kinds of applications
			* ssh
			* vpn
			* web applications
		* meant to replace classical proprietary two factor authentication systems
			* RSA SecurID
			* Vasco
		* supports
			* single sign-on
			* SAML
		* possible to login with a second factor to windows desktops using a privacyIDEA Credential Provider
	* authentication devices
		* supports a wide variety of authentication devices
			* hardware tokens
				* Feitian C200
				* Yubikey
			* smartphone apps compliant to HOTP and TOTP
				* google authneticator

* what is a [YubiKey](https://en.wikipedia.org/wiki/YubiKey)?
	* a hardware authentication device manufactured by Yubico that supports
		* one-time passwords
		* public key encryption and authentication
		* U2F protocol developed by the FIDO Alliance
	* allows users to securely log into their accounts by 
		* emitting otp
		* using a FIDO-based public/private key pair generated by the device
	* also allows for storing of static passwords for use at sites that do not support otp
	* otp algorithm support
		* HOTP (HMAC-based one time password)
		* TOTP (time-based one time password)
	* identifies itself as a keyboard that delivers the otp over the USB HID protocol
	* modhex
		* emits passwords in a modified hexadecimal alphabet 
		* `cbdefghijklnrtuv` map to `0123456789abcdef`

* what [OATH (initiative for open authentication)](https://en.wikipedia.org/wiki/Initiative_for_Open_Authentication)?
	* an industry-wide collaboration to develop an open reference architecture using open standards to promote the adoption of strong authentication

* what is the [FIDO (Fast IDentity Online) Alliance](https://en.wikipedia.org/wiki/FIDO_Alliance)?
	* an industry association of business companies launched in february 2013 to address the lack of interoperability among strong authentication devices and the problems users face creating and remembering multiple usernames and passwords
	* more than 260 companies
	* specification
		* aims to support
			* full range of authentication technologies
				* biometrics
				* voice recognition
				* facial recognition
			* existing solutions and communications standards
				* TPM (Trusted Platform Modules)
				* usb security tokens
				* eSE (embedded Secure Elements)
				* smart cards
				* NFC (near field communication)
		* emphasizes a device-centric model 
		* two user experiences
			* U2F (Universal Second Factor) protocol
				* an open authentication standard that stregthens and simplifies two-factor authentication using specialized USB or NFC devices based on similar technology found in smart cards
			* UAF (Universal Authentication Framework protocol
		
* what is [U2F (Universal 2nd Factor) authentication](https://en.wikipedia.org/wiki/Universal_2nd_Factor)?
	* an open authentication standard that strengthens and simplifies two-factor authentication using specialized USB or NFC devices based on similar security technology found in smart carads 
	* browser support
		* native
			* chrome
			* firefox
			* opera

* what is a [windows domain](https://en.wikipedia.org/wiki/Windows_domain)?
	* a form of computer network in which all user accounts, computers, printers and other security principals are registered with a central database located on one or more clusters of central computers known as domain controllers
	* authentication takes place on domain controllers
	* each person who uses computers within a domain receives a unique user account that can then be assigned access to resources within the domain
		* this is in contrast of a workgroup in which each computer maintains its own database of security principals
	* configuration
		* can connect to a domain via LAN, WAN, or VPN
		* users of a domain are able to use enhanced security for their VPN connection due to the support for a certification authority which is gained when a domain is added to a network
			* smart cards and digital certificates can be used to confirm identities and protect stored information
		* domain controller
			* directory resides on computers athat are configured as domain controllers
			* suitable for networks with more than 10 PCs
			* a domain is a logical grouping of controllers
		* integration
			* samba is software that can make non-windows computers part of the domain

* what is a [domain controller](https://en.wikipedia.org/wiki/Domain_controller)?
	* a server computer that responds to security authentication requests within a windows domain
	* allows for a user to be granted access to a number of computer resources with the use of a single username and password combination
	* windows servers can be one of three kinds
		* AD domain controllers
			* provides identity and authentication
		* AD member servers
			* provide complimentary services like file repositories and schema
		* windows workgroup stand-alone servers

* what is [WMI (Windows Management Instrumentation)](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation)?
	* a set of extensions to the windows driver model that provides an operating system interface through which instrumented components provide information and notification
	
	
* what is the [ WDM (Windows Driver Model)](https://en.wikipedia.org/wiki/Windows_Driver_Model)?
	* a framework for device drivers
	* WDM drivers are layered in a complex hierarchy and communicate with each other via IRPs
	* by conforming to WDM drivers can be binary compatible and source-compatible across
		* Windows 98
		* Windows Me
		* Windows 2000
		* Windows XP
		* Windows Server 2003
		* Windows Vista
	* designed to be forward-compatible but not backwards compatible
	* function driver
		* the main driver for a device
		* written by the device vendor and is required 
		* can service more than one device
		* class drivers
			* types of function drivers that are kinda like built-in framework drivers that miniport and other class drivers can be built on top of 
			* provide interfaces between different levels of WDM architecture
			* common functionality between different classes of drivers can be written into the class driver and used by other class and miniport drivers
			* the lower edge of the class driver will have its interface exposed to the miniport driver
			* the upper edge of the top level class drivers is operating system specific 
			* class drivers can be dynamically loaded and unloaded as well
			* they can do class specific functions that are not hardware or bus-specific 
		* miniport drivers
			* there are also function drivers for USB, audio, SCSI, and network adapters
			* hardware specific but control access to the hardware through a specific bus class driver
		* bus drivers
			* services a bus controller, adapter, or bridge
			* microsoft provides bus drivers for the most common buses such as 
				* PCI
					* local computer bus for attaching hardware devices in a computer
				* PnPISA
					* a computer bus with a specification that facilitates the discovery of a hardware component in a system without the need for physical device configuration or user intervention in resolving resource conflicts
				* SCSI
					* a set of standards for physically connecting and transferring data between computers and peripheral devices
				* USB
					* universal serial bus is an industry standard that defines
						* cables
						* connectors
						* communications protocols between computers and devices for
							* connection
							* communication
							* power supply 
				* FireWire
					* an interface standard for a serial bus for high-speed communications and isochronous real-time data transfer
			* each software vendor can create their own bus drivers if needed 
			* bus driver can service more than one bus
		* filter drivers
			* optional drivers that aff value to or modify the behavior of a device and many be non-device drivers
			* can also service one or more devices
			* upper level filter drivers sit above the primary driver for the device 
			* lower level filter drivers sit below the function driver and above the bus driver
			* driver service
				* a type of kernel-level  filter driver implemented as a windows service that enables applications to work with devices
	* criticism
		* interactions with power management events and plug and play are difficult
			* leads to a variety of situations where windows machines cannot go to sleep or wake up correctly due to bugs in driver code
		* I/O cancellation is almost impossible to get right
		* thousands of lines of support code are required for every driver
		* no support for writing pure user-mode drivers

* what are [IRPs (I/O Request Packets)](https://en.wikipedia.org/wiki/I/O_request_packet)?
	* kernel mode structures that are used by WDM (Windows Driver Model) and Windows NT device drivers to communicate with each other and with the operating system
	* they are data structures that describe I/O requests and can be thought of as "I/O request descriptors"
	* by passing in the pointer to a data structure it prevents the need to pass many small arguments to the driver like
		* buffer address
		* buffer size
		* I/O function type
		* ect...
	* the IRP with all of its parameters can be put on a queue if the I/O requests cannot be performed immediately
	* I/O completion is reported back to the I/O manager by passing its address to a routine for that purpose called IoCompleteRequest

* what is [WDF (Windows Driver Frameworks)](https://en.wikipedia.org/wiki/Windows_Driver_Frameworks)?
	* a set of microsoft tools nad libraries that aid in the creation of device drivers for windows
	* complements WDM (Windows Driver Model) abstracting away much of the boilerplace complexity in writing Windows drivers
	* provides new object-oriented programming model for windows driver development
	* the primary goals of WDF is conceptual scalability and reduced duplication
	* there are 3 types of WDF drivers
		* KMDF (Kernel-Mode Driver Framework)		
			* standard kernel-mode device drivers
		* UMDF v1 (User-Mode Driver Framework)
			* user-mode drivers using a C++ COM-based API
		* UMDF v2 (User-Mode Driver Framework)
			* user-mode drivers with syntactic parity of KMDF
		
	













