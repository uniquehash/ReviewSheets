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
			
			

















