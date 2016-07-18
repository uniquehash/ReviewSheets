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


 
