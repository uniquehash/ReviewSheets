
#May 1st - Ruby / Rails

Today we have the joy of setting up the dev environment. this will be fun, fun, fun, fun (it\"'"s friday)

got pow installed, got postgress installed, using the right version of ruby, got the right version of rails, shit on fleek.

Okay so postgres in it"'"s infinite wisdom needs a starting db that is created at instalation by the package manager. of course this didn"'"t happen which means that i had to create it using createdb. 

* possible error sources 
	* Pow versioning 
		* since im using 0.5 and the code base was built using 0.4 i should be wary of Pow issues. if im banging my head against the wall it might not be me.
	* Capestrano breaking
		* the installation said something about it breaking *shrug* we shall see
	* postgresql user
		* setting up databases is always a pain in the ass

* RVM vs Bundler
	* Bundler
		* is an installer that will easily install all dependencies 
	* RVM
		* is a package manager meant for managing multiple versions of ruby and gems. the point is to be able to have dependency sets (gemsets) ready to go for different ruby/rails projects.
	* Bundler with RVM
		* RVM designates where the gems should go and bundler installs them into the RVM designated place


#May 2nd - Ruby / Rails

alright today im gonna get the project running. got it all almost going except gotta get the DB shit working.

* bundle exec rake <command>
	* bundle exec 
		* command to execute a script in the context of the current bundle (with rvm means also gemset)
	* rake <command> 
		* rake is a make tool. you can use it to specify a task with prequisites. for example in the case of rake db:create:all the rake tool will create the appropriate databases found in the database.yml.

	* Thus using the commands above together you get rake to do a specific task within the context specified to bundler. in the case of bundle exec rake db:create:all you create the databases specified to rake in the database.yml in the context of the application that bundler is aware of (with the gems and rubies specified by RVM)

#May 7th - CSS and design

Well now it seems im on a weird path to learning css for the front-end things. Good opportunity to learn design in general while im at it sooooo im gonna do that. 

So basically css selectors are like xpath selectors. This is really awesome because of how deep i went into xpaths during the #scraperparties. This css shit my not be to bad. 

To run through a quick overview so far. Basically css rules are made of selectors and other stuff not really sure about the other stuff yet, but the selectors go and find the elements to style based on some expression just like xpath. What is really cool is that you can have multiple namespaces, which means theoritically you could have one css stylesheet for multiple webpages and stuff. It would be utter insanity to do that (probably) but that knowledge might prove useful in future hacky as fuck scenarios. 


#### Questions 

* what is a DIALOGUE element?


#### Vocab

* stylesheet
	* the file containing css is called a stylesheet
	* consists of a list of rules
		* each rule or rule set consists of selectors and decleration blocks

* [namespace](https://www.w3.org/TR/css-namespaces-3/)
	* i currently have no fucking clue

* [css qualified names](https://www.w3.org/TR/css3-namespace/#css-qnames)
	* a name explicitly located within a namespace 
	* meaning that identical identifiers and classes can be used for multiple namespaces as long as they are denoted by the appropriate namespace
	* this is done by indicating the appropriate namespace followed by "|" and then the selector
	```
		with namespace declarations
			@namespace veritas "http://veritas.catchme.com";
			@namespace "https://example.com/var";
		selecting between the different namespaces would be done as so 
			veritas|A	
				represents name A in the http//veritas.catchme.com namespace
			|B 
				represents the name B in that belongs to no namespace
			*|C 
				represents the name C in any namespace, including no namespace
			D
				represents the name D in the https://example.com/var namespace 		
	```	

* [selector](https://www.w3.org/TR/css3-selectors/) 
	* selectors are used to select which elements in the DOM created by html are to be styled 
	* selectors represent a structure
		* structure can be used as a condition that determines which elements a selector matches in a html DOM
		* selectors are case-insensitive		
		* types of selectors 
			* simple selector 
				* type selector 
					* the name of a DOM element type, specified by css qualified names
						* h1, span, div			
				* universal selector 
					* represents name of any element, specified by css qualified names
					* is essentially a wild card symbol
					* denoted by the "*" symbol
				* attribute selectors
					* the attribute of elements can be used to select elements 
					* select by attribute presence
						`h1[title]`
					* select by attribute presense and exact-match value
						`span[val="yes i am"]`
					* select multiple elements by presence and or value
						`span[hello="world"][goodbye]`
					* select by attribute with presence and partial-match value using the "~" symbol
						`a[rel~="copyright"]`
					* select by attribute with presence and exact-match or exact-match followed by "-" value using the "|" symbol
						`a[hreflang|="en"]`
					* select by attribute with presence and exact-match prefix value using the "^" symbol
						`object[type^="image/"]`
					* select by attribute with presence and exact-match suffix value using the "$" symbol
						`a[href$=".html"]`
					* select by attribute with presence and contains an exact-match substring using the "*" symbol
						`p[title*="hello"]`
				* class selectors 
					* the class attribute of elements can be used to select elements 
					* select by class presence 
						`.pastry {color: green}`
					* select by class presence for all elements with a particular name
						`h1.pastry {color:green}`
					* since the class attribute is an attribute, all the methods of attribute selection work for class selection
				* ID selectors 
					* the id attribute of an element can be used to select the element 
					* an id should only be assigned to a single element 
					* select by id presence 
						`#chapter1`
					* select by id presence for all elements with a particular name
						`h1#chapter1`
				* pseudo-classes
					* allows the selection of elements based on information not specified by the html DOM and that cannot be expressed using other simple selectors
					* always consists of the ":" symbol followed by the name of the pseudo-class and optionally by a value between parentheses
					* are allowed anywhere in a sequence of simple selectors after the leading type or universal selector, may be dynamic 
					* dynamic pseudo-classes 
						* an element may gain or lose a dynamic pseudo-class based user behavior
						* select a hyperlink that has not been visited using the ":link" symbol
							`a:link`
						* select a hyperlink that has been visited using the ":visited" symbol
							`a:visited`
						
 					 
						









# May 8th - CSS

Oh god now im gonna be post editiing previous days because of not finishing topics, and continuity of thought. eh fuck it. Today we learn about CSS architecture from this [philip walton article](http://philipwalton.com/articles/css-architecture/).

* Goals of Good CSS Architecture
	* predictable
		* css rules behave as expected
		* adding or updating rules does not affect unexpected parts of the site
		test one
	* reusable
		* 
	* maintainable



