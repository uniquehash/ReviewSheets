
#May 1st - Ruby / Rails

Today we have the joy of setting up the dev environment. this will be fun, fun, fun, fun (it\"'"s friday)

got pow installed, got postgress installed, using the right version of ruby, got the right version of rails, shit on fleek.

Okay so postgres in it"'"s infinite wisdom needs a starting db that is created at instalation by the package manager. of course this didn"'"t happen which means that i had to create it using createdb. 

possible error sources 
	Pow versioning 
		since im using 0.5 and the code base was built using 0.4 i should be wary of Pow issues. if im banging my head against the wall it might not be me.
	Capestrano breaking
		the installation said something about it breaking *shrug* we shall see
	postgresql user
		setting up databases is always a pain in the ass

RVM vs Bundler
	Bundler
		is an installer that will easily install all dependencies 
	RVM
		is a package manager meant for managing multiple versions of ruby and gems. the point is to be able to have dependency sets (gemsets) ready to go for different ruby/rails projects.
	Bundler with RVM
		RVM designates where the gems should go and bundler installs them into the RVM designated place

	
	


