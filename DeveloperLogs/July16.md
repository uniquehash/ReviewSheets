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
			* `! " # $ % & ' ( ) * + , . / : ; < = > ? @ [ \ ] ^ `` ` { | } ~`


















