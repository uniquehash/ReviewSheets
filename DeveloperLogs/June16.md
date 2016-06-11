# June 2 - woooo new month - rails active record

we are now in june summer has broken through the clouds and blessed us with eternal warmth  

today we learn of the secrets of the ancient active record of the rails persuasian 

#### following [Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)

* what is active record
	* active record puts the model in model - view - controller 
		* the layer of the system responsible for representing business data and logic 
	* implementation of the Active Record pattern
		* an interpretation of the Object Relational Mapping system spec 
	* the active record pattern 
		* objects carry both persistent data and behavior which operates on that data 
		* ensuring data access logic as part of the object will educate users of that object on how to write to and read from the database 
	* object relational mapping 
		* usually called ORM 
		* a technique that connects the rich objects of an application to tables in a relational database management system 
			* allows for the properties and relationships of objects in an application to be easily stored and retrieved from a database without writing SQL statements directly and with less overall databse access code 
	* active record as an ORM framework 
		* key mechanisms 
			* represent models and their data 
			* represent associations between these models 
			* represent inheritance hierarchies through related models 
			* validate models before they get persisted to the database 
			* perform database operations in an object-oriented fashion
	
* convention over configuration in active record 
	* follow rails conventions and you will need to do little to no configuration when creating active record models 
	* naming conventions 
		* active record uses some naming conventions to understand how the mapping between models and database tables should be created 
		* rails pluralizes your class names to find the appropriate database table 
			* for class `Book`
				* active record creates a database table called `books`
			* when using class names composed of two or more words 
				* the class name should follow the ruby conventions of CamelCase form 
					* the table name must contain words separated by underscores 
				* for class `BookClub`
					* active record creates a database table called `book_clubs`
			* pluralizes both regullar and irregular words 
	* schema conventions 
		* active record uses naming conventions for the columns in database tables depending on purpose of column 
			* foreign keys 
				* these fields are named following the pattern `singularized_table_name_id`
					* example: 	
						* `item_id` 
						* `order_id`
					* these are the fields that active record will look for when you create associations between your models 
			* primary keys 
				* by default active record uses an integer column named `id` as the tables primary key 
					* when using active record migrations to create your tables this column will be automatically created 	
			* optional column names 
				* `created_at`
					* automatically gets set to the current date and time when the record is first created
				* `updated_at`
					* automatically gets set to the current date and time whenever the record is updated 
				* `lock_version`
					* adds [optimistic locking](http://api.rubyonrails.org/classes/ActiveRecord/Locking.html) to a model 
				* `type`
					* specifies that the model uses [single table inheritance](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance)
				* `(association_name)_type`
					* stores the type for [polymorphic associations](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)
				* `(table_name)_count`
					* used to cache the number of belonging objects on associations 
						* example: 
							* a `comments_count` column in a `Articles` class that has many instances of `Comment` will cache the number of existent comments for each article 
				* these keywords are all reserved by the system 
	
* creating active record models 
	* active record models are created by subclassing the `ActiveRecord::Base` class 
	```
		class Product < ActiveRecord::Base
		end
	```
		* creates a `Product` model mapped to a `products` table at the database 
		* you can also map the columns of each row in that table with the attributes of the instances of your model 
		* if the `products` table was created using SQL
		```
			CREATE TABLE products (
				id int(11) NOT NULL auto_increment, 
				name varchar (255), 
				PRIMARY KEY   (id)
			);		
		```
			* you would be able to interact with the table in ruby 
			```
				p = Product.new
				p.name = "Some Book" 
				puts p.name # "Some Book"
			```
				* the code above would print `Some Book`

* overriding the naming conventions 
	* the default convetions are easily overridable 
		* in the declaration 
		```
			class Product < ActiveRecord::Base
				self.table_name = "my_products"
			end 
		```
			* you will have to manually define the class name that is hosting the fixtures (my_products.yml)
				* use the `set_fixture_class` method 
				```
					class ProductTest < ActiveSupport::TestCase
						set_fixture_class my_products: Product
						fixtures :my_products 
						...
					end
				```
		* you can also override the column that should be used as the tables primary key 
		```
			class Product < ActiveRecord::Base
				self.primary_key = "product_id"
			end
		```
		
* CRUD: readign and writing data 
	* crud is an acronym for the four verbs we use to operate on data 
		* create
		* read 
		* update 
		* destroy
	* active record automatically creates methods to allow an application to read and manipulate data stored within its tables. 
	* create 
		* active record objects can be created from 
			* a hash 
			* a block 
			* have their attributes manually set after creation 
		* given model `User` with attributes `name` and `occupation`
			* the `create` method 
				* return the object and save it to the database 
				``` 
					user = User.create(name: "David", occupation: "Code Artist")
				```
					* the object will be created and saved into the db
			* the `new` method 
				* returns a new object 
				```
					user = User.new 
					user.name = "David" 
					user.occupation = "Code Artist"
				```
					* the object is instantiated but not save to the db 
					* the `save` method 
						* commits a record to the db

			* if a block is provided both `create` and `new` will yield the new object to that block for initialization 
			```
				user = User.new do |u|
					u.name = "David"
					u.occupation = "Code Artist" 
				end 
			```
	* read 
		* there is a rich api for accessing data within a  database 
			* the `all` method 
			```
				users = User.all
			```
				* return a collection with al users 	
		 	* the `first` method
			```
				user = User.first
			```
				* return the first user 
			* the `find_by` method
			```
				david = User.find_by(name: 'David')
			```
				* return the first user named David 
			* the `where` and `order` method 
			```
				users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)
			```
			* more about reading with [active record](http://guides.rubyonrails.org/active_record_querying.html)
	
	* update 
		* once an active record object has been retrieved its attributes can be modified and it can be saved to the database
		```
			user = User.find_by(name: 'David')
			user.name = 'Dave'
			user.save
		```
		* you can use a hash map to be simpler
		```
			user = User.find_by(name: 'David')
			user.update(name: 'Dave')
		```
		* you can update a bunch at once with `update_all`
		```
			User.update_all "max_login_attempts = 3, must_change_password = 'true'"
		```
			* will apply to all users 
	
	* delete
		* once retrived an active record object can be destroyed removing it from the database 
		```
			user = User.find_by(name: 'David')
			user.destroy
		```

* valudations			 	
	* active record allows you to validate the state of a model before it gets written into the db 	
		* validation is a very important issue to consider when persisting to the database 
			* `save` and `update` take that into account when running 
				* they return `false` when validation fails without performing an operation on the database 
				* they have a bang counterpart 
					* stricter will raise an actual exception `ActiveRecord::RecordInvalid`
		* several methods can be used to check models and validate that an attribute value
			* [validations are outlined here](http://guides.rubyonrails.org/active_record_validations.html)

* callbacks
	* active record callbacks allow you to attach code to certain events in the life-cycle of your models 
		* enables you to add behaviors to your models by transparently executing code when those events occur 
			* create new record 
			* update it 
			* destroy it 
	* [more on callbacks](http://guides.rubyonrails.org/active_record_callbacks.html) 

* migrations 
	* rails provide a domain-specific language for managing a database schema called migrations 
		* migrations are stored in files which are executed against any database that active record supports using `rake` 
		* example: 
		```
			class CreatePublications < ActiveRecord::Migration 
				def change 
					create_table :publications do |t|
						t.string :title
						t.text :description
						t.references :publication_type
						t.integer :publisher_id
						t.string :publisher_type
						t.boolean :single_issue 
				
						t.timestamps null:false
					end
					add_index :publications, :publication_type_id
				end 
			end
		```
	* rails keeps track of which files have been committed to the db and provides rollback features
	* to actually create the table you run `db:migrate` 
	* to roll it back you run `db:rollback`
	* more about [active record migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)

#### following [active record validation](http://guides.rubyonrails.org/active_record_validations.html)

* validation overview 
	* why use validations 	
		* used to ensure that only valid data is saved into your database 
		* model-level validations are the best way to ensure that only valid data is saved into your databases 
		* they are database agnostic, cannot be bypassed by end users, are convenient to test and maintain 
		* there are other ways to validate data before it is saved into your database 
			* native database constraints 
				* make the validation mechanisms database-dependent and can make testing and maintenance more difficult 
					* if database is used by other applications could be useful 
				* database-level validations can safely handle some things that can be difficult to implement otherwise 
			* client-side validations 
				* unreliable if used alone 
				* implemented using JavaScript 
				* can be used to provide immediate feedback as they use your site
			* controller-level validations 	
				* often become unwieldy and difficult to test and maintain 
				* keep the controllers skinny makes life easy

# June 5th - Exploring computer vision 

I cant keep myself focused on front end stuff right now. So better to cut my loses and dive into computer vision. Because that makes sense. 

* [Computer Vision](https://en.wikipedia.org/wiki/Computer_vision)
	* what the fuck is it?
		* a field that includes methods for acquiring, processing, analyzing, and understanding images and in general high-dimensional data from the real world in order to produce numerical or symbolic information
			* basically turning images or otehr multi-dimensional data into something that normal computers can understand on and act on
	* a strong theme in this field has been to duplicate the abilities of human vision by electronically perceiving and understanding an image
		* this is probably the pop-culture thinking of computer vision 
	* sub-domains of computer vision (read: rabbit-hole)
		* scene reconstruction 
		* event detection 
		* video tracking 
		* object recognition 
		* object pose estimation 
		* learning 
		* indexing 
		* motion estimation 
		* image restoration 
	* computer vision is really part of a quad of fields that have to be thought of in each others context. they are also a host of other fields 
		* image analysis 
			* the extraction of meaningful information from images, mainly from digital images by means of digital image processing techniques 
			* tends to focus on 2d images 
				* pixel-wise operations 
					* contrast enhancement
				* local operations
					* edge extraction 
					* noise removal 
				* geometrical transformation 
					* rotating images 
			* require no assumptions about the image content 
			* produces no interpretations about the image content 			
		* machine vision 
			* the technology and methods used to provide imaging-based automatic inspection and analysis for such applications as automatic inspection, process control, and robot guidance in industry
			
		* image processing
			* the processing of images using mathematical operations by using any form of signal processing for which the input is an image, a series of images, or a video, such as a photograph or video frame  	
			* tend to focus on 2d images 
			* require no assumptions about the image content 
			* produces no interpretations about the image content 
		* computer vision 
			* extracting numerical or symbolic information from high-dimensional data, usually images 
			* includes 3d analysis from 2d images 
				* analyses 3d scen projected onto one or several images 
					* how to reconstruct structure or other informatino about the scene 
			* relies on complex assumptions about the scene depicted in an image 
		* pattern recognition 
			* a branch of machine learning that focuses on the recognition of patterns and regularities in data although it is in some cases considered to be nearly synonymous with machine learning 
			* a field which uses various methods to extract information from signals in general, mainly based on statistical approaches and artificial neural networks 
	* typical tasks of computer vision 
		* recognition 
			* types of recognition
				* object recognition 
					* one or several pre-specified or learned obkects or object classes can be recognized usually together with their 2d positions in the image or 3d poses in the scene 
						* example apps
							* [blippar](https://en.wikipedia.org/wiki/Blippar)
							* [google goggles](https://en.wikipedia.org/wiki/Google_Goggles)
				* identification
					* an individual instance of an object is recognized  
				* detection 
					* the image data is scanned for a specific condition 
			* algorithms 
				* [convolutional neural networks](https://en.wikipedia.org/wiki/Convolutional_neural_network) 
					* a type of [feed-forward artificial neural network](https://en.wikipedia.org/wiki/Feedforward_neural_network) 
						* an [artificial neural network](https://en.wikipedia.org/wiki/Artificial_neural_network)
							* a family of models inspired by biological neural networks which are used to approximate functions that can depend on a large number of inputs and are generally unknown							
						* connections between units do not form a cycle 
					* the ImageNet Large Scale Visual Recognition Challenge 
						* a benchmark in object classification and detection with millions of images and hundreds of object classes 
						* the best algorithms struggle with 
							* objects that small or thin
							* images that have been distorted with filters
			* specialized tasks based on recognition 
				* [content-based image retrieval](https://en.wikipedia.org/wiki/Content-based_image_retrieval)
					* finding all images in a larger set of images which have a specific content
						* the content can be specified in different ways
							* similarity relative a target image 
							* high-level search criteria give as text input 
				* [pose estimation](https://en.wikipedia.org/wiki/Pose_(computer_vision))
					* estimating the position or orientation of a specific object relative to the camera 
				* [optical character recognition](https://en.wikipedia.org/wiki/Optical_character_recognition)
					* identifying characters in images of printed or handwritten text usually with a view to encoding the text in a format more amenable to editing or indexing 
				* 2D code reading 
					* reading of 2D codes such as data matrix and qr codes 
				* [facial recognition](https://en.wikipedia.org/wiki/Facial_recognition_system)
					* a computer application capable of identifying or verifying a person from a digital image or a video fram from a video source 
				* shape recognition technology (srt) 
					* in people counter systems differentiating human beings from objects 
		* motion analysis 
			* [egomotion](https://en.wikipedia.org/wiki/Visual_odometry#Egomotion)
				* determining the 3D rigid motion (rotation and translation) of the camera from an image sequence produced by the camera 
			* [tracking](https://en.wikipedia.org/wiki/Video_tracking)
				* following the movements of a usually smaller set of interest points or objects in the image sequence 
			* [optical flow](https://en.wikipedia.org/wiki/Optical_flow)
				* to determine for each point in the image how that point is moving relative to the image plane
					* the motion is a result both of how the corresponding 3D point is moving in the scene and how the camera is moving relative to the scene 
		* scene reconstruction 
			* given one or more images of a scene or a video scene reconstruction aims at computing a 3D model of the scene 
		* image restoration 
			* aims to remove noise (sensor noise, motion blure, ect..) from imgaes 
			* simplest approach 
				* low-pass filters
				* median filters 
			* [inpainting](https://en.wikipedia.org/wiki/Inpainting)
				* the process of reconstructing lost or deteriorated parts of images and videos 
	
	* computer vision system methods 
		* computer vision system is highly application dependent 
		* typical functions 
			* image acquisition
				* a digital image is produced by one or several image sensors
			* per-processing 
				* must process the data before computer vision methods can be applied in order to assure that it satisfies certain assumptions implied by the method 	
					* re-sampling in order to assure that the image coordinate system is correct 
					* noise reduction in order to assure that sensor noise does not introduce false information 
					* contrast enhancement to assure that relevant information can be detected 
					* scale space representation to enhance image structures at locally appropriate scales 
			* [feature extraction](https://en.wikipedia.org/wiki/Feature_detection_(computer_vision))
				* image features at various levels of complexity are extracted from the image data 
					* typical examples 
						* lines, edges, and ridges 	
						* localized interest points such as corners, blobs or points 
			* detection/segmentation 
				* at some point in the processing a decision is made about which image points or regions of the image are relevant for further processing 
					* selection of a specific set of interest points 
					* segmentation of one or multiple image regions which contain a specific object of interest 
					* segmentation of images into nested scene architecture comprised of foreground, object group, single objects, or salient object parts 
			* high-level processing 
				* the input is typically a small set of data like a set of points or an image region which is assumed to contain a specific object 	
					* further processing 
						* verification that the data satisfy model-based and application specific assumptions 
						* estimation or application specific parameters, such as object pose or object size 
						* image recognition 
							* classifying a detected object into different categories 
						* image registration 
							* comparing and combining two different views of the same object 
			* decision making 
				* making the final decision required for the application 
					* example 
						* pass/fail on automatic inspection applications 
						* match / no-match in recognition applications 
						* flag for further human review in medical, military, security and recognition applications 
	* [list of computer vision topics](https://en.wikipedia.org/wiki/List_of_computer_vision_topics)
		* list of helpful topics 

* [optical character recognition](https://en.wikipedia.org/wiki/Optical_character_recognition)
	* the mechanical or electronic conversion of images of typed, handwritten or printed text into machine-encoded text, whether from a scanned document, a photo of a document, a scene-photo (billboards in a landscape) or from subtitle text superimposed on an image
	* at the intersection of 
		* pattern recognition
		* artificial intelligence 
		* computer vision 
	* ocr can be used for 
		* data entry 
		* automatic number plate recognition 
		* automatic insurance documents key information extraction 	
		* extracting business card information into a contact list 
		* more quickly make textual version of printed documents 
		* make electronic images of printed documents searchable 
		* converting handwriting in real time to control a computer 
		* defeating captcha anti-bot systems 
		* assistive technology for blind and visually impaired users 
	* types of ocr
		* optical character recognition 
			* targets typewritten text, one glyph or character at a time 
		* optical word recognition 
			* targets typewritten text, one word at a time
		* [intelligent character recognition](https://en.wikipedia.org/wiki/Intelligent_character_recognition)
			* also targets handwritten printscript or cursive text one glyph or character at a time, usually involving machine learning 
		* [intelligent word recognition](https://en.wikipedia.org/wiki/Intelligent_word_recognition)
			* also targets handwritten printscript or cursive text, one word at a time
			* especially useful for languages where glyphs are not separated in cursive script 
	* techniques 
		* pre-processing 
			* de-skew
				* if the document was not aligned properly when scanned it may need to be tilted a few degrees clockwise or counterclockwise in order to make lines of text perfectly horizontal or vertical 
				* [skew](https://en.wikipedia.org/wiki/Skew_(fax))
					* the angular deviation of the received frame from the rectangularity cause by asynchronism between the scanner and the recorder 	
			* [despeckle](https://en.wikipedia.org/wiki/Noise_reduction)
				* remove positive and negative spots, smoothing edges	
			* binarisation 	
				* convert an image from color or greyscale to black-and-white
					* this is called a [binary image](https://en.wikipedia.org/wiki/Binary_image)
						* a digital image with only two colors 
				* this is performed as a simple way of seperating the text from the background 
				* this is super important yo 
			* line removal 
				* cleans up non-glyph boxes and lines 
			* layout analysis (zoning)
				* identifies columns, paragraphs, captions, ect. as distinct blocks 
			* line and word detection 
				* establishes baseline for word and character shapes, separates words if necessary 
			* script recognition 
				* in multilingual documents, the script may change at the level of the words and hence, identification of the script is necessary, before the right OCR can be invoked to handle the specific script 
			* character isolation (segmentation) 
				* for per-character OCR, multiple characters that are connected due to image artifacts must be separated; single characters that are broken into multiple pieces due to artifacts must be connected 
			* normalise aspect ratio and scale 
		* character recognition 
			* there are two basic types of core OCR algorithm 
				* matrix matching 
					* involves comparing an image to a stored glyph on a pixel-by-pixel basis
					* also known as pattern matching 
					* also known as [image correlation](https://en.wikipedia.org/wiki/Digital_image_correlation)
					* relies on the input glyph being correctly isolated from the rest of the image, and on the stored glyph being in a similar font and at the same scale 
					* works best with typewritten text and does not work well when new fonts are encountered 
					* the technique implemented in early pphysical photocell-based OCR
				* feature extraction 
					* decomposes glyphs into features 
						* lines 
						* closed loops
						* line direction 
						* line intersections 
					* compared with an abstract vector like representation of a character 
						* might reduce to one or more glyph prototypes 
		* post-processing 
			* OCR accuracy can be increased if the ouput is constrained by a lexicon 
			* output stream may be a plain text stream or file of characters 
				* modern OCR systems can preserve the layout of the page and produce 
			* near-neighbor analysis 
				* can make use of co-occurence frequencies to correct errors by noting that certain words are often seen together 
			* levenshetin distance algorithm 
				* has been used in OCR post-processing to further optimize results from an OCR api
				
* [openCV](https://en.wikipedia.org/wiki/OpenCV)
	* a library of programming functions mainly aimed at real-time computer vision
	* openCV application areas include 
		* 2D and 3D feature toolkits 
		* egomotion estimation 
		* facial recognition system 
		* gesture recognition 
		* human-computer interaction 
		* mobile robotics 
		* motion understanding 
		* object identification 
		* segmentation and recognition 
		* stereopsis 
			* depth perception from 2 cameras 
		* structure from motion 
		* motion tracking 
		* augmneted reality 
	* openCV includes statistical machine learning libraries 
		* [boosting](https://en.wikipedia.org/wiki/Boosting_(machine_learning)) 
			* a machine learning ensemble meta-algorithm for primarily reducing bias and variance in supervised learning, and a family of machine learning algorithms which convert weak learners to strong ones 	
		* [decision tree learning](https://en.wikipedia.org/wiki/Decision_tree_learning)
			* uses a decision tree as a predictive model which maps observations about an item to conclusions about the items target value 
		* [gradient boosting trees](https://en.wikipedia.org/wiki/Gradient_boosting)
			* a machine learning technique for regression and classificartions problems, which produces a prediction model in the form of an ensemble of weak prediction models, typically decision trees
		* [expectation-maximization algorithm](https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm)
			* an expectation-maximization algorithm is an iterative method for finding maximum likelihood or maximum a posteriori estimates of parameters in statistical models, where the model depends on unobserved expectation of the log-likelihood evaluated using the current estimate for the parameters, and maximization step, which computes parameters maximizing the expected log-likelihood found on the Estep
			* i have no idea what the fuck that means 
		* [k-nearest neighbor algorithm](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)
			* in pattern recognition the k-nearest neighbors algorithm is a non-parametric method used for classification and regression 
		* [naive bayes classifier](https://en.wikipedia.org/wiki/Naive_Bayes_classifier)
			* a family of simple probabilistic classifiers based on applying bayes theorem with strong independence assumptions between the features 
		* [artificial neural networks](https://en.wikipedia.org/wiki/Artificial_neural_network)
			* a family of models inspired by animal central nervous system which are used to approximate functions that can depend on a large number of inputs and are generally unknown 
		* [random forest](https://en.wikipedia.org/wiki/Random_forest)
			* the notion of the general technique of random decision forests that are an ensemble learning method for classification, regression and other tasks, that operate by constructing a multitude of decision trees at training time and outputting the cass that is the mode of the classes or mean prediction of the individual trees 
		* [support vector machine](https://en.wikipedia.org/wiki/Support_vector_machine)
			* supervised learning models with associate learning algorithms that analyze data used for classificationa and regression analysis 

# June 10 - Rails resources 

#### resources in rails 
	* this is all out of date
		* [stackoverflow](http://stackoverflow.com/questions/4686945/what-is-a-resource-in-rails)
			* a resource is a database table which is represented by a model, and acted on through a controller 
				* the connection between the model and database is handled by action record 
				* there is a particular connection which maps uri access and CRUD operations handled by the controller to particular model operations and methods that in turn take action on the database 
					* this mapping is made by `map.resources :arbitary_resource_name`				
		* [routes driven development](http://www.stephenchu.com/2007/11/seeing-rails-resources-clearly.html)
			* a resource is not synonymous to a database table 
				* basically a resource is a route that mapps http verbs and controller actions 

	* `ActionDispatch::Routing::Mapper::Resources`
		* this is the internal rails framework that handles the routing mapping 
		* resource routing allows you to declare all common routes with a single decleration 
			* `resources :photos`
		* resource routes that always have an ID associated with them, that are only ever retrieved one at a time use singular resources 	
			* `resource :profile`
		* resource can be nested 
			```
				resources :magazines do 
					resources :ads
				end
			```
		* resources can be grouped under namespaces
			* if so the appropriate controllers should be placed in the same parent directory 
			```
				namespace "admin" do 
					resources :posts, :comments
				end 
			```
		* be default the `:id` parameter does not accept dots 
			* this can be hacked 
			* `resources :articles, id: /[^\/]+/`
				* allows any character besides slashes to be part of your id 
		* in depth dive into the pieces 
			* constants 
				* this is a ruby concept 
					* a constant is like a variable, except that its value is supposed to remain constant for the duration of the program 
						* constants defined within a class or module may be accessed anywhere within the class or module 
						* outside class they can be accessed with the scope operator `::` prefixed by an expression that returns the appropriate class or module 
						* cannot be defined in methods 
			* modules/mixins
				* this is a ruby concept 
					* ruby modules are similar to classes in that they hold a collection of methods, constants, and other module and class definitions 
						* defined with the `module` keyword instead of `class`
					* ruby modules cannot create objects or be subclassed 
					* they specify that you want the functionality of a particular module to be added to the functionality of a class or of a specific object
					* module stand alone 
						* no module hierarchy of inheritance 
						* good place to collect constants 
				* they serve two purposes 
					* they can act as `namespace` 
						* define methods whose names will not clash with those defined elsewhere 
					* allow you to share functionality between classes 
						* if a class mixes in a module that module instance methods become available as if they had been defined in the class 
						* they get mixed in 
			* collections 
				* this is a ruby concept 
					* allow for organizing large amounts of data 
					* basically just a group of objects 
			* [ActionDispatch::Routing::Mapper::Resources](http://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html#CANONICAL_ACTIONS)
				* Constants 
					* `VALID_ON_OPTIONS`
						* i think these dictates what a action is allowed to work on what type of resource 
							* CANONICAL_ACTIONS do not need prefixes or paths appendend  
						* values 
							* `[:new, :collection, :member]`
					* `RESOURCE_OPTIONS`
						* these are options that resources can have 
						* values 
							* `[:as, :controller, :path, :only, :except, :param, :concerns]`
								* `:path_names`
									* allows you to change the segment component of the `edit` and `new` actions 
										* `resources :posts, path_names: {new: "brand_new"}`
											* the above example will now change the default path of the resource segments from `posts/new` to `/posts/brand_new`
								* `:path`
									* allows you to change the path prefix for the resource 
										* `resources :posts, :path: 'posting'`
											* changes the default path of the resource from  `/posts` to `/postings`
								* `:only`
									* only generates routes for the given actions 
										```
											resources :cows, only: show
											resources :cows, only: [:show, :index]	
										```
											* will only generate the show and index route as oppose to the default of all them 
								* `:except`
									* generates all routes except for the given actions 
										```
											resources :cows, except: :show
											resources :cows, except: [:show, :index]
										```
											* will generate all routes except show and index
								* `:shallow`
									* generates shallow routes for nested resources 
										* when placed on a parent resource generates shallow routes for all nested resources
 										```
											resources : posts, shallow: true do 
												resources :comments 
											end
										```
											* this allows for URLs for resources that otherwise would be deeply nested to be shortened 
												* for example `/posts/a-long-permalink/comments/1234` becomes `/comments/1234`
								* `:shallow_path`
									* prefixes nested shallow routes with the specified path 
									```
										scope shallow_path: "sekret" do 
											resources :posts do	
												resources :comments, shallow: true
											end 	
										end 
									```
										* here the parent resource path get changed to the "sekret" namespace 
								* `:shallow_prefix`
									* prefixes nested shallow route names with specified prefix
									```
										scope shallow_prefix: "sekret" do 
											resources :posts do
												resources :comments, shallow: true
											end
										end
									```
										* adds a the prefix "sekret" to the name of the shallow route 
								* `:format`
									* allows you to specify the default value for optional `format` segment or disable it by supplying `false`
								
	
					* `CANONICAL_ACTIONS`
						* these are the basice resful actions 
						* values 
							* index, create, new, show, update, destroy 
				* public methods 
					* `collection()`
						* adds a route to the collection 
						* this lets rails recognize paths that are provided within the appropriately scoped controller 
						```
							resources :photos do 
								collection do 
									get 'search'	
								end 
							end
						```
							* the controller `PhotosController` can now recognize the uri path `/photos/search` using the GET http verb 
							* the route helpers `search_photos_url` and `search_photos_path` are also created 
					* `match( path, *rest)`
						* i have no idea what this does 
					* `member()`
						* adds a member route to the resource 
						* this lets rails recognize paths that are provided with the appropriately scoped controller and id 
						```
							resources :photos do
								member do 
									get 'preview' 
								end 
							end 
						```	
							* the controller `PhotosController` can now recognize the uri path `/photos/1/preview` using GET http verb
							* the route helprts `preview_photo_url` and `preview_photo_path` are also created 












































