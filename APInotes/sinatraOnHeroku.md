#All the steps to get a basic Ruby sinatra app working on heroku 

### Setup Ruby Environment 
* The first step is to setup our enviroment 
	* Test dependencies
		* Ruby 
			* `$ ruby -v`
		* List the current gems installed
			* `$ gem list`
			* For our basic sinatra app we are really only looking for two gems
				* sinatra 
				* bundler
			* If we are missing any of these gems we must download them, fortunately Ruby's package manager is very easy to use
				* `$ gem install /* insert gem to install here */`
		* Git 
			* We must make sure that Git is properly installed on our computer 
				* `$ git --version`	

### Create the Ruby App 
* We must build a basic Ruby sinatra app
	* Create a new .rb file called `app.rb` this will where all the logic of our simple application will reside
		```ruby
			# app.rb

			require 'sinatra'

			get '/' do 
				"I am a simple workin Ruby app!"
			end
		```
	* We will test the simple app by running it locally 
		* `$ ruby app.rb`
		* Most likelely our server will run on port 4567, at the localhost 
			* `http://localhost:4567/`
		* However it is possible that the server is running on an other port, in that case check the last line outputed to the terminal for the correct port number
			* `INFO  WEBrick::HTTPServer#start: pid= /* App pid */ port= /* App port number */`
	* Now we must add a `Procfile` to our ruby app 
		* The `Procfile` basically tells the heroku server how to handle the app
		```ruby 
			# Procfile
			web: bundle exec ruby app.rb -p $PORT
		```
		* Here the `web:` keyword tells heroku that we will be running one process, a web process, and that the process should run our `app.rb` file on the Enviroment variable `PORT` that our enviroment, in this case heroku, provides. 
	* We must add a `Gemfile` to our app
		* The `Gemfile` essentially keeps track of all of your apps dependencies 
		```ruby
			# Gemfile

			source "https://rubygems.org"

			# This should be the same as the version of Ruby you have installed locally 

			ruby "2.2.0" # type ruby -v in terminal to determine what version of Ruby is installed

			# here we add all of our dependencies 
			gem 'sinatra'			
		```
	* Now we bundle our app using the bundler gem that we installed we have to bundle our app in the terminal
		* `$ bundle install`

### Setup Git 

* Now we must create a Git repo in our current directory 
	* `$ git init`
* Then we add all the files in the directory to the next commit 
	* `$ git add .`
* Finally we add the new commit to our repo with a message 
	* `$ git commit - "init"`

### Working with heroku 

* If we haven't yet we must sign up for heroku and create an account
* Next we login to our heroku by entering our credentials via CLI 
	* `$ heroku login`
	* This enables all of the heroku tools in our git repo, please make sure to have a Git repo initialized before preceding 
* We must create our heroku app via CLI 
	* `$ heroku create` 
* Then push our Git repo to our heroku app 
	* `$ git push heroku master`
* Finally we must check to see if our heroku hosted ruby sinatra app is working
	* `$ heroku open`

# It works!!!!


















