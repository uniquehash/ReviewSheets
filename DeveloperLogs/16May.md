
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
					* user action pseudo-classes
						* sometimes people interact with elements and things requiring how they are styled to be changed. css has three pseudo-classes for selecting elements being used by the user.
							* select an element that a user designates with a pointing devices though not necessarily activating it
								* :hover
							* select an element that a user is interacting with a pointing device, like between the time a user presses the mouse button and releases it. 
								* :active
					 		* select an element that is currently being focused on by the user, like when tabed to or when a input element is accepting type
								* :focus
					* target pseudo-class 
						* 		 
						










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
			* why its a bad news bear ( i should have bear going rahhhhhhh here)
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

#May 12 - preprocessor galor

here we learn to use the beautiful preproccessors that allow us to add additional concepts into css like inheritance and stuff

####Questions 

* What is a preprocessor?
* What does interpolation mean?
* What is a key selector?



####Following the [html & css advanced guide](http://learn.shayhowe.com/advanced-html-css/performance-organization/)

* Style architecture 
	* separate style based on intent (separation of concerns)
		* Base
			* base css for neutral items 
		* Components
			* reusible visual elements 
		* Modules
			* compenent visual elements
	* [object oriented css](http://oocss.org/) 
		* Nicole Sullivan (idol person)
		* separate layout and feel 
		* separate content from container
	* [scalable & modular architecture css](https://smacss.com/)
		* Jonathan Snook (idol person)
		* separate style into 5 components 
			* base
				* core element styles, general defaults
			* layout 
				* identifies the sizing and gris styles 
			* module 
				* specific styles targeting indivisual parts of the page
					* navigation, feature
			* state
				* used to augment or overridde other styles for modules with changing states
			* theme	
				* styles based around look and feel of different modules
	
* performance driven selectors
	* keep selectors short 
		* limit the use of combinators, stick to simple selectors
	* favor classes 
		* key selector
			* selectors are rendered from right to left
			* the selector at the end of a selector furthese to the right, identifies the first element the browser is going to find
		* use classes instead of long chains 
		* do not prefix class selectors with an element
		* avoid using id
	* reusable code
		* reuse classes that use the same styling 
	* minify and compress files
		* gzip compression 
			* takes common files, identifies similar strings to compress down, the more matching strings the more it compresses. 
		* measuring compression 
			* google chrome web inspector has a tool for performance 
		* image compression 
			* image compression can reduce the quality of the image itself 
				* lossless compression is when there is no quality loss
			* [imageOptim](https://imageoptim.com/mac)
				* compresses both jpg and png 	
			* setting the height and width attributes of the img html tag increases performance
	* reduce http requests 
		* combine like files 
			* combine all of the css files into one file
			* combine all of the js files into one file 
			* css file should be loaded at the beginning of the document within the head 
			* javascript file should be loaded at the end of the document before the closing body tag
		* image sprites 
			* [spriting images](http://www.w3schools.com/css/css_image_sprites.asp)  
				* combining images into one background image 
				* use css to change where the positioning of the image is to display the correct image
		* image data uri
			* [data uri](https://css-tricks.com/data-uris/)
				* encode image data directly into html and css with a data uri, no http request
			* useful when the data never changes 
			* hard to maintain 
			* not backwards compatible 
			* generate data uri
				* [converters](http://websemantics.co.uk/online_tools/image_to_data_uri_convertor/)
				* [pattern generators](http://www.patternify.com/)
		* cache common files
			* set within the .htcaccess file 

* containing floats
	* allow elements to appear next to, apart from one another 
	* provide the ability to build a natural flow within a layout and allow elements to interact with one another based on their size and size of their parents
	* when floated an elements position is dependent on the other elements positioned around it
	* classic problems with float
		* parent element that contains many floated elements 
			* content on the page will respect the size and placement of the floated children element, but these floated elements no longer impact the outer edges of the parent container
			* the parent essentially loses the context of exactly what it contains and collapses thus giving the parent element a height of 0 and ignoring various other properties 
			* <b>solution</b> place an empty element with the css rule `clear: both` just before the parent elements closing tag
			* <b>solution</b> [method for containing floats](http://www.ejeliot.com/blog/59)
				* overflow technique 
					* use the css `overflow` property 
						* set the `overflow` property to `auto` within the parent element will contain the floats, resulting in an actual height for the parent element 
						* for IE 6 a `height` and `width` must be given to the parent element 
					* drawbacks 
						* adding styles or moving nested elements that span outside of the parent will not work as expected
						* browsers treat the overflow property differently 
					* code snippet 
						```
							.box-set {
							  overflow: auto;
							}
						```		
				* [clearfix technique](http://nicolasgallagher.com/micro-clearfix-hack/)
					* more complex but better supported 
					* based of using the `:before` and `:after` pseudo-elements on the parent element 
						* create hidden elements above and below the parent element 
						* `:before` 
							* used to prevent the top margin of child elements from collapsing by creating an anonymous table-cell element using the css rule `display: table;`
							* also helps ensure consistency within IE 6 and 7
						* `:after`
							* used to prevent the bottom margin of child elements from collapsing, as well to clear the nested floats
					* adding the `*zoom` property to the parent element triggers the `hasLayout` [mechanism](http://www.satzansatz.de/cssd/onhavinglayout.html)
						* determines how elements should draw and bound their content, as well as how elements should interact with and relate to other elements 	
					* code snippet 
					```
						.parent-set:before,
						.parent-set:after {
						  content: "";
  						  display: table;
						}
						.parent-set:after {
						  clear: both;
						}			
						.parent-set {
						  *zoom: 1;
						}	
					```	
				* effectively containing floats
					* assign a class to the parent element of the float elements
					* group class name 
						* all parents are assigned the group class name thus solving all the problems 
						
* fine-tune control over the [positioning of elements](http://alistapart.com/article/css-positioning-101) 
	* the `position` property controls how elements are positioned 			
	* accepts 5 values
		* position static 
			* elements default to the static position 
				* they do not have nor will they accept any specific box offset properties 
				* will be position as intended with default behavior 
		* position relative 
			* accepts the box offset properties 
				* the offset is based off the default position of the element in normal flow
				* top
					* prioritized over bottom
				* right 
					* prioritized by the direction in which the language of the page is written in 
				* bottom 
				* left
			* allows the element to be precisely positioned, shifting the element from its default position
			* specify how an element should be displaced from its default position 
			* will overlap and underlap on top of other elements without colisions
		* position absolute 
			* accepts box offset properties 
				* the offset is based off the positioning of the relative/absolute parent of the element 
			* removed from the normal flow of the document 
				* positioned directly in relation to their containing parent whom is relatively or absolutely positioned 
			* not specifying a offset will move the element to the top left of its parents position
				* if no relative or absolute parent found, will be positioned in relation to the body of the page
			* if an element does not have a specific height or width and is absolutely positioned using a combination of top and bottom offsets the element will inheret the size of its parent 	
		* position fixed 
			* essentialy like absolute except the position is relative to the browsers viewport and does not scroll with the page
				* will always be in the same spot no matter what the user does
			* does not work with IE 6
			* accepts box offset properties 
				* based on viewport
			* fixed header or footer
				* often used to create fixed headers and footers
				* code snippet
					```
						body {
						  background: #eaeaed;
						}
						footer {
						  background: #2db34a;
						  bottom: 0;
						  left: 0;
						  position: fixed;
						  right: 0;
						}
					```
	* [z-index property](http://www.impressivewebs.com/a-detailed-look-at-the-z-index-css-property/) 
		* allows control over the order in which elements are layerd on top of each other
		* default z positioning 
			* in the order inwhich the elements appear in the DOM 
		* z positioning is only functional when the `position` property has particular values 
			* relative 
			* absolute
			* fixed

* preprocessor 
	* a program that takes one type of data and converts it to another type of data
	
* haml 
	* an html preproccessor 
	* doctype
		* which doctype to use is explicit `!!! 5` translates to !doctype html otherwise will use default doctype of html 1.0
	* [declaring elements](http://www.screencasts.org/episodes/introduction-to-haml)
		* haml elements only have the opening tag 
		* elements are initialized with the `%` symbol
		* identation is used to show nesting 	
			* identation must be consistent like python
		* text can either be on the same line of a declared element or indented before it. on or the either
		* attributes 
			* declared directly after an element within either `{}` or `()` symbol 
				* `{}` is ruby syntax
					* do assignment the ruby way
					```
						%img{src: "shady.jpg", alt: "this is a shady jpg"}
					``` 
				* `()` is html syntax	
					* do assignment the html way
					```
						%img(src="shady.jpg" alt="this is a shady jpg")
					```
				* both compile to same html 
					```
						<img src="shady.jpg" alt="this is a shady jpg">
		* classes & ids
			* class and ids can be declared the same way as all other attributes 	
			* they can also be assigned using a different syntax 
				* you can use a `.` notation to assign classes 
				```
					%section.feature 
					%section.feature.special
				```
				* you can use a `#` notation to assign ids 
				```
					%section#hello
					%section#hello.feature(role="region")
				```
				* assigning classes and ids to divs
					* you can omit the `%div` tag
		* boolean attributes 
			* handled the same way as the syntax chosen
			```
				%input{type: "checkbox", checked: true}
				%input(type="checkbox" checked=true)
			```
		* escaping text 
			* major benefit of haml is the ability to evaluate and run ruby 
			* not always desired 
				* text, and lines of code can be escaped by using the `\` symbol
				```
					.author
						= @author
						\= @author		
				```
				* compiles to html
				```
					<div class="author">
					  Oliver Belanger
					  = @author
					</div>
				```
		* text escaping alternatives 
			* sometimes you need to do ruby hacks to get the desired output
			```
				%p 
					shay is 
					= succeed "." do
						%a{href: "#"} awesome
			```
			* compiles to html
			```
				<p>Shay is <a href="#">awesome</a>.</p>
			```
		* comments 
			* comments are made using the `/` symbol
			* multi line comments are just idented under the `/` symbol
		* conditional comments
			* to create a conditional comment use the `[]` symbols around the condition
			```
				/[if lt IE 9]
					%script{src: "html5shiv.js"}
			```
		* silent comments 
			* these are comments that are in the haml file but not in the html document 
			* use the `-#` symbol to initiate 
		* filters
			* haml lets you mix languages together in the same document by using filters 	
			* filters are denoted by the `:` before a established language keyword 
				* :cdata :coffee :css :erb :escaped :javascript :less :markdown :maruku :plain :preserve :ruby :sass :scss :textile
			* simply use a filter and nest the code underneath the filter 
		* ruby interpolation 
			* sometimes you need to evaluate ruby within plain-text 
			```
				%div {class: "student-#{@student.name}"}
			```
"
* sass
	* a css preprocessor 
	* stands for syntactically awesome stylesheets
	* files written in sass need to have a .sass file extension 
	* to convert run `sass style.sass style.css`	
		* to have auto recompile use `sass --watch styles.sass:style.css`
		* to have auto recompile for entire directory `sass --watch assets/sass:public/css`
	* syntax 
		* omits curly brackets and semicolons 
		* identation and clear line breaks to for formating 
		* strict syntax, if syntax rules broken file wont compile
		```
			.new
				color: #black
				font-weight: bold
				span
					text-transform: uppercase
		```
	* nesting 
		* selectors can be nested inside one another to create compound selectors
		* do not overdo it 
	* nesting properties 
		* you can nest properties 
		```
			div 
				font:
					family: baskerville, palatino, serif
					style: italic
					weight: normal
		```
	* nested media queries 
		* media queries can also be nested inside of a selector to change that property based off a media condition 
		```
			.container
				width: 960px
				@media screen and (max-width: 960px)
					width: 100%
		```
	* parent selector 
		* you can add styles to a previous selector using the `&` symbol
		```
			a 
				color: #0087cc
				&:hover
					color: #ff7b29
		```
	* parent key selector
		* you can add qualiifying selectors to make compound selectors 
		```
			.btn
				background: linear-gradient(#fff, #9799a7)
				.no-cssgradients &
					background: url("gradient.png") 0 0 repeat-x
		```
		* compiles to css
		```
			.btn {
				background: linear-gradient(#fff, #9799a7);
			}
			
			.no-cssgradients .btn {
				background: url("gradient.png") 0 0 repeat-x
			}
		```
	* comments 
		* the /* ... */ syntax for comments works and compiles to css comments 
	* silent comments 
		* the `//` symbol is used to make silent comments that will not be compiled to css
			* can be made multi-line with identation 
	* variables
		* you can define variables in sass and reuse them 
		* variables are defined using the `$` symbol
		```
			$font-base: 1em
			$serif: "Helvetica Neue", Arial, "Lucida Grande", sans-serif
			
			p
				font: $font-base $serif
		```
		compiles to css
		```
			p {
				font: 1em "Helvetica Neue", Arial, "Lucida Grande", sans-serif;
			}
		```
	* variable interpolation 
		* sometimes they variables need to be interpolated 
		```
			$location: chicago
			$offset: left
			
			.#{$location}
				#{offset}: 20px
		```
		* compile to css
		```
			.chicago {
				left: 20px;
			}
		```
	* calculations
		* you can do calculations in your css like but not limited to 
			* addition 
				* use the `+` symbol 
				* the first unit listed is the unit that the calculation will return 
			* subtraction
				* use the `-` symbol
				* the first unit listed is the unit that the calculation will return
			* modular
				* use the `%` symbol
				* only one number can have a unit 
			* multiplication 
				* use the `*` symbol 
				* only one number can have a unit 
			* division
				* use the `/` symbol
				* when using one unit the calculation will return one unit, when using two units the calculation will return no units
		* you can use sass to combine mathamatical operations 
		* [built in calc functions](http://sass-lang.com/documentation/Sass/Script/Functions.html)
			* percentage()
				* turns a value into a percentage 
			* round() 
				* rounds a value to the closest whole number
			* ceil() 
				* rounds a value up to the closest whole number 
			* floor() 
				* rounds a value down to the closest whole number
			* abs()
				* finds the absolute vaue of a given number
	* color 
		* sass has a lot of helper functions for colors 
		* you can change hexadecimal color or variable and convert it to RGBa value 
		```
			color: rgba(#8ec63f, .25)
			
			$green: #8ec63f
			color: rgba($green, .25)
		```
		* compile to css
		```
			color: rgba(142, 198, 63, .25);
		```
	* color operations 
		* you can do calculations on colors 
		```
			color: #8ec63f + #666
			color: #8ec63f * 2
			color: rgba(142, 198, 63, .75) / rgba(255, 255, 255, .75)
		```
	* color alterations
		* invert()
		* complement() 
		* mix() 
		* grayscale()
	* HSLa color alteration 
		* lighten() 
		* darken() 
		* saturate() 
		* desaturate() 
		* adjust-hue() 
		* fade-in() 
		* fade-out()
	* color manipulation 
		* sass can directly manipulate colors 
			* provides the most control over how to precisely tune specific color properties 
				* obvious trade off, power means complexity 
		* change-color()
			* set any property of a color
			* $color
				* [$red]
				* [$green]
				* [$blue]
				* [$hue]
				* [$saturation]
				* [$lightness]
				* [$alpha]
		* adjust-color()
			* incrementally manipulate any property of a color
			* $color
				* [$red]
				* [$green]
				* [$blue]
				* [$hue]
				* [$saturation]
				* [$lightness]
				* [$alpha]
		* scale-color()
			* fluidly scale any percentage based on property of a color 
			* $color
				* [$red]
				* [$green]
				* [$blue]
				* [$hue]
				* [$saturation]
				* [$lightness]
				* [$alpha]
	* extends 
		* provides a way to easily share and reuse styles without having to explicitly repeat code or use additional classes 
		* really allows for modular css 
		* element selectors can be used as an extend
		* class selectors can be used as an extend 
		* there are placeholder selectors built to be used as extends
		* the `@extend` symbols is used to denote an extension 
		```
			.alert
				border-radius: 10px
				padding: 10px 20px
			
			.alert-error
				@extend .alert	
				background: #black	
				color: #red
		```
		* compiles to css
		```
			.alert, 
			.alert-error {
				border-radius: 10px;
				padding: 10px 20px;
			}

			.alert-error {
				background: #black
				color: #red
			}		
		```
	* placeholder selector extend
		* prevents the creation of a bunch of unused classes
		* placeholder selectors meant to be used by extensions 
		* placesholder selectors are never compiled into css
		* the `%` symbol initializes a placeholder selector 
		```
			%alert
				border-radius: 10px
				padding: 10px 20px
			
			.alert-error
				@extend %alert
				background: #black
				color: #red
		```
		* compiles to css
		```
			.alert-error {
				border-radius: 10px;
				padding: 10px 20px;
			}
			.alert-error {
				background: #black;
				color: #red;
			}
		```
	* element selector extend 
		* standard type selectors can also be extended
		```
			h2
				color: #white
				span
					text-decoration: underline
			
			.sub-heading
				@extend h2
		```
		* compiles to css 
		```
			h2, .sub-heading {
				color: #white
			}
	
			h2 span, .sub-heading span {
				text-decoration: underline;
			}
		```
	* mixins 
		* a way to easily template properties and values and share them amongst different selectors
		* allow arguments to be passed in 
		* use the `@mixin` symbol followed by any potential arguments to make stand alone mixins
		* use the `+` symbol followed by the name of the mixin and argument values to call mixin from within a selector
		```
			@mixin btn($color, $color-hover)
				color: $color
				&:hover
					color: $color-hover
				
			.btn
				+btn($color: #black, $color-hover: #white)
		```
		* compiles to css
		```
			.btn {
				color: #black;
			}
			.btn:hover {
				color: #white;
			}
		```
		* mixins can also be passed default arguments
			* these can of course be overwritten when declared
			```
				@mixin btn($color: #black, $color-hover: #white)
					color: $color
					&: hover
						color: $color-hover
				
				.btn
					+btn($color-hover: #red)
			```
			* compiles to css
			```
				.btn {
					color: #black;
				}
				.btn:hover {
					color: #red	
				}
			```
		* mixins can also be passes multiple values for the same argument to take care of browser differences for example
			* use the `...` symbol after the argument 
			``` 
				@mixin box-shadow($shadow...)
					-webkit-box-shadow: $shadow
					-moz-box-shadow: $shadow
					box-shadow: $shadow
				
				.shadows
					+box-shadow(0 1px 2px #black, inset 0 0 5px #black)
			```
			* compiles to css
			```
				.shadows {	
					-moz-box-shadow: 0 1px 2px #black, inset 0 0 5px #black;
					-webkit-box-shadow: 0 1px 2px #black, inset 0 0 5px #black;
					box-shadow: 0 1px 2px #black, inset 0 0 5px #black;
				}
			```
	* imports 
		* sass can import multiple .scss or .sass files an condense them into one single file
			* reduces the number of http request that have to be made to render the pade
		* the `@import` symbol is used to import other style sheets
		* in the example three files are compiled into one sass stylesheet called `styles.sass`
		```
			@import "normalize"
			@import "grid", "typography"	
		```
		* compiles to css
		```
			<link href="styles.css" rel="stylesheet">
		```
	* loops & conditionals 
		* loops and conditionals are meant for creating detailed mixins and helpers 
		* operators 
			* relational operators
				* look at the relationship between two entities
				* < 
					* Less than 
				* > 
					* Greater than 
				* <= 
					* Less than or equal to 
				* >= 
					* Greater than or equal to 
			* comparison operators 
				* == 	
					* Equal to 
				* != 
					* Not equal to
		* if function 
			* tests an expression and then loads the styles beneath that expression if the expression returns anything other than false or null
			* use the `@if`, `@else` symbol to denote conditionals 
			```	
				$shay: awesome
				
				.shay
					@if $shay == awesome
						background: #black
					@else if $shay == cool
						background: #red
					@else 
						background: #white
			```
			* compiles to css
			```
				.shay {
					background: #black;
				}
			```
		* for loop 
			* outputs different sets of styles based off of a counter variable 
			* two different forms `to` and `through` 
				* `to` is exclusive
				* `through` is inclusive
			* use the `@for`, `from` symbols and either the `to` or `through` symbol to use for loops
			```
				@for $col from 1 to 6
					.col-#{$col}
						width: 40px * $col
			```
			* compiles to css
			```
				.col-1 {
					width: 40px;
				}
				.col-2 {
					width: 80px;
				}
				.col-3 {
					width: 120px;
				}
				.col-4 {
					width: 160px;	
				}
				.col-5 {
					width: 200px;
				}
			```
		* each loop 
			* each loop that follows a ruby like loop for an iterable 
			* use the `@each` symbol 
			```
				@each $class in uxd, rails, html, css
					.#{$class}-logo
						background: url("/img/#{$class}.jpg")
			```
			* compiles to css
			```
				.uxd-logo { 
					background: url("/img/uxd.jpg");
				}			
				.rails-logo {
					background: url("/img/rails.jpg");
				}
				.html-logo { 
					background: url("/img/html.jpg");
				}
				.css-logo {
					background: url("/img/css.jpg");
				}
			```
		* while loop 
			* repeatedly returns styles until boolean expression is false
			* use the `@while` symbol
			```
				$heading: 1
				@while $heading <= 6
					h#{$heading}
						font-size: 2em - ($heading * .25em)
					$heding: $heading + 1
			```
			* compiles to css
			```
				h1 {
					font-size: 1.75em;
				}
				h2 {
					font-size: 1.5m;
				}
				h3 {
					font-size: 1.25em;
				}
				h4 {
					font-size: 1em;
				}
				h5 { 
					font-size: 0.75em;
				}
				h6 {
					font-size: 0.5em;
				}
			```
			
	
#May 13 - The react js library 

react is a javascript library that can be used like a framework, it is pretty nifty he says. 

####questions 

What the fuck is isomorphic loading? 




* react js has super cool features
	* one-way data flow 
		* properties are passed to components as properties in its html tag
		* component cannot directly modify any properties passed to it, but can be passed callback functions that do modify values 
			* properties flow down and actions flow up 
	* [virtual DOM](http://facebook.github.io/react/docs/working-with-the-browser.html)
		* an in-memory data structure cache, computes the resulting difference and updates the browsers displayed DOM efficiently 			
			* the `render()` method returns a description of the DOM 
				* react can compare this description with the virtual DOM to compute the fastest way to update the browser
			* inplements a full synthetic event system 
				* all event objects are guranteed to conform to the W3C spec regardless of browser quirks 
				* everything bubbles consistently and efficiently across browsers 
				* allows you to use HTML5 evenets in older browsers that do not ordinarily support them	
			* provides hooks to manipulate the DOM api directly if neccesary 
	* [jsx](https://facebook.github.io/react/docs/jsx-in-depth.html) 
		* react components are written in javascript extension syntax
			* allows easy quoting of HTML and the use of HTML tag syntax to render subcomponents 
				* HTML syntax is processed into JS calls of the react library 
				* can also use pure JS
	* architecture beyond HTML 
		* the architecture applies beyond rendering HTML in the browser 
		* [fb has dynamic charts that render to <canvas> tags](https://facebook.github.io/react/blog/2013/06/05/why-react.html)
		* [netflix](http://techblog.netflix.com/2015/01/netflix-likes-react.html) and [paypal](https://www.paypal-engineering.com/2015/04/27/isomorphic-react-apps-with-react-engine/) use isomorphic loading to render HTML on both server and client

# May 14 - haml and rails harmony

So apparently the `-` symbol in rails is haml telling rails to silently execute ruby code

####Questions
	
* what does the `-` symbol mean in haml under rails?
	* indicates to rails that the line is ruby code and to silently execute (no output)


####Vocab

* `.to_s.downcase` (ruby)
	* to string and then forced to lower case

* `.to_s.singularize` (ruby)
	* to string and returns the singular form of a word 
 
# May 15 - rails - deeper into the docs

going to finish the rails tutorial and read deeper into the docs 

some populare authentication add-ons for rails are [Devise](https://github.com/plataformatec/devise) and [Authlogic](https://github.com/binarylogic/authlogic)
basically rails is a tentacle monster that knows no bounds


#### questions

* What does the `@` symbol before a variable mean again?
	* instance variable in a class are in shared memory for that instance of the class, but cannot be accessed outside the class
	* essentially a perma reference variable 

* ruby attributes are?
	* attributes that are set for all instances of the class, can be changed and are accessible by the scope outside of the class

* what is mass assignment?

* what do the `require` and `permit` methods do?

* what is a partial?

* what is the difference between `<%` and `<%=`?

* what is the difference between `@`variable (instance variable) and `:`variable?

* what is a nested resources in the context of rails routing?


#### features

* rails [security features](http://guides.rubyonrails.org/security.html) 
	* [strong parameters](http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)
		* [blog about it](http://weblog.rubyonrails.org/2012/3/21/strong-parameters/)
		* requires rails to know exactly which parameters are allowed into the controllwe actions 
		* prevents parameter injection from mean people 
		* built to precent `mass assignment`
		* thus parameters must be whitelisted 
		* use `require` and `permit` symbol to white list parameters
	* basic authentication 
		* `http_basic_authenticate_with` method
			* allows access to the requested action if that method allows it 
		* specified at top of ArticlesController
		* `app/controllers/articles_controller.rb`
		```
			class ArticlesController < ApplicationController
				http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
				
				def index
					@articles = Article.all
				end
			# snipper yo
		```
		* basically means that unless authenticated users can only use the articles index and show actions 
		* authentication to delete comments 
		* `app/controllers/comments_controller.rb`
		```
			class CommentsController < ApplicationController 
				http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
			
				def create
					@article = Article.find(params[:article_id])
					#...
				end
				#snipper yo
		```
		* popular authentication add-ons
			* Devise 
			* Authlogic


#### following the [getting started guide](http://guides.rubyonrails.org/getting_started.html#creating-the-article-model)

* creating the article model
	* active record is pretty cool 
	* `bin/rails generate model Article title:string text:text`
		* creates a new model, and links it to the DB and everything 
		* we have now created an Article model that has two attributes title and text of type string and text 
		* this model has been added and mapped to the DB automatically 
		* command creates multiple files the important ones being 
			* app/models/article.rb
			* db/migrate/#{dateTimeStamp}_create_articles.rb
				* responsible for creatign the database structure
				
* running a migration - [rabbit hole on active record migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)
	* db migrations are ruby classes that are designed to make it simple to create and modify database tables
	* rails uses rake commands to run migrations 
		* you can undo migrations even after its been applied to the db
	* when the db migration script is run it will create an articles table with one string column and a text column 
	* the migration has a method named `change` which is called to run the migration
	```
		class CreateArticles < ActiveRecord::Migration 
			def change
				create_table :articles do |t|
					t.string :title
					t.text :text

					t.timestamps null: false
				end
			end
		end
	```
	* to actually run the db/migration script use a rake command
		* `bin/rake db:migrate`
		* important to note that rails will no which to run because of the timestamp title 
		* important to note that the command will be applied tot he database defined in the development section of the config/database.yml 
			* this is because the default enviroment is a development environment 
			* to execute command in a different enviroment you must explicitly pass the appropriate environment 
				* `bin/rake db:migrate RAILS_ENV=production`

* saving data in the controller 
	* need to dictate to the ArticlesController to save the data in the DB when the create action is triggered
	* in `app/controllers/articles_controller.rb`
	```
		def create 
			@article = Article.new(params[:article])
			
			@article.save
			redirect_to @article
		end
	```
	* rails models can be initilized with its respective attributes 
		* automatically mapped to the respective database columns
	* the instance variable `@article` has a method `.save` that is responsible for saving the model to the database 
	* the user is redirected to the show action of the article (not yet defined)
	* class names in ruby must begin with capital letters 
		* `Article`
			* refers to the class defined in `/models/article.rb 
			* `.new` being a method defined in that class
	* the `@article.save` call returns a boolean indicating whether the article was saved or not
	* must whitelist our parameters
	```
		def create
			@article = Article.new(article_params)
			
			@article.save
			redirect_to @article
		end
		
		private 
			def article_params
				params.require(:article).permit(:title, :text)
			end	
	```

* showing articles
	* routes currently
	* `article GET		/articles/:id(.:format)		articles#show`
		* syntax `:id` 
			* tells rails that this route expects an :id parameter 
			* this will be the id of the article
	* we need to add a show action to the article controller 
	* `app/controllers/articles_controller.rb`
	```
		class ArticlesController < ApplicationController	
			def show
				@article = Article.find (params[:id])
			end
			
			def new
			end
			#snipper for brevity
	```
	* retrieve the id from the Article class using the `Article.find` method and passing it the `param[:id]` argument to get the id from the request
	* rails passes instance variables from the controller to the views 
	* we need to create a new view to display the data 
	* `app/views/articles/show.html.erb
	```
		<p>
			<strong>Title:</strong>
			<%= @article.title %>
		</p>
		
		<p>
			<strong>Text:</strong>
			<%= @article.text %>
		</p>
	```

* listing all articles 
	* we need to add a index action to list articles
	* convention is to make the index action be first in the controller 	
	* app/controllers/articles_controller.rb
	```
		class ArticlesController < ApplicationController
			def index
				@articles = Article.all
			end
			
			def show 
				@article = Article.find(params[:id])
			end
			
			def new 
			end 
			
			#snippet yo
	```
	* add a view to match the action 
	* app/views/articles/index.html.erb
	```
		<h1>Listing articles</h1>
 
		<table>
  			<tr>
    				<th>Title</th>
    				<th>Text</th>
  			</tr>
 
  			<% @articles.each do |article| %>
    				<tr>
      					<td><%= article.title %></td>
      					<td><%= article.text %></td>
    				</tr>
  			<% end %>
		</table>
	```

* adding internal links
	* when linking within the same controller there is no need to specify the controller to use as rails will know which to use by default 
	* need to navigate through the pages 
	* app/views/welcome/index.html.erb
	```
		<h1>Hello, Rails!</h1>
		<%= link_to 'My Blog', controller: 'articles' %>
	```
	* the `link_to` method is a built-in rails view helper
		* creates a hyperlink based on text to display and where to go
	* app/views/articles/index.html.erb
		* add above the table tag 
	```
		<%= link_to 'New article', new_article_path %>
	```
	* add a link to go back to the article index
	* `app/views/articles/new.html.erb
	```
		<%= form_for :article, url: articles_path do |f| %>
		...
		<% end %>
		
		<%= link_to 'Back', articles_path %>
	```
	* add a link to the show template to go back to the article index
	* app/views/articles/show.html.erb
	```
		<p>
  			<strong>Title:</strong>
  			<%= @article.title %>
		</p>
 
		<p>
  			<strong>Text:</strong>
  			<%= @article.text %>
		</p>
 
		<%= link_to 'Back', articles_path %>
	```
	
* adding [ActiveRecord validation](http://guides.rubyonrails.org/active_record_validations.html) 
	* currently the `Article` model inherits from `ActiveRecord::Base`	
	* `ActiveRecord` sets up pretty much all simple functionality for you including CRUD functionality 
	* there are also methods to ease validation of the data sent to models 
	* `app/models/article.rb`
	```
		class Article < ActiveRecord::Base
			validates :title, presence: true, length: {minimum:5}
		end
	```
		* this makes sure that each title is at least 5 characters long 
		* lots of stuff can be validated by forms
	* if the article submitted doesnt fufill the requirements it will get rejected, that needs to be in the controller logic
	* `app/controllers/articles_controller.rb`
	```
		def new 
			@article = Article.new
		end
		
		def create 
			@article = Article.new(article_params)
		
			if @article.save
				redirect_to @article
			else
				render 'new'
			end
		end
		
		private 
			def article_params
				params.require(:article).permit(:title, :text)
			end
	```
		* `render` 
			* used such that the instance variable @article is passed back to the new template when it is rendered 
			* the rendering is done within the same request as the form submission 
		* `redirect_to` 
			* tells the browser to issue another request 
	* error messages 
		* we need to pass error messages to the user so they know that their shit did not go through 
		* `app/views/articles/new.html.erb
		```
			<%= form_for :article, url: articles_path do |f| %>
			
				<% if @article.errors.any? %>
					<div id="error_explanation">
						<h2>
							<%= pluralize(@article.errors.count, "error") %>
								prohibited this article from being saved: 
						</h2>
						<ul>
							<% @article.errors.full_messages.each do |msg| %>
								<li><%= msg %></li>
							<% end %>
						</ul>
					</div>
				<% end %>
				<p>
					<%= f.label :title %><br>
					<%= f.text_field :title %>
				</p>	
			
				<p>
					<%= f.label :text %><bt>
					<%= f.text_area :text %>
				</p>
			
				<p>
					<%= f.submit %>
				</p>
			<% end %>
				
			<%= link_to 'Back', articles_path %>
		```		
		* `@article.errors.any?`
			* checks to see if there are any errors 
		* `@article.errors.full_messages`
			* list all the error messages
		* `pluralize` 
			* a rails helper 
			* takes a number and a string as its arguments 
			* if the number is greater than one the string will be automaticall pluralized 
		* rails automatically wraps fields that contain an error with a div 
			* class name of that div is `field_with_errors`
			* you can use css to make them standout 
		

* updating articles 
	* [more on forms in rails](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for)
	* we need an edit action in the ArticlesController
	* `app/controllers/articles_controller.rb`
	```
		def new 
			@article = Article.new 
		end 
		
		def edit 
			@article = Article.find(params[:id])
		end
	
		def create
			@article = Article.new(article_params)
		
			if @article.save
				redirect_to @article
			else 
				render 'new'
			end
		end
	```
	* add an edit view
	* `app/views/articles/edit.html.erb`
	```
		<h1>Editing article</h1>
 
		<%= form_for :article, url: article_path(@article), method: :patch do |f| %>
 
  			<% if @article.errors.any? %>
   				 <div id="error_explanation">
      					<h2>
        					<%= pluralize(@article.errors.count, "error") %> prohibited
        					this article from being saved:
      					</h2>
      					<ul>
        					<% @article.errors.full_messages.each do |msg| %>
          						<li><%= msg %></li>
        					<% end %>
      					</ul>
    				</div>
  			<% end %>
 
  			<p>
    				<%= f.label :title %><br>
    				<%= f.text_field :title %>
  			</p>
 
  			<p>
    				<%= f.label :text %><br>
    				<%= f.text_area :text %>
  			</p>
 
  			<p>
    				<%= f.submit %>
  			</p>
 
		<% end %>
 
		<%= link_to 'Back', articles_path %>
	```	
	* the method `:patch` option tells rails 
		* the form should be submitted via the PATCH HTTP method 
		* essential the update part of crud 
	* passing in parameter `:article` with the same name as the instance variable leads to the same behavior 
	* now we need an update action in the controller 
	* `app/controllers/articles_controller.rb`
	```
		def create
  			@article = Article.new(article_params)
 
  			if @article.save
    				redirect_to @article
  			else
    				render 'new'
 			end
		end	
	
		def update 
			@article = Article.find(params[:id])
			
			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
			end
		end
	
		private 
			def article_params
				params.require(:article).permit(:title, :text)
			end
	```
	* now in the index we need to add  a link to edit 
	* `app/views/articles/index.html.erb`
	```
		<table>
  			<tr>
    				<th>Title</th>
    				<th>Text</th>
    				<th colspan="2"></th>
  			</tr>
 
  			<% @articles.each do |article| %>
    				<tr>
      					<td><%= article.title %></td>
      					<td><%= article.text %></td>
      					<td><%= link_to 'Show', article_path(article) %></td>
      					<td><%= link_to 'Edit', edit_article_path(article) %></td>
    				</tr>
  			<% end %>
		</table>
	```
	* add it on the show page as well
	* `app/views/articles/show.html.erb`
	```	
		...	
		<% link_to 'Edit', edit_article_path(@article) %> |
		<% link_to 'Back', articles_path %>
	```

* using partials to clean up duplication in views 
	* [the guide on this shit](http://guides.rubyonrails.org/layouts_and_rendering.html)
	* [resource oriented style forms](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for-label-Resource-oriented+style)
	* by convention partials are prefixed with an underscore 
	* partials are i think just reausable view components 
	* were gonna make a form partial 
	* `app/views/articles/_form.html.erb`
	```
		<% form_for @article do |f| %>
			<% if @article.errors.any? %>
    				<div id="error_explanation">
      					<h2>
        					<%= pluralize(@article.errors.count, "error") %> prohibited
        					this article from being saved:
      					</h2>
      					<ul>
        					<% @article.errors.full_messages.each do |msg| %>
          						<li><%= msg %></li>
        					<% end %>
      					</ul>
    				</div>
  			<% end %>
 
 			<p>
    				<%= f.label :title %><br>
    				<%= f.text_field :title %>
  			</p>
 
  			<p>
    				<%= f.label :text %><br>
    				<%= f.text_area :text %>
  			</p>
 
  			<p>
    				<%= f.submit %>
  			</p>
 
		<% end %>	
	```
	* the data is exactly the same so we can make a mini-template to switch in and out 
	* the reason that this works is because the `@article` instance variable is a resource corresponding to a full set of restful routes
		* rails can infer which URI and method to use based on the context 
	* updat the view to use the partial 
	* `app/views/articles/new.html.erb`
	```
		<h1>New article</h1>
		
		<% render 'form' %>
		<%= link_to 'Back', articles_path %>
	```
 	* `app/views/articles/edit.html.erb`
	```
		<h1>Edit article</h1>
		
		<%= render 'form' %>
		<%= link_to 'Back', articles_path %>
	```

* deleting articles 
	* [details on routes](http://guides.rubyonrails.org/routing.html)
	* use the delete route to delete shit
	* create a delete method to destroy resources
	* create a detroy action in the controller 
	* `app/controllers/articles_controller.rb`
	```
		def destroy 
			@article = Article.find(params[:id])
			@article.destroy 
		
			redirect_to articles_path
		end
	```
	* we can now call destroy on active recorde objects to delete them from the db 
	* we need to addd the destroy call to the index view 
	* `app/views/articles/index.html.erb`
	```
		<h1>Listing Articles</h1>
		<%= link_to 'New article', new_article_path %>
		<table>
  			<tr>
    				<th>Title</th>
    				<th>Text</th>
    				<th colspan="3"></th>
  			</tr>
 
  			<% @articles.each do |article| %>
    				<tr>
      					<td><%= article.title %></td>
      					<td><%= article.text %></td>
      					<td><%= link_to 'Show', article_path(article) %></td>
      					<td><%= link_to 'Edit', edit_article_path(article) %></td>
      					<td><%= link_to 'Destroy', article_path(article), method: :delete, data: { confirm: 'Are you sure?' } %></td>
    				</tr>
  			<% end %>
		</table>
	```
	* used `link_to` differently 
		* passed options 
			* `:method :delete`
				* will submit the link using the delete restful method 
			* `data: {confirm: 'are you sure?'}`
				* html5 attribute that will launch a confirm dialog using jquery 

* adding a second model 
	* how to add comments to the application 	
		* after all a blogging platform cannot exist wihtout comments 
	* generate a `Comment` model for comments 
	* `bin/rails generate model Comment commenter:string body:text article:references`
	* creates four files 		
		* `db/migrate/#{dateTimeStamp}_create_comments.rb
			* db migrtion to create comments table in db	
		* `app/models/comment.rb`	
			* the comment model 
		* `test/models/comment_test.rb`
			* testing harness for the comments model
		* `test/fixtures/comments.yml`
			* sample comments for use in testing 
	* because we made a reference variable and pointed that to article the model shows the relationship
		* this is called `Active Record association`
		* the db migration contains a column for article_ids that act as a foreign key that point to the articles table 
	
* associating models
	* [Active Record associations](http://guides.rubyonrails.org/association_basics.html)
		* allow you to easily declare the relationship between two models 
		* the association is not completed until reflected in both models
	* `app/models/comment.rb`
	```
		class Comment < ActiveRecord::Base
			belongs_to :article
		end
	```
	* `app/models/article.rb`
	```
		class Article < ActiveRecord::Base
			has_many :comments
			validates :title, presence: true, length: {minimum:5}
		end
	```

* addding a route for comments 
	* we need to add routes so that rails knows where to see comments 
	* `config/routes.rb`
	```
		resources :articles do
			resources :comments
		end
	```
	* this makes comments a nested resource within articles 
		* shows the hierarchical relationship between comments and articles within the routing itself

* generating a controller 
	* command is `bin/rails generate controller Comments`
	* six files are generated 
		* `app/controllers/comments_controller.rb`
			* comments controller
		* `app/views/comments`
			views of the controllers are stored here
		* `test/controllers/comments_controller_test.rb`
			the test for the controller are here 
		* `app/helpers/comments_helper.rb`
			view helper files are here
		* `app/assests/javascripts/comment.js.coffee`
			coffeescripts for the controller
		* `app/assests/stylesheets/comment.css.scss`
			css stylesheet for the controller
	* we need to add comments to the Article show template
	```	
		<p>
  			<strong>Title:</strong>
  			<%= @article.title %>
		</p>
 
		<p>
  			<strong>Text:</strong>
  			<%= @article.text %>
		</p>
 
		<h2> Add a comment:</h2>
		<%= form_for([@article, @article.comments.build]) do |f| %>
			<p>
				<%= f.label :commenter %><br>
				<%= f.text_field :commenter %>
			</p>
			<p>
				<%= f.label :body %><br>
				<%= f.text_area :body %>
			</p>
			<p>
				<%= f.submit>
			</p>
		<% end %>
		
		<%= link_to 'Edit', edit_article_path(@article) %> | 
		<%= link_to 'Back', articles_path %>
	```
	* adds a form on the Article Show page to create a new comment by calling the CommentsController create action
	* the form_for call here uses an array to build a nested route 
	* the comments controller needs to have a create method though 
	* `app/controllers/comments_controller.rb`
	```
		class CommentsController < ApplicationController
			def create 
				@article = Article.find(params[:article_id])
				@comment = @article.comments.create (comment_params)
				redirect_to article_path(@article)
			end
			
			private 
				def comment_params
					params.require(:comment).permit(:commenter, :body)
				end
		end
	```
	* each comment needs to know the article that referenced it 
		* this is why the route was nested in the first place
		* this is why the form was using an array to make a nested call so that the comment would always know which article owned it 
	* the user gets redirected to the article they commented on so the view should reflect that 
	* ```app/views/articles/show.html.erb`
	```
		<p>
  			<strong>Title:</strong>
  			<%= @article.title %>
		</p>
 
		<p>
  			<strong>Text:</strong>
  			<%= @article.text %>
		</p>
 
		<h2>Comments</h2>
		<% @article.comments.each do |comment| %>
  			<p>
    				<strong>Commenter:</strong>
    				<%= comment.commenter %>
  			</p>
 
  			<p>
    				<strong>Comment:</strong>
    				<%= comment.body %>
  			</p>
		<% end %>
 
		<h2>Add a comment:</h2>
		<%= form_for([@article, @article.comments.build]) do |f| %>
  			<p>
   	 			<%= f.label :commenter %><br>
    				<%= f.text_field :commenter %>
  			</p>
  			<p>
    				<%= f.label :body %><br>
    				<%= f.text_area :body %>
 	 		</p>
  			<p>
    				<%= f.submit %>
  			</p>
		<% end %>
 
		<%= link_to 'Edit', edit_article_path(@article) %> |
		<%= link_to 'Back', articles_path %>
	```
	
* rendering partial collections 
	* turn showing comments into a partial 
	* `app/views/comments/_comment.html.erb`
	```
		<p>
			<strong>Commenter:</strong>
			<%= comment.commenter %>
		</p>
		
		<p>
			<strong>Comment:</strong>
			<%= comment.body %>
		</p>
	```
	* change the `app/views/articles/show.html` file to render the partial instead of the html
	
	* you can turn the comment form into a partial as well 
		* becareful you have to render the path to the form, 
			`<%= render 'comments/form' %>

* deleting comments 
	* important to remember in the controller while creating the destroy action 
		* need to find the article 
		* need to find the comment in the article 
		* need to tell that comment to kill itslef
		* redirect to the same page with dead comment 
	* important with the view 
		* you are making a hyper link that will send a request to the approriate route (nested) to delete with a confirmation 

* deleting associated objects 
	* if you delete an article all the comments have to die as well
	* `app/models/article.rb`
	```
		class Article < ActiveRecord::Base
			has_many :comments, dependent: :destroy
			validates :title, presence: true, length: {minimum:5}
		end
	```

# May 16 - asset pipeline 

The rails asset pipeline is the subject of todays fun time learn time 

this is the [sass-rails docs](https://github.com/rails/sass-rails#features)



#### questions 
	
* what is the `asset_path` helper?
* what is a `require_tree` directive?
* what are digest as in `config.assets.digest`?
* what are far-future headers?

#### [following rails docs on asset pipeline](http://guides.rubyonrails.org/asset_pipeline.html)

* what is the asset pipeline 
	* provides a framework to concatenate and minify or compress js and css	assets 
	* add the ability to write these assets in other languages and pre-processors like sass
	* no longer a core feature of rails
		* managed by the [sprockets-rails gem](https://github.com/rails/sprockets-rails)
	* asset pipeline is enabled by default 
		* to disable `rails new appname --skip-sprockets`
	* rails automatically adds pre-proccessor gems to your gemfile
		* sass-rails
		* uglifier
		* coffee-rails

* main features 
	* concatenate assets 
		* reduces the number of requests that the client has to make 
		* faster loading time 
		* sprockets concatenates all js files into one master .js file and all css files into one master .css file 
			* the order in which they are grouped is customizable 
			* in production rails inserts MD5 fingerprint into each filename so that the file is cashed by the browser 
	* asset minification/compression 
		* css 
			* removes whitespace and comments 
		* javascript 
			* more special stuff 
		* this compression can be set from a set of built in options or specify a custom compression 
	* allows coding assets via a higher-level language
		* precompiles down to actual assets 
			* sass -> css
			* coffeescript -> js
			* ERB -> either or

* what is fingerprinting and why should i care 
	* fingerprinting is a technique that makes the name of a file dependent on the contents of the file 
	* makes it easy to tell if contents of file are identical 
	* makes caching easy 
		* cache busting 
			* when the content is updated the fingerprint changes 
	* sprockets does this by inserting a hash of the content into the name usually at the end 
	* they used to use a query string stragy 
		* several disadvantages 
			* not all caches will reliably cache content where the filename only differs by query parameters 
			* the file name can change between nodes in multi-server environments 
			* too much cache invalidation 
	* fingerprinting can be enabled or disabled in your `config.assets.digest` options

* how to use the asset pipeline 
	* in previous rails all assets were located in subdirectories of `public`
	* with the asset pipeline the preferred location for these assets is
		* `app/assets` directory 
			* these files are served by the sprockets middleware 
	* assets can still be placed in the `public` directory 
		* any assets under `public` will be served as static files by the application or webserver when `config.serve_static_files` is set to true
		* use `app/assets` for file that must undergo pre-processing before they are served 
	* in production files in `app/assets` are never served directly in production 

* controller specific assets 
	* generating a scaffold or a controller aslo generates a js and css file for that controller 
	* when it comes to scaffold it also generates scaffolds.css 
	* these files will be ready to use by your application immediately using the `require_tree` directive 
	* only include controller specific stylesheets and js in their respective controllers 
		* `<%= javascript_include_tag params[:controller] %>` or `<%= stylesheet_link_tag params[:controller] %>
		* do not use the `require_tree` directive simultaniously as it will mean your assets are being included more than once 
	* disable generation of controller specific asset files 
		* `config/application.rb`
		```
			config.generators do |g|
				g.assets false
			end
		```

* asset organization 
	* pipeline assets can be placed inside one of three locations 	
		* `app/assets`
			* for assets that are owned by the application, such as custom images, js files or stylesheets
		* `lib/assets`
			* for your own libraries code that does not really fit into the scope of the application or those libraries which are shared across applications 
		* `vendor/assets`
			* for assets that are owned by outside entities such as js plugins or css frameworks 
				* third party code with references to other files also processed by the asset pipeline will need to be reqritten to use helpers like `asset_path`
	
* search paths 
	* when a file is referenced from a manifest or a helper sprockets searches the `app/assets` directory for it 
	* in each file the relative path to the directory can be ignored 
	* search paths can be seen by looking at `Rails.application.config.assets.paths` in the rails console
	* fully qualified paths can be added to the pipeline in 
	* `config/application.rb`
	```
		config.assets.paths << Rails.root.join("lib", "videoplayer", "flash")
	```
	* paths are traversed in the order they occur in the search path 
	* `app/assets` -> `lib` -> `vendor` 
		* paths in `app/assets` will mask corresponding paths in `lib` and `vendor`
	* files referenced outside a manifest must be added to the precompile array or they will not be available in the production environment 
	
* using index files 
	* sprockets uses files named index for a special purpose 
		* uses them as the manifest for all files in the library 
			* can include a list of all the required files in order 
			* or a simple `require_tree` directive 
	* the library as a whole can be accessed in the application manifest 
	
* coding links to assets 
	* sprockets does not add any new methods to access your assets 
	* to include assets 
	```
		<%= stylesheet_link_tag "application", media: "all" %>
		<%= javascript_include_tag "application" %>
	```
	* if using the turbolinks gem (you are) 
		* add the `data-turbolinks-track` option
			* makes turbolinks check to see if an asset has been updated and if so loads it into the page 
		```
			<%= stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => true %>
			<%= javascript_include_tag "application", "data-turbolinks-track" => true %>
		```
	* in regular views you can access images in the `public/assets/images` directory 
	```
		<%= image_tag "rails.png" %>
	```
	* sprockets will aslo look through the paths specified in `config.assets.paths` 
		* includes standard application paths 
		* includes any paths added by the Rails engine 
	* images can also be organized into subdirectories and accessed with specified path
		* if precompiling linking to an asset that does not exist will raise an exception in the calling page 
	
* css and erb
	* the asset pipeline automatically evaluates erb
		* if you add an erb extension to a css asset then helpers like `asset_path` are available in your css rules 
		```
			.class { background-image: url (<%= asset_path 'image.png' %>) }
		```
	
* css and sass 
	* when using the asset pipeline paths to assets 
	* `-url` and `-path` helpers 
		* image-url("rails.png") 
			* grabs the assets/rails.png url
		* image-path('rails.png')
			* grabs the /assets/rails.png path 
	
* js and coffeescript and erb
	* adding a erb extension to a js asset 
	* can use the asset_path helper in js source 
	
* manifest files and directives 
	* sprockets uses manifest files to determine which assets to include and serve 
	* `directives` 
		* instructions that tell sprockets which files to require to build a single css or js file 
			* using the directives sprockets loads the files specified, processes them, and concatenates them into one single file and then compresses them 
		* directives are processed top to bottom, but the order in which files are included by require_tree is unspecified 
		* js sprocket directives 
			* begin with `//=` syntax 
			* sprockets assumes that you are referencing js files from js files 
		* `require_self`
			* puts the file in the current file at the precise location of the require_self call
		* `require_tree` 
			* tells sprockets to recursively include all js files in the specified directory into the output 
			* must be specified relative to the manifest file 
		* `require_directory` 
			* includes al js files in the directory specified without recursion 
		* css sprocket directives 
			* begin with `/* *= */` syntax 
			* the same thing as js 
			* if using multiple sass files use the [sass @import rule](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#import)
		* each section of an application could theoritically have its own manifest file 
				
* preprocessing 
	* file extensions used on an asset determine what preprocessing is applied 
	* preprocessors extensions are read from right to left 
	* `app/assets/stylesheets/projects.css.scss.erb` 
		* first processed as erb 
		* then scss
		* then served as css

* development 
	* in development mode assets are served as separate files in the order they are specified in the manifest file 
	* sprockets requires the body param 

* runtime error checking 
	* the asset pipeline will check for potential errors in development mode during runtime 
		* to disable `config.assets.raise_runtime_errors = false`
	* if the option is turned on the asset pipeline will check to see if all assets loaded are included in the `config.assets.precompile` list 
		* if `config.assets.digest` is also true the asset pipeline will require all requess for assets include digests 
	
* turning digests off 
	* you can turn off digests by updating `config/environments/development.rb`
		* to include `config.assets.digest = false` 

* turning debugging off
	* you can turn off debug mode by updating `config/environments/development.rb`
		* to include `config.assets.debug = false`
	* when debug mode is off sprockets concatenates and runs the necessary preprocessors on all files
		* the manifest would look like `<script src="/assets/application.js"></script>
	* assets are compiled and cached on the first request after the server is started 
		* sprockets sets a `must-revalidate` cache-control HTTP header to reduce request overhead on subsequent requests 
		* if any of the files in the manifest have changed between requests the server responds with a new compiled file
	
* in production 	
	* in production sprockets uses the fingerprinting scheme outlined above 
		* by default Rails assumes assets have been precompiled and will be served as static assets by your web server 

* precompiling assets 
	* Rails comes bundled with a rake task to compile the asset manifests and other files in the pipeline
		* compiled assets are written to the location specified in config.assets.prefix 	
			* by default this is the `/assets` directory 
		* rake task to create a compiled version of assets directly on the server 
		* `$ RAILS_ENV=production bin/rake assets:precompile`
	* capistrano (v2.15.1 and above) include a recipe to handle this in deployment 
		* add following to `Capfile` 
		* `load 'deploy/assets'
		* links the directory specified in `config.assets.prefix` to `shared/assets`
			* it is important that this directory is shared between deployments so that remotely cached pages referencing the old compiled assets still work for the life of the cached page

* [far-future expires header](http://guides.rubyonrails.org/asset_pipeline.html#far-future-expires-header)
	* precompiled assets exist on the file system and are served directly by your web server 
	* they do not have far-future headers by default 		
	
* customizing the pipeline 
	* css compression 
		* [yui css compression](http://yui.github.io/yuicompressor/css.html)
			* `config.assets.css_compressor = :yui`
			* requires the `yui-compressor` gem
		* sass-rails css compression
			* `config.assets.css_compressor = :sass`
			* requires `sass-rails` gem
	* js compression 
		* [uglifier js compression](https://github.com/lautis/uglifier)
			* `config.assets.js_compressor = :uglifier`
			* requires `uglifier` gem
		* yui js compression 
			* `config.assets.js_compressor = :yui`
			* require `yui-compressor` gem
		* closure js compression 
			* `config.assets.js_compressor = :closure`
			* require `closure-compiler` gem
	* you can use your own compressor (no)
	* changing the assets path 
		* the public path that sprockets uses by default is `/assets`	
			* can be changed
			* `config.assets.prefix = "/some_other_path"`
	* x-sendfile headers 
		* is a directive to the web server to ignore the response from the application and instead serve a specified file from disk 

# May 17 - rails action view overview 

im tired but today we learn about action view and all its glory 


#### questions 

* what do yields do in ruby?
* what does the `div_for` helper class do?
* what is an Atom feed?
* and what is an RSS feed how does it work?
* what is a select tag?


#### following [action view overview](http://guides.rubyonrails.org/index.html)

* in rails web request handled by action pack 
	* splits the work into 
		* controller component (action controller) 
			* concerned with communicating with the database and performing CRUD actions  
		* view component (action view) 
			* responsible for compiling the response 
			* templates written using embedded ruby in tags mingled with html 
			* to avoid boilerplate code helper classes exist to provide common behavior for forms, dates, and strings 

* using action view with rails 
	* for each controller there is an associated directory in the `app/views` directory 
		* it holds the template files that create the views for the controller 
		
* templates, partials and layouts 
	* .builder extensions 
		* mwans the `Builder::XmlMarkup` library is used 
	* the extension determines the template system to interpret 
	* erb 
		* ruby code can be included usign either 
			* `<% %>`
				* executes ruby code that does not return anything 
					* conditionals	
					* loops 
					* blocks 
			* `<%= %>`
				* used when output is desired 
			* `<%- -%>` 
				* used to suppress leading and trailing whitespaces 
	* builder 
		* these are more programmatic than erb 
		* useful for generating XML content 
		* automatically passes template an XmlMarkup object named xml
	* template caching 
		* rails compiles each template to a method in order to render it 
	* partials 
		* a way of breaking the rendering process into more manageable chunks 
		* extract pieces of code from templates to separate files and reuse them throughout your templates 
		* to rend partials 
		```
			<%= render "menu" %>
		```
			* rails will look for a file `_menu.html.erb` and render it in the appropriate spot 
		* partials are named with a leading underscore 
		* partials can be used as subroutines to simplify views 
		* the `as` and `object` options 
			* `ActionView::Partials::PartialRenderer` has its object in a local variable with the same name as the template 
				* `<%= render partial: "product" %>
					* within product the instance variable `@product` will be in the local variable `product` 
						* no different than being explcit 
						* `<%= render partial: "product", locals: {product: @product} %>
			* `as` 
				* can be used to specify a different name for the local variable 
				* `<%= render partial: "product", as: "item" %>`
			* `object`
				* can be used to directly specify which object is rendered into the partial 
				* useful when the templates object is elsewhere
				* instead of	
					* `<%= render partial: "product", locals: {product: @item} %>
				* you can do 
					* `<%= render partial: "product", object: @item %>`
			* `as` and `object` can be used together 
				* `<%= render partial: "product", object: @item, as: "item" %>
		* rendering collections 
			* to iterate over a collection and render a sub-template for each of the elements
			* there is a method for that 
			* you can turn 
				```
					<% @products.each do |product| %>
						<%= render partial: "product", locals:{ product: product} %>
					<% end %>
				```
			* can be rewritten into a single line 
				* `<%= render partial: "product", collection: @products %>`
			* when a partial is called with a collection 
				* the individual instances of the partial have access to the member of the collection being rendered via a variable named after the partial
					* in this case `_product`
				 * if @products is a collection of Product instances you can shorten it even more 
					* `<%= render @products %>`
					* rails determines the name of the partial to use by looking at the model name in the collection 
						* in this case `Product` 
						* you can also render a collection made up of instances of different models with the same shorthand 
							* rails will choose the proper partial for each memeber of the collection 
		* spacer templates 
			* you can have a second partial rendered between instances of a main partial using the `:spacer_templates` option 
			* `<%= render partial: @products, spacer_template: "product_ruler" %>`
			* rails will render the _product_ruler partial between each pair of _product partials 
	* layouts 
		* used to render a common view template around the results of rails controller actions 
			* typically a rails app will have a couple of layouts that pages will be rendered within 
		* different layouts can have completely different organizational structures 
	* partial layouts 
		* partials can have their own layouts applied to them 
		* imagine displaying an article on a page that should be wrappe in a div for display
			* create article
				* `Article.create(body: "partial layouts are cool!")`	
			* in show template render _article partial wrapped in box layout
			* `articles/show.html.erb`
				* `<%= render partial: 'article', layout: 'box', locals: {article: @article} %>`
			* the box layout wraps the article in a div 
			* `articles/_box.html.erb`
				* `<div class='box'><%= yield %></div>`
			* the _article partial wraps the articles body in a div with the id of the article using the div_for helper
			* `articles/_article.html.erb`
			```
				<%= div_for(article) do %>
					<p><%= article.body %></p>
				<% end %>
			```
			* the output generated 
			```
				<div class='box'>
					<div id='article_1'>	
						<p>Partial Layouts are cool!</p>
					</div>
				</div>
			```
			* partial layouts still use the `_` syntax
			* you can also render a block of code instead of yield within the partial layout
			* `articles/show.html.erb`
			```
				<% render(layout: 'box', locals: {article: @article}) do %>
					<%= div_for(article) do %>
						<p><%= article.body %></p>
					<% end %>
				<% end %>
			```
				* this would produce same output as before						
	* view paths 
		* UNKNOWN OMG PANIC
	* overview of helpers provided by Action view 
		* full list of [API Docs](http://api.rubyonrails.org/classes/ActionView/Helpers.html)
		* [RecordTagHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/record_tag_helper_rb.html)
			* provides methods for generating container tags such as div for your record 
			* the recommended way of creating a container to render Active Record objects, as it adds an appropriate class and id attribute to that container 
			* following conventions means less thinking 
				* `content_tag_for`
					* renders a container tag that relates to your Active Record Object 
					* given @article
					```
						<%= content_tag_for(:tr, @article) do %>
							<td><%= @article.title %></td>
						<% end %>
					```		
					* basically retrieves content tags of the record 
				* `div_for`
					* convenience method 
					* calls `content_tag_for` internally with :div as the tag name 
					```
						<%= div_for(@article, class: "frontpage") do %>
							<td><%= @article.title %></td>
						<% end %>	
					```
		* [AssetTagHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/asset_tag_helper_rb.html)
			* provides methods for generating html that links views to assets like images and js files 
			* by default Rails links to these assets on the current host in the public folder 
				* you can direct rails to link to assets from a dedicated assets server by altering 					
					* `config/environments/production.rb`
						* `config.action_controller.asset_host = "assets.example.com"`
				* `auto_discovery_link_tag`
					* returns a link tag that browsers and feed readers can use to auto-detect an RSS or atom feed
					```
						auto_discovery_link_tag(:rss, "www.example.com", { title: "RSS Feed" }) 
							<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="http://www.example.com"/>
					```
				* `image_path`
					* computes the path to an image asset in the app/assets images directory 
					* `image_path("edit.png") # => /assets/edit.png`
				* `image_url`
					* computes the url to an image asset in app/assets/images directory 
					* calls image_path internally and will merge with current host 
					* `image_url("edit.png")`
				* `image_tag`
					* returns an html image tag for the source 
					* `image_tag("icon.png")`
				* `javascript_include_tag`
					* returns an html script tag for each source provided 
					* `javascript_include_tag "common"`
					* if app not using asset pipeline to include jQuery and js libraries in app 
						* pass defaults as the source 
							* when using defaults if an application.js file exists in your app/assets/javascripts directory it will be included 
							* `javascript_include_tag :defaults`
						* pass all to pass all	
							* pass all js in app/assets/javascripts directory 
							* `javascript_include_tag :all`
				* `javascript_url`
					* computes the url to a js asset in app/assets/javascript directory 
					* `javascript_url "common"`
				* `stylesheet_link_tag`
					* returns a stylesheet link tag for the sources specified as arguments 
					* `stylesheet_link_tag "application"`
					* you can pass all to include all 
						* `stylesheet_link_tag :all`
				* `stylesheet_path`
					* computes the path to a stylesheet asset in app/assets/stylesheets directory 
					* `stylesheet_path "application"`
				* `stylesheet_url`
					* computes the url to a stylesheet asset in app/assets/stylesheets directory 	
					* `stylesheet_url "application"`
		* [AtomFeedHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/atom_feed_helper_rb.html)		
			* this makes building an Atom feed easy 
			* `config/routes.rb`
				* `resources :articles`
			* `app/controllers/articles_controller.rb`
			```
				def index 
					@articles = Article.all
					
					respond_to do |format|
						format.html
						format.atom
					end
				end
			```
			* `app/views/articles/index.atom.builder`
			```
				atom_feed do |feed|
					feed.title("Article Index")
					feed.updated((@articles.first.created_at))
	
					@articles.each do |article|		
						feed.entry(article) do |entry|
							entry.title(article.title)
							entry.content(article.body, type: 'html')
					
							entry.author do |author|
								author.name(article.author_name)
							end
						end
					end
				end
			```
		* [BenchmarkHelper]()
			* measures the execution time of a block in a template and records the result to the log 
			```
				<% benchmark "Process data files" do %>
					<%= expensive_files_operation %>
				<% end %>
			```
		* [CacheHelper](http://api.rubyonrails.org/classes/ActionView/Helpers/CacheHelper.html)
			* `cache`
				* a method for caching fragments of a view rather than an entire action or page 
				* useful for caching menus, list of topics, html fragments ect 
				```
					<% cache do %>	
						<%= render "shared/footer" %>
					<% end %>
				```
		* [CaptureHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/capture_helper_rb.html)
			* `capture`
				* method allows you to extract part of a template into a variable 
				* the variable can then be used anywhere in template or layout 
				```
					<% @greeting = capture do %>
						<p> Welcome! The date and time is <%= Time.now %></p>
					<% end %>
				```
			* `content_for`
				* stores a block of markup in an identifier for later use
				* can be grabbed by passing identifier to yield
				* `app/views/articles/special.html.erb`
				```
					<p> this is a special page.</p>
						
					<% content_for :special_script do %>
						<script> alert('hello!')</script>
					<% end %>
				```
				* `app/views/layouts/application.html.erb`
				```	
					<html>
						<head>
							<title>Welcome!</title>
							<%= yield :special_script %>
						</head>
						<body>
							<p>Welcome! the date and time is <%= Time.now %></p>
						</body>
					</html>	
				```	
		* [DateHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/date_helper_rb.html)
			* `date_select`
				* returns a set of select tags (year, month, day) 
				* `date_select("article", "published_on")
			* `datetime_select`
				* returns a set of select tage (year, month, day, hour, minute) 
				* `datetime_select("article", "published_on")
			* `distance_of_time_in_words`
				* reports the approximate distance in time between two time or date objects or integers as seconds 
				```
					distance_of_time_in_words(Time.now, Time.now + 15.seconds)
					distance_of_time_in_words(Time.now, Time.now + 15.seconds, include_seconds: true)
				```
			* `select_date`
				* returns a set of html select tags(year, month, day) with date provided
					* date select that defaults to the date provided 
						* `select_date(Time.today + 6.days)
					* date select that defaults to today
						* `select_date()`
			* `select_datetime`	
				* returns a set of html select-tags (year, month, day, hour, minute) with datetime provided
					* datetime select that is provided 
						* `select_datetime(Time.now + 4.days)`
					* datetime select that defaults to today
						* `select_datetime()`
			* `select_day`
				* returns a select tag with options for each of the days 1-31 with current day selected 
					* day provided
						* `select_day(Time.today + 2.days)`
					* defaults number given
						* `select_day(5)`
			* `select_hour`
				* returns a select tag with options for each of the hours 0 - 23 with current hour selected 
				* `select_hour(Time.now + 6.hours)`
			* `select_minute`
				* returns a select tag with options for each of the minutes 0 - 59 with current minute selected 
				* `select_minute(Time.now + 6.hours)`
			* `select_month`
				* returns a select tag with options for each of the months January through December with current month selected 
				* `select_month(Date.today)`	
			* `select_second`
				* returns a select tag with options for each of the second 0 - 59 with current second selected 
				* `select_secont(Time.now + 16.minutes)`
			* `select_time`
				* returns a set of html select tags (hour and minute)
				* `select_time(Time.now)`
			* `select_year`
				* returns a select tag with options for each of the five years on each side of the current which is selected 
					* five years before after today 
						* `select_year(Date.today)`	
					* between 1900 and 2009
						* `select_year(Date.today, start_year: 1900, end_year: 2009)`
			* `time_ago_in_words`
				* like distanct_of_time_in_words but to_time is fixed to Time.now
				* `time_ago_in_words(3.minutes.from_now)
			* `time_select`
				* returns a select tag (hour, minute, and optional seconds) prepared for multi-parameter assignment to Active Record Object
				* `time_select("order", "submitted")
		* [DebugHelper](http://api.rubyonrails.org/files/actionview/lib/action_view/helpers/debug_helper_rb.html)
			* returns a pre tag that has an object dumped by YAML
			* a very readable way to inspect an object 
			```		
				my_hash = {'first' => 1, 'second' => 'two', 'third' => [1,2,3]}
				debug(my_hash)
			```
			* the ouput is 
			```
				<pre class="debug_dump">---
				first: 1
				second: two
				third:
				- 1
				- 2
				- 3 
				</pre>
			```

# May 19 - work the grind

fun fact improper shut down can cause postgress to freak out and fuck your shit up 

```
	PG::ConnectionBad at /

	could not connect to server: Connection refused
		Is the server running on host "localhost" (::1) and accepting
		TCP/IP connections on port 5432?
	could not connect to server: Connection refused
		Is the server running on host "localhost" (127.0.0.1) and accepting
		TCP/IP connections on port 5432?
```

this is the error i was getting. this is likely caused by a [stale postgress pid file that is intefering with normal work](http://stackoverflow.com/questions/19828385/pgconnectionbad-could-not-connect-to-server-connection-refused)

* solution 1
	* To fix it remove/rename the PID file. Find the postgres data directory. On a MAC using homebrew it is /usr/local/var/postgres/, other systems it might be /usr/var/postgres/.
	* To make sure this is the problem, look at the log file (server.log). On the last lines you will see: FATAL:  lock file "postmaster.pid" already exists HINT:  Is another postmaster (PID 347) running in data directory "/usr/local/var/postgres"?
	* If so, rm postmaster.pid
	* Restart your server. On a mac using launchctl (with homebrew) the following commands will restart the server.
	```	
		launchctl unload homebrew.mxcl.postgresql.plist  
		launchctl load -w homebrew.mxcl.postgresql.plist
	```
	* did not work for me

* solution 2 
	* get info on how brew and postgres play
		*  ` brew info postgres`
	* start postgresql and restart at login 
		* ` brew services start postgresql`
	* woooooooo it worked 
		* postgres does not like getting interupted and takes rudness really poorly, noted

 we must conquer the evil of margin collapsing 

* margin collapsing 
	* top and bottom margins of blocks are sometimes combined into a single margin whose size is the largest of the margins combined 
	* three basic cases 
		* adjacent siblings 
			* margins of adjacent siblings are collapsed 
		* parent and first/last child
			* the margins collaps if
				* if there is no 
					* border 
					* padding 
					* inline content 
					* or clearance 
				* to separate the margin-top of a block from the margin-top of its first child block 
				* or no 
					* border
					* padding
					* inline content
					* height	
					* min-height	
					* max-height 	
				* to separate the margin-bottom of a block from the margin bottom of its last child 
		* empty blocks 
			* the margins collaps if 
				* there is no 
					* border
					* padding 
					* inline comment 
					* height 
					* min-height 
				* to separate a blocks margin-top from its margin-bottom 
		* margins of floating and absolutely positioned elements never collapse	
				
of course bootstrap and sass-rails do not play nice together. overide default variables is a whole thing wooooo

kk so apperently the thing is how sass deals with variables. sass does not allow variables to be used until they are declared. i guess that means that the entire framework has to be in memory before you can overide. 

* _variables.scss ->
	* bootstrap ->
		* mixins ->
			* overwrites -> 
				* your own style 

oy now we have to have a deep understanding of how rails loads the css assets 

* application.css.scss is the master stylesheet in the pipeline 
	* require_self
		* putss the css contained within the file at the top of any other css being imported in the following lines 
		* if you want to override everything else heres where to do it 
	*  require_tree 
		* imports all other files in `app/assets/stylesheets/`

* maximizing sass power in the rails framework can be troubling 
	* but there is a way 
	* `app/assets/stylesheets/application.css.scss`
	```
		/* 
			*= require_self
			// only require main
			*= require main
		*/
	```
	* directory structure: 
		* assets/
			* stylesheets/
				* /application.css.scss
				* /main.scss
					* base/
						* /mixins.scss
						* /globals.scss
						* /normalize.scss
					* styles/
						* /posts.scss
						* /home.scss
	* `app/assets/stylesheets/main.css.scss`
	```
		@import "base/mixins.scss";
		@import "base/normalize.scss";
		@import "base/globals.scss";
		@import "styles/home.scss";
		@import "styles/posts.scss";
	```
	
# May 21 - Linux 

* chown
	* for changing the owner/group of a file 

* chmod 
	* for changing the mode of a file 
	
* mode 
	* actual read/write/execute bits 	

* import data into postgress
	* `psql -d [database_name] [filename]`
		* `-d` 
			* flag to specify the database name 

# May 22 - Boolean logic 

Im gonna build a fucking compiler god damn it. but first boolean logic.

#### following elements of computer systems

* boolean logic 
	* boolean algebra 
		* works with boolean values 
			* boolean values 
				* contain only 2 possible states 
					* true/false is an example
	* boolean gates 
		* physical implementations of boolean functions 
		* boolean functions
			* a function that operates on binary inputs and returns binary outputs 
	* boolean operations 
		* standardized observed causal relationships between input and output 
		* typical operators 
			* and
				* x and y is 1 exactly when both x and y are 1 
				* symbolic representation `*` 
			* or 
				* x or y is 1 exactly when either x or y or both are 1
				* symbolic representation `+` 
			* not 
				* not x is 1 exactly when x is 0
				* symbolic representation `!`
	* truth table representation 
		* the simplest way to specify a boolean function 
		* enumerate all the possible values of the functions input variables 	
		* enumerate all the possible values of the functions output variables for each set of inputs 
	* boolean expressions 
		* boolean functions can be specified using and stringing together operators 
		* boolean literals 
			* boolean variables or their negations 
	* canonical representation 
		* a notation to represent a boolean function succinctly 
		* select all the rows in which the function has value 1 
			* for each row with a value of 1 
				* apply the and operator to literals with a 1 point of reference 
		* all boolean functions regardless of complexity can be expressed using three boolean operators 
			* and
			* or
			* not
	* two-input boolean functions 
		* number of boolean functions that can be defined over n binary variables is `2^2^n`
		* each of those functions for simple two-input boolean functions has a conventional name 
		* for all examples below `x = 0 0 1 1` and `y = 0 1 0 1`
			* constant 0
				* operation: `0`
				* result: `0 0 0 0`
			* and 
				* operation: `x * y`
				* result: `0 0 0 1`
			* x and not y 
				* operation: `x * !y`
				* result: `0 0 1 0`
			* x 
				* operation: `x`
				* result: `0 0 1 1`
			* not x and y 
				* operation: `!x * y`
				* result: `0 1 0 0`
			* y 
				* operation: `y`
				* result: `0 1 0 1`
			* xor 
				* operation: `x * y + !x * !y`
				* result: `0 1 1 0`
			* or 
				* operation: `x + y`
				* result: `0 1 1 1` 
			* nor 
				* operation: `!(x + y)`
				* result: `1 0 0 0` 
			* equivalence 
				* operation: `x * y + !x * !y`
				* result: `1 0 0 1`	
			* not y
				* operation: `!y`
				* result: `1 0 1 0`
			* if y then x 
				* operation: `x + !y`
				* result: `1 0 1 1`
			* not x 
				* operation: `!x`
				* result: `1 1 0 0`
			* if x then y 
				* operation: `!x + y`
				* result: `1 1 0 1`
			* nand 
				* operation: `!x * !y`
				* result: `1 1 1 0`
			* constant 1 
				* operation: `1`
				* result: `1 1 1 1`
		* nand function is super special yo 
			* each operation 
				* and 
				* or 
				* not
			* can be constructed from nand expressions alone 
				* every boolean function can be constructed from and, or and not operations
					* every boolean function can be constructed from nand alone 
		* gate logic 
			* gate 
				* a physical device that implements a boolean function 
			* if a boolean function f operated on n variables and returns m binary results 
				* the gate implements f has 
					* n input pins 
					* m output pins 
			* complex gates are composed from elementary gates 
				* the simplest gate is a transistor 
				* transistors 
					* simple piece of circutry that controls current 
						* two states 
							* on / 1
							* off / 0
				* primitive gates 
					* black box abstraction that implements an elementary logical operation 
						* and 
							* looks like a bullet
						* or 	
							* looks like a shield	
						* not 
							* looks like a triangle with a boob 
				* composite gates 
					* a abstraction that implements more complex logical operations by using a series of primitive gates
				* since they all boil down to boolean values you can create several layers of abstraction that compile down to primitive gates
				* gate logic 
					* also known as logic design 
					* the art of interconnecting gates in order to implement more complex functionality 
					* all gates can be viewed from two perspectives 
						* implementation
							* the gates internal architecture 
						* interface
							* the input and output pins that is exposed to the outside world 
					* interface is unique but implementation is completely open ended 
					* the fundemental requirement of logic design 	
						* the gate implementation will realize its stated interface in one way or another 
				* hardware description language - hdl
					* you can plan a chip architecture with a markup language 
					* hardware simulator takes your markup and checks it 
				* hdl definition of a chip 
					* header section 
						* specifies the chips interface
							* chip name 
							* name of input and output 
					* parts section 	
						* name of all lower-level parts 
						* topology of all the lower-level parts 
						* represented by a statement that specifies the part name and the way it is connected to other parts in the design
























