
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

What is a preprocessor?
What does interpolation mean?
What is a key selector?



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


