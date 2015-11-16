#(XML) eXtensible Markup Language
	* designed to store and transport data
	* designed to be both human- and machine-readable

### Difference between XML and HTML 
	* XML designed to carry data - with focus on what the data is 
	* HTML designed to display data - with focus on how data looks
	* XML tags are no predefined like HTML tags are
		* the author of an XML document must define both the tags and document structure 

### XML 
	* is extensible 
		* adding new tags to an XML document does not impede previous parser of the document 
		* removing tags does not change the structure of the document 
	* simplifies things 
		* simplifies data sharing 
		* simplifies data transport 
		* simplifies platform changes
		* simplifies data availability 
	* used to speratate data from presentation 
		* does not carry any information about how to be displayed 
	* uses a tree structure 
		* Root element <bookstore>
			* attribute "category"
			* element <book>
				* attribute "lang"
				* element <title>
					* text "everyday italian"
				* element <author>
					* text "giada de laurentiis"
				* element <year>
					* text "2005"
				* element <price>
					* text "30.00"
	* prolog defines the xml version and character encoding 
	* XML documents must have a root element 
	* XML documents must have a closing tag and the tags must match 
	* XML documents must be properly nested
	* XML attribute values must always be quoted 
	* XML have entity references that are esentially escape sequences 
		* &lt; 
			* less than 
				* < 
		* &gt;
			* greater than 
				* > 
		* &amp; 
			* ampersand
				* & 
		* &apos; 
			* apostrophe 
				* '
		* &quot;
			* quotation mark
				* "
	* XML white space is preserved 
	* an XML element is everything from the element start tag to the elements end tag 
		* can contain 
			* text 
			* attributes
			* other elements 
			* or a mix of the above
		* can be empty 
			* empty elements can use self closing tags
			* empty elements can have attributes 
	* XML attributes 
		* metadata should be stored as attributes, data as elements
		* cannot contain multiple values 
		* cannot contain tree structures 
		* are not easily expandable 
	* XML namespaces can be used to solve name conflicts 
		* use a prefix and a colon in decleration 
			* <h:table>
		* xmlns attribute can have gives a unique name space
			* can be placed at root element 
			* <h:table xmlns:h="www.blah.com">
		* using default namespace prevents the need to prefix every element since it is applied   
		  to all children 
	* XML files can be viewed in all major browsers raw

### (XSLT) eXtensible Stylesheet Language Transformation 
	* more sophisticated than CSS 
		* can add/remove elements and attributes to or from ouput files 
		* rearrange and sort elements
		* perform tests 
		* make decisions about which elements to hide or display 
	* uses XPath to find information in an XML document 
	* essentially a rewrite of XML for display

### (XPath) XML Path Language 
	* what is it 
		* a syntax for defining parts of an XML document 
		* uses path expressions to navigate in XML documents 
		* contains a library of standard functions 
		* a major element in XSLT 
		* used in XQuery, Xpointer and Xlink
		* w3c recommendation 
	* uses path expressions to select nodes or node-sets in an XML document 

### XLink 
	* used to create hyperlinks in XML documents 
		* any element in XML document can behave as a link
		* links can be defined outside the linked files 
		* w3c recommendation 
	* no browser support for Xlink in xml documents but they do support XLink in SVG
	* to use xlink we must declare the xlink namespace 
		* the type of link and the href is declared referencing the namespace in the individual elements 

### XPointer 
	* what is it
		* allows links to point to specific parts of an XML documents
		* uses Xpath expressions to navigate the xml document 
	* no browser support for XPointer 
		* used in other XML languages 
	* essentially a link with a pound to the id

### XML Doctypes 
	* a valid XML document must be well formed and conform to a document type definition 
		* these are called (DTD) document type definitions 
			* there are two types 
				* DTD - the orifinal document type definition 
				* XML Schema - XML based alternative to DTD
		* using a DTD independent groups of people can agree to use a standard DTD for exchanging
		  data
		* apps can use a standard DTD to verify that the data received from outside world is valid
		* used to verify your own data 















