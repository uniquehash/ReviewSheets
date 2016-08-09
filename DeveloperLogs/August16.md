# August 3rd - devise and routing 

This routing shit is completely fucked. gotta get some context on devise before i do anything 


# questions 

* how does scoping work in a rails app? what does it mean?



# explore

* [devise](https://github.com/plataformatec/devise)
	* a flexible authentication solution for rails based on [warden](https://github.com/hassox/warden/wiki)
		* rack based 
		* mvc solution based on rails engine 
		* allows multiple models signed in at a time 
		* based on modularity 
		* warden is
			* a mechanism for authentication in rack based ruby applications 
				* designed for multiple applications sharing within the same rack instance in mind 
	* 10 modules 
		* [database authneticatable](http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/DatabaseAuthenticatable)
			* stores hashes and passwords in the database to validate authenticity of a user while signed in 
				* authentication can be done both through post request or http basic authentication 
		* [omniauthable](http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/Omniauthable) 
			* adds [OmniAuth](https://github.com/intridea/omniauth) support to devise 
		* [confirmable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Confirmable)
			* sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in 
		* [recoverable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Recoverable)
			* resets the user password and sends reset instructions 
		* [registerable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Registerable)	
			* handles signing up users through a registration process 
				* allows them to edit and destroy their account 
		* [rememberable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Rememberable) 
			* manages generating and clearing a token for remembering the user from a saved cookie 
		* [trackable[(http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Trackable)
			* tracks sign in count, timestamps and ip addresses 
		* [timeoutable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Timeoutable)
			* expires sessions that have not been active in a specified period of time 
		* [validatable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Validatable)
			* provides validations of email and password
				* optional 
				* can be customized to define your own validations 
		* [lockable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Lockable)
			* locks an account after a specified number of failed sign-in attempts 
				* can unlock via email or after specific time period 
	* getting started 
		* controller filters and helpers 
			* devise creates some helpers to use inside the controllers and views 
				* to set up a controller with user authentication and your devise model is called `User`
					* `before_action :authenticate_user!`
				* to verify if a user is signed in 
					* `user_signed_in?`
				* retrieve current signed-in user
 					* `current_user` 
				* access the session for this scope 
					* `user_session` 
			* after signing in a userr and confirming the account or updating the password 
				* devise will look for a scoped root path to redirect to 
					* example: 
						* when using a `:user` resource 
							* the `user_root_path` will be used if it exists 
						* other wise
							* the default `root_path` is used
					* you can customize redirect hooks by overriding 
						* `after_sign_in_path_for` 
						* `after_sign_out_path_for` 
		* configuring models 
			* the devise method in your models also accepts some options to configure its modules 
				* chose the cost of the hashing algorithm 
					* `devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 20`
					* besides `:stretches` you can define 
						* more details in the initializer file created when `devise:install` was invoked 
							* usually located at `/config/initializers/devise.rb` 
						* `:pepper`
						* `:encryptor` 
						* `:confirm_within` 
						* `:remember_for` 
						* `:timeout_in` 
						* `:unlock_in` 
		* strong parameters 
			* when customizing your own views you may add new attributes to forms 
			* rails 4 has moved parameter sanitization from the model to the controllwe 
				* devise must handle this concern there as well
			* there are three actions in devise that allow any set of parameters to be passed down to the model 
				* as such require sanitization 
					* `sign_in` (`Devise::SessionsController#create`) - permits only the authentication keys 
					* `sign_up` (`Devise::RegistrationsController#create`) - permits authentication keys plus `password`, `password_confirmation`
					* `account_update` (`Devise::RegistrationController#Update`) - permits authentication keys plus `password`, `password_confirmation` and `current_password` 
				* to permit additional parameters lazily do so by using a before filter in `ApplicationController`: 
					* example: 
						``` 
							class ApplicationController < ActionController::Base 
								before_action :configure_permitted_parameters, if: :devise_controller?
								
								protected
						
								def configure_permitted_parameters 
									devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
								end 
							end 
						```
							* works for any additional fields where parameters are simple scalar types 
						* for nested attributes that are simple sclara types
						```
							def configure_permitted_parameters 
								devise_parameter_sanitizer.permit(:sign_in) do |user_params|
									user_params.permit(:username, :email)
								end 
							end 
						```
							* must tell devise about the nester parameter and types 
								* you can completely change devise defaults or invoke custom behaviour by passing a block 
						* for nested attributes with checkboxes that express the roles a user may take on registration 
						```
							def configure_permitted_parameters 
								devise_parameter_sanitizer.permit(:sign_up) do |user_params| 	
									user_params.permit({ roles: []}, :email, :password, :password_confirmation)
								end 	
							end 
						```
					* for a list of permitted scalars and how to declare permitted keys in [nested hashes and arrays](https://github.com/rails/strong_parameters#nested-parameters)
				* if you have multiple devise models and you want to set up a different parameter sanitizer per model 
					* inherit from `Devise::ParameterSanitizer` 
						* example: 
							``` 
								class User::ParameterSanitizer < Devise::ParameterSanitizer
									def initialize(*)
										super 
										permit(:sign_up, keys: [:username, :email])
									end 
								end 
							```
							* then configure your controllers to use it 
							```
								class ApplicationController < ActionController::Base 
									protected 
									
									def devise_parameter_sanitizer 
										if resource_class == User 
											User::ParameterSanitizer.new(User, :user, params) 
										else 
											super # user default	
										end 
									end 
								end 
							```
								* overrides the permitted parrametes for the user to be both `:username` and `:email` 
								* this is the non lazy way 
			* configuring views 
				* devise is an engine so all its views are packaged inside the gem 
					* to unpack the views and copy them to your application 
						* `$ rails generate devise:views` 
				* devise offers an easy way to customize views 
					* in `config/initializers/devise.rb`
						* set `config.scoped_views = true` 
					* allows to have views based on the role like `users/sessions/new` and `admins/sessions/new`
						* if no view is found within the scope devise will user the default view at `devise/sessions/new`
						* can use a generator to generate scoped views 
							* `$ rails generate devise:views users` 
							* to generate only a few sets of views like ones for `registerable` and `confirmable` 
								* pass a list of modules to the generator with the `-v` flag		
									* `$ rails generate devise:views -v registrations confirmations` 
			* configuring controllers 
				* if the customization at the views level is not enough you can customize each controller by following the following steps 
					* create custom controllers using the generator which requires a scope 
						* `$ rails generate devise:controllers [scope]`
						* if you specify `users	 as the scope, controllers will be created in `app/controllers/users/` 
							* example:
								* the session controller	
								```
									class Users::SessionsController < Devise::SessionsController 
										# GET /resource/sign_in
										# def new 
										# 	super 
										# end 
										...
									end 
								```
					* tell the router to use this controller 
						* `devise_for :users, controllers: { sessions: 'users/sessions'}
					* copy the views from `devise/sessions` to `users/sessions` 
						* since the controller was changes it wont use the default views located in `devise/sessions` 
					* finally change or extend the desired controller actions 
						* example: 
							* completely override a controller action
							```
								class Users::SessionsController < Devise::SessionsController
									def create 
										# custom sign-in codr 
									end 
								end 
							```
							* add new behaviour to a controller action 
							```
								class Users::SessionsController < Devise::SessionsController 
									def create 
										super do |resource| 
											BackgroundWorker.trigger(resource) 
										end 
									end 
								end 
							```
				* devise uses flash messages to let users know if sign in was successful or unsuccessful 
					* devise expects your applciation to call `flash[:notice]` and `flash[:alert]` as appropriate 
					* do not print the entire flash hash 
						* print only specific keys 
					* sometimes devise adds a `:timedout` key to the flash hash 
						* not meant for display 	
						* remove the key if you intend to print the entire hash 
		* configuring routes 
			* devise also ships with default routes 
				* to customize do it through the [`devise_for`](http://www.rubydoc.info/github/plataformatec/devise/master/ActionDispatch/Routing/Mapper%3Adevise_for) method 
					* accepts several options like `:class_name`, `:path_prefix`
					* example: 
						* `devise_for :users, path: 'auth', path_name: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock'm registration: 'register', sign_up: 'cmon_let_me_in' }`
			* to have deeper customization 
				* creates routes normally and wrap them in a `devise_scope` block in the router 
					* example setup - allow `/sign_in` besides `/users/sign_in`
					* example: 
						```
							devise_scope :user do 
								get 'sign_in', to: 'devise/sessions#new' 
							end 
						```
							* tells devise to use the cope `:user` when `/sign_in` is accessed
								* also aliased as `as` in your router 
* [rails routing](http://guides.rubyonrails.org/routing.html)
	* i totally did this before but hey round 2 
	* the purpose of the rails router 
		* rails router recognizes urls and dispatches them to a controller action 
			* it can generate paths and urls 
				* avoids hardcoding strings in views 
		* connecting urls to code 
			* when rails receives an incoming request for 
				* `GET /patients/17` 
			* asks the router to match it to a controller action 
			* if the first matching route is 
				* ` get '/patients/:id', to: 'patients#show'`
			* the request is dispatched to the `patients` controllers `show` action with {id: '17'} in params
		* generating paths and urls from code 
			* paths and urls can be generated 
				* ` get '/patients/:id', to: 'patients#show', as: 'patient'`
			* application contains 
				* `@patient = Patient.find(17)`
			* and this in the corresponding view 
				* `<%= link_to 'Patient Record', patient_path(@patient) %>`
			* the router automatically generates the path `/patients/17` 
				* reduces brittleness of views 
				* easier to understand code 	
	* resource routing the rails default 
		* resource routing allows you to quickly declare all common routes for a give resourceful controller 
			* convenience 
		* resources on the web 
			* browsers request pages from rails by making a request for a url using a specific HTTP method 
				* each method is a request to perform an operation on the resources 
				* a resource route maps a number of related requests to actions in single controller 
		* crud, verbs, action 
			* a resourceful route provides a mapping between http verbs and urls to controller actions 
			* by convention each action also maps to a specific crud operation in the db 
			* rails are matched in the order they are specified 
		* path and url helpers 
			* creating a resourceful route exposes a number of helpers to the controllers in your application 	
				* example: 
					* helpers for resource `:photos` 
					```
						photos_path 		# => returns /photos
						new_photo_path 		# => returns /photos/new 	
						edit_photo_path(:id) 	# => returns /photos/:id/edit
						photo_path(:id) 	# => returns /photos/:id
					```
		* defining multiple resources at the same time 
			* you can define resources in routes all in one line 
		* singular resource 
			* some resources are always looked up without referencing an id 
				* can use a singular resource map 
					* `get 'profile', to: 'users#show' 
				* can also be specified 
					* `get 'profile', to: :show, controller: 'users'`
			* singular resourful route helpers 
				```
					new_geocoder_path 		# => returns /geocoder/new 
					edit_geocoder_path		# => returns /geocoder/edit 
					geocoder_path 			# => returns /geocoder
				```
		* controller namespaces and routing 
			* you may wish to organize groups of controllers under a namespace 
				* example setup - group a number of administrative controllers to an admin namespace 
				* example: 
					* place all of the controllers under the `app/controllers/admin` directory 
					* router 
					```
						namespace :admin do 
							resources :articles, :comments 
						end 
					```
					* rails will create a bunch of routes for each of the articles and comments controller 
					* to route `/articles` without the prefix admin to `Admin::ArticlesController`		
					```	
						scope module: 'admin' do 
							resources :articles, :comments
						end 
					```
					* or for a single case 
					```		
						resources :articles, module: 'admin' 
					```
					* to route `/admin/articles` to ArticlesController without the admin module prefix 
					``` 	
						scope '/admin' do 
							resources :articles, :comments
						end 
					```
					* or for single case 
					```
						resources :articles, path: '/admin/articles' 
					```
		* nested resources 
			* it is common to have resources that are logically children of other resources 
			* nested routes allow you to capture this relationship in the routing 
			```
				resources :magazines do 
					resources :ads 
				end 
			```
			* limits to nesting 
				* you can nest resources within other nested resources 
					* deeply nested resources become an issue fast 
				* resources should never be nested more than 1 level deep 
		* routing concerns 
			* allow you to declare common routes that can be reused inside other resources and routes 
				* define a concern 
				```
					concern :commentable do 
						resources :comments 
					end 
				
					concern :image_attachable do 
						resources :images, only: :index 
					end 
				```
			* these concerns can be used in resources to avoid code duplication and share behavior across routes 
	* non-resourceful routes 
		* rails has powerful support for routing arbitrary urls to actions 
			* set each route seperately 
		* bound parameters 
			* when you set up a regular route you supply a series of symbols that rails maps to parts of an incoming http request 
			* two of these symbols are special 
				* `:controller` 
					* maps to the name of a controller in your application 
				* `:action` 
					* maps to the name of an action within that controller 
				* exmaple: 
					* `get ':controller(/:action(/:id))'`
						* an incoming request of `/photos/show/1` is processed by this route 
							* invoke the `show` action of the `PhotosController` and to make the final parameter '1' available as `params[:id]`
						* also routes the incoming request of `/photos` to `PhotosController#index` since `:action` and `:id` are optional parameter 
		* dynamic segments 
			* you can set up as many dynamic segments within a regular route as you like 
				* anything other than `:controller` or `:action` will be available to the action as part of params 
				* with route `get ':controller/:action/:id/:user_id'` 	
					* an incoming request of `/photos/show/1/2` will be dispatched to the show action of the `PhotosController` and `params[:id]` will be '1' `params[:user_id]` will be '2'
		* static segments 
			* you can specify static segments when creating a route by not prepending a colon to a fragment 
				* `get ':controller/:action/:id/with_user/:user_id'`
			* this route would respond to paths such as `/photos/show/1/with_user/2` 
				* params would be `{ controller: 'photos', action: 'show', id: '1', user_id: '2' }`
		* the query string 
			* the params will also include any parameters from the query string 
				* route: `get ':controller/:action/:id'` 	
					* incoming request of `/photos/show/1?user_id=2` will be dispatched to the `show` action of the `PhotosController` and params would be `{ controller: 'photos', action: 'show', id: '1', user_id: '2' }`
		* defining defaults 
			* no need to explicitly use the `:controller` and `:action` symbols within a route 
				* can be supplied as defaults 
				* `get 'photos/:id', to: 'photos#show'`
					* rails will match an incoming request of `/photos/12` to the show action of `PhotosController`
				* can also define other defaults in a route by supplying a hash for the `:default` option 
					* `get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }` 
						* rails matches `photo/12` show action of `PhotosController` and sets params[:format] to 'jpg'
			*  cannot override defaults with query parameters for security 
		* naming routes
			* specify a name for any route using the `:as` option 
				* `get 'exit', to: 'sessions#destroy', as: :logout` 
				* this creates `logout_path` and `logout_url` as named helpers in your application 
				* calling `logout_path` will return `/exit`
			* you can also use this to override routing methods defined by resources 
				* `get ':username', to: 'users#show', as: :user` 	
				* defines a `user_path` method that will be available in controllers, helpers and views 
		* http verb constraints 
			* in general you should use the `get`, `post`, `put`, `patch`, and `delete` methods to constrain a route to a particular verb 
				* you can use the math method with the `:via` option to match multiple verbs at once 
					* `match 'photos', to: 'photos#show', via: [:get, :post]`
				* you can match all verbs to a particular route using `via: :all` 
					* `match 'photos', to: 'photos#show', via: :all`
			* get in rails wont check for CSRF token 
				* never write to db from a get request 
		* segment constraints 
			* you can use the `:constraints` option to enforce a format for a dynamic segment 
			```
				get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }

			```
			* will match route `/photos/A12345` but not `/photos/893` 
			* to be more succinct 
			```
				get 'photos/:id', to: 'photos#show', id: /[A-Z]\d{5}/
			```
			* `:constraints` takes a regular expressions with the restriction that regexp anchors cannot be used 
		* request-based constraints 
			* you can also constrain a route based on any method on the request obkect that returns a string 
			* you can specify a request based constraint the same way that you specify a segment constraint 
			```
				get 'photos', to: 'photos#index', constraints: {subdomain: 'admin' }
			```
			* you can also specify constraints in a block form 
			```
				namespace :admin do 
					constraints subdomain: 'admin' do 
						resources :photos 
					end 
				end 
			```
			* request constraints work by calling a method on the request object with the same name as the hash key and then compare the return value with the hash value 
				* constraint values should match the corresponding request object method return type 
				* example 
					* `constraints: { subdomain: 'api' }` 
					* will lmatch an api subdomain as expected 
					* however using a symbol will not work because the request returns a string 
				* there is an exception for the `format` constraint
		* advanced constraints 			
			* if you have more advanced constraints you can provide an object that responds to `matches?` that rails should use 
				* example setup - route all users on a blacklist to the `BlacklistController` 
				* example: 
				```
					class BlacklistConstraint 
						def initialize 
							@ips = Blacklist.retrieve_ips 
						end 
					
						def matches?(request) 
							@ips.include?(request.remote_ip)
						end 
					end 
					
					Rails.application.routes.draw do 
						get '*path', to: 'blacklist#index', constraints: BlacklistConstraint.new
					end 
				```
			* you can also specify a constraint as a lamba 
				* example: 	
				```
					Rails.application.routes.draw do 
						get '*path', to: 'blacklist#index', constraints: lambda { |request| 
							Blacklist.retrieve_ips.include?(request.remote_ip) }
					end
				```
				* both receive the `request` object as an argument 
		* route globbing and wildcard segments 
			* a way to specify that a particular parameter should be matched to all the remaining parts of a route 
				* example: 
					* `get 'photos/*other', to: 'photos#unknown'`
					* will match a `photos/12` or `/photos/long/path/to/12` setting params[:other] to "12" or "/long/path/to/12"
					* fragment prefixes with a start are called wildcard segments 
						* can occur anywhere in a route 
						* `get 'books/*section/:title', to: 'books#show'`
		* redirection 
			* you can redirect any path to another path using the redirect helper in your router 
				* `get '/stories', to: redirect('/articles')`
			* you can also reuse dynamic segments from the match in the path to redirect to 
				* `get '/stories/:name', to: redirect('/artices/%{name}')`
			* you can also provide a block to redirect which receives the symbolized path parameters and request object 
				* example: 
				```
					get '/stories/:name', to: redirect { |path_params, req| 
						"/articles/#{path_params[:name].pluralize}" } 
					
					get '/stories', to: redirect { |path_params, req| 
						"/articles/#{req.subdomain}" }
				```	
			* the default redirection is a 301 moved permantly redirect 
				* some browsers cach this type of redirect making the old page inaccessible 
				* use status option to change the responce status 
				* example: 
					```
						get '/stories/:name', to: redirect('/articles/%{name}', status: 302)
					```
			* routing to rack applications 
				* instead of a string like 'articles#index' which corresponds to the index action in the `ArticlesController` you can specigy any Rack app as the endpoint 
					* example: 
						* `match '/application.js', to: MyRackApp, via: :all`
						* as long as `MyRackApp` responds to call and returns a [status, headers, body] the router wont know the difference between the rack application and an action 
				* if you specify a rack application as the endpoint for a matcher remember that the route will be unchanged in the receiving application 
					* example: 
						* rack receiving '/admin'	
							* `match '/admin', to: AdminApp, via: :all`
				* if you prefer to have your rack app receive request at teh root path instead use mount 
					* `mount AdminApp, at: '/admin'`
			* using root 
				* you can specify what rails should route '/' to with the `root` method 
					* example: 
					```	
						root to: 'pages#main' 
						root 'pages#main' #shortcut 
					```
				* the `root` route should be at the top of the file because it should be matched first 
					* only routes get requests to the action 
				* you can also use root inside namespaces and scopes as well
					* example: 
						```
							namespace :admin do 
								root to: 'admin#index' 
							end 
				
							root to: 'home#index'
						```

# August 6th - design the groups refactor and media item module  

learning about modules today. they seem cool 


# questions 

* what is an executable statement? in the ruby context?




# explore 

* [modules dive 1](http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html)
	* modules
		* a great way of grouping together methods, classes, and constants 
		* two major benefits 
			* provide a namespace and prevent name clashes 
			* implement the mixin facility 
		* namespace 
			* module constants are named just like class constants 
				* initial uppercase letter 
			* method are defined just like class methods 
			* call a module by preceding its name with the modules name and a period 
			* reference a constant using the module name and two colons
			* example setup - we have a set of trigonometry functions `sin` and `cos` in `trig.rb`, a simulation with functions `begood` and `sin` in `action.rb` we want to include both of these in a file 
			* example: 
				* `trig.rb` 
				```
					module Trig 
						PI = 3.14592654
						def Trig.sin(x) 
						# ... 
						end 
						def Trig.cos(x)
						# ... 
						end 
					end 
				```
				* `action.rb`
				```	
					module Action 
						VERY_BAD = 0
						BAD 	 = 1 
						def Action.sin(badness) 
						# ... 
						end 
					end 
				```
			 	* third file that calls them 
				```
					require "trig" 
					require "action" 
				
					y = Trig.sin(Trig::PI/4)
					wrongdoing = Action.sin(Action::VERY_BAD)
				```
		* mixins 
			* a controlled way of adding functionality to classes 
				* there true power comes out when the code in the mixin starts to interact with code in the class that uses it 
				* example setup - the `Comparable` mixin is used to add comparison operators `(<, <=, ==, >=, and >)` and the method `between?` to a class. 
					* assumes that any class that `includes` the module defines the operator `<=>`
					* as a class writer you define `<=>` and get six comparison functions for free 
					* a `song` class where songs are comparable based on their duration 
				* example:
					* `song.rb`  
					``` 
						class Song 
							include Comparable 
							def <=> (other) 	
								self.duration <=> other.duration 
							end 
						end 
					``` 
					* test file 
					```
						song1 = Song.new("My Way", "Sinatra", 255)
						song2 = Song.new("Biculops", "Fleck", 260)	
				
						song1	<=> 	song2	#=>	-1
						song1	< 	song2 	#=>	true
						song1 	==	song2	#=>	true
						song1	>	song2	#=>	false
					```		
			* a module cannot have instances because a module is not a class 
			* you can include a module within a class definition 
				* makes the modules instance methods available as methods to the class 
					* i.e. mixed in 
			* the `include` statement 
				* simply makes a reference to a named module 
					* if module is in a seperate file you must `require` to drag the file in before using `include` 
					* if multiple classes include that module they all point to the same thing 
						* changing the definition of a method within a module will exhibit the new behavior 
				* example: 
					```
						module Debug 
							def whoAmI?
								"#{self.type.name} (\##{self.id}): #{self.to_s}"
							end 	
						end 
					
						class Phonograph 
							include Debug 
							# ...
						end 
				
						class EightTrack 
							include Debug 
							# ... 	
						end 
			
						ph = Phonograph.new("West End Blues")
						et = EightTrack.new("surrealistic pillow") 
						ph.whoAmI? >> "Phonograph (#537766170): West End Blues" 	
						et.whoAmI? >> "EightTrack (#537765850): Surrealistic Pillow" 
					```				
					* by including the `debug` module both `Phonograph` and `EightTrack` gain access to the `whoAmI?` instance method 
			* instance variables
				* in ruby 
					* the first mention of an `@`-prefixed variable creates the instance variable in the current object, `self`
				* the module you mix into your client class may create instance variables in the client object and use the `attr` and friends to define accessors for these instance variables 
				* example: 
					```
						module Notes 
							attr :concertA	
							def tuning(amt) 
								@concertA = 440.0 + amt 
							end 
						end 
					
						class Trumpet 
							include Notes 
							def initialize(tune) 
								tuning(tune) 
								puts "Instance method returns #{concertA}" 
								puts "Instance variable is #{concertA}"
							end 
						end 
					
						# The piano is a little flat, so we will match it 
						Trumpet.new(-5.3)
						
						#=> Instance method returns 434.7
						#=> Instance variable is 434.7
					```
					* we have access to the methods defined in the mixin and access to the necessary instance variables as well 
						* there is a chance that a different mixin may use an instance variable with the same name and create a collision 
					```
						module MajorScales 
							def majorNum 
								@numNotes = 7 if @numNotes.nil?
								@numNotes # Return 7 
							end 
						end 
				
						module PentatonicScales 
							def pentaNum 
								@numNotes = 5 if @numNotes.nil?
								@numNotes # Return 5?
							end 
						end 
				
						class ScaleDemo 
							include MajorScales 
							include PentatonicScales 
							def initialize 
								puts majorNum # should be 7 
								puts pentaNum # should be 5 
							end 
						end 
					
						ScaleDemo.new 
						#=> 7 
						#=> 7
					```
					* both of the mixins use an instance variable `@numNotes` 	
						* they intefer super no bueno 
				* mixin modules do not try to carry their own instance data around 
					* they use accessors to retrieve data from the client object 
					* to create mixin that have its own state 
						* ensure that the instance variables have unique names to distinguish them from any other mixin in the system 
			* iterators and the Enumerable module 
				* to use the `Enumerable` mixin 
					* class must have an iterator called `each` which returns the elements of your collection in turn 
					* once `each` is defined the class can support enumerable and once mixed in use methods such as `map`, `include?`, and `find_all?` 
					* if you implement meaningful ordering semantics using the `<=>` method you will also be able to use `min`, `max`, and `sort` 
		* including other files 
			* ruby makes it easy to write good modular code 
				* leads to producing lots of small files containing some chunk of self-contained functionality 
				* typically these are organized as classes or module libraries 
			* with these files produced you will want to incorporate them into your new programs 
				* ruby has two statements that do this 
					* `load "filename.rb"`
						* includes the names ruby source file every time the method is executed 
						* will include source unconditionally you can use it to reload a source file that may have changed since the program began 
					* `require "filename"`
						* loads any given file once 
						* can load shared binary libraries 
						* is an executable statement
							* it may be inside an `if` statement or it may include a string that was just built 
							* the search path can be altered at runtime as well 
					* both accept relative and absolute paths 
						* if given a relative path they will search every directory in the current load path 
					* files loaded using `load` and `require` can include other files, which include other files 
				* example: 
					* `load` can be used to reload a source file that may have changed since the program began 
					```
						5.times do |i|
							File.open("temp.rb", "w") { |f|
								f.puts "module Temp\ndef Temp.var() #{i}; end\nend"
							}
							load "temp.rb" 
							puts "Temp.var"
						end 
						
						#=> 0
						#=> 1
						#=> 2
						#=> 3
						#=> 4
					```
				












