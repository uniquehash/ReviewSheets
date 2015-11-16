# XPath 
	
### What's XPath
	a syntax for defining parts of an XML document 
	uses path expressions to navigate in XML documents
	contains a library of standard functions 
	a major element of XSLT 
	W3c recommendation 

### XPath Nodes
	XML documents are treated as trees of nodes 
	there are seven kind of nodes 
		element 
		attribute 
		text 
		namespace 
		processing 
		instruction 
		comment 
		document 
	atomic values 
		nodes with no children or parents 
	relationship between nodes
		parent 
			each element or attribute only has one parent 
		children 
			each element may have zero to many children 
		siblings 
			elements with the same parent
		ancestors 
			the parent of the parent of a node
		descendants 
			the child of a child of a node

### XPath syntax
	expression	
		nodename 
			selects all nodes with the label "nodename"
		/ 
			selects from the root node
		// 
			selects nodes in the document from the current node that match the selection no matter where they are
		. 
			selects the current node
		.. 
			selects the parent of the current node 
		@ 
			selects attributes 
	Path expression 
		bookstore 
			selects all nodes with the name "bookstore"
		/bookstore 
			selects the root element bookstore 
				any path that starts with / represents an absolute path to an element 
		bookstore/book
			selects all book elements that are children of bookstore 
		//book 
			selects all book elements no matter where they are in the document 
		bookstore//book 
			selects all book elements that are descendant of the bookstore element, no matter where they are under the bookstore element 
		//@lang
			selects all attributes that are named lang
	predicates 
		used to find a specific node or a node that contains a specific value 
			always embeded in [square brackets]
		Path expressions
			/bookstore/book[1]
				selects the first book element that is the child of the bookstore element 
			/bookstore/book[last()]
				selects the last book element that is the child of the bookstore element 
			/bookstore/book[last()-1]
				selects the last but one book element that is the child of the bookstore element 
			/bookstore/book[position()<3]
				selects the first two book elements that children of the bookstore element 
			//title[@lang]
				selects all the title elements that have an attribute named lang
			//title[@lang='en']
				selects all the title elements that have a "lang" attribute with a value of 'en'
			/bookstore/book[price>35.00]
				selects all the book elements of the bookstore element that have a price element with a value greater than 35.00
			/bookstore/book[price>35.00]/title
				selects all the title elements of the book element of the bookstore element that have a price element with a value greater than 35.00
	wildcards
		wild cards are useful mkayyyy
		Wildcard
			* 
				matches any element node
			@* 
				matches any attribute node
			node()
				matches any node of any kind
		path expressions
			/bookstore/*
				selects all the child element nodes of the bookstore element 
			//* 
				selects all elements in the document 
			//title[@*]
				selects all title elements which have at least one attribute of any kind
	selecting multiple paths 
		use the pipe | operator to select multiple paths
		path expression
			//book/title | //book/price
				selects all the title AND price elements of all book elements 
			//title | //price 
				selects all the title AND price elements in the document 
			/bookstore/book/title | //price 
				selects all the title elements of the book element of the bookstore element AND all the price elements in the document 

### XPath Axes 
	an axis defines a node-set relative to the current node
	AxisName 
		ancestor 
			selects all ancestors (parent, granparent) of the current node
		ancestor-or-self
			selects all ancestors of the current node and the current node itself 
		attribute 
			selects all attributes of the current node
		child 
			selects all children of the current node 
		descendant 
			selects all descendants of teh current node and the current node itself
		descendant-or-self
			selects all descendatns of the current node and the current node itself 
		following 
			selects everything in the document after the closing tag of the current node
		following-sibling 
			selects all siblings after the current node
		namespace 
			selects all namespace nodes of the current node
		parent 
			selects the parent of the current node 
		preceding 
			selects all nodes that appear before the current node in the document, except ancestors, attribute nodes and namespace nodes 
		preceding-sibling 
			selects all siblings before the current node
		self 
			selects the current node 
	location path expression 
		can be absolute or relative 
		three components 
			an axis
				defines the tree-relationship between the selected nodes and the current node
			a node-test
				identifies a node within an axis
			zero or more predicates
				further refines the selected node set
		example 
			axisname::nodetest[predicate]
		concrete examples 
			child::book
				selects all book nodes that children of the current node
			attribute::lang
				selects the lang attribute of the current node
			child::* 
				selects all element children of the current node 
			attribute::* 
				selects all attributes of the current node
			child::text()
				selects all text node children of the current node 
			child::node()
				selects all children of the current node
			descendant::book
				selects all book descendants of the current node
			ancestor::book
				selects all book ancestors of the current node
			ancestor-or-self
				selects all book ancestors of the current node and the current node if it is a book node 
			child::*/child::price
				selects all price grandchildren of the current node

### XPath operators 
	XPath expression return either a node-set, a string, a boolean or a number
	Operators 
		|
			computes two node-sets
			//book | //cd
		+ 	
			addition 
			6+3
		- 
			subtraction 
			6-3
		* 
			multiplication 
			6 * 4
		div 
			division 
			8 div 4
		= 
			equal 
			price = 9.80
		!=
			not equal 
			price != 9.80
		< 
			less than 
			price<9.80
		<= 
			less than or equal to
			price <= 9.80
		>
			greater than
			price > 9.80
		>= 
			greater than or equal to
			price >= 9.80
		or 
			or 
			price = 9.80 or price = 9.70
		and 
			and 
			price > 9.00 and price < 9.90
		mod
			modulus (division remainder)
			5 mod 2
			








 




