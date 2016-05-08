
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
	'''
		* with namespace declarations
			@namespace veritas "http://veritas.catchme.com";
			* @namespace "https://example.com/var";
		* selecting between the different namespaces would be done as so 
			veritas|A	
				represents name A in the http//veritas.catchme.com namespace
			|B 
				represents the name B in that belongs to no namespace
			*|C 
				represents the name C in any namespace, including no namespace
			D
				represents the name D in the https://example.com/var namespace 		
	'''	

* [selector](https://www.w3.org/TR/css3-selectors/) 
	* selectors are used to select which elements in the DOM created by html are to be styled 
	* selectors represent a structure
		* structure can be used as a condition that determines which elements a selector matches in a html DOM
		* selectors are case-insensitive		
		* types of selectors 
			* simple selector 
				* type selector 
					* the name of a DOM element type, specified by css qualified names
						* css qualified names
							* a name explicitly located within a namespace
							* meaning that identical identifiers and classes can be used for multiple namespaces as long as they are denoted by the appropriate name space
								* this is done by indicating the appropriate namespace followed by "|" and then the simple selector
								
				* universal selector 
					
