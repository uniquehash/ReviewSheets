
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

Okay so basically css architecture is like any other architecture and you should not be dumb about it. be smart, code smart, debug dumb. biggest take away is to seperate your concerns as in presentation and content and functionality and structure should not be touching each other. aim to achieve the awkwardness of a middle school dance.



* Goals of Good CSS Architecture
	* predictable
		* css rules behave as expected
		* adding or updating rules does not affect unexpected parts of the site
	* reusable
		* css rules should be abstract and decoupled such that new components can be built quickly from existing parts without having to recode patterns and problems already solved
	* maintainable
		* adding rules and components to a page should not break any existing components 
	* scalable 
		* css should be easily managable by a single person or large engineering team
		* the css architecture is easily approachable without requiring a large learning curve
		* 

* CSS architecture bad practices 
	* modifying components based on who their parents are
		* sometimes there are visual elements that all look the same except one. 
			* bad idea: 
				* attempt to find a unique parent for the instance or create one and write a new rule to handle it 
			* why its a bad idea
				* the visual element created will not be predictable, it will have different behavior depending on where it is placed
				* not reusable or scalable custom code will be needed to handle different context 
				* not maintainable because during a redesign several rules would have to be updated, and someone naive to the codebase would have no fucking clue where that shit is 
	* overly complicated selectors 
		* attempting to keep html free from css markup
			* bad idea:
				* using long chains of type selectors 
			* why its a bad idea
				* its not predictable, since the css becomes tightly coupled with the html, and the html will change
				* its not reusable the selectors are pointing to an exact location in the html, meaning that they cannot be transplaced 
				* not maintainable or scalable since any change in the html will break the css rules 
	* overly generic class names
		* it is common to scope components sub-elements inside the components class name
			* bad idea: 
				* the parent component is used as a main scope followed by the smaller sub-scopes in the css rules
			* why its a bad news bear <i should have bear going rahhhhhhh here>
				* so the style of the subscopes wont spill into other rules but other rules could spill into them
				* generic class names lead to unpredictable css
	* making a rule do too much
		* coupling layout and styling 
			* bad idea:
				* having a rule that gives an element its look as well as its position 
			* why its a no no no no
				* basically its not predictable or reusable since if you reuse the class somewhere else for styling it will have the layout rule associated with it most likely fucking everything up, and if you want to reuse the layout component it will have the styling fucking everything up
	* determined root cause of all this evil
		* the bad practices place too much of the styling burden on css
		* html and css need to work together to do cool shit not placing the styling burden to heavily on either

* The "enlightend" path to css 
	* css should assume as little of the html structure as possible
	* css should define how a set of visual elements look and those elements should look as they are defined 
		* if a component should look different in a different scenario it should be called something different and the html shuold reflect that
	* css creates preset elements to be used by the html, the css essentially builds building blocks for html to use
	
* Best practices 
	* be intentional 
		* do one thing and do it right, essentially each visual element should be its own distinct entity and named appropriately
	* separate your concerns 
		* css components should be modular, they should know how to style themselves but not get to heavy into layout
	* namespace your classes
		* use naming conventions to namespace subelements of a main element
	* extend components with modifier classes 
		* each context that affect presentation should have its own modifier classe
	* organize your css into a logical structure 
		* organize css rules into four different categories 
			* base
				* reset rules 
				* element defaults 
			* layout 
				* positioning of site-wide elements 
				* generic layout helpers like grid systems
			* modules 
				* modules are reusible visual elements
					* components 
						* standalone visual elements 
						* example:
							* modal dialog box
					* templates
						* building blocks
						* do not stand on their own 
						* do not describe look and feel 		
						* single repeatable patterns that can be put together to form a component
						* mostly used by preprocessors 	 
			* state
				* styling that can be toggled on or off by js
	* use classes for styling and styling only 
		* all non-styled classes should have a prefix which describe its purpose 
			* js classes should have a prefix of .js-header for example 
			* support can be used for extra functionality
		* do not couple functionality and styling 
			* the same class should not be used as both a js hook and a css hook
	* name your classes with a logical structure 
		* each type of class should have a seperate naming convention 
			* example:
			```
				/* a component */
				.button-group {}
				
				/* a component modifier (modifying .button) */
				.button--primary {}
				
				/* a component sub-object (lives within .button) */
				.button__icon {}
				
				/* layout rules */
				.l-layout-method {}
				.grid {}
			
				/* state rules  */
				.is-state-type {}
			
				/* non-styled javascript hooks  */ 
				.js-action-name {}
			```

* tools to make your css life easier
	* preprocessors
		* help you write css faster not better
		* do not use features that  
			* nest rules purely for code organization 
			* use a mixin if you are not passing an argument, mixins without arguments are better used as templates that can be extended
			* use @extend on a selector that is not a single class 
			* use @extend for UI components in component modifier rules because you will lose the inheritance chain 
		* awesome features 
			* @extend
				* used to inherit rules of a previous css rule
				* should not extend anything that needs to be targeted by js at anypoint 
				* extend is great for templates 
			* %placeholder
	* css lint
		* points out problems with css code. 
			* basic syntax chekcing 
			* applying a set of rules to code that look for problematic patterns or signs of inefficiency 	
		* anti-patterns 
			* no IDs in selectors
			* no non-semantic type selectors in any multi-part rule
			* do not use more than 2 combinators in a selector
			* do not allow any class names that begin with "js-"
			* warn if frequently using layout and positioning for non "l-" prefixed rules
			* warn if a class defined by itself is later redefined as a child of something else 
	* html inspector 	
		* anti-patterns 
			* warn if the same ID is used more than once on a page
			* do not use any classes that are not mentioned in any stylesheet or pass a whitelist
			* modifier classes should not be used without their base class
			* sub-object classes should not be used when no ancestor contains the base class
			* plain old div or span elements without classes attached should notbe used in the html
