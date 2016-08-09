# July 1st - preparing for the hermit season 

So were going to launch in 15 days which basically means im going to have to allow myself to be completley obssesed with the product and cut out all distractions. I love crunch time.


 * img src 
	* the height and width is only available once the img is loaded 
		* [pass a anonymous function to `.onload` to do shit once its loaded] (http://stackoverflow.com/questions/20221852/firefox-gives-wrong-values-for-image-width-and-height)



# July 3rd - time to get those ajax request going 

So it turns out that javascript has a function called .some() that will basically apply a coniditinal statement to an array. It is awesome. It seems that building stuff is getting easier which is awesome. I feel myself fear code less, and be more willing to do stateless and flatter programming. Things that do not come naturally to me. 


* check a (files file type with JS)[http://stackoverflow.com/questions/190852/how-can-i-get-file-extensions-with-javascript]?
	* filename.split('.').pop();

# July 4th - paperclip investigation 

Celebrate your independence! learn paperclip. 


#### questions 
	
* what is Exif image data?

* what is an 8BIM profile?


* what are the [ImageMagick basic operators](http://www.imagemagick.org/script/command-line-processing.php#geometry)?
	* when passing options 
		* width always precedes the height 
		* arguments passed to geometry argument are maximum values unless a percentage is specified 
		* basic adjustments to width and height
			* `%`
				* tells imageMagick to scale the image by perentage provided 
			* `^`
				* tells imageMagick the minimum values for each dimension 
			* `!`
				* tells imageMagick to fuck the aspect ratio
		* bounding the width, height, and area  
			* `>`
				* shrink the image only if its dimensions are larger than the corresponding width and height arguments
			* `<`
				* enlarge the image only if its dimensions are smaller than the corresponding width and height arguments 
			* `@`
				* specify the maximum area in pixels of an image, again while attempting to preserve the aspect ratio 
		* offsets in geometry 
			* offsets are always signed 
			* affected by the gravity setting 

* how to do a [circular crop with imageMagick](http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=15492&p=54769&hilit=circle+mask#p54769)?
	```
		  convert filename.jpg \
		  \( +clone -threshold -1 -negate -fill white -draw "circle 64,64 64,0" \) \
		  -alpha off -compose copy_opacity -composite filename_circle.jpg
	```

* how to create a thumbnail from an image with arbritatry offsets? 
	* `convert ruler.png -gravity NorthEast -crop 800x150+100+30 thumbnail.png`

* what does the word interpolation mean?
	
* what are rails migration methods? 

* what is [Capistrano](http://capistranorb.com/#)?

* what is symlinking?

* why does symlinking a directory to an apps shared directory allow it to survive between deployments?

* should i go over hashes again? I feel like that shit wont be cold until i implement my own. 

* what exactly are lambdas?

* what is the difference between : and :: in ruby/rails?


##### learn shit

* paperclip 
	* intended to be an easy file attachment library for ActiveRecord
		* keep setup as easy as possible 
		* treat files as like other attributes as possible 
	* actions done to files are not completed until `.save()` is called
	* manages validation based on size and presence 
	* has ability to transform images 
		* thumbnails 
	* attached files are saved to filesystem and referenced in the browser with rails style references 
	* usage 
		* declare that a model has an attachment with the `has_attached_file` method and give it a name 
		* four attributes are wrapped 
			* <attachment>_file_name
				* names the attachment 
				* REQUIRED 	
			* <attachment>_file_size		
				* the size of the attachment 
			* <attachment>_content_type
				* the content type of the attachment 
			* <attachment>_updated_at
				* when the attachment was updated 
		* `has_attached_file` has many options it can take 
			* `has_attached_file(name, options = {}) => object`				
				* takes options as a hash 
				* url
					* the url of where the attachment is publically accessible 
					* can take instance variables 
				* default_url 
					* the url that will be returned if there is no attachment assigned 
				* styles 
					* a hash of the thumbnail styles and their geometries 
						* [ImageMagick geometries](http://www.imagemagick.org/script/command-line-options.php#resize)
						* paperclip adds the '#' option which resizes the image to fit maximally inside the dimensions and then crops the rest off (weighted at the center) 
						* going to have to extend paperclip woooooooo
				* default_style
					* thumbnail style that will be used by default urls 
				* keep_old_files
					* keep the existing attachment files from being automatically deleted when an attachment is cleared or updated 
				* preserve_files 
					* keep the existing attachment files in all cases, even if the parent record is destroyed 
				* whiny
					* will raise an error if paperclip cannot post_process an unploaded file due to a command line error 
				* convert_options 
					* when creating a thumbnail this free-form options array can be passed in various convert command options [ImageMagick convert options](http://www.imagemagick.org/script/convert.php)	
						* hash with the key representing the name of the style and the value being the options being passed 
							* [ImageMagick convert values](http://www.imagemagick.org/script/convert.php)
								* -strip 
									* remove all Exif data from the image 
								* -depth 8
									* specify the depth of the resulting conversion 
								* -border (geometry)
									* surround image with a border of color 
								* -bordercolor(color)	
									* border color 
								* -clip 
									* clip along the first path from the 8BIM profile 
								* -clip-mask (filename)		
									* associate clip mask with the image 
								* -clip-path (id) 
									* clip along a named path from the 8BIM profile 
								* -clone (index) 
									* clone an image 
								* -complex (operator) 
									* perform complex mathematics on an image sequence 
								* -crop (geometry)
									* crop the image 
								* -fft
									* implements the discrete Fourier transfrom 
								* [-geometry (geometry)](http://www.imagemagick.org/script/command-line-processing.php#geometry)
									* preferred size or location of the image 
									* used by many command-line options to specify the desired width and height of an image and other dimensions 
									* to fufill a huge amount of use cases the geometry argument can take a wider range of forms 
										* the usual form is `size[offset]` 
											* size is required and offset is optional 
											* spaces are never permitted within the geometry argument 
										* scale%
											* height and width both scaled by specified percentage 
										* scale-x%xscale-y%
											* height and width individually scaled by specified percentages 	
										* width
											* width given, height automagically selected to preserve aspect ratio
										* xheight
											* height given, width automagically selected to preserve aspect ratio 
										* widthxheight
											* maximum values of height and width fiven, aspect ratio preserved 
										* widthxheight^
											* minimum values of width and height given, aspect ratio preserved
 										* widthxheight!
											* width and height emphatically given, original aspect ratio ignored 
										* widthxheight>
											* shrinks an image with dimensions larger than the corresponding with and /or height argument 
										* widthxheight<
											* enlarges an image with dimensions smaller than the corresponding width and /or height argument 
										* area@
											* resize image to have specified area in pixels. aspect ratio is preserved 
										* {size}{offset}
											* specifying the offset(default is `+0+0`). below, size refers to any of the forms above 
										* {size}{+-}x{+-}y
											* horiontal and vertical offsets x and y respectively specified in pixels. signs are required for both. offsets are affected by -gravity settings. offsets are not affected by % or other size operators 
								* -gravity (type) 
									* horiontal and vertical text placement 
								* -help 
									* print program options 
								* -resize (geometry) 
									* resize the image 
								* -set (attribute, value) 
									* set an image attribute 
								* -size (geometry) 
									* width and height of an image 
								* -thumbnail (geometry) 
									* create a thumbnail of the image 
								* -transform 
									* affine transform image 
				* storage 
					* chooses the storage backend where the files will be stored 
						* :filesystem 
							* default 	
							* on local server 
						* :fog
						* :s3
											
	* validation 
		* post-processing does not start until attachment has been validated 
		* feeds the `validates` or `validates_with` function a attachment model validation function
			* three types of attachment model validation
				* `AttachmentContentTypeValidator`
				* `AttachmentPresenceValidator`
				* `AttachmentSizeValidator`
			* example 
				* `validates :avatar, attachment_presence: true`
				* `validates_with AttachmentPresenceValidator, attributes: :avatar`
		* security validation 
			* must validate filename and content type in 4.0.0
				* `validates_attachment_file_name :avatar, matches: [/png\Z/, /jpg?g\Z/]
	* defaults 
		* global defaults for your application are defined in `config/application.rb` or in any `config/environments/*.rb` 
			* changes by passing a option hash to `default_options`
			* `config/application.rb`
				* `config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: 'local', local_root: '#{Rails.root}/public'}, fog_directory: '', fog_host: 'localhost'}`
	* migrations 
		* there are several migration methods to create the necesary columns in models 
			* add attachment column to a table 
				```
					class CreateUsersWithAttachments < ActiveRecord::Migration
						def up 
							create_table :users do |t|
								t.attachment :avatar
							end
						end 
					
						def down 
							drop_table :users 
						end 	
					end 
				```
				* use `change` method 
				```
 					def CreateUsersWithAttachments < ActiveRecord::Migration
						def change 	
							create_table :users do |t|
								t.attachment :avatar
							end 
						end 
					end 
				```
			* schema definition 
				* you can use `add_attachment` and `remove_attachment` methods to add paperclip columns to an existing table 
					```
						class AddAttachmentColumnsToUsers < ActiveRecord::Migration
							def up 
								add_attachment :users, :avatar
							end 
							
							def down 
								remove_attachment :users, :avatar
							end 
						end 
					```
					* or use the change method 
					```
						class AddAttachmentColumnToUsers < ActiveRecord::Migration 
							def change 
								add_attachment :users, :avatar
							end 
						end 
					```
	* storage 	
		* three storage options 
			* file storage 
			* S3 storage (via `aws-sdk`) 
			* fog storage 
		* understanding storage 
			* files assigned as attachments are by default placed in the directory specified by the `:path` option to `has_attached_file`
			* the default 
				* `:rails_root/public/system/:class/:attachment/:id_partition/:style/:filename`
					* this location was chosen because of Capistrano 
						* the `public/system` directory can be symlinked to the apps shared directory 
							* this allows it to survive between deployments 
			* you can use S3 
				* must include the `aws-sdk` gem in your Gemfile 
				* [you are going to need this rabbit hole](http://www.rubydoc.info/gems/paperclip/Paperclip/Storage/S3)
			* rememeber that public is obviously public 
	* post processing 			
		* it is idiomatic to subclass `Paperclip::Processor` to perform non thumbnail intended post processing 
			* new class should be placed in `lib/paperclip` or `lib/paperclip_processors`
				* these directories are automatically loaded by paperclip 
			* you can specify a processor with the `:processors` option 
				* `has_attached_file :scan, styles: { text: { quality: :better } }, processors: [:ocr]`
					* loads a custom class Paperclip::Ocr and passes it the hash { quality: :better} as well as the file 
					* [rabbithole](https://github.com/thoughtbot/paperclip/blob/master/lib/paperclip/processor.rb)
			* the default 
				* Paperclip::Thumbnail 
					* `has_attached_file :avatar, styles: { thumb: ["32x32#", :png] }`
			* you can specify multiple processors and pass them in an array
				* will be called in FIFO sequence 
			* no processor will run if a style is not defined 
		* Paperclip::Processor
			* allows you to modify attached files when they are attached 
			* must be defined inside the Paperclip module and are also required to be a subclass of `Paperclip::Processor` 
				* must implement `#make` 
				* probably want to implement `#initialize` 
			* `#make` 
				* does the post processing 
				* accepts three arguments 
					* the file to be operated on 
						* must be instance of file 
					* a hash of options defined in `has_attached_file` style hash 
					* the Paperclip::Attachment object 
				* must return an instance of File (Tempfile is acceptable) which contains the results of the processing 
				* [rabbit hole to Paperclip.run to run commandline utilities within processors](http://www.rubydoc.info/github/thoughtbot/paperclip/Paperclip%2FHelpers%3Arun)
					* lord help me.
			* `#initialize` 
				* called when processor instance is created 
			* insperation 
				* [rjcrop](https://github.com/jschwindt/rjcrop)
				
	* events 
		* before and after post processing Paperclip calls back to the model with a few callbacks 
			* allows the model to change or cancel the processing step 
				* `before_post_process` 	
					* called before processing of each attachment 				
				* `after_post_process` 
					* called after processing of each attachment 
				* `before_<attachment>_post_process` 
					* called before processing of the mentioned file 
				* `after_<attachment>_post_process` 	
					* called after processing of the mentioned file 
			* if you return false in a `before_filter` the post processing step will halt 
	* URI obfuscation 
		* obfuscate filenames of publically available files 
			* using an interpolation called `:hash` 
				```
					has_attached_file :avatar, {
						url: "/system/:hash.:extension", 
						hash_secret: "longSecrtString"
					}
				```
			* the hash interploation will be replaced with a unique hash made up of whatever is specified in `:hash_data` 
				* default value is `:class/:attachment/:id/:style/:updated_at`
			* exception will be raised if `:hash` is used without `:hash_secret` 
		* [author owned rabbit hole](https://github.com/thoughtbot/paperclip/pull/416)
	* dynamic configuration 
		* you can use lambdas to create dynamic configurations 
			* allows custom styles and processors to be applied to specific model instances 
		* dynamic styles 
			* custom styling based on class 
				```
					class User < ActiveRecord::Base 
						has_attached_file :avatar, styles: lambda { |attachment| { thumb: (attachment.instance.boss? ? "300x300>" : "100x100>") } }
					end 
				``` 
		* dynamic processors 
			* custom processing based on class 
				```
					class User < ActiveRecord::Base 
						has_attached_file :avatar, processors: lambda { |instance| instance.processors }
						attr_accessor :processors 
					end 
				```
	* logging 
		* can be disabled in environment configuration 
	* deployment 
		* symlink the `public/system` directory with Capistrano 	
			* `config/deploy.rb`
				* `set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
		* attachment styles 
			* keeps track of previously deployed attachment styles 
			* after each deployment call 
				* `rake paperclip:refresh:missing_styles` 
					* default will store current attachment styles in 
						* `RAILS_ROOT/public/system/paperclip_attachments.yml` 
			* example using capistrano 
				```
					namespace :paperclip do 
						desc "build missing paperclip styles" 
						task :build_missing_styles do 	
							on roles(:app) do 
								within release_path do 
									with rails_env: fetch(:rails_env) do 
										execute :rake, "paperclip:refresh:missing_styles"
									end 
								end 
							end 
						end 
					end 
					
					after("deploy:compile_assets", "paperclip:build_missing_styles")
				```
			* allows you to not have to refresh thumbnails in production everytime you add a new style 
				* does not work with dynamic styles 
			* you can create `paperclip_attachments.yml` by hand 
				``` 
					class User < ActiveRecord::Base 
						has_attached_file :avatar, styles: { thumb: 'x100', croppable: '600x600>', big: '1000x1000>' }
					end 
					
					class Book < ActiveRecord::Base 
						has_attached_file :cover, styles: { small: 'x100', large: '1000x1000>' }
						has_attached_file :sample, styles: { thumb: 'x100' }
					end 
				```
				* in `rails_root/public/system/paperclip_attachment.yml`	
					``` 
						---
						:User: 
							:avatar: 
							- :thumb 
							- :croppable 
							- :big
						:Book: 
							:cover: 
							- :small
							- :large 
							:sample: 
							- :thumb
					```	
# July 5th - Subclassing processor method of paperclip 

this shit is hard fam.

when you change a model file, you have to restart the server. every. fucking. time.

#### questions 

* what the fuck does `attr_accessor` actually do ?
	* convenience method that is a getter and setter for a variable 


* what is [jbuilder](https://github.com/rails/jbuilder)?
	* dsl for declaring json structures 

* what does nil:NilClass mean?

* what does `before_action` do?
	* basically runs a function before an action is started 


* what are [rails controller filters](http://guides.rubyonrails.org/action_controller_overview.html)? 

* what is the rails request cycle?

* how does rack middlewares work?

* what is [single table inheritance](https://en.wikipedia.org/wiki/Single_Table_Inheritance), why does rails default to it?
	* a way to emulate object-oriented inheritance in a relational database 
	* all subclasses of a base class are stored in the same table 
		* in rails a column called `type` with the name of the subclass as a value keeps track of which class the data belongs to 
			* this column is also called a discriminator column

* what are [polymorphic associations](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)?
	* a model that can belong to more than one other model 
	* uses the mechanism of `belongs_to` with the `polymorphic` flag set to true 

* what is a [virtual attribute](http://railscasts.com/episodes/16-virtual-attributes)?





##### learnings 

* `attr_accessor` 
	* its a ruby thing 
	* its a convenience method that basically is a combined getter and setter for a variable 
	* a method called on the current class 

* filters 
	* methods that are called in relation to a controller action 
		* filters are inherited, so if you set one to `ApplicationController` it will be run on every controller in your application 
		* types of filters 
			* before 
				* called before action
				* may halt the request cycle 
				* commonly used to check if a user is logged in for an action to be run 
				
			* after 
				* called after action 
				* has access to the response data that is to be sent to the client 
			* around
				* responsible for running their associated actions by yielding 
					* compared to how rack middlewares works 
						* how does it work?

* adding a variable to an existing model in ruby on rails 
	* [generate a migration and then run it with rake db:migrate](http://stackoverflow.com/questions/5658035/how-to-add-a-variable-to-an-existing-model-ruby-on-rails)
				
	* you undo migrations with 
		* rake db:rollback
		* you can pass a step paramater that will count the number of steps back you wanna go


##### the debuggening 

* subclassing 
	* tracing the issue #1
		* its deeper than the model 
			* its deeper than `has_attached_file`
				* its pretty certainly in my feeble attempt to subclass `Paperclip::Processor` 
					* this error in question is `ArgumentError - wrong number of arguments (3 for 0):`
						* the program is not getting the arguments its expecting 
							* is it expecting 0 and getting 3?
								* how do i properly initialize the subclass?
									* can ruby/rails not find the parent class in the first place?
									* is this a configuration issue?
							* ~~is it expecting 3 and getting 0?~~
	* ~~tracing issue #2~~ [solved]
		* view 
			* app/views/images/show.json.jbuilder:18 		
				* `NoMethodError - undefined method `url' for nil:NilClass:`
						* what does nil:NilClass mean?
					* something is expecting a url method but it aint there
					* oh my fucking god. there is a file in the directory called show.json.jbuilder....
						* i do not know if this file is even being fucking used but it certainly fucked up my day 
							* the file is calling a deprecated variable			
				* what does the json.jbuilder do?
					* its a rails thing 
					* it is a domain specific language for declaring JSON structures				
						* useful for when json generation involves a lot of conditionals and loops 
			* ~~what if i comment out the edit view?~~
				* ~~infact it says its in the show action, so likely that has something to do with it~~
					* ~~hmmm there use to be a style called show before. perhaps this is a remenant bug from sheref setting up initially~~
				* ~~edit view has nothing to do with this error, persists after comment purge~~ 				
			* ~~comment everything out in show action?~~
				* ~~error persists~~
		* ~~controller~~ 
			* ~~the `before_action` is passed the `:show` action~~ 	
				* ~~what does `before_action` do?~~ 
					* ~~its a rails thing~~ 
					* ~~its a filter~~
				* ~~is it somehow fucking my day up?~~

# July 7th - Rails and their models 

Well i have gone about as far as i can without fundementally understanding how models work 





#### questions 



* what is the [YAML format](https://en.wikipedia.org/wiki/YAML)?
	* it is a human-readable data serialization language
		* basically a format that both humans and machines understand 
		* useful for configuration files 

* what is the Initializer section?

* what is a Rails environment?

* what is a race condition?

* what is a macro-style class method?

* what is a block in ruby?

* what is the [principle of object encapsulation](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))?
	* used to descript one of two different concepts and sometimes a combination of the two 
		* a language mechanism for restricting direct access to some of the objects components 
		* a language construct that facilitates the bundling of data with the methods operating on that data 


* what is the difference between a variable with the `!` suffix and a variable with the `?` suffix and a variable with no suffix?
	* definetly a ruby thing
	* these are conventions 	
		* `!` 
			* indicates that a method call is destructive or has side effects 
			* as in you are mutating stuff, not returning a copy 
			* convention 
		* `?` 	
			* indicates that the method returns a boolean 
			* convention 

* what are [dynamic finders](http://guides.rubyonrails.org/active_record_querying.html#dynamic-finders)?

* what is a transaction in the context of rails?
	* a transaction is a protective wrapper around SQL statements to ensure changes to the database only occur when all actions succeed together 
		* enforce data integrity within the application 
		* if any of the steps fail the entire process should be reset 

* what is a `Proc` in the context of rails?
	* basically a function that has been wrapped in an object 
	* allows you to turn block into first class functions 


* what is a predicate method in the context of rails?
	* ruby term 
	* a method that returns either true or false 
	* the method call usually has the `?` suffix 






##### learnings			
			
			

* [debugging rails applications](http://guides.rubyonrails.org/debugging_rails_applications.html)
	* view helpers for debugging 
		* tools to inspect the contents of a variable 	
			* `debug` 
				* runs a `<pre>` tag that renders the object using the YAML format 
					* generates human-readable data from any object 	
				* renders to the view 
			* `to_yaml`
				* converts the object to YAML format 
					* this can be passed to helper `simple_format` to format the output 
						* `simple_format` 	
							* a helper library that formats what it is passed 
					* basically the precussors to debug 
				* renders to the view 
			* `inspect` 
				* prints the object value as a string  
				* renders to the view 
	* the logger 
		* saves information to log files at runtime 
		* rails maintains a separate log file for each runtime environment 
		* what is the logger 
			* rails uses the `ActiveSupport::Logger` class to write log information
			* you can specify alternative loggers in `config/application.rb` or any other enviroment file
			* example:
				```
					config.logger = Logger.new(STDOUT)
					config.logger = Log4r::Logger.new('Application Log')
				```
				* or in the `Initializer section add 
				```
					Rails.logger = Logger.new(STDOUT)
					Rails.logger = Log4r::Logger.new('Application Log')
				```
		* log levels 
			* logs are printed if the log level of the message is equal or higher than the configured log level 
				* to know the current log level call `Rails.logger.level`
			* there are 5 log levels 
				* `:debug` 
					* 0
				* `:info`
					* 1
				* `:warn`
					* 2
				* `:error` 
					* 3
				* `:fatal`
					* 4
				* `:unknown` 
					* 5
			* log level can be set 
				* in an environment initializer 
					* `config.log_level = :warn 
				* at any time 
					* `Rails.logger.level = 0`
			* the purpose of log levels is to allow you to have some development logs that do not crowd production logs 
			* the default Rails log level is `:debug` in all enviroments 
		* sending messages 
			* to write to the logs in a controller, model, or mailer
					* `logger.log_level "random string"`
		* tagged logging 
			* `TaggedLogging` in ActiveSupport helps you tag logs to be able to filter them 
			* example: 
				```
					logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
					logger.tagged('BCX') { logger.info 'Stuff' }
					logger.tagged('BCX', 'jason') { logger.info 'Stuff' }
					logger.tagged('BCX') { logger.tagged('jason') { logger.info 'stuff' } }
				```
		* impact of logs on performance 
			* has a small performance hit especially when logging to disk 
				* `:debug` has a larger performance hit than `:fatal`
			* adding to many logger calls in your code slows performance 
	* debugging with the byebug gem
		* this is where we use an actual debugger 
		* setup 
			* the `byebug` gem allows you to set breakpoints and step through live code in Rails 
				* `gem install byebug`
			* super simple to invoke the debugger 
				* call the byebug method 
					```
						def new 	
							byebug
							@person = Person.new 
						end
					```
		* the shell 
			* once the `byebug` method is called the debugger will be started in a debugger shell inside the terminal window where the server was launched 
				* you will be placed at the debuggers prompt 	
					* the code around the line line that is about to be run will be displayed and marked with `=>` on the left of line numbers 
			* if the prompt was caused by a browser request the browser tab containing the request will be hung until the debugger has finnished tracing 
			* you can type `help` into the debugger prompt to see all your debugger actions 
		* the context 
			* while debugging you will be placed in different context as you go through the different parts of the stack 
				* context are created when a stopping point or an event is reached 
					* context has info about the suspended program 
						* inspect the frame stack 
						* evaluate variables from the perspective of the debugged program 
						* know the place where the debugged program is stopped 
				* call the `backtrace` command to print the backtrace of the application 
					* tells you how you got to where you are 
				* the current frame is indicated on the left with `-->` 
					* change the context by using the `frame n` command wherw n is the specified frame number 
		* threads 
			* the debugger can list, stop, resume, and switch between running threads by using the thread command 
		* inspecting variables 
			* any expression in the current context can be evaluated 
				* simply type the expression 
			* `instance_variables` commad gets the instance variables 
		* step by step 
			* use the `step` command (or alias `s`) to continue running your program until the next logical stopping point and return control to the debugger 
			* `next` is similar to `step` 
				* `next` does not go deep inside the method calls, just to the next line. `step` does 
		* breakpoints 
			* forces your application to stop when a designated point is reached 
				* debugger shell invoked at that line 
		
* ruby basics 
	* variables 
		* local 
			* can only be used in a finite part of the program 
			* destroyed once out of scope 
		* global 
			* can be used throughout the entire program 
			* denoted by `$`
		* constants 
			* intended to remain constant during the life of the program
			* global variables you do not fuck with 
			* denoted by an uppercase letter 
		* class 
			* can be only accessed by the class they are defined in 
			* denoted by `@@` 
		* instance 
			* can only be accessed by a particular instance of a class 
			* denoted by `@`
	* the `:` means you are using a symbol 
		* it is used to represent names and strings 
		* they are literally string literals with common memory 
		* its just a hack to save memory 

* [active record callbacks - life cycle of active record objects](http://guides.rubyonrails.org/active_record_callbacks.html)
	* during the normal operation of a Rails application, object may be created, updated and destroyed 
	* Active Record provides hooks so that you can control the application and its data 
	* callbacks overview 
		* methods that get called at certain moments of an objects life cycle 
		* callback registration 
			* to use callbacks you must register them 
			* you can implement callbacks as ordinary methods and then use a macro-style class method to register them as call backs 
			* example: 
				```
					class User < ApplicationRecord 
						validates :login, :email, presence: true 
					
						before_validation :ensure_login_has_a_value
						
						protected
							def ensure_login_has_a_value 
								if login.nil?
									self.login = email unless email.blank?
								end 
							end 
						end 
				```
				* macro-style class methods can also receive a block 	
					* useful if block is short enough to fit in a single line 
					* example: 
						```
							class User < ApplicationRecord 
								validates :login, :email, presence: true 
							
								before_create do 
									self.name = login.capitalize if name.blank?
								end 
							end 
						```
			* callback can also be registered to only fire on certain life cycle events 
				* example: 
					```
						class User < ApplicationRecord 
							before_validation :normalize_name, on: :create 
							
							# :on takes an array as well 
							after_validation :set_location, on: [:create, :update]
							
							protected 
								def normalize_name 
									self.name = name.downcase.titleize 
								end 
							
								def set_location 
									self.location = LocationService.query(self)
								end
							end
					```
			* idiomatic way is to decrale callbacks as protected or private 
				* if left public they can be called outside the model 			
				* violates principle of object encapsulation 
	* available callbacks 
		* list of all the Active Record callbacks listed in the order that they are called in 	
			* creating an object 
				* `before_validation`
				* `after_validation`
				* `before_save`
				* `around_save`
				* `before_create`
				* `around_create`
				* `after_create`
				* `after_save`
				* `after_commit/after_rollback`	
			* updating an object 
				* `before_validation`
				* `after_validation` 
				* `before_save` 
				* `around_save` 
				* `before_update` 
				* `around_update` 
				* `after_update` 
				* `after_save` 
				* `after_commit/after_rollback`
			* destroying an object 
				* `before_destroy`
				* `around_destroy` 
				* `after_destroy`
				* `after_commit/after_rollback`
			* `after_initialize` and `after_find`
				* `after_initialize` 
					* called whenever an Active Record object is instantiated 
						* directly using `new`
						* record is loaded from the database 
					* allows you to avoid the need to directly override your Active Record `initialize` method 
				* `after_find` 
					* called whenever Active Record loads a record from the database 
						* called before `after_initialize` 
				* neither of these have `before_*` counterparts 
			* `after_touch`
				* called whenever an Active Record object is touched 
					* example: 
						```
							class User < ApplicationRecord 
								after_touch do |user| 
									puts "You have touched an object" 
								end 
							end 
						
							>> u = User.create(name: "awesome_person")
							=> #<User id: 1, name: "awesome_person", created_at: "2016-7-7
							14:23:00", updated_at: "2016-7-7 14:35:00">
							
							>> u.touch 	
							You have touched an object 
							=> true 
						```
				* can be used with `belong_to` 
					* if the parent has a `after_touch` callback registered then it will be called before the child touch callback 
						* example: 
							```
								class Employee < ApplicationRecord 
									belongs_to :company, touch: true 
									after_touch do 
										puts 'An Employee was touched'
									end 
								end 
						
								class Company < ApplicationRecord 
									has_many :employees 
									after_touch :log_when_employees_or_company_touched 
								
									private 
									def log_when_employees_or_company_touched 
										puts 'Employee/Company was touched' 
									end 
								end 
								
								>> @employee = Employee.last 
								=> #<Employee id: 1, company_id: 1, created_at: "2016-7-7 
								14:40:00", updated_at: "2016-7-7 14:45:00">
								
								# triggers @employee.company.touch 
								>> @employee.touch 
								Employee/Company was touched
								An Employee was touched 
								=> true 
							```
	* running callbacks 
		* these methods all trigger callbacks 
			* `create`
			* `create!` 	
			* `decrement!`
			* `destroy` 
			* `destroy!`
			* `destroy_all` 
			* `increment!`
			* `save`
			* `save!`
			* `save(validate: false)`
			* `toggle!`
			* `update_attribute` 
			* `update` 
			* `update!` 
			* `valid?`	
		* the `after_find` callback is triggered by the following methods 
			* `all`
			* `first` 
			* `find`
 			* `find_by`
			* `find_by_*`
			* `find_by_*!`
			* `find_by_sql`
			* `last`
		* the `after_initialize` callback is triggered everytime a new object of a class is initialized 
	* skipping callbacks 
		* you can skip callbacks by using the following methods 
			* `decrement` 
			* `decrement_counter` 
			* `delete`
			* `delete_all` 
			* `increment`	
			* `increment_counter` 
			* `toggle` 
			* `touch` 
			* `update_column`
 			* `update_columns` 
			* `update_all`
 			* `update_counters` 
		* do this with care 
	* halting execution 
		* registered callback are queued for execution 
			* the queue includes 
				* model validations 
				* registered callbacks 
				* database operation to be executed 
		* the callback chain is wrapped in a transaction
			* if any `before` callbacks return `false` or raise an exception the execution chain is halted and a rollback is issued 
	* relational callbacks 
		* callbacks work through model relationships 
			* callbacks can be defined by model relationships 
			* example: 
				```
					class User < ApplicationRecord 
						has_many :articles, dependent: :destroy 
					end 
				
					class Article < ApplicationRecord 
						after_destroy :log_destroy_action 
						
						def log_destroy_action 
							puts 'Article destroyed' 
						end 
					end 
					
					>> user = User.first 
					=> #<User id: 1> 
					>> user.articles.create!
					=> #<Article id: 1, user_id: 1>
					>> user.destroy 	
					Article destroyed 
					=> #<User id: 1> 
				```
	* conditional callbacks 
		* conditional calling of a method 
			* `:if` 
				* accepts symbol, string, Proc, or Array 
				* specify under which the callback should be called 
			* `:unless` 
				* accepts symbol, string, Proc, or Array 
				* specify under which the callback should not be called 
		* using `:if` and `:unless` with a symbol 
			* these options can accept a symbol that correspond with the name of a predicate method 
			* predicate method will get run right before the callback 
			* example: 
				```
					class Order < ApplicationRecord 
						before_save :normalize_card_number, if: :paid_with_card?
					end 
				```
		* using `:if` and `:unless` with a string 
			* options can accept a string that is evaluated with `eval` and must be valid ruby code
			* best used when containing short conditions 
			* example: 
				```
					class Order < ApplicationRecord 
						before_save :normalize_card_number, if: "paid_with_card?"
					end 
				```
		* using `:if` and `:unless` with a Proc 
			* options can accept Proc objects 	
			* good for one liners 
			* example: 
				```
					class Order < ApplicationRecord 
						before_save :normalize_card_number, 
							if: Proc.new { |order| order.paid_with_card? }
					end 
				```
		* multiple conditions for callbacks 
			* you can mix `:if` and `:unless` in the same callback 
			* example: 
				``` 
					class Comment < ApplicationRecord 
						after_create :send_email_to_author, if: :author_wants_emails?, 
							unless: Proc.new { |comment| comment.article.ignore_comments? }
					end 
				```
	* callback classes 
		* you can create classes that encapsulate callback methods 
			* makes reusing them very simple 
			* example: 
				```
					class PictureFileCallbacks
						def after_destroy(picture_file) 	
							if File.exist? (picture_file.filepath)
								File.delete (picture_file.filepath)	
							end 
						end 
					end 
				```
				* here an `after_destroy` callback is nested within the class allowing us to call it liberally as an instance method 
				```
					class PictureFile < ApplicationRecord 
						after_destroy PictureFileCallbacks.new 
					end 
				```
				* we can also declare as a class method 
				```
					class PictureFileCallbacks 
						def self.after_destroy(picture_file) 
							if File.exist?(pitcture_file.filepath)
								File.delete(picture_file.filepath)	
							end 
						end 
					end 
				```
				* this way there is no need to instantiate `PictureFileCallbacks` object 
				```
					class PictureFile < ApplicationRecord 
						after_destroy PictureFileCallbacks
					end 
				```
	* transaction callbacks 
		* there are two callbacks triggered by database transactions 
			* `after_commit` 
				* the `:on` option specifies which CRUD action the callback should work on 	
					* there are three convenience methods to combine the step 
						* `after_create_commit` 	
						* `after_update_commit` 
						* `after_destroy_commit` 
			* `after_rollback`
		* these are triggered after the database changes have been commited or rolled back 
		* exceptions raised by these callbacks will be ignored unles resqued and handled appropriately 

* [this person is god sent](http://stackoverflow.com/questions/12132991/ruby-on-rails-passing-a-returned-value-of-a-method-to-has-attached-file-do-i)
	* so basically the problem is that `has_attached_file` is a class method 
	* im trying to do instance level stuff and methods to it 
	* so basically i need to reprocess the thumbnails once the class is instantiated 	




					
# July 9 - make the image processors extend from the base class 

Now that im not feeling pressured I should be able to make this thing a full subclass not a hacky one 


#### questions 

* what does [begin mean in the ruby context](http://stackoverflow.com/questions/2191632/begin-rescue-and-ensure-in-ruby)?
	* yup ruby thing also this bad boy is a set :) 
	* this seemse similar to try excepts 
		* yup its exception handling 
		* brings me back to the python days #scraper_party
	* this exception handling has 5 step flow 
		* `begin` -> `rescue` -> `else` -> `ensure` -> `end`
			* `begin` 
				* a code block that may raise an exception 
			* `rescue`
				* the response to an exception 
				* if the exception is not specified then all exceptions that inherit from `StandardError` will be caught 
			* `else` 	
				* code block that runs if no exceptions specified were raised 
			* `end` 
				* the end of the code block 
		* syntax feel: thank you [Jorg W Mittag from SO](http://stackoverflow.com/users/2988/jörg-w-mittag) 
			```	
				begin 
					# something which might raise an exception 
				rescue SomeExceptionClass => some_variable
					# code that deals with some exception 
				rescue SomeOtherException => some_other_variable
					# code that deals with some other exception 
				else 
					# code that runs only if *no* exception was raised 
				ensure 
					# ensure that this code always runs, no matter what 
				end 
			```

* what does `<<` mean in ruby syntax?
	* well in this case it was used in conjunction with an array 
	* shortcut syntax that means to add to append to the end of an array


* what does the flatten method of array do?
	* meant for multi dimensional arrays 
	* returns a new array that is one dimensional 
	* works recursively 
	* syntax feel: 
		```
			s = [ 1, 2, 3]		#=> [1, 2, 3]
			t = [ 4, 5, 6]		#=> [4, 5, 6]
			a = [ s, t, 9, 10]	#=> [[1, 2, 3], [4, 5, 6], 9, 10]
			a.flatten  		#=> [1, 2, 3, 4, 5, 6, 9, 10]
		```

* what does the compact method of array do?
	* returns a new array with all `nil` elements removed 
	* syntax feel: 
		* `[ 1, nil, 2, nil, 3, nil].compact 	#=> [1, 2, 3]`

* what does sequezze method of string do?
	* returns a new string where any repeat characters are omitted
	* can be passed a set of characters to only focus on 
	* syntax feel: 
		```
			"yellow moon".squeeze 			#=> 'yelow mon'
			"  now  is  the".squeeze(" ")		#=> ' now is the'
			"putters shoot balls".squeeze('m-z')	#=> 'puters shot balls'
		```

# July 10 - errors and validations, and deployment 









##### questions 










##### learning 

* [jquery selectors](https://api.jquery.com/category/selectors/)
	* there are meta-characters 	
		* they must be escaped using `\\`
		* list of characters 
			* `! " # $ % & ' ( ) * + , . / : ; < = > ? @ [ \\ ] ^ { | } ~`
	* [all selector](https://api.jquery.com/all-selector/)
		* ("*")
		* selects all elements 
	* [:animated selector](https://api.jquery.com/animated-selector/)
		* (":animated")
		* selects all elements that are in the progress of an animation at the time the selector is run 
	* [attribute contains prefix selector](https://api.jquery.com/attribute-contains-prefix-selector/)
		* ("[attribute|='value']")
			* attribute: an attribute name 
			* value: an attribute value (can be an identifier or a quoted string
		* selects elements that have the specified attribute with a value either equal to a given string or starting with that string followed by a hyphen 
	* [attribute contains selector](https://api.jquery.com/attribute-contains-selector/)
		* ("[attribute*='value']")
			* attribute: an attribute name 
			* value: an attribute value (can be wither an identifier or a quoted string
		* selects elements that have the specified attribute with a value containing a given substring  		
	* [attribute contains word selector](https://api.jquery.com/attribute-contains-word-selector/)
		* ("[attribute~='value']")
			* attribute: an attribute name 
			* value: an attribute value (can be either an identifier or a quoted string) 	
		* selects elements that have the specified attribute with a value containing a given word, delimited by spaces 
	* [attribute ends with selector](https://api.jquery.com/attribute-ends-with-selector/)
		* ("[attribute$='value']")
			* attribute: an attribute name 
			* value an attribute value (can either be an identifier or a quoted string)
		* selects elements that have the specified attribute with a value ending exactly with a given string, the comparison is case sensitive 
	* [attribute equals selector](https://api.jquery.com/attribute-equals-selector/)
		* ("[attribute='value']")
			* attribute: an attribute name 
			* value: an attribute value (can either be an identifier or a quoted string) 
		* selects elements that have the specified attribute with a value exactly equal to a certain value 
	* [attribute not equal selector](https://api.jquery.com/attribute-not-equal-selector/)
		* ("[attribute!='value']")
		* select elements that either do not have the specified attribute or do have the specified attribute but not with a certain value 
	* [attribute starts with selector](https://api.jquery.com/attribute-starts-with-selector/)
		* ("[attribute^='value']")
		* selects elements that have the specified attribute with a value beginning exactly with a given string 
	* [:button selector](https://api.jquery.com/button-selector/)
		* (":button")
		* selects all button elements and elements of type button 
	* [:checkbox selector](https://api.jquery.com/checkbox-selector/)
		* (":checkbox")
		* selects all elements of type checkbox
	* [:checked selector](https://api.jquery.com/checked-selector/)
		* (":checked")
		* matches all elements that are checked or selected 
	* [child selector](https://api.jquery.com/child-selector/)
		* ("parent>child")
			* parent: any valid selector 
			* child: a selector to filter the child elements 
		* selects all direct child elements specified by "child" of elements specified by "parent" 
	* [class selector](https://api.jquery.com/class-selector/)
		* (".class")
			* class: a class to search for. an element can have multiple classes; only one of them must match 
		* selects all elements with the given class 
	* [contains selector](https://api.jquery.com/contains-selector/)
		* (":contains(text)")
			* text: a string of text to look for. it is case sensitive 
		* selects all elements that contain the specified text 
	* [descendant selector](https://api.jquery.com/descendant-selector/)
		* ("ancestor descendant")
			* ancestor: any valid selector 
			* descendant: a selector to filter the descendant elements 
		* selects all elements that are descendants of a given ancestor 
	* [:disabled selector](https://api.jquery.com/disabled-selector/)
		* (":disabled")
		* selects all elements that are disabled 
	* [element selector](https://api.jquery.com/element-selector/)
		* ("element")
			* element: an element to search for. refers to the tagName of DOM nodes 
		* selects all elements with the given tag name 
	* [:empty selector](https://api.jquery.com/empty-selector/)
		* (":empty")
		* selects all elements that have no children (including text nodes)
	* [:enabled selector](https://api.jquery.com/enabled-selector/)
		* (":enabled")
		* selects all elements that are enabled 
	* [:eq()](https://api.jquery.com/eq-selector/)
		* (":eq(index)")
			* index: zero-based index of the element to match 
		* (":eq(-index)")
			* indexFromEnd: zero-based index of the element to match, counting backwards from the last element 
		* selects the element at index `n` within the matched set 
	* [even selector](https://api.jquery.com/even-selector/)
		* (":even")
		* selects even elements, zero-indexed 
	* [file selector](https://api.jquery.com/file-selector/)
		* (":file")
		* selects all elements of type file 
	* [first-child selector](https://api.jquery.com/first-child-selector/)
		* (":first-child")
		* selects all elements that are the first child of their parent 
	* [first-of-type selector](https://api.jquery.com/first-of-type-selector/)
		* (":first-of-type")
		* selects all elements that are the first among siblings of the same element name 
	* [:first selector](https://api.jquery.com/first-selector/)
		* (":first")
		* selects the first matched DOM element 
	* [:focus selector](https://api.jquery.com/focus-selector/)
		* (":focus")
		* selects element if it is currently focused 
	* [:gt() selector](https://api.jquery.com/gt-selector/)
		* (":gt(index)")
			* index: zero-based index 
		* (":gt(-index)")
			* indexFromEnd: zero-based index, counting backwards from the last element 
		* selects all elements at an index greater than `index` within the matched set 
	* [has attribute selector](https://api.jquery.com/has-attribute-selector/)
		* ("[attribute]")
		* selects elements that have the specified attribute, with any value 
	* [:has() selector](https://api.jquery.com/has-selector/)
		* (":has(selector)")
		* selects elements which contain at lease one element that matches the specified selector 
	* [:header selector](https://api.jquery.com/header-selector/)
		* (":header")
		* selects all elements that are headers, like h1, h2, h3, and so on 
	* [:hidden selector](https://api.jquery.com/hidden-selector/)
		* (":hidden")
		* selects all elements that are hidden 	
	* [ID selector](https://api.jquery.com/id-selector/)
		* ("#id")
		* selects a single element with the given id attribute 
	* [:image selector](https://api.jquery.com/image-selector/)
		* (":image")
		* selects all elements of type image 
	* [:input selector](https://api.jquery.com/input-selector/)
		* (":input")
		* selects all input, textarea, select and button elements 
	* [:lang() selector](https://api.jquery.com/lang-selector/)
		* (":lang(language)")
			* language: a language code 
		* selects all elements of the specified language 
	* [:last-child selector](https://api.jquery.com/last-child-selector/)
		* (":last-child")
		* selects all elements that are the last child of their parent 
	* [:last-of-type selector](https://api.jquery.com/last-of-type-selector/)
		* (":last-of-type")
		* selects all elements that are the last among siblings of the same element name 
	* [:last selector](https://api.jquery.com/last-selector/)
		* (":last")
		* selects the last matched element 
	* [:it() selector](https://api.jquery.com/lt-selector/)
		* (":It(index)")
			* index: zero-based index 
		* (":It(-index)")
			* indexFromEnd: zero-based index, counting backwards from the last element 
		* selects all elements at an index less than `index` within the matched set 
	* [multiple attribute selector](https://api.jquery.com/multiple-attribute-selector/)
		* ("[attributeFilter1][attributeFilter2][attributeFilterN]")
			* attributeFilter1: an attribute filter 
			* attributeFilter2: another attribute filter, reducing the selection even more 
			* attributeFilterN: as many more attribute filters as desired 
		* matches elements that match all of the specified attribute filters 
	* [multiple selector](https://api.jquery.com/multiple-selector/)
		* ("selector1, selector2, selectorN")
			* selector1: any valid selector 
			* selector2: another valid selector 
			* selectorN: as many more valid selectors as you like 
		* selects the combined results of all the specified selectors 
	* [next adjacent selector](https://api.jquery.com/next-adjacent-selector/)
		* ("prev + next")
			* prev: any valid selector 
			* next: a selector to match the element that is next to the first selector 
			* selects all next-elements matching `next` that immediately preceded by a sibling `prev`
	* [next siblings selector](https://api.jquery.com/next-siblings-selector/)
		* ("prev ~ siblings")
			* prev: any valid selector 
			* siblings: a selector to filter elements that are the following siblings of the first selector
		* selects all sibling elements that follow after the `prev` element, have the same parent, and match the filtering `sibling` selector 
	* [.not() selector](https://api.jquery.com/not-selector/)
		* (":not(selector)")
			* selector: a selector with which to filter by 
		* selects all elements that do not match the given selector 
	* [:nth-child() selector](https://api.jquery.com/nth-child-selector/)
		* (":nth-child(index/even/odd/equation)")
			* index: the index of each child to match, starting with `1`, the string `even` or `odd`, or an equation (eg. `:nth-child(even)`, `:nth-child(4n)`)
		* selects all elemenths that the nth-child of their parent 
	* [:nth-last-child() selector](https://api.jquery.com/nth-last-child-selector/)
		* (":nth-last-child(index/even/odd/equation)")
			* index: the index of each child to match, starting with the last one (`1`), the string `even` or `odd`, or an equation (eg. `:nth-last-child(even)`, `:nth-last-child(4n)`)
		* selects all elements that are the nth-child of their parent, counting from the last element to the first 
	* [nth-last-of-type() selector](https://api.jquery.com/nth-last-of-type-selector/)
		* (":nth-last-of-type(index/even/odd/equation)")
			* index: the index of each child to match, starting with the last (`1`), the string `even`, or `odd`, or an equation (eg. `:nth-last-of-type(even)`, `:nth-last-of-type(4n)`)
		* selects all the elements that are the nth-child of their parent in relation to siblings with the same element name, counting from the last element to the first 
	* [:nth-of-type() selector](https://api.jquery.com/nth-of-type-selector/)
		* (":nth-of-type(index/even/odd/equation)")
			* index the index of each child to match, starting with `1`, the string `even` or `odd`, or an equation (eg. `:nth-of-type(even)`, `:nth-of-type(4n)`)
		* selects all elements that are the nth child of their parent in relation to siblings with the same element name 
	* [:odd selector](https://api.jquery.com/odd-selector/)
		* (":off")
		* selects odd elements, zero-indexed 
	* [:only-child selector](https://api.jquery.com/only-child-selector/)
		* (":only-child")
		* selects all elements that are the only child of their parent 
	* [:only-of-type selector](https://api.jquery.com/only-of-type-selector/)
		* (":only-of-type")
		* selects all elements that have no siblings with the same element name 
	* [.parent selector](https://api.jquery.com/parent-selector/)
		* (":parent")
		* selects all elements that have at least one child node (either an element or text)
	* [:password selector](https://api.jquery.com/password-selector/)
		* (":password")
		* selects all elements of type password 
	* [:radio selector](https://api.jquery.com/radio-selector/)
		* (":radio")
		* selects all elements of type radio 
	* [:reset selector](https://api.jquery.com/reset-selector/)
		* (":reset")
		* selects all elements of type reset 
	* [:root selector](https://api.jquery.com/root-selector/)
		* (":root")
		* selects the element that is the root of the document 
	* [:selected selector](https://api.jquery.com/selected-selector/)
		* (":selected")
		* selects all elements that are selected 
	* [:submit selector](https://api.jquery.com/submit-selector/)
		* (":submit")
		* selects all elements of type submit 
	* [:target selector](https://api.jquery.com/target-selector/)
		* (":target")
		* selects the target element indicated by the fragment identifier of the documents URI 
	* [:text selector](https://api.jquery.com/text-selector/)
		* (":text")
		* selects all input elements of type text 
	* [:visible selector](https://api.jquery.com/visible-selector/)
		* (":visible")
		* selects all elements that are visible
	
	* selectors can be chained using multiple selector 
		* this is pretty bad ass 

# July 12th - deployment (pray for me) 

today i become a sys admin. many hats. many hats. 




#### questions 

* what is [`yum` in linux context](https://en.wikipedia.org/wiki/Yellowdog_Updater,_Modified)?
	* stands for yellow dog updater, modified 
	* an open-source command line package-management utility for computers running the linux operating system using the [RPM package manager](https://en.wikipedia.org/wiki/RPM_Package_Manager)
	* works with software repositories which can be accessed locally or over a network 

* what is [(apt) advanced package tool](https://en.wikipedia.org/wiki/Advanced_Packaging_Tool)?
	* a free software interface 
	* handles the installation and removal of software on Debian based linux
	* originally designed as a front-end for [dpkg](https://en.wikipedia.org/wiki/Dpkg) to work with Debian `.deb` packages 
		* modified to work with RPM package manager system 	
	* [fink](https://en.wikipedia.org/wiki/Fink) has ported the interface to osx

* what is the [`apt-get` command](http://linux.die.net/man/8/apt-get)
	* `apt` package handling utility command line interface
	* this the command line tool for handling packages 


* what is [dpkg](https://en.wikipedia.org/wiki/Dpkg)?
	* the base of the package management system in Debian 
	* used to install, remove, and provide information about `.deb` packages 
	* a low level tool, usually interfaced by another tool 

* what is [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu_(operating_system))?
	* a Debian-based linux operating system 

* what is [Debian](https://en.wikipedia.org/wiki/Debian)?
	* a unix-like operating system that is entirely free software under the GNU general public license 
	* packaged by the Debian Project 
		* three baranches 
			* stable 
			* testing 
			* unstable 

* what is [Fedora](https://en.wikipedia.org/wiki/Fedora_(operating_system))?
	* an operating system based on linux kernel 
	* built by the [Fedora Project](https://en.wikipedia.org/wiki/Fedora_Project)
	* an os aiming to be the leading edge of free and open source software 	

* what is [RPM package manager](https://en.wikipedia.org/wiki/RPM_Package_Manager) in linux context?	
	* a package management system 
	* uses the `.rpm` file format 
	* intended for linux distributions 
	* built originally for red hat linux

* what is [`su`](http://man7.org/linux/man-pages/man1/su.1.html) in the linux context? 
	* likely a unix thing 
	* allows to run commands with a substitute user and group ID 
	* when called without arguments, defaults to running shell as root 
	* [`su -`](http://unix.stackexchange.com/questions/7013/why-do-we-use-su-and-not-just-su) is prefered use because it resets the shell environment, diminishing the chances of weird shit happening 

* what does the command [`which`](https://en.wikipedia.org/wiki/Which_(Unix)) do?
	* unix thing 
	* used to identify the location of executables 

* what does the command [`identify`](http://www.tutorialspoint.com/unix_commands/identify.htm) do?
	* its an imageMagick thing
	* describes the format and characteristics of one or more image files 
	
* what does the command [`visudo`](http://www.tutorialspoint.com/unix_commands/visudo.htm) do?
	* its a unix thing 
	* edits the sudoers file in a safe fashion 

* what is a [`sudoer`](https://www.sudo.ws/man/1.8.13/sudoers.man.html)?
	* its a unix thing 
	* the default sudo security policy plugin 

* what does [`adduser`](http://unix.stackexchange.com/questions/121071/what-does-adduser-do-that-useradd-doesnt) do?
	* its a debian linux thing?
	* it is a convenient interface for that leverages `useradd` on the backend to add users and related tasks 
		* `useradd`
			* a low level utility for adding users

* what does the command [`history`](https://en.wikipedia.org/wiki/History_(Unix)) do?
	* its a unix thing 
	* unix shells maintain a record of the commands issued by the user during the current session. 
	* history manipulates these records 
	* without arguments it prints the list 

* what is a web server?

* what is nginx?

* what is a ssl certificate?

* what is a hosting provider?

* what is a content delivery network (cdn)?









#### explore 


* edit new york stack [(used builtwith to find tech)](http://builtwith.com/editnewyork.com)
	* web server 
		* apache 
		* phusion passenger 
	* email services 
		* campaign monitor 
	* nameserver providers 
		* zerigo dns 
	* hosting providers 
		* rackspace 
		* rackspace cloud servers 
		* dedicated hosting 
	* ssl certificate 
		* goDaddy ssl
	* frameworks 
		* ruby on rails 
	* analytics and tracking 
		* google analytics 
	* javascript libraries 
		* css browser selector 
		* jQuery 
		* google hosted libraries 
	* widgets 
		* thefind upfront 
	* content delivery network 
		* ajax libraries api 
	* aggregation functionality 
		* feedburner 
		* rss 


* nycnak stack [(used builtwith to find out)](http://builtwith.com/nycnak.com)
	* web server 
		* nginx
	* ssl certificate 
		* essentialssl 
		* comodo ssl
	* hosting providers 
		* serverbeach 
	* frameworks 
		* ruby on rails token 
		* ruby on rails 
		* j2ee
	* analytics and tracking  
		* google analytics 
	* javascript libraries 
		* jQuery 
		* twitter platform 
	* widgets 
		* font awesome 
		* webtype 
	* content delivery network 
		* bootstrapcdn 
		* amazon s3
	* css media queries 
		* orientation 
		* min width 
		* max width 

* edit new york order of commands 
	* 1. install ruby 
	* 2. install passenger 
	* 3. install git 
	* 4. install postgress 
	* 5. install imagemagick 
	* 6. set up application_user 
	* 7. install memcached 
	* 8. set up database 
	* 9. configure apache 

* nycnak order of commands 
	* 1. prepare linux system 
	* 2. install ruby 
	* 3. install postgress 
	* 4. install git 
	* 5. install nginx 
	* 6. install imagemagick 
	* 7. configure postgress 
	* 8. install and configure unicorn 
	* 9. setup ssl 

# July 13th - deployment continues 

last night was fun installing the software unto the system. today we start thinking about application deployent 






#### questions

* what does the command [`make`](http://linux.die.net/man/1/make) do?
	* its a unix thing with GNU implementation 
	* a GNU make utility to maintain groups of programs 
		* a [make utility](https://en.wikipedia.org/wiki/Make_(software)) is a tool that automatically builds executable program and libraries from source code by reading files called makefiles, which specify how to derive the target program 
	* determines automatically which pieces of a large program need to be recompiled, and issues the commands to recompile htem 

* what is a [`makefile`](https://en.wikipedia.org/wiki/Makefile)?
	* its a unix thing 
	* a file containing a set of directives used by the make build automation tool 
		* how to compile and link a program 

* what does the command [`tail`](https://en.wikipedia.org/wiki/Tail_(Unix)) do?
	* its a unix thing 
	* used to display the last 10 lines of a text file 
	* if no file provided used to display as standard ouput piped data 
	
* what does the command [`chown`](https://en.wikipedia.org/wiki/Chown) do?
	* its a unix thing
 	* used to change the owner of a file system object

* what does the command [`chgrp`](https://en.wikipedia.org/wiki/Chgrp) do?
	* its a unix thing 
	* used to change the group associated with a file system object 

* what does the command [`chmod`](https://en.wikipedia.org/wiki/Chmod) do?
	* its a unix thing 
	* used to change the access permissions to file system objects 

* what does the command [`kill`](https://en.wikipedia.org/wiki/Kill_(command)) do?
	* its an operating system thing 
	* sends a signal to running processes to request the termination of the process 
	
* what does the command [`top`](https://en.wikipedia.org/wiki/Top_(software)) do?
	* its a unix thing 
	* stands for "table of processes" 
	* a task manager program that produces an ordered list of running processes selected by user-specified criteria, and updates it periodically.
	* default is cpu usage 

* what does the command [`fg`](https://en.wikipedia.org/wiki/Job_control_(Unix)#Commands) do?
	* its a unix thing 	
	* part of [unix job control](https://en.wikipedia.org/wiki/Job_control_(Unix)) 
	* resumes suspended jobs in the foreground 

* what does the command [`cat`](https://en.wikipedia.org/wiki/Cat_(Unix)) do?
	* its a unix thing 
	* reads files sequentially, writing them to standard output

* what is [`standard output`](https://en.wikipedia.org/wiki/Standard_streams)?
	* its a general programmign thing 
	* part of `standard steams` concept 
		* preconnected input and output communications channels between a program and its environment when it begins execution 
		* the three i/o connections are called 
			* standard input (stdin) 
			* standard output (stdout) 
			* standard error (stderr)
	* the default for `standard  output` is usually set to display on the terminal screen 

* what is a [`pid`](https://en.wikipedia.org/wiki/Process_identifier)?
	* its a unix thing 
	* stands for process identifier 
	* a number used by operating systems to identify an active process 

* what are [`sockets`](https://en.wikipedia.org/wiki/Unix_domain_socket) in server context?
	* its a unix thing 
	* full name (IPC) inter-process communication socket
	* a data communications endpoint for exchanging data between processes executing on the same host operating system 

* what is [`pg`](https://bitbucket.org/ged/ruby-pg/wiki/Home) in the deployment context?
	* its a ruby gem 
	* pg is the ruby interface to postgres 

* what is [`pg_ctl`](https://www.postgresql.org/docs/9.4/static/app-pg-ctl.html)?
	* its a postgres thing 
	* a utility for initializing a postgresSQL database cluster, starting, stopping, or restarting the postgresSQL database server, or displaying the status of a running server





#### explore 
	
* capistrano - [resource1](http://robmclarty.com/blog/how-to-deploy-a-rails-4-app-with-git-and-capistrano), [capistrano handbook](https://github.com/leehambley/capistrano-handbook/blob/master/index.markdown), [capistrano wiki](https://github.com/capistrano/capistrano), [deploy flow](http://capistranorb.com/documentation/getting-started/flow/), [capistrano overview](http://capistranorb.com/documentation/overview/what-is-capistrano/), 
	* capistrano is a gem 
		* once installed you must "capify" project 
			* to capify 
				* go to rails root 
					* `$ capify .`
			* generates files 
				* `/config/deploy.rb` 
					* add or write custom scripts to help automate your development tasks
				* `/Capfile` 
				
* configuring postgress for production 
	* [first vector from digital ocean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-12-04)
		* update server 
			* `apt-get update`
		* download postgres and dependencies 
			* `apt-get install postgresql postgresql-contrib`
		* configure postgres 
			* become the postgres user 
				* `su - postgres` 
				* create roles 
					*  `createuser` 
						* interactive 
							* enter name 
							* is role a superuser?
						* pass argument to attach password when user created 
							* `createuser --pwprompt`
				* connecting to the postgres database 
					* create a database 	
						* `createdb <db_name>`
				
* postgress pattern in deployment 
	* have a "deploy" system user 
	* create a db user called "deplpoy"
	* allow the system user to aunthenticate to the db via trust (config file) 
		* allows the system user "deploy" to connect to db without a password 
	
* [capistrano](https://github.com/leehambley/capistrano-handbook/blob/master/index.markdown)
	* capistrano involves three of our directories 
		* public 
		* config 
			* it will install `deploy.rb` here 
				* contains your deployment settings
				* loaded when you call the `cap` command on the cli 
					* searches up until it finds a capfile
		* app
	* setting up capistrano is known as `capifying` an application 
		* use the server method as oppose to the role method for pointing to where deployment goes 
		* these settings are in `deploy.rb` i believe
	* tasks 
		* the foundation of a capistrano setup 
			* collections of tasks are called recipes 
		* tasks can be defined anywhere inside the `Capfile` or `deploy.rb` or any other file you want to load into `Capfile` at runtime 
		* example: 
			```
				desc "Search Remote Application Server Libraries" 
				task :search_libs, :roles => :app do
					run "ls -x1 /usr/lib | grep -i xml"
				end 
			```
		* task methods expect a block 
		* task can contain instructions to run locally or on the deployment target servers 
		* namespacing tasks 
			* use a namespace variable 
			* example: 
				```
					namespace :web_server do 
						task :backup do 
							puts "In Example Backup Web-Server" 
						end 
					end 
		
					namespace :database_server do 
						task :backup do
 							puts "In Example Backup Database-Server" 
						end 
					end  
				```
		* existing task 
			* if you define a task that colides with the name of another it will overwrite the old task 
		* chaining task 
			* use `after` to chain tasks 
			* use `before` as well
		* calling tasks 
			* you can specify which task to run 
				* `cap deploy:symlink`
	* transactions 
		* allow us to define what should happen to roll-back a failed task 
	* variables
		* `set`  
			* use the `set` command to declare and set variables 
			* can be used with symbols and then called as actual variables 
			* these variables can be used anywhere in the Capistrano environment 
			* can set variables at run time, accepts `&block`
		* `fetch`
			* retrieves previously `set` variables 
		* `exists?`
			* checks whether a variable exists at all 
	
* [capistrano](https://github.com/capistrano/capistrano#from-the-beggining)
	* use the `cap` command to do all capistrano things 
	* when you deploy (`$ cap <environment> deploy`) 

# July 14th - deployment working with s3

we are using s3 to store our assets 





#### questions 

* what does the word ['delay']() mean in deployment context?

* what does the command [`monit`]() do?

* what is [`rsync`]()?

* what is an ['assets group']()?

* what is [reverse proxying]()?








##### explore 

* nycnak code base  
	* `nycnak_com/config/environments/development`
		```
			...
			config.paperclip_defaults = {
				:storage => :s3,
				:s3_protocol => 'http', 
				:bucket => ENV['AWS_BUCKET'],
				:s3_credentials => {
					:access_key_id => ENV['AWS_ACCESS_KEY_ID'], 
					:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
				}
			}
		```
	* `nycnak_com/config/environments/production`
		```
			...
			config.paperclip_defaults = {
				:storage => :s3, 
				:s3_protocol => 'http', 
				:bucket => ENV['AWS_BUCKET'], 
				:s3_credentials => {
					:access_key_id => 	ENV['AWS_ACCESS_KEY_ID'], 
					:secret_access_key => 	ENV['AWS_SECRET_ACCESS_KEY'] 
				}
			}
		```
	* `nycnak_com/.env`
		```
			...
	 		#S3_ACCESS_KEY_ID = CREDENTIALS
			#S3_SECRET_ACCESS_KEY = CREDENTIALS 
			#S3_BUCKET = staging-downloads-nycnak-com
		```	
		* these are commented out which makes me thing they are not being used 
	* `nycnak_com/app/models/artwork.rb`
		```
			...
			has_attached_file 	:file, 
					  	storage: :s3, 
					  	s3_credentials: Proc.new { |a| a.instance.s3_credentials }, 
						path: 	"/artworks/:id/:style/:filename",
						s3_permissions: :public_read, 
						bucket: 'artwork-nycnak-com', 
						styles: {
							original: '800x800', 
							large: '450x450>', 
							medium: '300x300>', 
							thumb: '100x100>'
						}
			...
			def s3_credentials {
				bucket: 		ENV['S3_BUCKET'],
				access_key_id: 		ENV['S3_ACCESS_KEY_ID'],
				secret_access_key: 	ENV['S3_SECRET_ACCESS_KEY']
			}
		```
	* `nycnak_com/app/models/download.rb`
		```	
			...
			has_attached_file 	:file, 
						storage: :s3, 
						s3_credentials: Proc.new { |a| a.instance.s3_credentials },
						path: 		"/downloads/:id/:style/:filename",
						s3_permissions: :private
			
			after_save :queue_upload_to_s3
			
			...
			def s3_credentials {
				bucket: ENV['S3_BUCKET'], 
				access_key_id: ENV['S3_ACCESS_KEY_ID'], 
				secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
			}
			
			def queue_upload_to_s3
				if local_file? && previous_changes.keys.include?('local_file_updated_at')
					puts "LOCAL FILE CHANGED"	
					Delayed::Job.enqueue(FileDownloadJob.new(id))
				end 
			end 

			def upload_to_s3
				self.file = fixture_file_upload(local_file.path, local_file.content_type)
				save!
			end
		```
	* `nycnak_com/app/models/file_download_job.rb`
		```
			class FileDownloadJob < Struct.new(:download_id)
				def perform 
					download = Download.find(download_id)
					download.upload_to_s3
				end 
			end 
		```
	
* nycnak server
	* `/home/nycnak/applications/nycnak_com/production/shared/.env`
		```
			...
			AWS_BUCKET = downloads-nycnak-com
			AWS_ACCESS_KEY_ID = CREDENTIAL_KEY
			AWS_SECRET_ACCESS_KEY = CREDENTIAL_KEY
		```	

* holy shit stumbled onto a gold mine for deployment 
	* background worker
		* Delayedjob.all 	
			* this is what works with background workers?
			* passenger can load the application 
			* worker does not care about all the dependencies rails does 
			* if background worker dies it loads the app in memory again 
	* passwordless authentication	
		* deploy keys 
			* creates a unique link between a site and its repository cannot have the same deploy keys for separate applications 
			* best practice is one system user per application 
		* ssh agent forwarding
			* add your own key to github 
			* no need for passwords because of this 
	* application deployment procedure 
		* compile assets on the fly with capistrano 
			* when you get to x step push directory to s3 with credentials 
		* heroku 
			* every request to an asset counts as a request 
			* does a full build every time you deploy 
		* elastic beanstalk
			* aws version of heroku 
		* [git deploy](https://github.com/mislav/git-deploy)
			* for simple projects
			* no rolling back 
		* capistrano 
			* expects some centralized repository somewhere 
			* requires a lot of set up 
				* once all the connections are in place, it is a lot less complicated 
			* it is a gem 
			* you need to restart the web server because the server relies on a version of the gem stored in memory 
			* steps: 	
				```	
					$ cap deploy setup 
					# everything is based on directories with capistrano, much liberty of implementation here 
					# options include application / the application / environment (production, staging) 
					# capistrano creates all directories from this point onwards 
					# shared contains anything that needs to last between deployments 
						# logs, crednetials, passwords, configurations 
					# linked files and linked directories are set once, then remain the same through any new deployment 
						# 'current' just points at the current deployment in 'releases' 
						# 5 releases maximum 
						# $ cap rollback, for examples, switches back to the previous release 
						# $ cat REVISION, shows you which release you have deployed 	
					# permissions of anything inside an environment directory gets set through the use of the deploy key
					# config/deploy.rb 
						# main entry point for capistrano 
							# sets user who is going to be allowed to deploy  
					# $ cap setup 
						# we decided on a standard structure 
						# feed that structure to the deploy settings files 
						# when we deploy, capistrano follows those instructions and creates all the necessary directories 
				```
			* example: bondno9.com
				* the bondno9 user is the one who gets to deploy the site and owns the files 
				* how do i know that i am able to deploy?
					* `cap -T`
						* lists all tasks that are available to you via the cap command 
				* deploying restarts the application server, like passenger but does not restart the web server like apache or nginx 
				* `bundle exec cap staging deploy`
	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 	* web and application servers - apache, nginx, passenger 
		* advantage of an app server 
			* you are not restarting the web server constantly 
			* some app servers are very good at certain things 
			* passenger is an app server that seems to live in the web server 
		* nginx and ruby 
			* really goot at reverse proxying 				
				* when a request comes to nginx it looks up where it should go 
					* passes the information to the backend ('upstream') server 
					* upstream server generates the html, ect...
					* passes it back to nginx 
					* nginx passes it back to the browser 
			* to restart NGINX 
				* check to make sure user has proper permissions 
					* `$ nginx -t -c /etc/nginx/nginx.conf`
				* restart server 
					* `$ nginx -s reload` or
					* `$ /usr/local/nginx/sbin/nginx -s reload` or
					* `$ service nginx restart`
	
		* apache and passenger 
			* no process running in the upstream 

* DNS stuff 
	* mypeer1.com is a tool what does it do?

# July 15th - ssh and capistrano 

today we set up ssh and capistrano god damn it 




#### questions 

* what does the [`.ssh/config`](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/#sshconfig) file do?
	* within `home/.ssh/config` 
	* basically allows you to create ssh aliases and set up options for them to be read when called 
	* can set up port forwarding and stuff to make accessing servers behind firewalls simple because the options are saved (kind of understand it but this is a hell of a rabbit hole) 

* what is an [`IdentityFile`](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/#sshconfig) in the context of ssh?
	* allows you to specify exactly which private key should be used to authenticate with a given host 
	* can be specified as a command like option in normal connection process 
	* config files are meant for this though 

* what is a [`symlink`](https://en.wikipedia.org/wiki/Symbolic_link)
	* its a unix thing 
	* a file that contains a reference to another file or directory in the form od an absolute or relative path 
	* in other words its basically a system pointer 
 
* what is [shared web hosting]() in the context of web hosting?
	
* how does capistrano symlink files that already exist?
	* its actually a gem called `dotenv-rails` that is generating fake environment variables for development use 
		* add `dotenv-rails` to the development and test group of your gemfile 
		* `$ bundle install` to install the gem 
	* then just add your application config to your `.env` file in the root of your project 
	* note 
		* dotenv is initialized in your rails app during the `before_configuration` callback 
			* fired when the `Application` constant is defined in `config/application.rb` 

* what is the [`rack_env`] `.env` property do? Is there a difference between `rails_env` and `rack_env`?
	* rack based applications use `rack_env` which rails is a part of 
	* `rails_env` has higher precedence in the rails ecosystem than `rack_env` 
	* basically they do the same thing 

	



#### explore 

* setting up ssh keys 
	* [setup key simple ssh key authentication on remote server](http://linuxproblem.org/art_9.html)
		* ssh login from host A/user a to host B/user b 
			* log in to `host A` as `user a` 		
				* generate a pair of authentication keys 
				* no passphrase 
			* log in to `host B` as `user b`
				* create a directory `~/.ssh` 
				* append `user a` public key to `user b`
					* `.ssh/authorized_keys`
				* might have to deal with a permission issue with `.ssh` and `.ssh/authorized_keys`	
	* [multiple SSH private keys on one client](http://stackoverflow.com/questions/2419566/best-way-to-use-multiple-ssh-private-keys-on-one-client)
		* seems like same process as before except that now theres a config file in play 
		* `.ssh/config` 
		
* capistrano set up 
	* [installation](http://capistranorb.com/documentation/getting-started/installation/)
		* ssh needs to be set up 
	* [structure](http://capistranorb.com/documentation/getting-started/structure/)
		* `set :deploy_to, "/home/theglassfiles-com/applications/#{fetch(:application)}/#{fetch(:rails_env)}"`
			* this sets the location in which capistrano will put its deployment 
			* in our case we are telling it to put it in our particular applications rails environment 
			* the structure serveside looks like this for lets say `theglassfiles` app `staging` environment
				```
					|--- current -> /home/theglassfiles-com/applications/theglassfiles_com/staging/releases/20160701584000/
					|--- releases 
					|	|--- 20160701253000
					|	|--- 20160701364000
					|	|--- 20160701473000
					|	|--- 20160701583000
					|	|--- 20160701584000
					|--- repo
					|	|___ <VCS related data> 
					|--- revisions.log	
					|___ shared
						|___ <linked_files and linked_dirs>
				```	
				* current 
					* a symlink pointing to the latest release 
					* if deployment fails at any point the current symlink points to the old release 
				* releases 
					* hols all deployments in a timestamped folder 
					* the latest of which is the target of the current symlink 
				* repo 	
					* holds the version control system configured 
					* is a raw git repo
				* revisions.log 
					* used to log every deploy or rollback 
						* timestamped 
						* executing user is listed 
				* shared 
					* contains the `linked_files` and `linked_dirs` 
						* symlinked each release 
					* persist across deployment and releases 
					* used for 
						* database configuration files 
						* static and persistent user storage 
	* [configuration](http://capistranorb.com/documentation/getting-started/configuration/) 
		* location 
			* can be either global or specific to your stage 
				* global 
					* `config/deploy.rb`
				* stage specific 
					* `config/deploy/<stage_name>.rb` 	
		* access 
			* each variable can be set to a specific value 
			* a value can be retrieved from the configuration at any time 
			* variables that hold arrays can easily add values to the array using `append` 
				* useful for `:linked_dirs` and `:linked_files` 
				* works with `remove` too
		* settable variables 
			* `:application` 
				* the name of the application 
			* `:deploy_to` 
				* default -> {"/var/www/#{fetch(:application)}"} 
				* the path on the remote server where the application should be deployed 
			* `:scm`
				* default -> :git 
				* the source control managment used 
				* :git, :hg, :svn supported 
			* `:repo_url` 
				* URL to the repository 
				* must be a valid url for the used scm 
					* access a repo on a machine using a non-standard ssh port	
						* `:repo_url, 'ssh://git@example.com:30000/~/me/my_repo.git`
			* `:branch` 
				* default -> 'master'
				* the branch name to be deployed from scm 
			* `:repo_path` 
				* default -> { "#{fetch(:deploy_to)}/repo"}
				* the path on the remote server where the repository should be placed 
				* this does not normally need to be set 
			* `:repo_tree`
				* default -> none the whole repo is normally deployed 
				* the subtreee of the repository to deploy 
				* currently only implemented for git and hg 
			* `:linked_files` 
				* default -> []
				* listed files will be symlinked to each release directory during deployment 
				* can be used for persistent configuration files like `database.yml` 
			* `:linked_dirs` 	
				* default -> []
				* listed directories will be symlinked into the release directory during deployment 
				* can be used for persistent directories like uploads or other data 
			* `:default_env` 
				* default -> {}
				* default shell environment used during command execution 
				* can be used to set or manipulate specific environment variables 
			* `:keep_releases` 
				* default -> 5 
				* the last n releases are kept for possible rollbacks 
				* the cleanup task detects outdated release folders and removes them if needed 
			* `:tmp_dir` 
				* default -> '/tmp'	
				* temporary directory used during deployments to store data 
				* if you have a shared web host this setting may need to be set 
			* `:local_user`
				* default -> { Etc.getlogin }
				* username of the local machine used to update the revision log 
			* `:pty` 
				* default -> false 
				* used in SSHKit 
			* `:log_level` 
				* default -> :debug 
			* `:format` 
				* default -> :pretty
				* used in SSHKit 
	* [user input](http://capistranorb.com/documentation/getting-started/user-input/)
		* user input can be required in a task or during configuration 	
			* use the `ask()` method 
				* you can pass echo: false to prevent input from being displayed
				* if you pass a symbol to ask 
					* the text will be printed 
					* the input will be saved to that variable 
	* [preparing your application](http://capistranorb.com/documentation/getting-started/preparing-your-application/)
		* commit your application to external source control hosting i.e github
			* put your shit on github 
		* move secrets out of the repository 
			* change `config/database.yml` to `config/database.yml.example`
			* leaving the the `database.yml` filename unused at deployment time is important 
				* capistrano uses theat name to symlink the production database configuration into place at deploy time 
			* the original `database.yml` should be added to the `.gitingnore` 
			* SHOULD BE DONE FOR ALL SECRET FILES 	
		* initialize capistrano in your application 
			* commands: 
				```
					$ cd my-project 
					$ cap install
				```
			* creates a bunch of files 		
				```
					|--- Capfile
					|--- config 
					|	|--- deploy 
					|	|	|--- production.rb 
					|	|	|--- staging.rb
					|	|___ deploy.rb
					|___ lib
						|___ capistrano
							|___ tasks
				```
				* your new Capfile will automatically any tasks from any `*.rake` files in `lib/capistrano/tasks` 
		* configure your server addresses in the generated files 
			* capistrano breaks down common tasks into a notion of 'roles' 
				* typical rails application have three roles 
					* web 
					* app	
					* db 
			* generated `config/deploy/staging.rb`
				```
					set :stage, :staging 
					
					# simple role syntax 
					role :app, %w{example.com}
					role :web, %w{example.com}
					role :db,  %w{example.com} 
					
					# extended server syntax 
					server 'example.com', roles: %w{web app}, my_property: :my_value	
					
					# set :rails_env, :staging
				```
				* servers can be defined in two ways 
					* both 
						* can specify optional properties to be associated with a server or role 
						* include capistrano-required ones like ssh options 
					* roles syntax 
					* server syntax 
				* example: 
					```
						server 'ip_address', roles: [:web, :app, :db], user: 'system_deploy_user'
					```
		* set the shared information in `deploy.rb` 
			* configuration common to each environment can be specified 
				* git repo 
				* app name 
				* user to deploy 
			* example: 
				```
					set :application, 'my app name' 
					set :repo_url, 'git@example.com:me/my_repo.git'
					set :branch, 'master'
				```
		* roundup 
			* capistrano knows where to find the servers 
			* capistrano knows where to find the code
	* [authentication & authorisation](http://capistranorb.com/documentation/getting-started/authentication-and-authorisation/)
		* create a deploy user in every environment 
		* authentication 
			* we need promptless authentication 
				* from workstation to our server 
					* do this with ssh keys 
					* ++ using a key agent 
				* from our servers to the repository host 
					* the server must have access to the repo 
					* usually done using ssh agent forwarding or deploy keys 
			* ssh keys from workstation to servers 
				* create an ssh key 
				* recomend ssh agent 
				* drop public key in remote server `~/.ssh/authorized_keys` file
				* github exposes ssh public keys for users 
					* `https://github.com/theirusername.keys`
			* from our servers to the repository host 
				* ssh agent forwarding 
					* get the url of the git repo 
					* make sure the keys are loaded into the agent on localhost 
						* `ssh-add`
					* check to make sure the agent forwarding is working 
						* `me@localhost $ ssh -A deploy@remote_server_com 'git ls-remote git@github.com:repo.git'`
							* the `ls-remote` command 
								* list the remote objects 	
								* if you get error host key verfication failed 
									* log into deploy user and add github to list of known host 
										* `ssh git@github.com`
				* http authentication 
					* uses https if you do this 
						* cleartext passwords no bueno 
					* prompted for username and password 
				* with a regular username/password 
					* not happening 
				* with an OAuth perosnal api token 
					* gives access to every repository you as a github user has access to 
					* also no bueno 
				* deploy keys 
					* generate a second set of SSH keys for the connection between github and the servers themselves 
					* public key is uploaded to the repository 		
					* the private key is copied to each server that needs to deploy 
		* authorisation 
			* the system user must be authorised to work in the deployment directory on the server 
			* work without sudo 
	* [flow](http://capistranorb.com/documentation/getting-started/flow/)
		* deploy flow 
			* when you run `cap <environment> deploy` 
				* the execution flow 
					* deploy:starting 
						* start a deployment, make sure everything is ready 
					* deploy:started 
						* started hook(for custom tasks)
					* deploy:updating 	
						* update servers with a new release 
					* deploy:updated 
						* updated hook for custom tasks 
					* deploy:publishing 
						* publish the new release 
					* deploy:published 
						* published hook for custom tasks 		
					* deploy:finishing 
						* finish the deployment, clean everything up 
					* deploy:finished 
						* finished hook for custom tasks 
				* each of the hooks can be used with `after()` and `before()` 	
		* rollback flow 
			* `cap <environment> deploy:rollback` 
				* execution flow 
					* deploy:starting 
					* deploy:started 
					* deploy:reverting
						* revert servers to previous release 
					* deploy:reverted 
						* reverted hook for custom tasks
					* deploy:publishing
					* deploy:published 
					* deploy:finishing_rollback 
						* finished the rollback clean everythign up 
					* deploy:finished 
						* finished hook for custom tasks 
	* [rollbacks](http://capistranorb.com/documentation/getting-started/rollbacks/)
	* [cold start](http://capistranorb.com/documentation/getting-started/cold-start/)
		* checking the directory structure on the remote machine 
			* make sure that the deploy user has proper authorization 
				* `ssh deploy@remote 'ls -lR /var/www/my-application'`
		* writing our first cap task to formalize this into a check 
			* make a cap task to do the above 
				```
					desc "check that we can access everything" 
					task :check_write_permissions do 
						on roles(:all) do |host|
							if test("[ -w #{fetch(:deploy_to)}]")
								info "#{fetch(:deploy_to)} is writable on #{host}"	
							else 
								error "#{fetch(:deploy_to)} is not writable on #{host}"
							end 
						end 		
					end 
				```
			* this will generate a one line output for each server 
			* capistrano api 
				* `desc()`, `task()`, `on()`, `roles()`, `test()`, `info()`, `error()`
		* we can check if git is working 
			* `me@localhost $ cap staging git:check`
				* this is super badass
	* trouble shoot 
		* [linked file config/database.yml does not exist on remote server](http://stackoverflow.com/questions/28981897/capistrano-linked-file-database-yml-does-not-exist-on-my-server-ipadress)
			* create the file on the server and adjust it after
		* capistrano is installing shared and release in the wrong place
			* fairly certain :rails_env is not being set 
			* had to set :deploy_to again in the particular environment 
		* capistrano is freaking out about migrations 
			* probably load the db on our own 
			* basicaly rails keeps track of if things need to be migrated by comparing the schema version in `config/schema.rb` to the latest entry in the schema_migrations table in the database. 
				* if the are different, the system is cued to run migrations 
			* i was right just need to reupload the db manually


# July 18th - capistrano and passenger together 

basically dev ops is fucking nuts. really cool though. 

okay so im going to actually try to reflect on this work day. basically things are not as hard as you think they are if you actually go through and try to understand whats going on as you go. i feel pretty close to getting a more intuitive understanding of how this whole bit pusher thing works. thats pretty dope. 



#### questions 

* what is the [`413 request entity too large for`](http://craftcms.stackexchange.com/questions/2328/413-request-entity-too-large-error-with-uploading-a-file)?
	* its an nginx thing 
	* this happens whne the request body is larger than the server is configured to allow 
	* apperently some vpns can cause this issue as well 





#### explore 
	
* passenger 
	* release notes 
		* there are now two ways to restart passenger 
			* `touch tmp/restart.txt` 
				* this is the classic method 
			* `passenger-config restart-app` 
				* new way 
				* need to make changes to `config/deploy.rb` 
					* set :passenger_restart_with_touch, false
		* if you are running passegenger in standalone mode, good luck
	* may need to add some [passenger configs to `config/deploy.rb`](https://www.phusionpassenger.com/library/deploy/apache/automating_app_updates/ruby/#editing-instructions-1)
		* passenger on the server needs to be configured to server the app from the directory symlinked to current 
	* [now it is time to learn of the passengers](https://www.phusionpassenger.com/library/walkthroughs/basics/ruby/fundamental_concepts.html)
		* basic understanding of passenger 

# July 19th - active record associations and models






#### questions 

* what is a [foreign key constraint](https://robots.thoughtbot.com/referential-integrity-with-foreign-keys) in the rails context?
	* related to referential integrity 	
	* [doc](https://www.postgresql.org/docs/9.3/static/ddl-constraints.html#DDL-CONSTRAINTS-FK)
		* specifies that the values in a column must match the values appearing in some row of another table 
	

* what is [referential integrity](https://en.wikipedia.org/wiki/Referential_integrity)?
	* a property of data which, when satisfied, requires every value of one column(attribute) of a table(relation) to exist as a value of another column(attribute) in a different table(relation) 
	* in a relational database 
		* any field in a table that is declared a foreign key can obtain either a null value, or only values from a parent tables primary key, or a candidate key

* what is a [candidate key](https://en.wikipedia.org/wiki/Candidate_key)?
	* its a relational db thing 
	* a minimal superkey for a relation 
		* the smallest possible set of attributes that makes all rows distinct from each other 

* what is a [prime attribute](https://en.wikipedia.org/wiki/Candidate_key)?
	* its a relational db thing 
	* the attributes that are part of a minimal superkey set are called prime attributes 
	* those that are not in the set are called non-prime attributes 

* what is a [superkey](https://en.wikipedia.org/wiki/Superkey)?
	* its a relational db thing 
	* a set of attributes of a relation variable for which in all relations assigned to that variable there are no repeat rows that have the same values for the attributes in this set 

* what does a [unique index](https://robots.thoughtbot.com/the-perils-of-uniqueness-validations) mean in rails context?
	* make sure that the db will make each row unique on a db level 

* what is a [job runner]()?
	* i guess its a background task manager kinda like cron-job?

* what is the [request-response cycle]()?

* what is GlobalID in the rails context?
	* its a rails mixin 
	* a method to reference models by URI 
		* GlobalID is an app wide URI that uniquely identifies a model instance 
		* `gid://yourApp/Some::Mode/id`
	* useful when you need a single identifier to reference different classes of objects 
	* can be signed to ensure that the data has not been tampered with 

* what does `#add_index` mean in rails migrations?

* how will [`delayed_job` play with passenger](http://stackoverflow.com/questions/35245425/passenger-kills-background-workers-for-delayed-job)?
	* need to use the daemons gem 
	
* what is a second-order association in the rails context?

* what does eager-loading mean?

* what does lazy-loading mean?

* what is a association extension?

* what is a `GROUP BY` clause in sql?

* what is a `ORDER BY` clause in sql?

* what is a race condition? 






#### explore 



* [delayed paperclip](https://github.com/jrgifford/delayed_paperclip/)
	* connects paperclip and [activejob](https://github.com/rails/rails/tree/master/activejob)	
	* works in the same model that paperclip is called 
	* uses macro-style calls
 	* feature set 
		* displays images during processing 
			* custom image for processing 
				* can introduce custom logic for when and what to display a custom image
			* custome messages if accessed during processing 
		* only process certain styles	
			* lets you process certain styles in the background  	
		* split processing 
			* lets you only process certain styles in the foreground and background 
		* reprocess without delay 
			* in case no background job is necessary 
			* disables normal `reprocess!`
			* if post-processors dont work 
		* set queue name 
			* you can set the name of the queue for background jobs 
			* can be changed in global default options or in the actual model 
		* defaults 
			* global defaults for all delayed paperclip instanced in the app can be defined by changing the `DelayedPaperclip.options` hash 
				* useful for 
					* setting a default processing image 
				* `config/application.rb`
 				```
					module YourApp 
						class Application < Rails::Application 
							# other code... 
							config.delayed_paperclip_defaults = {
								url_with_processing: true,
								processing_image_url: 'custom_processing.png'
							}
						end 
					end 
				```

* [active job](http://guides.rubyonrails.org/active_job_basics.html)
	* introduction 
		* active job is a framework for declaring jobs and making them run on a variety of queuing backends 
		* works for anything that can be chopped up into small units of work and run in parallel 
	* the purpose of active job 
		* ensures that all rails apps have job infastructure in place 
		* basically standerdizes the writing of jobs so that differences in job runners are irrelevant 
	* creating a job 
		* step-by-step 
		* create the job 
			* active job provides a rails generator to create jobs 
				* creates a job in `app/jobs` with a test case in `test/jobs` 
				```
					$ bin/rails generate job guests_cleanup 
						# output
						invoke 	test_unit 
						create 		test/jobs/guests_cleanup_job_test.rb 
						create	app/jobs/guests_cleanup_job.rb 
				```
				* creates a job that will run on a specific queue 
				```
					$ bin/rails generate job guests_cleanup --queue urgent 
				```
				* create a job in `app/jobs` without a generator 
				```
					class GuestsCleanupJob < ApplicationJob 
						queue_as :default 
						
						def perform(*guests) 	
							# do something later 
						end 
					end 
				```
					* `perform` can be defined with as many arguments as desired 
		* enqueue the job 
			* enqueue a job to be performed as soon as the queueing system is free 
				```
					GuestsCleanupJob.perform_later guest 
				```
			* enqueue a job to be performed tomorrow at noon 
				```
					GuestsCleanupJob.set(wait_until: Date.tomorrow.noon).perform_later(guest)
				```
			* enqueue a job to be performed 1 week from now 
				```
					GuestsCleanupJob.set(wait: 1.week).perform_later(guest)
				```
			* `perform_now` and `perform_later` will call `perform` under the hood, pass as many arguments as defined in the latter 
				```
					GuestsCleanupJob.perform_later(guest1, guest2, filter: 'some_filter')
				```
	* job execution 
		* to enqueue and execute jobs in production you need to set up a queuing backend 
			* a 3rd-party queuing library that rails should use 
			* rails only provides an in-process queuing system
				* only keeps jobs in ram 
				* any reset for any reason wipes out all jobs 
		* backends 
			* [active job has built-in adapters](http://api.rubyonrails.org/classes/ActiveJob/QueueAdapters.html) for multiple queuing backends 
				* sidekiq
				* resque 		
				* delayed job 
		* setting the backend 
			* set your queuing backend 
				* `config/application.rb`
				```
					module YourApp 
						class Application < Rails::Application 
							# be sure to have the adapters gem in your gemfile 	
							# follow the adapters specific installation and deployment instructions 
							config.active_job.queue_adapter = :sidekiq
						end 
					end 
				```
				* can also be set on a per job basis 
				```
					class GuestsCleanupJob < ApplicationJob 
						self.queue_adapter = :resque
					end 
					# this overides the default config 		
				```
		* starting the backend 
			* jobs run in parallel to your rails application 
				* most queuing libraries require that you start a library-specific queuing service for the job processing to work 
				* refer to library documentation for instructions on starting your queue backend 
					* [sidekiq](https://github.com/mperham/sidekiq/wiki/Active-Job)
					* [resque](https://github.com/resque/resque/wiki/ActiveJob)
					* [sucker punch](https://github.com/brandonhilkert/sucker_punch#active-job)
					* [queue classic](https://github.com/QueueClassic/queue_classic#active-job)
	* queues 
		* most adapters support multiple queues 
			* active job allows you to schedule a job to run on a specific queue 
			```	
				class GuestsCleanupJob < ApplicationJob
					queue_as :low_priotity 
						
				end 
			```
			* in `application.rb` you can set a prefix for the queue name for all jobs 
				* `config/application.rb` 
				```
					module YourApp 
						class Application < Rails::Application 
							config.active_job.queue_name_prefix = Rails.env
						end 
					end 
				```
				* `app/jobs/guests_cleanup_job.rb` 
				```
					class GuestsCleanupJob < ApplicationJob 
						queue_as :low_priority 
					end 
				```
				* jobs will run on queue production_low_priority in the production environment 
				* jobs will run on queue staging_low_priority in the staging environment 
			* the default queue name prefix delimiter is '_', this is changes in `application.rb` 
				* `config/application.rb`
				```
					module YourApp 
						class Application < Rails::Application 
							config.active_job.queue_name_prefix = Rails.env 	
							config.active_job.queue_name_delimiter = '.'
						end 
					end 
				```
				* `app/jobs/guests_cleanup_job.rb` 
				```
					class GuestsCleanupJob < ApplicationJob 
						queue_as :low_priority 
					end 
				```
				* jobs will run on queue production.low_priority in production environment 
				* jobs will run on queue staging.low_priority in staging environment 
			* to have even more control on what queue a job will be run you can pass a `:queue` option to `#set`
				* `MyJob.set(queue: :another_queue).perform_later(record)`
			* to control the queue from the job level you can pass a block to `#queue_as` 
				* executed in the job context (`self.arguments` accessible)
					* must return the queue name 
					* `app/jobs/process_video_job.rb` 
					```
						class ProcessVideoJob < ApplicationJob 
							queue_as do 
								video = self.arguments.first 
								if video.owner.premium?
									:permium_videojobs
								else 
									:videojobs
								end 
							end 
							
							def perform(video) 
								# process video 
							end 
						end 
						
						ProcessVideoJob.perform_later(Video.last)
					```
			* make sure your queuing backend listens on your queue name 
				* some backends need you to specify the queues to listen to 	
	* callbacks 
		* active job provides hooks during the life cycle of a job 
		* callbacks allow you to trigger logic during the lifecycle of a job 
		* available callbacks 
			* `before_enqueue`
			* `around_enqueue` 
			* `after_enqueue` 
			* `before_perform` 
			* `around_perform` 
			* `after_perform` 
		* usage 
			* `app/jobs/guests_cleanup_job.rb`
			```
				class GuestsCleanupJob < ApplicationJob 
					queue_as :default 
						
					before_enqueue do |job|
						#do something with the job instance 
					end 
				
					around_perform do |job, block|
						# do something before perform 
						block.call 
						# do something aafter perform 
					end 
					
					def perform 
						# do something later 
					end 
				end 
			```
	* action mailer 
		* sending emails outside of request-response cycle 			
		* active job is integrated with mailer to easily send async emails 
		* example: 
			```
				# to send email now use #deliver_now 
				UserMailer.welcome(@user).deliver_now 
					
				# if you want to send the email through active job use #deliver_later 
				UserMailer.welcome(@user).deliver_later 
			```
	* internationalization 
		* jobs use the `I18n.locale` set when the job was created 
			```
				I18n.locale = :eo
					
				UserMailer.welcome(@user).deliver_later # email will be localized to esperanto 
			```
	* globalID
		* active job supports globalID for parameters 
		* makes it possible to pass live active record objects to jobs instead of class/id pairs 
		* before globalID 
			```
				class TrashableCleanupJob < ApplicationJob
					def perform(trashable_class, trashable_id, depth)
						trashable = trashable_class.constantize.find(trashable_id) 
						trashable.cleanup(depth)
					end 
				end 
			```
		* after globalID 
			```
				class TrashableCleanupJob < ApplicationJob 
					def perform(trashable, depth) 
						trashable.cleanup(depth) 
					end 
				end
			```
		* works with any class that mixes in GlobalID::Identification 
			* default into active record classes 
	* exceptions 
		* active job provides a way to catch exceptions raised during the execution of a job 
		* example: 
			* `app/jobs/guests_cleanup_job.rb`
			```
				class GuestsCleanupJob < ApplicationJob 
					queue_as :default 
					
					rescure_from(ActiveRecord::RecordNotFound) do |exception|
						# do something with exception 
					end 
							
					def perform 
						# do something later 
					end 
				end 
			```
		* deserialization 
			* globalID allows serializing full active record objects passed to `#perform` 
			* if a passed record is deleted after the job is enqueued but before the `#perfom` method is called 
				* active job raises an `ActiveJob::DeserializationError` exception					
	* job testing 
		* check here [testing guide](http://guides.rubyonrails.org/testing.html#testing-jobs)

* [delayed job queue backend](https://github.com/collectiveidea/delayed_job)
	* encapsulates the common pattern of asynchronously executing longer tasks in the background 
		* used by shopify to 
			* send massive newsletters, image resizing, http downloads, updating smart collections, updating solr, our search server, after product changes, batch imports, spam checks 
	* installation 
		* `gem 'delayed_job_active_record` 
		* run bundle install 
		* create active record tables 
		```
			rails generate delayed_job:active_record 
			rake db:migrate 
		```
	* queuing jobs 
		* call `.delay.method(params)` on any object and it will be processed in the background 
		``` 	
			# without delayed_job 
			@user.activate!(@device) 
			
			# with delayed_job 
			@user.delay.activate!(@device)
		```	
		* if a method should always be run in the background call `#handle_asynchronously` after the method declaration 
		```
			class Device 
				def deliver 
					# long running method 
				end 	
				handle_asynchronously :deliver 
			end 
				
			device = Device.new 
			device.deliver 
		```
	* parameters 
		* `#handle_asynchronously` and `#delay` take these parameters 
			* `:priority` (number): 
				* lower numbers run first
				* default is 0 but can be reconfigured 
			* `:run_at` (time): 
				* run the job after this time 
			* `:queue` (string): 
				* named queue to put this job in 
			* can be Proc objects allowing call-time evaluation of the value 
		* example: 
			```
				class LongTasks 
					def send_mailer 
						#some code 
					end 
					handle_asynchronously :send_mailer, :priority => 20
					
					def in_the_future 
						# some code 
					end 
					# 5.minutes.from_now will be evaluated when #in_the_future is called 
					handle_asynchronously :in_the_future, :run_at => Proc.new {5.minutes.from_now}
				
					def self.when_to_run 	
						2.hours.from_now 
					end 
				
					class << self 
						def call_a_class_method 
							#some code 
						end 
						handle_asynchronously :call_a_class_method, :run_at => Proc.new{when_to_run}
					end 
					
					attr_reader :how_important 
					
					def call_an_instance_method 
						#some code 
					end 
					handle_asynchronously :call_an_instance_method, :priority => Proc.new {|i| i.how_important}
				end 
			```
		* while developing if you want to check how jobs are running without waiting 
			* append the name of the method with `_without_delay` 
				* for method: `foo` call `foo_without_delay` 
	* rails 3 mailers 
		```	
			# without delayed_job 
			Notifier.signup(@user).deliver 
			
			# with delayed_job 
			Notifier.delay.signup(@user)
			
			# with delayed_job running at a specific time 
			Notifier.delay(run_at: 5.minutes.from_now).signup(@user) 
		```
	* named queues 
		* jobs can be assigned to a queue by setting the queue option 
			```	
				object.delay(:queue => 'tracking').method 
					
				Delayed::Job.enqueue job, :queue => 'tracking' 
				
				handle_asynchronously :tweet_later, :queue => 'tweets' 
			```	
		* configure default priorities for named queues 
			```
				Delayed::Worker.queue_attributes = {
					high_priority: { priority: -10},
 					low_priority: { priority: 10}
				}
			```
		* configured quque priorities can be overriden by passing priority to the delay method 
			```
				object.delay(:queue => 'high_priority', priority: 0).method 
			```
	* running jobs 
		* `script/delayed_job` can be used to manage a background process which will start working off jobs 
			* add `gem "daemons"` to your gemfile and make sure you've run `rails generate delayed_job` 
		* then magic commands follow 
			```
				RAILS_ENV=production script/delayed_job start 
				RAILS_ENV=production script/delayed_job stop 
				
				# runs two workers in separate processes 
				RAILS_ENV=production script/delayed_job -n 2 start 
				RAILS_ENV=production script/delayed_job stop 
				
				# set the --queue or --queues option to work from a particular queue 
				RAILS_ENV=production script/delayed_job --queue=tracking start 
				RAILS_ENV=production script/delayed_job --queues=mailers, tasks start 
				
				# use the --pool option to specify a worker pool. you can use this option multiple times to start different numbers of workers for different queues.
				# the following command will start 1 worker for the tracking queue, 
				# 2 workers for the mailers and tasks queues, and 2 workers for any jobs: 
				RAILS_ENV=production script/delayed_job --pool=tracking --pool=mailers, tasks:2 --pool=*:2 start 
				
				# runs all available jobs and then exits 
				RAILS_ENV=production script/delayed_job start --exit-on-complete 
				# or to run in the foreground 
				RAILS_ENV=production script/delayed_job run --exit-on-complete
			```
			* for rails 4 replace `script/delayed_job` with `bin/delayed_job`
		* each worker will check the database at least every 5 seconds 
		* the `rake jobs:work` will start working off jobs 
			* `rake jobs:workoff` will run all available jobs and exit 
		* work of queues by setting the `QUEUE` or `QUEUES` environment variable 
			```
				QUEUE=tracking rake jobs:work 
				QUEUES=mailers, tasks rake jobs:work
			```
	* restarting delayed_job
		* the following syntax will restart delayed jobs 
			* `RAILS_ENV=production script/delayed_job restart`
 		* to restart multiple delayed_job workers 
			* `RAILE_ENV=production script/delayed_job -n2 restart` 
		* rails 4 replace `script/delayed_job` with `bin/delayed_job` 
	* hooks 
		* you can define your own hooks on a job 
		* example: 	
			```
				class ParanoidNewsletterJob < NewsletterJob 
					def enqueue(job)
						record_stat 'newsletter_job/enqueue' 
					end 
			
					def perform 
						emails.each { |e| NewsletterMailer.deliver_text_to_email(text, e)}
					end 
					
					def before(job) 
						record_stat 'newsletter_job/start' 
					end 
				
					def after(job) 	
						record_stat 'newsletter_job/after'
					end 
				
					def success(job) 
						record_stat 'newsletter_job/success'
					end 
			
					def error (job, exception) 
						Airbrake.notify(exception) 	
					end 
					
					def failure(job) 
						page_sysadmin_in_the_middle_of_the_night
					end 
				end 
			```
	* gory details 
		* the library revolves around a delayed_jobs table 
		* theres a lot of details 	
	* guide on setting up [delayed job with active job](http://bica.co/2015/03/08/howto-using-activejob-with-delayedjob/)
	* [tips and tricks](https://www.sitepoint.com/delayed-jobs-best-practices/)

		
* [referential integrity in rails](https://robots.thoughtbot.com/referential-integrity-with-foreign-keys)
	* referential integrity ensures that the relationship between rows in two tables will remain synchronized during all updates and deletes 
	* rails lets you set up the implied relationship but does nothing to enforce it 
	* use the dependence macros to indicate rails should do stuff in accordance with relations 
	* basically to make sure this kind of stuff never happens we add foreign key constraints at the database level 
		* db will reject any operation that would violate the referential integrity 
	* polymorphic associations are maintained by rails 
		* the db knows nothing about them 

* [active record associations](http://guides.rubyonrails.org/association_basics.html)
	* why associations 
		* an association is a connection between two active record models 
		* basically allows you to streamline development of models associated with each other 
	* the types of associations 
		* 6 types of associations 
			* `belongs_to`
				* sets up a one-to-one connection with another model 
					* each instance of the declaring model belongs to one instance of the other model 
						* if we had books and authors and each book could belong to exactly one author this would be the relationship 
						* example:
							* model  
							```
								class Book < ApplicationRecord 
									belongs_to :author 
								end 
							```
							* migration 
							```
								class CreateBooks < ActiveRecord::Migrations[5.0]
									def change 
										create_table :authors do |t|	
											t.string :name 
											t.timestamps
										end 
									
										create_table :books do |t|	
											t.belongs_to :author, index: true 
											t.datetime :published_at 
											t.timestamps 
										end 
									end 
								end 
							```
					* they must use the singular term 
						* if you use the pluralized form in the above example then rails would attempt to pluralize the plural form and that would obviously break things 
						
			* `has_one` 
				* sets up a one-to-one connection with another model 
					* each instancs of a model contains or possesses one instance of another model 
					* basically the same relationship as `belongs_to` but from the other perspective  
						* example: 
							* model 
							```
								class Supplier < ApplicationRecord 
									has_one :account
								end 	
							```
							* migrations 
							```
								class CreateSuppliers < ActiveRecord::Migrations[5.0]
									def change 
										create_table :suppliers do |t|
											t.string :name 
											t.timestamps 
										end 
										
										create_table :accounts do |t|
											t.belongs_to :supplier, index: true, unique: true, foreign_key: true
											t.string :account_number 
											t.timestamps
										end 
									end 
								end 
							```
								* here we add a unique index and a foreign key constraint to the supplier column for the accounts table 	
			* `has_many` 
				* indicates a one-to-many connection with another model
					* often paired with `belongs_to` 
				* each instance of the model has zero or more instances of another model 
					* example: 
						* model
						```
							class Author < ApplicationRecord 
								has_many :books
							end 
						```
						* migrations 				
						```
							class CreateAuthors < ActiveRecord::Migration[5.0]
								def change 
									create_table :authors do |t|
										t.string :name
										t.timestamps 
									end 
									
									create_table :books do |t|
										t.belongs_to :author, index: true
										t.datetime :published_at 		
										t.timestamps			
									end 
								end 
							end 
						```
				* the name of the referenced model should be pluralized when declared 
			* `has_many :through` 
				* used to set up a many-to-many connection with another model 
					* indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model 
				* for the example: medical practice where patients make appointments to see physicians 
					* example: 
						* model 
						```	
							class Physician < ApplicationRecord 
								has_many :appointments 	
								has_many :patients, through: :appointments 
							end 
				
							class Appointment < ApplicationRecord 
								belongs_to :physician
								belongs_to :patient 
							end 
				
							class Patient < ApplicationRecord 
								has_many :appointments 
								has_many :physicians, through: :appointments		
							end 
						```
						* migration 
						```
							class CreateAppointments < ActiveRecord::Migrations[5.0]
								def change 
									create_table :physicians do |t|	
										t.string :name 
										t.timestamps 
									end 
								
									create_table :patients do |t|
										t.string :name 
										t.timestamps 
									end 
						
									create_table :appointments do |t|
										t.belongs_to :physician, index: true 
										t.belongs_to :patient, index: true 
										t.datetime :appointment_date 
										t.timestamps 	
									end 
								end 
							end 
						```
				* automatic deletion of join models is direct 
					* no destroy callbacks are triggered 
			* `has_one :through` 
				* sets up a one-to-one connection with another mode 
					* indicates that the declaring model can be matched with one instance of another model by proceeding through a third model 
				* set up for example- each supplier has one account and each account is associated with one account history 
					* example: 
						* model 
						```
							class Supplier < ApplicationRecord 
								has_one :account 
								has_one :account_history, through: :account 	
							end 	
			
							class Account < ApplicationRecord 
								belongs_to :supplier 	
								has_one :account_history 
							end 
			
							class AccountHistory < ApplicationRecord 
								belongs_to :account 
							end 
						```
						* migration 
						```
							class CreateAccountHistories < ActiveRecord::Migrations[5.0]
								def change 
									create_table :suppliers do |t|
										t.string :name
										t.timestamps
									end 	
			
									create_table :accounts do |t|
										t.belongs_to :supplier, index: true 
										t.string :account_number 
										t.timestamps 	
									end 
			
									create_table :account_histories do |t|
										t.belongs_to :account, index: true 
										t.integer :credit_rating 
										t.timestamps 
									end 
								end 		
							end
						```									
			* `has_and_belongs_to_many` 
				* creates a direct many-to-many connection with another model 
					* no interveening model 
				* setup example- assemblies and parts, each assembly having many parts and each part appearing in many assemblies 
					* example: 
						* model 
						```
							class Assembly < ApplicationRecord 
								has_and_belongs_to_many :parts 
							end 
				
							class Part < ApplicationRecord 
								has_and_belongs_to_many :assemblies 
							end 
						```
						* migrations 
						```
							class CreateAssembliesAndParts < ActiveRecord::Migrations[5.0]
								def change 
									create_table :assemblies do |t|
										t.string :name 
										t.timestamps 
									end 
									
									create_table :parts do |t|
										t.string :parts_number 
										t.timestamps 
									end 
				
									create_table :assemblies_parts, id: false do |t|
										t.belongs_to :assembly, index: true 
										t.belongs_to :part, index: true 
									end 
								end 
							end 
						```								
			* associations are implemented using macro-style calls 
		* choosing between `belongs_to` and `has_one` 
			* setting a one-to-one relationship 
				* `belongs_to` on one 
				* `has_one` on the other 
			* the distinction is where you place the foreign key 
				* `has_one` relationship 
					* something points back to you 
				* `belongs_to` relationship 		
					* you point at something 
			* example: 
				* model 
				```
					class Supplier < ApplicationRecord 	
						has_one :account
					end 
				
					class Account < ApplicationRecord 
						belongs_to :supplier 
					end 
				```
				* migrations 
				```
					class CreateSuppliers < ActiveRecord::Migration[5.0]
						def change 
							create_table :suppliers do |t|
								t.string :name 
								t.timestamps 
							end 
						
							create_table :accounts do |t|
								t.integer :supplier_id 
								t.string :account_number 
								t.timestamps 
							end 
				
							add_index :accounts, :supplier_id 
						end 
					end
				```
		* choosing between `has_many :through` and `has_and_belongs_to_many`
			* set up a `has_many :through` relationship if 
				* you need to work with the relationship model as an independent entity
				* you need validations 
				* you need callbacks 
				* or extra attributes on the join model 	
			* otherwise the `has_and_belongs_to_many` relationship is simpler 
		* polymorphic associations 
			* a model can belong to more than one other model on a single association 
			* setup example- a picture model that belongs to either an employee model or a product model 
			* example: 
				* `app/model/picture.rb`
				```
					class Picture < ApplicationRecord 
						belongs_to :imageable, polymorphic: true 
					end 	
				```
				* `app/model/employee.rb` 
				```
					class Employee < ApplicationRecord 
						has_many :pictures, as: :imageable 
					end 
				```
				* `app/model/product.rb` 
				```
					class Product < ApplicationRecord 
						has_many :pictures, as: :imageable 	
					end 
				```
			* polymorphic `belongs_to` is like an interface that any other model can use 
			* to have access to the parent of an instance of the `Picture` model you must declare in the model that is polymorphic 
				* a foreign key column 
				* a type column  
				* `db/migrations/create_pictures_201607010405055.rb`
				```
					class CreatePictures < ActiveRecord::Migration[5.0]
						def change 
							create_table :pictures do |t|
								t.string :name 
								t.integer :imageable_id 
								t.string :imageable_type 
								t.timestamps
							end 
							
							add_index :pictures, [:imageable_type, :imageable_id]
						end 
					end 
				```
				* simplified using the t.references form 
				* `db/migrations/create_pictures_201607020402402.rb`
				```
					class CreatePictures < ActiveRecord::Migration[5.0]
						def change 
							create_table :pictures do |t|
								t.string :name 
								t.references :imageable, polymorphic: true, index: true 
								t.timestamps 	
							end 
						end 
					end 
				```
		* self joins 
			* some models need to have relations to themselves 
			* setup example- store all employees in a single db model, but be able to trace relationships between types of employees 
			* example: 
				* `app/model/employee.rb` 
				```
					class Employee < ApplicationRecord 
						has_many :subordinates, class_name: "Employee", foreign_key: "manager_id" 	
						
						belongs_to :manager, class_name: "Employee" 
					end 
				```
				* `db/migrations/create_employees_20160702058404.rb` 	
				```
					class CreateEmployees < ActiveRecord::Migrations[5.0]
						def change 
							create_table :employees do |t|	
								t.references :manager, index: true 
								t.timestamps 
							end
						end 
					end 
				```
	* tips, tricks, and warnings 
		* things you should know to make efficient use of active record associations 
			* controlling caching, avoiding name collisions, updating the schema, controlling association scope, bi-directional associations 
		* controlling caching 
			* all of the association methods are built around caching 
			* keeps the result of the most recent query available for further operation 
			* the cache is shared across methods 
			* example: 
				```		
					author.books 					# retrieves books from the db 
					author.books.size 				# uses the cached copy of books 
					author.books.empty? 				# uses the cached copy of books 
				```
				* to reload the cache fresh from the db call `reload` on the association 
				```
					author.books 					# retrieves books from the db 
					author.books.size 				# uses the cached copy of books 
					author.books.reload.empty?			# discards the cached copy of books and retrieves a new copy from db 
				```
		* avoiding name collisions 	
			* creating associations adds a method with that name to the model 
			* do not give an association a name that is already used for an instance method of `ActiveRecord::Base` 
				* this would override the base method and break things 
				* `attributes` and `connection` are bad names for associations 
		* updating the schema 
			* you are responsible for maintaining referential integrity 
			* `belongs_to` associations need foreign keys 
				* if the association is created long after the model 
					* migrate and add a column to provide the necessary foreign key 
				* example: 
					* `app/model/book.rb` 
					```
						class Book < ApplicationRecord 	
							belongs_to :author 
						end 
					```
					* `db/migration/create_books_2016-73813427.rb` 
					```
						class CreateBooks < ActiveRecord::Migration[5.0]
							def change 
								create_table :books do |t|
									t.datetime :published_at 
									t.string   :book_number
									t.integer  :author_id 
								end 
							
								add_index :books, :author_id 
							end 
						end 
					```
			* `has_and_belongs_to_many` need join tables 
				* you need to manually create a joining table 
				* unless the name of the join table is explicitly specified by using the `:join_table` option 
					* active record creates the name by using the lexical book of the class names 
						* lexical ordering 
				* example: 
					* `app/model` 
					```
						class Assembly < ApplicationRecord 
							has_and_belongs_to_many :parts 
						end 
					
						class Part < ApplicationRecord 
							has_and_belongs_to_many :assemblies 
						end 
					```
					* `db/migrations/create_assemblies_parts_join_table_20160719482472.rb` 
					```
						class CreateAssembliesPartsJoinTable < ActiveRecord::Migrations[5.0]
							def change 
								create_table :assemblies_parts, id: false do |t|
									t.integer :assembly_id 
									t.integer :part_id 
								end 
								
								add_index :assemblies_parts, :assembly_id 
								add_index :assemblies_parts, :part_id 
							end 
						end 
					```
					* `id: false` is passed to `#create_table` because the table does not represent a model 
						* strange behavior like mangled model ids or execeptions about conflicting ids are about this 
					* you can also use `#create_join_table` 
					* `db/migrations/create_assemblies_parts_join_table_2016071422492249.rb` 
					```
						class CreateAssembliesPartsJoinTable < ActiveRecord::Migration[5.0]
							def change 
								create_join_table :assemblies, :parts do |t|
									t.index :assembly_id
									t.index :part_id
								end
							end 
						end 
					```
		* controlling association scope 
			* by default associations look for objects only within the current modules scope 
				* important when you declare active record models within a module 
				* example: 
					* this is okay because both supplier and account class are defined within the same scope 
					```
						module MyApplication 
							module Business 
								class Supplier < ApplicationRecord 
									has_one :account
								end 
								
								class Account < ApplicationRecord 
									belongs_to :supplier 
								end 
							end 
						end 	
					```
					* this will not work because they are in different scopes 
					```
						module MyApplication 
							module Business 
								class Supplier < ApplicationRecord 
									has_one :account 
								end 
							end 
							
							module Billing 
								class Account < ApplicationRecord 
									belongs_to :supplier 
								end 
							end 
						end 
					```
			* to associate a model with a model in a different namespace you must specify the complete class name in delcaration 
			* example: 	
				```
					module MyApplication 
						module Business 
							class Supplier < ApplicationRecord 
								has_one :account,
									class_name: "MyApplication::Billing::Account" 	
							end 
						end 
						
						module Billing 
							class Account < ApplicationRecord 
								belongs_to :supplier,				
			  						class_name: "MyApplication::Business::Supplier" 
							end 
						end
					end 
				```
		* bi-directional associations 
			* it is normal for associations to work in two directions requiring delcarations on two differet models 
			* there is an `inverse_of` option to infrom rails of bi-directional associations 
			* exmaple: 
				```
					class Author < ApplicationRecord 
						has_many :books, inverse_of: :author 
					end 
				
					class Book < ApplicationRecord 
						belongs_to :author, inverse_of: :books
					end 
				```
			* `inverse_of` does not work with 
				* `:through` associations 
				* `:polymorphic` associations 
				* `:as` associations 
				* `belongs_to` associations ignore `has_many` inverse associations 
	* detailed association reference
		* `belongs_to` association reference 
			* creates a one-to-one match with another model 
				* in db term this class contains the foreign key 
					* if the other class contains the foreign key use the `has_one` association 
			* methods added by `belongs_to` 
				* when declaring a `belongs_to` association the class gains 5 classes 
					* `association` 
					* `association=(associate)`
					* `build_association(attributes = {})`
					* `create_association(attributes = {})`
					* `create_association!(attributes = {})`
				* the word `association` in each of these methods is replaced with the symbol passed as the first argumet to `belongs_to` 
					```
						class Order < ActiveRecord::Base
							belongs_to :customer 
						end 
					```
					* each instance of the `Order` model will have these methods 
					```
						customer 
						customer=
						build_customer 
						create_customer 
						create_customer!
					```
				* indepth of the `association(force_reload = false)` method 
					* returns the associated object 
						* if none returns `nil` 
						* example: 
							* `@customer = @order.customer`
					* if the associated object has already been retrieved from the database for this object 
						* cached version will be returned 
						* to override and force a db read 
							* pass true as the `force_reload` argument 
				* indepth look at the `association=(association)` method 
					* assigns an associated object to this object 
						* extracts the primary key from the associate object and setting this objects foreign key to the same value 
						* basically sets an association 
						* example: 	
							* `@order.customer = @customer` 
				* indepth look at the `build_association(attributes = {})` method
					* returns a new object of the associated type 
						* this object is instantiated from the passed attributes 
						* the link through this objects foreign key will be set 
						* associated object is not saved 
						* example: 
							* `@customer = @order.build_customer(customer_number: 123, customer_name: "John Doe")`
				* indepth look at the `create_association(attributes = {})` method 
					* returns a new object of the associated type 
						* the object will be instantiated from the passed attributes 
						* the link through the objects foreign key will be set 
						* once it passes all the validations specified on the associated model the associated object will be saved 				
						* example: 
							* `@customer = @order.create_customer(customer_number: 123, customer_name: "John Doe")`
				* indepth look at the `create_association!(attributes = {})` method
					* does the same thing as `create_association` but raises `ActiveRecord::RecordInvalid` if the record is invalid 
				

			* options for `belongs_to` 
				* rails uses intelligent defaults that work in most situations
					* like most smart things, it breaks 
				* customization of the behavior of the `belongs_to` association is accomplished by passing options and scope blocks when you create the association 
				* example: 	
					```
						class Order < ActiveRecord::Base 
							belongs_to :customer, dependent: :destroy, counter_cache: true
						end 
					```
				* `belongs_to` options 
					* `:autosave`
						* if set to true 
							* rails will save any loaded members and destroy members that are marked for destruction whenever you save the parent object  
					* `:class_name` 
						* if the name of the other model cannot be derived from the association name 
							* set `:class_name` to supply the model name 
							```
								class Order < ActiveRecord::Base 	
									belongs_to :customer, class_name: "Patron" 
								end 
							```
					* `:counter_cache` 
						* used to make finding the number of belonging objects more efficient 
							* caches the db COUNT(*) query 
							* exmample: 
							```
								class Order < ActiveRecord::Base 
									belongs_to :customer, counter_cache: true 
								end 
								class Customer < ActiveRecord::Base 
									has_many :orders 
								end 
							```
						* rails will keep the cache value up to date and then return that value in response to the `size` method 
						* the associated model must contain a column for the cache value 
							* read only attribute 
					* `:dependent` 
						* set to `:destroy` 
							* when the object is destroyed, `destroy` will be called on its associated objects 
						* set to `:delete` 
							* when the object is destroyed, all its associated objects will be deleted directly from the database without calling their destroy method 
						* do not set this option if the inverse class has a `has_many` association 
					* `:foreign_key` 
						* rails assumes that the column used to hold the foreign key on this model is the name of the association with the suffix `_id` added 
						* this option lets you set the name of the foreign key directly 
						* rails does not create foreign key columns for you
							* must be explicitly defined in the migrations 
						* example: 
							```		
								class Order < ActiveRecord::Base 
									belongs_to :customer, class_name: "Patron", foreign_key: "patron_id" 
								end 
							```
					* `:inverse_of` 
						* specifies the name of the `has_many` or `has_one` association that is the inverse of this association 
						* does not work in combination with the `:polymorphic` options 
						* example: 
							```
								class Customer < ActiveRecord::Base 
									has_many :orders, inverse_of: :customer
								end 
									
								class Order < ActiveRecord::Base 	
									belongs_to :customer, inverse_of: :orders 
								end 
							```
					* `:polymorphic` 
						* passing true indicates that this is a polymorphic association 
					* `:touch` 
						* if set to true then the `updated_at` or `updated_on` timestamp on the associated object will be set to the current time whenever the object is saved or destroyed 
							* example: 
								* saving or destroying an order will update the timestamp on the associated customer 
								``` 	
									class Order < ActiveRecord::Base 
										belongs_to :customer, touch: true 
									end 
				
									class Customer < ActiveRecord::Base 
										has_many :orders 
									end 
								```
								* specify a particular timestamp attribute to update
								```
									class Order < ActiveRecord::Base 
										belongs_to :customer, touch: :orders_updated_at 
									end 
								```
					* `:validate`	 
						* if set to true the associated objects will be validated whenever you save this object 
							* default is false, associated objects will not be validated when this object is saved 
			* scopes for `belongs_to` 
				* you may want to customize the query used by `belong_to` 
					* achieved via scope block 
					* example: 	
						```
							class Order < ActiveRecord::Base 
								belongs_to :customer, -> { where active:true}, dependent: :destroy
							end 
						```
				* you can use any of the [standard querying methods](http://guides.rubyonrails.org/v4.2/active_record_querying.html) inside the scope block
					* four of which are 
						* `where` 
							* lets you specify the conditions that the associated object must meet 
							```
								class Order < ActiveRecord::Base 
									belongs_to :customer, -> { where activate: true }
								end 
							```
						* `includes`
							* specifies the second-order associations that should be eager-loaded when this association is used  
							* example: 
								* without includes 
								```
									class LineItem < ActiveRecord::Base 	
										belongs_to :order 
									end 
										
									class Order < ActiveRecord::Base 
										belongs_to :customer 
										has_many :line_items 
									end
			
									class Customer < ActiveRecord::Base 
										has_many :orders 
									end 
								```
								* with include allows you to call `@line_item.customer` 
								```
									class LineItem < ActiveRecord::Base 
										belongs_to :order, -> { includes :customer }
									end 
			
									class Order < ActiveRecord::Base 
										belongs_to :customer 
										has_many :line_times 
									end 
			
									class Customer < ActiveRecord::Base 
										has_many :orders 
									end 
								```
						* `readonly`
							* this makes the associated object read-only when retrieved via the association 
						* `select` 
							* lets you override the SQL SELECT clause that is used to retrieve data about the associated object 
								* by default Rails retrieves all columns 
							* make sure to set the `:foreign_key` option when overriding select 
			* do any associated objects exist?
				* using `association.nil?` method checks to see if there are associated objects in existance 
			* when are objects saved?
				* assigning a `belongs_to` association does not automatically save object or the associated object 
		* `has_one` association reference 
	
		* `has_many` association reference 		
			* creates a one-to-many relationship with another model 
				* in database terms this means that the other class will have a foreign key that refers to instances od this class 
			* methods added by `has_many` 
				* `collection(force_reloads = false)`
				* `collection<<(object, ...)`
				* `collection.delete(object, ...)`
				* `collection.destroy(object, ...)`
				* `collection=(objects)`
 				* `collection_singular_ids` 
				* `collection_singular_ids=(ids)`
				* `collection.clear` 
				* `collection.empty?`	
				* `collection.size`
				* `collection.find(...)`
				* `collection.where(...)`
				* `collection.exists?(...)` 	
				* `collection.build(attributes = {}, ...)`
				* `collection.create(attributes = {})`
				* `collection.create!(attributes = {})`
				
				* `collection` is replaced with the symbol passed as the first argument to `has_many`
				* `collection_singular` is replaced with the singularized version of that symbol 
				* example: 
					```
						class Customer < ActiveRecord::Base 
							has_many :orders 
						end 
					```
				* each instance of the `Customer` model will have these methods 
					```
						orders(force_reload = false) 
						orders<<(object, ...)
						orders.delete(object, ...)
						orders.destroy(object, ...) 
						orders=(objects)
						order_ids
						order_ids=(ids)
						orders.clear
						orders.empty?
						orders.size 
						orders.find(...)
						orders.where(...)
						orders.exists?(...)
						orders.build(attributes = {}, ...)	
						orders.create(attributes = {})
						orders.create!(attributes = {})
					```
			* indepth look at the `collection(force_reload = false)` method 
				* returns an array of all the associated objects 
					* if none returns an empty array 
				* example: 	
					* `@orders = @customer.orders` 
			* indepth look at the `colleciton<<(object, ...)` method
				* adds one or more objects to the collection by setting their foreign keys to the primary key of the calling model 
				* example: 
					* `@customer.orders << @order1`
			* indepth look at the `collection.delete(object, ...)` method
				* removes one or more objects from the collection by setting their foreign keys to `NULL` 
				* example: 
					* `@customer.orders.delete(@order1)`
				* objects will be destroyed if they are associated with dependent: :destroy, and deleted if they are associated with dependent: :delete_all
			* indepth look at the `collection.destroy(object, ...)` method 
				* removes one or more objects from the collection by running `destroy` on each object 
				* example: 
					* `@customer.orders.destroy(@order1)`
				* objects will always be removed from the database ignoring the :dependent option 
			* indepth look at the `collection=(objects)` method
				* makes the collection contain only the supplied objects by adding and deleting as appropriate 
			* indepth look at the `collection_singular_ids` method 
				* returns an array of the ids of the objects in the collection 
				* example: 
					* `@order_ids = @customer.order_ids`
			* indepth look at the `collection_singular_ids=(ids)` method 
				* makes the collection contain only the objects identified by the supplied primary key values by adding and deleting as appropriate 
			* indepth look at the `collection.clear` method 
				* removes all objects from the collection according to the strategy specified by the `dependent` option 
					* default for `has_many :through` is `delete_all` 	
					* default for `has_many` is to set the foreign keys to `NULL`
				* example: 
					* `@customer.orders.clear`
				* objects will be deleted if they are associated with `dependent:` `:destroy`, or `:delete_all`
			* indepth look at the `collection.empty?` method
				* returns true if the collection does not contain any associated objects 
				* example: 
					```
						<% if @customer.orders.empty? %> 
							No Orders Found
						<% end %>
					```
			* indepth look at the `collection.size` method 
				* returns the number of objects in the collection 
				* example: 	
					* `@order_count = @customer.orders.size` 	
			* indepth look at the `collection.find(...)` method 
				* finds objects within the collection
				* uses the same syntax and options as `AcitveRecord::Base.find` 
				* example: 
					* `@open_orders = @customer.orders.find(1)` 
			* indepth look at the `collection.where(...)` method 
				* finds objects within the collection based on the conditions supplied
				* the objects are loaded lazily 
					* databased is queried only when the objects are accessed 
				* example: 
					```
						@open_orders = @customer.oders.where(open: true) # no query yet 
						@open_orders = @open_orders.first # now the db will be queried 
					```
			* indepth look at the `collection.exists?(...)` method 
				* checks whether an object meeting the supplied conditions exists in the collection 
				* uses same syntax and options as `ActiveRecord::Base.exists?`
			* indepth look at the `collection.build(attributes = {}, ...)` method 
				* returns one or more new objects of the associated type 
				* objects are instantiated from the passed attributes 
				* the link through their foreign key is set 
				* the associated objects will not be saved 
				* example: 
					* `@order = @customer.orders.build(order_date: Time.now, order_number: "A12345")`
			* indepth look at the `collection.create(attributes = {})` method 
				* returns a new object of the associated type 
				* instantiated from the passed attributes 
				* the link through its foreign key will be created 
				* once it passes all of teh validations specified on the associated model the associated object will be saved 
				* example: 
					* `@order = @customer.orders.create(order_date: Time.now, order_number: "A12345")`
			* indepth look at the `collection.create!(attributes = {})` method 
				* does the same as `create` but raises `ActiveRecord::RecordInvalid` if the record is invalid 
			* options for `has_many` 
				* intelligent defaults are not alway so smart 
				* overwrite defaults with options 
				* example: 
					```
						class Customer < ActiveRecord::Base 
							has_many :orders, dependent: :delete_all, validate: :false
						end 
					```
				* supports the following options 
					* `:as`
						* indicates that this is a polymorphic association 
					* `:autosave`	
						* if set to true rails will save any loaded members and destroy members that are marked for destruction whenever you save the parent object 
					* `:class_name` 
						* if the name of the class cannot be derived from the association name you can pass your own 
					* `:dependent` 
						* controls what happens to the associated object when their own er is destroyed 
							* `:destroy` 	
								* causes all the associated objects to also be destroyed 
							* `:delete_all` 
								* causes all the associated object to be deleted directly from the database (no callbacks executed)
							* `:nullify` 	
								* causes the foreign keys to be set to `NULL` (no callback executed) 
							* `:restrict_with_exception` 
								* causes an exception to be raised if there are any associated records 
							* `:restrict_with_error` 
								* causes an error to be added to the owner if they are any associated objects 
					* `:foreign_key` 
						* lets you set the name of the foreign key directly 
					* `:inverse_of` 
						* specifies the name of the `belongs_to` association that is the invers of this association 
					* `:primary_key` 
						* lets you explicitely set the primary key 
					* `:source`
						* specifies the source association name for a `has_many :through` association 
							* only necessary if the name of the source cannot be automatically inferred from the association name 
					* `:source_type` 
						* specifies the source association type for a `has_many :through` association that proceeds through a polymorphic association 
					* `:through` 
						* specifies a join model which to perform the query
					* `:validate` 				
						* if set to false the associated objects will not be validated whenever you save this object 
			* scopes for `has_many`
				* you can customize the query made by `has_many` 
					* achievied via a scope block 
					* example: 
						```
							class Customer < ActiveRecord::Base 
								has_many :orders, -> { where processed: true }
							end 
						```
				* though all standard querying methods can be used inside the scope block the following 10 are important to understand 
					* `where` 
						* lets you specify the conditions that the associated object must meet 
							* example: 
								```
									class Customer < ActiveRecord::Base 
										has_many :confirmed_orders, -> { where "confirmed = 1" }, class_name: "Order"
									end 
								```
								* you can also set conditions via a hash 
								```	
									class Customer < ActiveRecord::Base 	
										has_many :confirmed_orders, -> { where confirmed: true }, class_name: "Order"
									end 
								```
							* if you use hash-style `where` option then record creation via this association will be automatically scoped using the hash
					* `extending` 
						* specifies a named module to extend the association proxy
					*  `group` 
						* supplies an attribute name to group the result set by, using a `GROUP BY` clause in the finder SQL 
						* example: 	
							```
								class Customer < ActiveRecord::Base 
									has_many :line_items, -> { group 'orders.id' }, through: :orders 
								end 
							```
					* `includes` 
						* specify second-order associations that should be eager-loaded when this association is used 
						* lets you use `@collection.association.association2` to retrieve connected things 
					* `limit` 
						* lets you restrict the total number of objects that will be fetched through an association 
						* example: 
							```
								class Customer < ActiveRecord::Base 
									has_many :recent_orders, -> { order('order_date desc').limit(100) }, class_name: "Order"
								end 
							```
					* `offset` 
						* lets you specify the starting offset for fetching objects via an association 
						* example: 	
							* skips the first 11 records 
							* `-> { offset(11) }`
					* `order` 
						* dictates the order in which associated objects will be received in the syntax used by an SQL `ORDER BY` clause 
						* example: 
							```
								class Customer < ActiveRecord::Base 
									has_many :orders, -> { order "date_confirmed DESC" }
								end 
							```
					* `readonly` 
						* the associated objects will be read-only when retrieved via the association 
					* `select` 
						* lets you override the SQL `SELECT` clause that is used to retrieve data about the associated objects 
							* default is all columns 
						* be sure to include the primary key and foreign key columns of the associated model 
							* otherwise rails will be confused 
					* `distinct` 	
						* keeps the collection free of duplicates 
							* used with the `:through` option 
						* example: 
							* without distinct 
							```
								class Person < ActiveRecord::Base 
									has_many :readings 
									has_many :articles, through: :readings 
								end 
					
								person = Person.create(name: 'John')
								article = Article.create(name: 'a1') 
								person.articles << article 
								person.articles << article 
								person.articles.instpect # => [#<Article id: 5, name: "a1">, #<Article id: 5, name:"a1">]
								Reading.all.inspect # => [#<Reading id: 12, person_id: 5, article_id: 5>, #<Reading id: 13, person_id: 5, article_id: 5>]
							```
							* with distinct 
							```
								class Person 
									has_many :readings 
									has_many :articles, -> { distinct }, through: :readings 
								end 
						
								person = Person.create(name: 'Honda') 
								article = Article.create(name: 'a1')
								person.articles << article 
								person.articles << article 
								person.articles.inspect # => [#<Article id: 7, name: 'a1'>]
								Reading.all.inspect # => [#<Reading id: 16, person_id: 7, article_id: 7>, #<Reading id: 17, person_id: 7, article_id: 7>]
							```
					* distinct does not make sure of duplicates upon creation but on load 
					* to make sure that upon insertion all of the records in the persisted association are distinct add a `unique` index to the table itself 
						* example: 
							* `add_index :person_articles, :article, unique: true`
					* checking uniqueness using something like `include?` is subject to race conditions 
						* apperently `unique` indexs are not 
			* when are objects saved 
				* when you assign an object to a `has_many` association that object is automatically saved in order to update its foreign key 
					* assigning multiple objects in one statment saves them all
				* if any of these saves fail due to validation errors then assignment statement returns `false` and the assignment itself is cancelled 
				* if the parent object (with the `has_many` association) is unsaved then the child objects are not saved when they are added 
					* all unsaved members of the association will automatically be saved when the parent is saved 
					* to assign an object to a `has_many` association without saving the object use the `collection.build` method
		* `has_and_belongs_to_many` association reference 
			
		* association callbacks 
			* callbacks hook into the life cycle of active record objects 
				* lets you inject functionality into objects at various points 
			* association callbaks are similar to normal callbacks 
				* triggered by events in the life cycle of a collection 
			* there are four available callbacks 
				* `before_add` 
				* `after_add` 
				* `before_remove` 
				* `after_remove` 
			* associations callbacks are defined by adding options to the association declaration 
				* example: 
					```
						class Customer < ActiveRecord::Base 
							has_many :orders, before_add: :check_credit_limit 
					
							def check_credit_limit(order)
								...
							end 
						end 
					```
			* callbacks can be stacked on a single event by passing them as an array 
				* example: 
					```
						class Customer < ActiveRecord::Base 
							has_many :orders, before_add: [:check_credit_limit, :calculate_shipping_charges]
				
							def check_credit_limit(order)
								...
							end 
			
							def calculate_shipping_charges(order)	
								...
							end 
						end 
					```
			* if a `before_add` callback throws an exception the object does not get added to the collection 
			* if a `before_remove` callback throws an exception the object does not get removed from the collection 
		
		* association extensions 
			* not limited by the functionality that rails automatically builds into association proxy objects 
			* these objects can be extended through anonymous modules, adding new finders, creators, or other methods
				* example: 
					```
						class Customer < ActiveRecord::Base 
							has_many :orders do 
								def find_by_order_prefix(order_number)
									find_by(region_id: order_number[0..2])
								end 
							end 
						end 
					```
			* if you have an extension that should be share by many associations you can use a named extension module 
				* example: 
					```
						module FindRecentExtension 
							def find_recent 
								where("created_at > ?", 5.days.ago)
							end 
						end 
				
						class Customer < ActiveRecord::Base 
							has_many :orders, -> { extending FindRecentExtension }
						end 
				
						class Supplier < ActiveRecord::Base 
							has_many :deliveries, -> { extending FindRecentExtension }
						end 
					```
			* extensions can refer to the internals of the association proxy using these three attributes of `proxy_association` accessor 
				* `proxy_association.owner` 
					* returns the object that the association is a part of 
				* `proxy_association.reflection` 
					* returns the reflection object that describes the association 
				* `proxy_association.target` 	
					* returns the associated object for `belongs_to` or `has_one`
					* returns the collection of associate objects for `has_many` or `has_and_belongs_to_many` 
				
# July 24th - clean up and deployment 

#### questions 
	
* what are environment variables?
	* [link 1](http://www.catb.org/esr/writings/taoup/html/ch10s04.html)
		* unix thing 
		* shell variables saved in the shell context accessible by everything running in the shell 

* what does bundle exec do?

	
# July 25th - models, background workers 


so basically im just creating the account model and connecting it to groups and users. should be straight forward. i need to make sure to have the foreign key constraints in place and all that.

I should build the account model first and make sure it is set up properly before moving forward with the connections. 

#### questions 

#### explore 


# July 27th - make the things pop up on the screen 

mm so basically tying groups and images, and making the sharing functionality work as expected 

so reflecting. i really need to read ruby and rails documentation on different objects and helper classes on a regular basis. this involves also becoming very familiar with the different types of syntax, especially the more abstract symbolic ones. this is going to dramatically increase my speed, since i will be able to parse things faster. i have probably reached the limit of my understanding without becoming intimitaly comfortable with functional languages. that is a wall i need to pass. breaking that syntex and design barrier will dramatically change things. another note. its really all about this library shit. like fuck man if i had a decent understanding of all the mixins applied to random objects and how to leverage them my workflow would dramatically speed up. and this is true in general. 

to become better at leveraging libraries the key is in literacy and comprehension. literacy to easily parse and understand what is said and comprehension to bridge the multitude of design patterns. 


#### questions 

* what is a hash of conditions in the active record context?

* what does strong and weak parameters mean?

* what exactly is an enumerable? in ruby?
	* in the context of ruby 
		* a mixin that gives objects a collection of classes with several traversal and seraching methods with the ability to sort 
		* must provide a method `each` 
			* yields successive members of the collection 
		* if #max, #min, #sort is to be used 
			* the object that is called upon must implement a meaningful `<=>` operator 
				* because those methods rely on an ordering between members of the collection 


#### explore 


* [hash ruby](http://ruby-doc.org/core-2.0.0/Hash.html#update-instance_method)
	* a hash is a dictionary-like collection of unique keys and their values 
		* also called associative arrays 
	* public instance methods
		* `update`(other_hash) -> hsh
		* `update`(other_hash) { |key, oldval, newval| block } -> hsh
			* same thing as `merge!`
			* add the contents of other_hash to hsh
			* if no block is specified entries with duplicate keys are overwritten with the values from other hash 
			* other wise the value of each duplicate key is determined by calling the block with the key
				* its value in hsh and its value in other_hash 
			* example: 
				```
					h1 = { "a" => 100, "b" => 200 } 
					h2 = { "b" => 254, "c" => 300 } 
					h1.merge!(h2) 				#=> {"a"=>100, "b"=>254, "c"=>300}
					
					h1 = { "a" => 100, "b" => 200 } 
					h2 = { "b" => 254, "c" => 300 } 
					h1.merge!(h2) { |key, v1, v2| v1 } 	#=> {"a"=> 100, "b"=>200, "c"=>300}
				```
	



* [enumerable ruby](http://ruby-doc.org/core-2.0.0/Enumerable.html#flat_map-instance_method)
	* a mixin that provides collection classes with several traversal and searching methods with the ability to sort 
		* receiving class must have a `each` method 
			* yields successive memebers of the collection 
		* #max, #min, #sort 
			* objects in collection must have a meanigful `<=>` operator 
				* these methods rely on an ordering between members of the collection 
	* public instance methods 
		* `all?`[{|obj| block}] -> true or false 
			* passes each element of the collection to the given block 
			* the method returns true if the block never returns false or nil
			* if block is not given ruby adds an implicit block of { |obj| obj } 
				* will cause `all?` to return true when none of the collection members are false or nil
			```
				%w[ant bear cat].all? { |word| word.length >= 3 }	#=> true
				%w[ant bear cat].all? { |word| word.length >= 4 }	#=> false
				[nil, true, 99].all?  					#=> false
			```
		* `any?` [{ |obj| block }] -> true or false 
			* passes each element of the collection to the given block 
				* returns true if the block ever returns a value other than false or nil 
			* when no block gives an implicit block of { |obj| obj } 
				* returns true if at least one of the collection memeber is not false or nil 	
			```	
				%w[ant bear cat].any? { |word| word.length >= 3 }	#=> true 
				%w[ant bear cat].any? { |word| word.length >= 4 }	#=> true
 				[nil, true, 99].any?					#=> true 
			```
		* `chunk` { |elt| ...} -> an_enumerator 
		* `chunk(initial_state) { |elt, state| ...} -> an_enumerator 
			* enumerates over the items, chunking them together based on the return value of the block 
				* consecutive elements which return the same block value are chunked together 
				* example setup - chunk consecutive even numbers and odd numbers
				```
					[3, 1, 4, 1 , 5, 9, 2, 6, 5, 3, 5].chunk { |n|
						n.even?
					}.each { |even, ary|
						p [even, ary]
					}
				
					#=> [false, [3, 1]], [true, [4]], [false, [1, 5, 9]], [true, [2, 6]], [false, [5, 3, 5]]
				```	
			* method is very useful for sorting series of elements 
				* example setup - counts words for each initial letter
				```
					open("/usr/share/dict/words", "r:iso-8859-1") { |f|
						f.chunk { |line| line.ord }.each { |ch, lines| p [ch.chr, lines.length] }
					}
					#=> ["\n", 1], ["A", 1327], ["B", 1372], ["C", 1507], ["D", 791] ......
				```
			* the following key values have special meaning 
				* `nil` and `:_separator` specifies that the elements should be dropped 
					* can be used to ignore some elements 
				* `:_alone` specifies that the element should be chunked by itself 
					* can be used to force items into their own chunk 
						* example setup - put lines that contain a URL by themselves and chunk the rest of the lines together 
						```
							pattern = /http/
							open(filename) { |f| 
								f.chunk { |line| line =- pattern ? :_alone : true }.each {|key, lines|
									pp lines
								}
							}
						```
				* all other symbols that begin with an `_` wil raise an error 
			* if the block needs to maintain state over multiple elements an `initial_state` argument can be used 	
				* if a non-nil value is given, a reference to it is passed as the 2n argument of the block for the `chunk` method 
					* state-change persist across block calls 
		* `flat_map`{ |obj| block } -> array 
		* `flat_map` -> an_enumerator 
			* returns a new array with the concaatenated results of running block once for every element in enum 
			* if no block is given an enymerator is returned instead 
			* example: 
				```
					[1, 2, 3, 4].flat_map { |e| [e, -e] } 		#=> [1, -1, 2, -2, 3, -3, 4, -4]
					[[1, 2], [3, 4]].flat_map { |e| e + [100] } 	#=> [1, 2, 100, 3, 4, 100]
				```
		
											




* [groupify gem](https://github.com/dwbutler/groupify)
	* member associations on groups 
		* groups can be configured to create associations for each expected memeber type 
			* example setup - group has users and assignments as memebers
			* example: 
				```
					class Group < ActiveRecord::Base 
						groupify :group, members: [:users, :assignments], default_members: :users
					end 
				```
				* the `default_members` option sets the model type when accessing the `memebers` association 
					* `group.members`	
						* returns the users who are members of this group
	* add to named groups 
		```
			user.named_groups << :admin 
			user.in_named_group?(:admin)
		```
	* remove from groups 
		```
			users.groups.destroy(group) 		# destroys this users group memebership for this group 
			group.users.delete(user) 		# deletes this groups group membership for this user 
		```
	* check if two members share any of the same groups 
		```
			user1.shares_any_group?(user2)		# returns true if user1 and user2 are in any of the same groups 
			user2.shares_any_named_group?(user1)	# also works for named groups
		```
	* query for groups & members 
		```
			User.in_group(group) 			# find all users in this group 
			User.in_named_group(:admin)		# find all users in this named group 
			Group.with_member(user)			# find all groups with this user 
			
			User.shares_any_group(user) 		# find all users that share any groups with this user 
			User.shares_any_named_group(user)	# find all users that share any named groups with this user 
		```
	* check if member belongs to any/all groups 
		```
			User.in_any_group(group1, group2) 		# find users that belong to any of these groups 
			User.in_all_groups(group1, group2)		# find users that belong to all of these groups 
			Widget.in_only_groups(group2, group3)		# find widgets that belong to only these groups

			widget.in_any_named_group?(:foo, :bar)		# check if widget belongs to any of these named groups 
			user.in_all_named_groups?(:manager, :poster)	# check if user belongs to all of these named groups 
			user.in_only_named_groups?(:employee, :worker)	# check if user belongs to only these named groups 
		```
	* merge one group into another 
		```
			# moves the members of source into destination and destroys source 
			destination_group.merge!(source_group)
		```
	* membership types 
		* allows for differentiation in roles 
		* allows role based authorization combined with group authorization 
		* example setup - add users and resources to the same "sub-group" or "project" within a larger group
		* example: 
			```
				# add user to group as a specific membership type 
				group.add(user, as: 'manager')
				
				# works with named groups too 
				user.named_groups.add user, as: 'manager' 
				
				# query for the groups that a user belongs to with a certain role 
				* user.groups.as(:manager)
				* user.named_groups.as('manager')
				* Group.with_member(user).as('manager')	
					
				# remove a members membership type from a group 
				group.users.delete(user, as: 'manager')			# deletes this groups 'manager' group membership for this user 
				user.groups.destroy(group, as: 'employee')		# destroy this users 'employee' group membership for this group
				user.groups.destroy(group) 				# destroy any membership type this user had in this group 

				# find all members that have a certain membership type in a group 
				User.in_group(group).as(:manager)
 			
				# find all members of a certain membership type regardless of group 
				User.as(:manager) 	# find users that are managers, we dont care what group 
			
				# check if a member belongs to any/all groups with a certain membership type 
				user.in_all_groups?(group1, group2, as: 'manager') 
				
				# find all members that share the same group with the same membership type 
				Widget.shares_any_group(user).as("Moon Launch Project")
			
				# check if one member belongs to the same group as another member with a certain membership type 
				user.shares_any_group?(widget, as: 'employee')
			```
			* adding a member to a group with a specific membership type will automatically add them to that group without a specific membership type 
				* you can still query `groups` and find the member in that group 
				* if you then remove that specific membership type they will still remain in the group without a specific membership type 
	* using for authorization 
		* with cancan 
			```
				class Ability 
					include CanCan::Ability 
					
					def initialize(user) 
						# implemeners group-base authorization 
						# users can only manage assignment which belong to the same group 
						can [:manage], Assignment, Assignment.shares_any_group(user) do |assignment|
							assignment.shares_any_group?(user)
						end 
					end 
				end 
			```
		* with authority 
			```
				# whatever class represents a logged-in user in your app 
				class User 
					groupify :named_group_member 
					include Authority::UserAbilities 
				end 
				
				class  Widget 
					groupify :named_group_member 
					include Authority::Abilities 
				end 
			
				class WidgetAuthorizer < ApplicationAuthorizer 
					# implements group-based authorization using named groups. 
					# users can only see widgets which belong to the same named group. 
					def readable_by?(user) 
						user.shares_any_named_group?(resource) 
					end 
					
					# implements combined role-based and group-based authorization 
					# widgets can only be updated by users that are employees of the same named group 
					def updateable_by?(user) 
						user.shares_any_named_group?(resource, as: :employee) 
					end 
					
					# widgets can only be deleted by users that are managers of the same named group 
					def deletable_by?(user)
						user.shares_any_named_group?(resource, as: :manager) 
					end 
				end 
				
				##ruby sheell
				user = User.create!		
				user.named_groups.add(:team1, as: :employee) 
				
				widget = Widget.create!
				widget.named_groups << :team1 
					
				widget.readable_by?(user)	# => true 
				user.can_update?(widget)	# => true 
				user.can_delete?(widget)	# => false 
			```
		* with pundit 
			```
				class PostPolicy < Struct.new(:user, :post) 
					#user can only update a published post if they are admin of the same group 
					def update?
						user.shares_any_group?(post, as: :admin) || !post.published?
					end 
				
					class Scope < Struct.new(:user, :scope) 
						def resolve 
							if user.admin?
								#an admin can see all the posts in the groups they are admin for 
								scope.shares_any_group(user).as(:admin) 
							else 
								# normal users can only see published posts in the same group 
								scope.shares_any_group(user).where(published: true) 
							end 
						end 
					end 
				end 
			```			

* [cancancan](https://github.com/CanCanCommunity/cancancan/)
	* an authorization library for RoR which restricts what resources a given user is allowed to access 
	* all permissions are defined in a single location with the `Ability` class 
		* not duplicated across controllers, views, and db queries 
	* mission 
		* continuation of the dead cancan project 
			* keep cancan alive and moving forward 
	* getting started 
		* cancancan expects a `current_user` method to exist in the controller 
			* setup authentication like `Devise` before moving forward 
		* when using [`rails-api`](https://github.com/rails-api/rails-api) you have to manually include the controller methods for cancan
			```
				class ApplicationController < ActionController::API 
					include CanCan::ControllerAdditions 
				end 
			```
	* define abilities 
		* user permissions are defined in an `Ability` class 
			* generator included in the library 
				* `rails g cancan:ability`
		* defining abilities 
			* the `Ability` class is where all user permissions are defined 
			* example: 
				```
					class Ability 
						include CanCan::Ability 
						
						def initialize(user) 
							user ||= User.new # guest user (not logged in)
							if user.admin?
								can :manager, :all
							else 
								can :read, :all
							end 
						end 
					end 
				```
			* the current model is passed into the initialize method 
				* permissions modified based on any user attributes 
				* cancan makes no assumption about how roles are handled by your application 
		
			* the can method
				* used to define permissions and requires two arguments 
					* the action you are setting the permission for 
					* the class of object you are setting it on 
					* example: 
						* `can :update, Article` 
				* you can pass `:manage` to represent any action and `:all` to represent any object 
					* example: 
						```
							can :manage, Article		# user can perform any action on the article 
							can :read, :all			# user can read any object 
							can :manage, :all		# user can perform any action on any object 
						```
				* common actions are 
					* `:read` 
					* `:create` 	
					* `:update` 
					* `:destroy` 
					* they can be anything 
						* [action aliases](https://github.com/CanCanCommunity/cancancan/wiki/Action-Aliases)
						* [custom actions](https://github.com/CanCanCommunity/cancancan/wiki/Custom-Actions)
					* arrays can be passed for either parameter and are match accordingly 
				* important notice about `:manage` 
					* :manage is basically chmod 777	
						* grants the ability to use any action on the object including aliases and custom actions 
					* to only allow crud create a custom action 
				* hash of conditions 			
					* a hash can be passed to further restrict which records this permission applies to 
						* example setup - the user will only have permission to read active projects which they own 
						* example: 
							* `can :read, Project, :active => true, :user_id => user.id` 
					* only use database columns for these conditions so they can be used for [fetching records](https://github.com/CanCanCommunity/cancancan/wiki/Fetching-Records)
					* nested hashes can be used to define conditions on associations 
						* example setup - project can only be read if the category it belongs to is visible 
						* example: 
							* `can :read, Project, :category => { :visible => true }`
							* the above will issue a query that performs an `INNER JOIN` to query conditions on associated records 
								* if you need the associations be queried with a `LEFT OUTER JOIN` then you can pass in a scope 
								* example setup - uses a scope that returns all photos that do not belong to a group
								* example: 
									```
										class Photo
											has_and_belongs_to_many :groups
											scope :unowned, includes(:groups).where(:groups => {:id => nil})
										end 
			
										class Group 
											has_and_belongs_to_many :photos 
										end 
			
										class Ability 	
											def initialize(user) 
												user ||= User.new # guest user (not logged in) 
												can :read, Photo, Photo.unowned do |photo| 
													photo.groups.empty?
												end 
											end 
										end 
									```	
					* an array or range can be passed to match multiple values 
						* the user can only read projects of priority 1 through 3 
							* `can :read, Project, :priority => 1..3` 
					* almost anything you can pass to a hash of conditions in active record will work
						* exception is working with model ids 
							* cannot pass model objects directly, must pass in the appropriate ids 
							* example: 
								* `can :manage, Project, :group => { :id => user.group_ids }` 
						* for complext abilities that to complex for hash of conditions [defining abilities with block](https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities-with-Blocks)
				* combining abilities 
					* it is possible to define multiple abilities for the same resource 
						* example setup - users can read projects which are released or available for preview 
						* example: 
							```
								can :read, Project, :released => true 
								can :read, Project, :preview => true 
							```
				* the `cannot` method takes the same arguments as the `can` and defines which actions the user is unable to perform 
					* normally done after a more generic `can` call 
						* example: 
							```
								can :manage, Project 
								cannot :destroy, Project
							```
	* check abilities & authorization 
		* the current users permissions can be checked using the `can?` and `cannot?` methods in the view and controller 
			* example: 
				``` 
					<% if can? :update, @article %> 
						<%= link_to "Edit", edit_article_path(@article) %> 
					<% end %> 
				```
			* more details on [checking abilities](https://github.com/CanCanCommunity/cancancan/wiki/checking-abilities)
		* the `authorize!` method in the controller will raise an exception if the user is not able to perform the given action 
			* example: 
				```
					def show 
						@article = Article.find(params[:id])
						authorize! :read, @article 
					end 
				```
			* setting this for every action can be tedious therefore the `load_and_authorize_resource` method is provided to automatically authorize all actions in a RESTful style resource controller 
				* uses the `before` action to load the resource into an instance variable and authorize it for every action 
					* example: 
						```
							class ArticlesController < ApplicationController 
								load_and_authorize_resource 
							
								def show 
									# @article is already loaded and authorized 
								end 	
							end 
						```
			* more details about [authorizing controller actions](https://github.com/CanCanCommunity/cancancan/wiki/authorizing-controller-actions)
		* strong parameters 
			* when using `strong_parameters` or rails 4+
				* must sanitize inputs before saving record in actions like `:create` and `:update` 	
			* for `:update` action cancan will load and authorize the resource bu not change it automtically 
				* example: 
					```
						def update 
							if @article.update_attributes(update_params) 	
								# hurray 
							else 
								render :edit 
							end 
						end 
						... 
					
						def update_params 
							params.require(:article).permit(:body) 
						end 
					```
			* for the `:create` action cancan will try to initialize a new instance with sanitized input by seeing if your controller will respond to the following methods 
				* `create_params` 
				* `<model_name>_params` such as `article_params` 	
					* default convention for naming your param method 
				* `resource_params` 
					* a generically named method you could specify in each controller 
			* the `load_and_authorize_resource` can take a `param_method` option to specify a custom method in the controller to run to sanitize input 
				* you can associate the `param_method` option with a symbol corresponding to the name of a method that will get called
					* example: 
						```
							class ArticlesController < ApplicationController 
								load_and_authorize_resource param_methods: :my_sanitizer 
										
								def create 
									if @article.save 
										#hurray 
									else 
										render :new
									end 
								end 
						
								private 
							
								def my_sanitizer 
									params.require(:article).premit(:name) 
								end 
							end 
						```
				* you can also use a string that will be evaluated in the context of the controller using `instance_eval` 
					* needs to contain valid ruby code 
						* comes in handy when using PermittedParams class as suggested in Railscast 371 
							* example: 
								* `load_and_authorize_resource param_methods: 'permitted_params.article'` 
				* it is possible to associate `param_method` with a Proc object which will be called with the controller as the only argument 
					* example: 	
						* `load_and_authorize_resource param_method: Proc.new { |c| c.params.require(:article).permit(:name) }`
	* handle unauthorized access 
		* if the user authorization fails a `CanCan::AccessDenied` exception will be raised 
			* you can catch this and modify its behavior in the `ApplicationController` 
				* example: 
					```
						class ApplicationController < ActionController::Base 
							rescue_from CanCan::AccessDenied do |exception| 
								redirect_to root_url, :alert => exception.message 
							end 
						end 
					```
		* see [exception handling](https://github.com/CanCanCommunity/cancancan/wiki/exception-handling) for more details 
	* lock it down 
		* to ensure that authorization happens on every action in your application add `check authorization` to your application controller 
			example: 
				```
					class ApplicationController < ActionController::Base 
						check_authorization 
					end 
				```
	* [fetching records](https://github.com/CanCanCommunity/cancancan/wiki/Fetching-Records)
		* sometimes you need to restrict which records are returned from the database based on what the `user` is able to access 
			* im pretty sure `user` is just a `group memeber` concept 
			* call the `accessible_by` method on any active record model to make this work 
				* example:
					```
						#current_ability is a method made available by CanCan to your controllers extending ActionController::Base
						@aerticles = Article.accessible_by(current_ability) 
					```
				* done automatically by `load_resource` for the index action 
			* you can change the action by passing it as the second argument 	
				* example setup - only fetches the user permission for update 
				* example: 
					* `@articles = Article.accessible_by(current_ability, :update)`
			* if you want to use the current controllers action call the `to_sym` method on it 
				* example: 
					* `@articles = Article.accessible_by(current_ability, params[:action].to_sym)` 
			* this is an active record scope so other scopes and pagination can be chained onto it 
		* to define complex permission logic and have it translate properly to set up in ability model 
			* example setup - `Ability.rb model` 
			* example: 	
				```
					# in Ability 
					# assuming user.id == 1 
					can :manage, User, :manager_id => user.id 
					cannot :manage, User, :self_managed => true 
					can :manage, User, :id => user.id 
					# translates to "(id = 1) OR (not(self_managed = 't') AND (manager_id = 1))"
					# as if it is read from bottom to top 
					# "user could manage himself, for others he could not manage self_managed users, otherwise he could manage his employees" 
				```
				* you can define sql fragment in addition to block see [defining abilities with block](https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities-with-Blocks)
		* if not using active record you can fetch the conditions hash directly from the current ability 
			* example: 
				* `current_ability.model_adapter(TargetClass, :target_action).conditions`

#### trials and tribulations

* okay so first lets see how this feature is communicating with the database
	* so it is adding images to the group membership table with the appropriate group ids
		* its entering the records twice for some reason 
			* fix that bug later 
	* to show the checked state on the front end i need to grab which groups a particular image id is associated with in the group membership table 
 				
# July 29th - modal stuff 

so the modal is using bootstrap/jquery to call itself i believe. 
its using handle-bar to build the modal template.
this dude did not know what he was doing so theres definetly a handlebar and jquery tutorial out there that he followed. 
lol does the title [using handlebars to generate bootstrap modals in rails](http://blog.isnorcreative.com/2015/01/27/using-handlebars-to-generate-bootstrap-modals-in-rails.html) sound familiar.
kk i got a feel for whats next. 

#### questions 



#### explore 


* [handlebars.js](http://handlebarsjs.com/)
	* provides the power necessary to build semantic templates effectively with no frustration 
		* compatible with mustach templates 
	
	* getting started 
		* handlebars templates look like regular html with embedded handlebar expressions 
		* example: 
			```
				<div class="entry"> 
					<h1>{{title}}</h1> 
					<div class="body">
						{{body}}
					</div> 
				</div> 
			```
		* can deliver template to the browser by including it in a script tage 
		* example: 
			```
				<script id="entry-template" type="text/x-handlebars-template">
					<div class="entry">
						<h1>{{title}}</h1> 
						<div class="body"> 	
							{{body}}
						</div> 
					</div> 
				</script> 
			```
		* compile a template in javascript by using `Handlebars.compile`
		* example: 
			```
				var source = $("#entry-template").html();
				var template = Handlebars.compile(source);
			```
		* get the html result of evaluating a handlebars template by executing the template with a context 
		* example: 
			* context 
			```
				var context = {title: "My New Post", body: "This is my first post!"};
				var html = template(context);
			```
			* html result 
			```
				<div class="entry"> 
					<h1>My New Post</h1> 
					<div class="body">
						This is my first post!
					</div>
				</div>
			```
	* HTML escaping 
		* handlebars html-escapes values returned by an `{{expression}}` 
			* to not escape a value use 'triple-stash' `{{{`
		* example:
			* template 
			```
				<div class="entry"> 
					<h1>{{title}}</h1>
					<div class="body">
						{{{body}}}		
					</div>
				</div>
			```
			* with context 
			```
				{
					title: "All about <p> Tags", 
					body: "<p>This is a post about &lt;p&gt; tags</p>"
				}
			```
			* looks like on the browser
			```	
				<div class="entry"> 
					<h1>All About &lt;p&gt; Tags</h1> 
					<div class="body"> 
						<p>This is a post about &lt;p&gt; tags</p>
					</div> 
				</div> 
			```
		* handlebars will not escape a `Handlebars.SafeString` 
			* you can write a helper that returns a `new Handlebars.SafeString(result)` 
			* create your own html escaping 
			*example: 
				```
					Handlebars.registerHelper('link', function(text, url) {
						text = Handlebars.Utils.escapeExpression(text);
						url = Handlebars.Utils.escapeExpression(url);
						
						var result = '<a href="' + url + '">' + text + '</a>';
						
						return new Handlebars.SafeString(result);
					});
				```
				* this will esacape the passed in parameters but mark the response as safe 
					* handlebars will not try to escape it even if the 'triple-stash' is not used 
	* block expressions 
		* allows you to define helpers that will invoke a section of your template with a different context than the current
		* block helpers are identified by a `#` preceeding the helper name and require a matching closing mustache `/` of the same name 
		* example: 
			* helper that will generate an html list 	
			```
				{{#list people}}{{firstName}} {{lastName}}{{/list}}
			```
			* context 
			```
				{
					people: [
						{firstName: "Yehuda", lastName: "Katz"},
						{firstName: "Carl", lastName: "Lerche"},	
						{firstName: "Alan", lastName: "Johnson"}
						]
				}
			```
			* helper called `list` to generate html list 
			```
				Handlebars.registerHelper('list', function(items, options){
					var out = "<ul>";
						
					for(var i=0, l=items.length; i<l; i++){
						out = out + "<li>" + options.fn(items[i]) + "</li>";
					}
				
					return out + "</ul>";
				});
			```
				* helper receives `people` as its first parameter 	
				* receives an options hash as its second parameter 
					* contains a property `fn` which is invoked with a context just as you would invoke a normal handlebare template 
			* when executed template renders 
			```
				<ul> 
					<li>Yehuda Katz</li>
					<li>Carl Lerche</li> 
					<li>Alan Johnson</li>
				</ul> 
			```
		* block helpers can create conditionals in templates 
		* handlebars does not escape the results of a block helper 
	* handlebars paths 
		*  handlebars supports simple paths like mustache 
			* example: 	
				* `<p>{{name}}</p>`
		* also supports nested paths 
			* makes it possible to look up properties below the current context 
			* example: 
				* template
				```
					<div class="entry"> 
						<h1>{{title}}</h1> 
						<h2>by {{author.name}}</h2> 
						
						<div class="body"> 
							{{body}}
						</div> 	
					</div> 
				```
				* context 
				```
					var context = { 
						title: "My First Blog Post!", 
						author: {
							id: 47, 
							name: "Yehuda Katz" 
						},
						body: "My first post. Wheeeee!" 
					};
				```
				* this allows you to use templates with more raw json objects
		* nested handlebar paths can also include `../` segments which evaluate their paths against a parent context 
			* example: 
				```
					<h1>Comments</h1> 
							
					<div id="comments"> 
						{{#each comments}}
						<h2><a href="/posts/{{../permalink}}#{{id}}">{{title}}</a></h2> 
						<div>{{body}}</div>
						{{/each}}
					</div>
				```
				* even though the link is printed while in the context of a comment 
					* can still go back to the main context (post) and retrieve its permalink 
				* the exact value of `../` resolve bases on the helper that is calling the block 
					* `../` only necessary when the context changes (like each, but not like if)
				```
					{{permalink}}
					{{#each comments}}
						{{../permalink}}
						
						{{#if title}}
							{{../permalink}}
						{{/if}}
					{{/each}}
				```
				* all examples above will reference the same `permalink` value even though they are located within different blocks 
		* handlebars also allows for name conflict resolution between helpers and data fields via `this` reference 
			* example: 
				```
					<p>{{./name}} or {{this/name}} or {{this.name}}</p>
				```
				* all of the above would cause the `name` field of the current context to be used rather than a helper of the same name 
	* template comments with `{{!-- --}}` or `{{! }}`
		* you can use comments in your handlebars code 	
		* example: 
			```
				<div class="entry"> 
					{{!-- only output author name if an author exists --}}
					{{#if author}}
						<h1>{{firstName}} {{lastName}}</h1> 
					{{/if}}
				</div> 
			```
		* the comments do not result in output 
			* use html comments to see them in the browser 
	* helpers 
		* handlebars helpers can be accessed from any context in a template 
		* register a helper with `Handlebars.registerHelper` method 
		* example: 
			* template 
			```
				<div class="post">
					<h1>By {{fullName author}}</h1>
					<div class="body">{{body}}</div>
				
					<h1>Comments</h1> 
				
					{{#each comments}}
					<h2>By {{fullName author}}</h2>
					<div class="body">{{body}}</div> 
					{{/each}}
				</div> 
			```
			* context and helpers 
			```
				var context = {
					author: {{firstName: "Alan", lastName: "Johnson"}, 
					body: "I Love Handlebars", 
					comments: [{
						author: {firstName: "Yehuda", lastName: "Katz"},
 						body: "Me too!"
					}]
				};

				Handlebars.registerHelper("fullName", function(person) {
					return person.firstName + " " + person.lastName;
				});	
			```
			* browser results 
			```
				<div class="post> 
					<h1>By Alan Johnson</h1> 
					<div class="body">I Love Handlebar</div> 
						
					<h1>Comments</h1> 
					
					<h2>By Yehuda Katz</h2> 
					<div class="body">Me Too!</div> 
				</div> 
			```
		* helpers receive the current context as the `this` context of the function 
		* example: 
			* template
			```
				<ul> 
					{{#each items}}
					<li>{{agree_button}}</li>
					{{/each}}
				</ul>
			```
			* context and helpers 
			```
				var context = {
					items: [
						{name: "Handlebars", emotion: "love"}, 
						{name: "Mustache", emotion: "enjoy"}, 
						{name: "Ember", emotion: "want to learn"} 
					]
				}; 
				
				Handlebars.registerHelper('agree_button', function(){ 
					var emotion = Handlebars.escapeExpression(this.emotion), 
						name = Handlebars.escapeExpression(this.name);
					
					return new Handlebars.SafeString(
						"<button>I agree. I " + emotion + " " + name + "</button"
					);
				});
			```
			* browser results 
			```
				<ul> 	
					<li><button>I agree. I love Handlebars</button></li> 
					<li><button>I agree. I enjoy Mustache</button></li> 
					<li><button>I agree. I want to learn Ember</button></li> 
				</ul> 
			```
			* if your helper returns html that you do not want escaped make sure to return a `Handlebars.SafeString` 
	* literals 
		* helper calls may also have literal values passed to them either as parameter arguments or hash arguments 
			* support includes
				* numbers
				* strings 
				* true 
				* false
				* null 
				* undefined 
			* example 
				```	
					{{agree_button "My Text" class="my-class" visible=true counter=4}}
				```
	* partials 
		* handlebars partials allow for code to be reused by creating shared templates 
		* example: 
			* template 	
			```
				<div class="post"> 
					{{> userMessage tagName="h1" }}
				
					<h1>Comments</h1> 	
				
					{{#each comments}}
						{{> userMessage tagName="h2"}}
					{{/each}}
				</div> 
			```
			* partial and context 
			```
				Handlebars.registerPartial('userMessage', 
					'<{{tagName}}>By {{author.firstName}} {{author.lastName}}</{{tagName}}>'
					+ '<div class="body">{{body}}</div>');
	
				var context = {
					author: {firstName: "Alan", lastName: "Johnson"}, 
					body: "I Love Handlebars", 
					comments: [{
						author: {firstName: "Yehuda", lastName: "Katz"},
						body: "Me too!"
					}]
				};
			```
			* browser results 
			```
				<div class="post"> 
					<h1>By Alan Johnson</h1> 
					<div class="body">I Love Handlebars</div> 
					
					<h1>Comments</h1> 
					
					<h2>By Yehuda Katz</h2> 
					<div class="body">Me Too!</div> 
				</div> 
			```
	* [built in helpers](http://handlebarsjs.com/builtin_helpers.html)
	* [api reference](http://handlebarsjs.com/reference.html)

* [nested_forms](https://github.com/ryanb/nested_form)
	* a rails gem for conveniently managing multiple nestd models in a single form
	* unobtrusive through jquery 
	* setup 
		* add gem 'nested_form' 
		* add require in asset pipeline 
	* usage 
		* you must add `accepts_nested_attributes_for :dependent_model` to parent model 
			* creates a `:dependent_model_attributes=` method 
			* may need to add it to the `attr_accessible` array 
				* `attr_accessible :dependent_model_attributes`
		* in the view use the `nested_form_for` helper method to enable the nesting 
		* now able to use `link_to_add` and `link_to_remove` helper methods on the form builder in combination with fields_for to dynamically add/remove nested records 
	* strong parameters 
		* pass the `:dependent_model_attributes` arribute accessor to the params 
			* example: 
			```
				params.require(:project).permit(:name, dependent_model_attributes: [:id, :name, :_destroy])
			```
		* passing the `:id` ensures that you do not end up with a whole lot of tasks 
		* passing `:_destroy` ensures that we can delete the depenedent model built upon validation

* [accepts nested attributes](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html#method-i-accepts_nested_attributes_for)
	* allow you to save attributes on associated records through the parent 
	* by default nested attribute updating is turned off 
		* enable it by using the `#accepts_nested_attributes_for` class method 
			* this defines an attribute writer on the model 
	* the attribute writer is named after the association 
		* adds a methods to your model 
			* `association_attibutes=(attributes)`
		* `:autosave` option is automatically turned on for every association that `#accepts_nested_attributes_for` 
	* one-to-one 
		* example setup - a member model that has one Avatar 
		* example: 
			```
				class Member < ActiveRecord::Base 
					has_one :avatar 
					accepts_nested_attributes_for :avatar
				end 
			```
		* enabling nested attributes on a one-to-one association allows you to create the member and avatar in one go 
		* example: 	
			```	
				params = { member: { name: 'Jack', avatar_attributes: { icon: 'smiling' } } }
				member = Member.create(params[:member])
				member.avatar.id    # => 2
				member.avatar.icon  # => 'smiling'
			```
		* allows you to update the avatar through the member 
		* example: 
			```
				params = { member: { avatar_attributes: { id: '2', icon: 'sad' } } } 
				member.update params[:member]
				member.avatar.icon # => 'sad'
			```
		* by default you will only be able to set and update attributes on the associated model 
			* to destroy the associated model through the attributes hash you have to enable it first using the `:allow_destroy` option 
			example: 
				* model 
				``` 
					class Member < ActiveRecord::Base 
						has_one :avatar 
						accepts_nested_attributes_for :avatar, allow_destroy: true
				```
				* controller
				```
					member.avatar_attributes = { id: '2', _destroy: '1' } 
					member.avatar.marked_for_destruction? 	# => true 
					member.save 
					member.reload.avatar	# => nil 
				```
					* when you add the `_destroy` key to the attributes hash with a value that evaluates to true the associated model will be destroyed 
						* the associated model will not be destroyed until the parent is saved 
						* the associated model will not be destroyed unless you specify its id in the updated hash 
		* one-to-many 
			* example setup - consider a member that has a number of posts 
			* example: 
				* model 
				```
					class Member < ActiveRecord::Base 
						has_many :posts
						accepts_nested_attributes_for :posts 
					end 
				```
					* alloes the model to set or update its associated posts through an attribute hash 
						* must include the key `:posts_attributes` with an array of hashes of post attributes as a value 
				* controller 
				```
					params = { member: {
						name: 'joe', posts_attributes: [
							{ title: 'Kari, the awesome Ruby documentation browser!' }, 
							{ title: 'The egalitarian assumption of the modern citizen' }, 
							{ title: '', _destroy: '1' } # this will be ignored 
						]
					}}
				```
					* for each hash that does not have an `:id` key a new record will be instantiated, unless the hash also contains a `_destroy` key that evaluares to true 
				* you can set a `:reject_if` proc to silently ignore any new record hashes if they fail to pass the criteria 
				```
					class Member < ActiveRecord::Base 
						has_many :posts
						accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['title'].blank? }
					end 
					
					params = { member: {
						name: 'joe', posts_attributes: [
							{ title: 'Kari, the awesome Ruby documentation browser!' }, 
							{ title: 'The egalitarian assumption of the modern citizen' }, 
							{ title: '' } # this will be ignored because of the `:reject_if` proc 
						]
					}}
				
					member = Member.create(params[:member])
					member.posts.length # => 2 
					member.posts.first.title # => 'Kari, the awesome Ruby documentation browser!'
					member.posts.second.title # => 'the egalitarian assumption of the modern citizen 
				```
				* alternatively `:reject_if` also accepts a symbol for using methods
				```
					class Member < ActiveRecord::Base 
						has_many :posts
						accepts_nested_attributes_for :posts, reject_if: :new_record?
					end 
			
					class Member < ActiveRecord::Base 
						has_many :posts
						accepts_nested_attributes_for :posts, reject_if: :reject_posts
						
						def reject_posts(attributes) 
							attributes['title'].blank?
						end
					end
				```
			

#### trials and tribulations 

* okay so i should probably start by making the old media items work with the modal first. they have better data, which will make investigating the templating much simpler.
	* looks like its a permissions issue 


























 
