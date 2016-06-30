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

# June 11 - rails form helpers 

learning all about how forms and rails sleep at night 

* [dealing with basic forms](http://guides.rubyonrails.org/form_helpers.html)
	* `form_tag` 
		* the most basic form helper 
			```
				<%= form_tag do %>
					Form contents 
				<% end %>
			```
		* when called without an argument 
			* creats a `<form>` tag 
			* when submitted will POST to the current page 
			* for page `/home/index`
				```
					<form accept-charset="UTF-8" action="/" method="post">
						<input name="utf8" type="hidden" value="&#x2713;"/>
						<input name="authenticity_token" type="hidden" value="J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts="/>
						Form contents
					</form>
				```
					* contains hidden input elements 
						* form cannot be succesfully submited without these 
						* forces browser to respect your forms character encoding 
							* in this case UTF-8
							* generated for all GET and POST forms 
						* cross-site request forgery protection
							* security feature 		
							* generated for all non-GET forms 
							* contains name authenticity_token 
	* generic search form 
		* contains 
			* form element with GET method 
			* a label for the input 
			* a text input element 	
			* a submit element 
		* use multiple form helpers to create this form 
			* `form_tag`
				* creates a form element 
			* `label_tag`
				* creates a label element 
			* `text_field_tag`
				* creates a text field input element 
			* `submit_tag`
				* creates a submit input element
			* example: 
				```
					<%= form_tag("/search", method: "get") do %>	
						<%= label_tag(:q, "search for:") %>
						<%= text_field_tag(:q) %>
						<%= submit_tag("search") %>
					<% end %>
				```
			* will generate the following HTML: 
				```
					<form accept-charset="UTF-8" action="/search" method="get">
						<input name="utf8" type="hidden" value="&#x2713;" />
						<label for="q">search for:</label>
						<input id="q" name="q" type="text" />
						<input name="commit" type="submit" value="search" />
					</form>
				```
					* for every form input 
						* an id attribute is generated from its name
						* these ids can be useful for CSS styling or manipulation of form controls with JS
			* always use GET as the method for search forms 
				* it allows users to bookmark a specific search an get back to it 
		* multiple hashes in form helper calls 
			* `form_tag` helper accepts 2 arguments 
				* the path for the action 
					* does not have to be a string 
						* like `link_to` helper it can recognize a hash of url parameters
							* rails recognizes them in the routing mechanism 
							* turns them into a valid url 
				* an options hash 
					* specifies the method of the form submission and html options such as the form elements classes 
			* since both options can be hashes be careful deliniating between the two 
				* can be donw by wraping first hash in curly brakcets or both hashes 
				* example: 
					```
						form_tag({controller: "people", action: "search"}, method: "get", class: "nifty_form")
					```
		* helpers for generating form elements 
			* rails has a lot of helpers for generating form elements 
				* the first parameter of these is always the name of the input 
					* when the form is submitted the name is passed along with the form data 
					* it will make its way to the `params` hash in the controller with the value entered by the user for that field 
						* example: 
							* `<%= text_field_tag(:query) %>`
								* the value of this field is passed to the controller with `params[:query]`
			* when naming inputs rails uses certain conventions that make it possible to submit parametes with non-scalar vaules such as arrays or hashes 
				* these will also be accessible in `params` 
			* checkboxes 
				* a form control that gives the user a set of options they enable or disable 
				* example: 
					```
						<%= check_box_tag(:pet_dog) %> 
						<%= label_tag(:pet_dog, "I own a dog") %>
						<%= check_box_tag(:pet_cat) %> 
						<%= label_tag(:pet_cat, "I own a cat") %>
					```
				 * html: 
					```
						<input id="pet_dog" name="pet_dog" type="checkbox" value="1" />
						<input for="pet_dog">I own a dog</label>
						<input id="pet_cat" name="pet_cat" type="checkbox" value="1" />
						<input for="pet_cat">I own a cat</label>
					```
				* parameters to `check_box_tag`
					* name of the input 
					* the value of the input 
						* included in the form data 
							* will be present in the controller in the `params` when the box is checked 
			* radio buttons 
				* similar to checkboxes
				* form controls that specify a set of options in which they are mutually exclusive 
					* user can only pick one
				* example: 
					```
						<%= radio_button_tag(:age, 'child') %>
						<%= label_tag(:age_child, "I am younger than 21") %>
						<%= radio_button_tag(:age, 'adult') %>
						<%= label_tag(:age_adult, "I am over 21" %>
					```
				* html: 
					```
						<input id="age_child" name="age" type="radio" value="child" />	
						<label for="age_child">I am younger than 21</label>
						<input id="age_adult" name="age" type="radio" value="adult" />
						<label for="age_adult">I am over 21</label>
					```
				* parameters to `radio_button_tag` 
					* the inputs share the same name making them mutually exclusive 
					* the value of the input 
						* included in the form data 
							* controller will be able to retrieve in `params` however only on of the inputs can pass a value since they have the same name 
			* other helpers of interest 
				* form controls 
					* `text_area_tag`
					* `password_field_tag`
					* `hidden_field_tag`
						* are not shown to the user but hold data 
					* `search_field`	
						* html 5 control
					* `telephone_field`
						* html 5 control
					* `date_field`
						* html 5 control
					* `datetime_field`
						* html 5 control
					* `datetime_local_field`
						* html 5 control
					* `month_field`
						* html 5 control
					* `week_field`
						* html 5 control
					* `url_field`
						* html 5 control
					* `email_field`
						* html 5 control
					* `color_field`
						* html 5 control
					* `time_field`
						* html 5 control
					* `number_field`
						* html 5 control
					* `range_field`
						* html 5 control
				* example: 
					```
						<%= text_area_tag(:message, "hi, nice site", size: "24x6") %>
						<%= password_field_tag(:password) %>
						<%= hidden_field_tag(:parent_id, "5") %>
						<%= search_field(:user, :name) %>
						<%= telephone_field(:user, :phone) %>
						<%= date_field(:user, :born_on) %>	
						<%= datetime_field(:user, :meeting_time) %>
						<%= datetime_local_field(:user, :graduation_day) %>
						<%= month_field(:user, :birthday_month) %>
						<%= week_field(:user, :birthday_week) %>
						<%= url_field(:user, :homepage) %>
						<%= email_field(:user, :address) %> 
						<%= color_field(:user, :favorite_color) %> 
						<%= time_field(:task, :started_at) %>
						<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
						<%= range_field(:product, :discount, in: 1..100) %> 
					```
				* html: 
					```
						<textarea id="message" name="message" cols="24" rows="6">Hi, nice site</textarea>
						<input id="password" name="password" type="password" />
						<input id="parent_id" name="parent_id" type="hidden" value="5" />
						<input id="user_name" name="user[name]" type="search" />
						<input id="user_phone" name="user[name]" typer="tel" />
						<input id="user_born_on" name="user[born_on]" type="date" />
						<input id="user_meeting_time" name="user[meeting_time]" type="datetime" />
						<input id="user_graduation_day" name="user[graduation_day]" type="datetime-local" />
						<input id="user_birthday_month" name="user[birthday_month]" type="month" />
						<input id="user_birthday_week" name="user[birthday_week]" type="week" />
						<input id="user_homepage" name="user[homepage]" type="url" />
						<input id="user_address" name="user[address]" type="email" />
						<input id="user_favorite_color" name="user[favorite_color]" type="color" value="#00000" />
				 		<input id="task_started_at" name="task[started_at]" type="time" />
						<input id="product_price" max="20.0" min="1.0" name="product[price]" step="0.5" type="number" />
						<input id="product_discount" max="100" min="1" name="product[discount]" type="range" />
					```
* dealing with model objects 
	* model object helpers 
		* you can use tags without the `tag` suffix 
		* objects need to be mentioned 
		* these helpers take two arguments 
			* name of an instance variable 
			* name of a method to call on that object 
		* rails will set the value of the input control to the return value of that method for the object and set an appropriate input name 
		* example: 
			* controller has `@person` as a instance variable 
				* `@person` has an attribute `:name`
					* `:name` has a value of "Henry"
			* `<%= text_field(:person, :name) %>`
			* produces html output 
				* `<input id="person_name" name="person[name]" type="text" value="Henry" />`
					* when submitted the value entered by the user will be stored in `params[:person][:name]`
						* this value can then be used to be passed to methods of the `@person` instance variable 
	* binding a form to an object 
		* `form_for`
			* binds a form to a model object 
			
			* example: 
				* `app/controllers/articles_controller.rb`
					```
						def new 
							@article = Article.new
						end		
					```
				* `app/views/articles/new.html.erb`
					```
						<%= form_for @article, url: {action: "create"}, html: {class:"nifty_form"} do |f| %>
							<%= f.text_field :title %>
							<%= f.text_area :body, size: "60x12" %>
							<%= f.submit "Create" %>
						<% end %>
					```
				* things to note
					* `@article` is being edited 
					* there is a single hash of options 
						* routing options are passed in the `:url` hash
						* html options are passed in the `:html` hash 
						* namespace can be passed in a `:namespace` option 
							* attribute will be prefixed with underscore ont he generated html id
						* `form_for` yields a form builder object 
							* this is what the `f` variable is 
							* methods to create form controls are called on the form builder object f 
				* html output:
					```
						<form accept-charset="UTF-8" action="/articles/create" method="post" class="nifty_form">
							<input id="article_title" name="article[title]" type="text" />
							<textarea id="article_body" name="article[body]" cols="60" rows="12"></textarea>
							<input name="commit" type='submit' value="Create" />
						</form>
					```
						* the name passed to `form_for` controls the key used in the `params` to access the forms values 
		* `fields_for` 
			* creates a similar binding to `form_for` but does not create a <form> html object 
				* simply makes the attributes of a model object available 
			* `form_for` calls `fields_for` internally 
		* relying on record identification 			
			* RESTful resources and `form_for` play nicely together if you rely on record identification 
				* rails basically does all the work for you 
			* example: 
				* `app/views/articles/new.html.erb`
					```
						## creating a new article 
						# long-style: 
						form_for(@article, url: articles_path)
						# same thing, short-style (record identification gets used): 
						form_for(@article)
					
						## editing an existing article
						# long-style 	
						form_for(@article, url: article_path(@article), html: {method: "patch"})
						# short-style
						form_for(@article)
					```
						* the short form is smart enough to now if it is editing a record or creating a new one
							* will automatically select the correct path to submit to and name based on class of the object 
			* STI(single-table inheritance) is not compatible with record identification 
		* dealing with namespaces 
			* if the routes are namespaced `form_for` has a shorthand 
				* example: 
					* `form_for [:admin, @article]`
						* creates a form that submits to the `ArticlesController` inside the admin namespace 
						* works with namespace nesting
		* how do forms with PATCH, PUT, or, DELETE methods work 	
			* most browsers do not support methods other than GET and POST when submiting forms 
				* rails emulates other methods over POST with a hidden input named `"_method"`	
					* `form_tag(search_path, method: "patch")`
				* html output
					```
						<form accept-charset="UTF-8" action="/search" method="post">	
							<input name="_method" type="hidden" value="patch" />
							<input name="utf8" type="hidden" value="&#x2713;" />
							<input name="authenticity_token" type="hidden" value="long fucking hash xx"/>
						</form>
					```
				* rails will be chill and use the method in the hidden field 

* making a select boxes with ease
	* the select and option tags 
		* `select_tag`
			* helper which generates a select html tag containing an option string 
				* `<%= select_tag(:city_id, '<option value="1">Lisbon</option>...')%>`
					* does not dynamically create the option tags 
		* `options_for_select` 
			* helper which dynamically generates option html tags 
				```
					<%= options_for_select([['Lisbon', 1], ['Madrid', 2], ...], 2) %>
				```
				* html output: 
				```
					<option value="1">Lisbon</option> 
					<option value="2" selected="selected">Madrid</option> 
				```
			* the first argument is a nested array	
				* each element has two elements 	
					* option text	
						* this case city name 
					* option value 	
						* this case city id 
						* this is submitted to the controller 
			* allows you to preselect an option by passing the value of the option as the second argument to the helper 
			* arbitrary attributes can be added to the options using hashes
				* `<%= options_for_select([['Lisbon', 1, {'data-size' => '2.8 million'}]], 1) %>`
				* html output: 
					* `<option value="1" data-size="2.8 million">Lisbon</option>`

		* can be combined to do smart things 
			* `<%= select_tag(:city_id, options_for_select(...))%>`
				* will do all of the previous things 
	* select boxes for dealing with models 
		* rails has helpers built just for dealing with the fuckery of select and options with models
		* controller: 
			* `@person = Person.new(city_id: 2)`
		* view: 
			* `<%= select(:person, :city_id, [['Lisbon', 1], ['Madrid', 2], ...]) %>`
		* comentary from the rails gods 
			* the first parameter 
				* an instance variable corresponding with a model graced by the controller 
			* the second parameter 
				* the helper checks the instance variable matching property to see if there already is a match in values 
				* in this case the option 'Madrid' would be preselected since the :city_id match 
			* the third parameter	
				* an options array just like the `options_for_select`
			* if using a form builder scoper to the instance variable 
				* `<%= f.select(:city_id, ...) %>`	
					* magic 
		* red flag: 
			* beware of using `select`, `collection_select`, `select_tag` to set a `belongs_to` association 
				* must pass the name of the foreign key not the name of the association itself 
				* this is a security threat?
	* options tags from a collection of arbitrary objects 
		* the `options_for_select` helper requires you to create an array containing the text and value for each option 
		* you can also generate the select and options tags from a collection of objects 
			* take for example a `City` model
				* you could iterate over a nested array 
					* view: 		
						```
							<% cities_array = City.all.map { |city| [city.name], city.id] } %>
							<%= options_for_select(cities_array) %>
						```
				* rails has a helper for that 
					* `options_from_collection_for_select`
						* expects 
							* a collection of arbitraty objects 
							* the name of the methods to read the option value 
							* the name of the methods to read the text value 
						* example 
							* `<%= options_from_collection_for_select(City.all, :id, :name) %>` 
								* generates the option tags from 
									* all the City instances 
									* their :id
									* their :name
					* `<%= collection_select(:person, :city_id, City.all, :id, :name) %>`
						* you can probably figure out how this works 
	* time zone and country select 
		* rails has a helper specifically for timezone selects 
			* example 
				* `<%= time_zone_select(:person, :time_zone) %>`
		* can be done more intricatly using 
			* `time_zone_options_for_select` 

* using date and time form helpers 
	* there are alternative date and time helpers available		
		* these are different 
			* data and times are not representable by a single input element 
				* input for each component (year, month, day, etc.)
				* no single value in `params` hash in controller
			* other helpers use the `_tag` suffix to indicate whether a helper is a barebones helper or a model helper 
				* `select_date`, `select_time`, `select_datetime`
					* barebones helpers 
				* `date_select`, `time_select`, `datetime_select`
					* model helpers 
	* barebones helpers 
		* the `select_*` family of helpers 
			* first argument 
				* instance of `Date`, `Time`, or `DateTime` 
					* `<%= select_date Date.today, prefix: :start_date %>`
					* used as the currently selected value 
			 		* if omitted the current date is used 
					* `params[:start_date]` in the controller
						* a hash with keys 
							* `:year`, `:month`, `:day`
						* to get an actual `Date`, `Time`, or `DateTime` object you must extract these values and pass them to the appropriate constructor 
							* `Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)`
						* the `:prefix` option is the key used to retrieve the hash of date components from the `params` hash
	* model object helpers 
		* `select_date` does not work well with forms that create Active Record objects 
			* Active Record expects each elements in the `params` hash to correspond to one attribute 
		* the model object helper submits parameters with key word names 
			* Active Record knows how to react 
			* it knows how to appropriately combine columns 
		* example: 
			* `<%= date_select :person, :birth_date %>`
			
		* html output: 
			```
				<select id="person_birth_date_1i" name="person[birth_date(1i)">
				<select id="person_birth_date_2i" name="person[birth_date(2i)">
				<select id="person_birth_date_3i" name="person[birth_date(3i)">
			```		
		* controller receives on submition: 
			```
				{ 'person': 	
					{ 'birth_date(1i)': '2008',
					  'birth_date(2i)': '11',
					  'birth_date(3i)': '22'}
				}
			```
			* when this hash is passed to `Person.new` 	
				* Active Record spots that these parameters should be used to construct the birth_date attribute and uses the suffixes information to determine which order it should pass these parameters to other functions 
	* common options 
		* both barebones and model object helpers accept largely the same options 
		* default: 
			* rails generate year options 5 years on either side of the current year 
				* the `:start_year` and `:end_year` options override this behavior 
		* [exhaustive list of options](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html)
		* individual components 
			* some times you need to display just a single date component such as a year or a month 
				* each component has its own helper 
					* `select_year`, `select_month`, `select_day`, `select_hour`, `select_minute`, `select_second`
			
* uploading files 
	* to upload files the forms encoding must be set to 'multipart/form-data' 
		* done automatically with `form_for` must be done manually for `form_tag`
	* rails has usual helper dichotamy 
		* barebones `file_field_tag`
			* in the controller access with `params[:picture]`
		* model helper `file_field`
			* in the controller access with `params[:person][:picture]`
	* what gets uploaded 
		* controller `params` hash 
			* an instance of a subclass of `IO` object 
				* may be a `StringIO` object 
				* may be a `File` object 
					* backed by a temporary file 
				* both cases object will have an
					* `original_filename` attribute 	
						* the name the file had on the users computer 
					* `content_type` attribute 
						* contains the MIME type of the uploaded file 
				* example: 
					```
						def upload 
							uploaded_io = params[:person][:picture]
							File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|		
								file.write(uploaded_io.read)
							end
						end
					```
						* basically the controller reads the received file into a local copy
		* dealing with Ajax 
			* asynchronous file upload form is not as simple as a plug and play helper 
			* its fucked?

* customizing form builders 
	* objects yielded by `form_for` and `fields_for` are instances of `FormBuilder`
		* `FormBuilder` can be subclassed and extended 
		
* understanding parameter naming conventions 
	* values from forms can be at the top level of `params` or nested in another hash 
		* a create action for a Person model 
			* `params[:person]` would contain all the attributes for the person to create 
		* the `params` hash can also contain arrays, arrays of hashes, and so on
	* basic structures 
		* arrays 
			* duplicate parameter names will be accumullated in an array 
		* hashes 
			* mirror syntax used for accessing the value in `params` 
	* combining them 
		* only one level of arrayness is permited 
			* array does not play well with `check_box` helper 
	* using form helpers 
		* you can do some interesting play between `form_for`, `fields_for` and `:index` 
		* example: 
			```
				<%= form_for @person do |person_form| %> 
					<%= person_form.text_field :name %> 
					<% @person.addresses.each do |address| %> 
						<%= person_form.fields_for address, index: address.id do |address_form| %>
							<%= address_form.text_field :city %>
						<%end%>
					<%end%>
				<%end%>
			```
	









 
# 6/18 rails, rails, rails.
	
i still have no idea what im doing. but im starting to get a handle on what questions to ask. 

#### questions 
	
* what the fuck is a `belongs_to` association?

# 6/22 fuck forms 

forms are very annoying 

* label and check box 
	* [stack overflow deffff](http://stackoverflow.com/questions/18432376/what-does-for-attribute-do-in-html-label-tag)
	* label tags can be used to click on associated input elements 
		* two methods 
			* nest the checkbox into the label tag 
			* use the `for` attribute 
				* will associate the label to the checkbox that contains the same name 	

# 6/23 css dreams 

css you are so silly but ily

* make a circular border thing
	* the css border radius property 
		* dictates the roundedness of each components of an element 
			* accepts 
				* length in pixels
				* length in percentage 
				* initial (default)
				* inherits from parent element 
		* basically turn border-radius to 50% to make a circle 
	
* [the difference between masking and clipping](https://css-tricks.com/clipping-masking-css/)
	* this shit is totally not supported
		* ie dead, firefox poor 
	* fundemental difference 
		* masks are images 
			* simple image 
		* clips are paths 
			* inside path opaque outside path transparent 
	
	* clip 
		* `clip: rect(10px, 20px, 40px, 30px);`
			* similar to margin 
		* restrictions 	
			* only works if element is `position: absolute` 
			* can only do rectangles 
	* clip-path 
		* `clip-path: inset(10px 20px 30px 40px);`
			* single value: all sides the same 
			* 2 values: vert/horz
			* 3 values: top/horz/bottom
		* clip a circle 
			* `clip-path: circle(60px at center);`
		* clip an ellipse 
			* `clip-path: ellipse(60px 40px at 75px 30px);`
		* clip a polygon 
			* `clip-path: polygon(5% 5%, 100% 0%, 100% 75%, 75% 75%, 75% 100%, 50% 75%, 0% 75%);`
			* [indepth of clip-path polygons](https://css-tricks.com/sketchy-avatars-css-clip-path/)
	* masking 
		* there was a webkit-only version of masking 
		* you can link up an svg file as a mask 
			
* the html `data` attribute
	* a great solution for custom element-associated metadata
	* [the data-* attribute](http://www.w3schools.com/tags/att_global_data.asp)
		* used to store custom data private to the page or application 
		* gives the ability to embed custom data attributes on all html elements 
		* the stored data can be used by JS to create a more engaging user experience without making any Ajax calls or server-side db queries 
		* consist of two parts 
			* the attribute name 
				* should not contain any uppercase letters 
				* must contain the prefix `data-`
				* must be at least on character long following the prefix
			* the attribute value 
				* can be any string 
	* [using data attributes](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Using_data_attributes)
		* basically the data-* attribute is an idiomatic way to store information in semantic html elements without hacks 
		* useful for storing information that does not have any visual reprsentation 
		* javascript access 
			* the key-value pairs can be read from elements using 
				* `getAttribute()` function 
				* using standard `.` notation on the element itself through the `dataset` property
					* `-` are converted to camelcase 
					* `article.dataset.columns`
		* css access 
			* the key-value pairs can be read from elemnts using 	
				* `attr()` function 
				* this can be very useful in combination with css generated content and the content css property 
				* can use [attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors) in css to change styles according to the data 
	* browser support 
		* IE 11+ supports 

# June 25 - browser and file uploads 

basically diving deep into file uploads and stuff and how they are implemented 

#### questions 

* will dropzone handle the upload process even if the upload interface is the default browser upload interface?

* when i select a file to upload from the OS, or i drag and drop a file into the browser, what generates the POST request and where/how does it get stored (browser memory, browser cache...)?

* if we have both interfaces displayed at all times, can the state of one interface affect the state of the other?

	* i drag and drop, i see a preview; i then select-for-upload, the preview disappears or even better, changes to the image i just selected-for-upload?

	* i select-for-upload, i see a file name; i then drag and drop, the file name disappears or even better, changes to the file name of the new image?

* what really is MIME type?
	* stands for Multi-purpose Internet Mail Extensions 
	* a standard way of classifying file types 
		* two parts seperated by a slash 
			* top-level type name 
				* registered names 
					* application 
					* audio 
					* example 
					* image 
					* message 
					* model 
					* multipart 
					* text
					* video 
			* subtype 
	* example: 
		* `application/json`

* what is an ENCTYPE?
	* a form attribute that specifies how the form-data should be encoded when submitted to the server 
	* can only be used if metho="post"

* what is a positioning context?

* what is this flow concept in css? fucking annoying that i dont understand it 

* why is em value better for accessibility?

* what are linear gradients? 

* what is a polyfil ?

* what is a [blob](https://developer.mozilla.org/en-US/docs/Web/API/Blob)?
	* a file-like object of immutable, raw data
	* represents data that is not necessarily JS natove format 
	* the [File](https://developer.mozilla.org/en-US/docs/Web/API/File) object is based off of it

* what is a [FileReader](https://developer.mozilla.org/en-US/docs/Web/API/FileReader);
	* a object that lets web apps asynchronously read the contents of files (or raw data buffers) stored on the users computer 


#### research 

* [form-based file upload in html: rfc 1867](https://www.ietf.org/rfc/rfc1867.txt)
	* circa 1995 yall
	* abstract: 
		* extend html to 
			* express file upload request uniformly 
			* MIME compatible representation for file upload responses 
	* html forms with file submission 
		* current html
			* input: checkbox, hidden, image, password, radio, reset, submit, text 
		* ENCTYPE attribute using post method have default value 
			* "application/x-www-form-urlencoded"
		* changes 
			* add a file option for input tags 
			* allow an accept attribute for input tags 
				* list of media types or type patterns allowed for the input 
			* defines new MIME media type 
				* multipart/form-data
			* specifies behavior of html user agents when interpretung a form with 
				* ENCTYPE="multipart/form-data" 
				* <input type="file">
	* suggested implementation 
		* display of file widget 
			* browse button with a file selection gui 
			* accept attribute constrains the file extensions allowed 
		* action on submit 
			* send the form data and content of the selected files 
				* encoding type `multipart/form-data` is used since the other is insufficient 
		* use of multipart/form-data 
			* each field is sent in order in which it appears in the form as part of the stream 
				* identifies the input name within the form 
				* labelled with an appropriate content-type if media type is known 
			* if multiple files are selected they should be transferred together using the `multipart/mixed format`	
			* http protocol can transport arbitrary binary data 
				* the default for mail transport is 7Bit encoding 
				* may need to supply the `content-transfer-encoding` header if the value does not conform to default encoding 
			* the original local file name may be supplied as well 
				* filename parameter within 
					* `content-disposition: form-data` header (single file) 
					* `content-disposition: file` header of the subpart (multiple files)
			* the server realizes that it is `multipart/form-data` and does special shit to it 
		* interpretation of other attributes 
			* value attribute 
				* could be used with `<input type=file>` tags for a default file name 
			* size attribute 
				* width 
					* default for filename width 
				* height 
					* expected size showing the list of selected files for filename area 
	* backward compatibility issues 
		* i just dont care sorry 
	* other considerations 
		* compression, encryption 
			* rfc thinks these topics are out of scope 
		* deferred file transmission 
			* lost patience 



* [some clarity on file upload](http://stackoverflow.com/questions/12085392/how-html-file-upload-works)
	* web applications are sandboxed and cannot access local files directly 
		* file upload picker must somehow reach an OS api to select a file in the local computer 
			* once a user has selected a file the web application can access it 

* [how does the browser determine the mime type to send](http://stackoverflow.com/questions/1201945/how-is-mime-type-of-an-uploaded-file-determined-by-browser)
	* mime type sent by the browser is likely to be the one reported by the OS 
					
	
* [the w3c file api](https://www.w3.org/TR/FileAPI/)

* [the mozilla form gambit](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms)
	* [sending form data](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Sending_and_retrieving_form_data)
		* web is based on basic client/server architecture
		* the client side: defining how to send the data 
			* the `<form>` element itslef defines how the data will be sent 
				* attributes are designed to let you configure the request to be sent when a user hits a submit button 
					* action 
						* defines where the data gets sent 
						* value must be a valid url 
						* if not provided data will be sent to the url of the page containing the form 
					* method  
						* defines how the data is sent 
						* form data can be sent via 
							* get method 
								* retrieves from server something 
								* never send sensitive data via get
							* post method 
								* form data is part of the body of the http request 
								* the `content-length` header 			
									* indicates the size of the body 
								* the `content-type` header 
									* indicates the type of resource sent to the server 
								* large amount of data the post method is preferred 
		* special case: sending files 
			* files are binary data 
			* the enctype attribute 
				* specifies the value of `content-type` 
					* must be set to `multipart/form-data` so that the data is split into multiple parts
						* one for each file 
						* one for the text of the form body that may be sent with it
		* security concerns 
			* concentrated on the server side 
			* XSS and CSRF 
				* Cross-site Scripting (XSS)
					* allows the attackers to inject client-side scripts into web pages viewed by other users 
					* can be used to bypass access controls like 
						* [same origin policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)
					* exploits the trust a user has for a website 
				* Cross-Site Request Forgery   
					* allows the user to inject client-side script into web pages 
						* target ti attempt to escalate privileges of user to that of a higher-privileged user to perform actions it should not be able to do 
					* exploits the trust a web site has for its users
				* sanitize user input always 
			* sql injection 
				* attempts to perform actions on a database used by the website 
				* typically involve sending an sql request in the hope that the server will execute it 
				* can cause data loss to unprivileged access 
			* http header injection and email injection 
				* leave you open to session hijcking and phishing attacks 
			* be paranoid 
				* all data should be sanitized 
				* escape potentially dangerous characters 		
				* limit the incoming amount of data allowed only to whats necessary 
				* sandbox upploaded files 
	* [data form validation](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Data_form_validation)
		* the browser can validate user data without relying on scripts 
			* [validation attributes](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation)
		* when an element is  invalid 
			* the element will match the `:invalid` css pseudo-class enabling particular styles (same goes for `:valid`)
			* if the user tries to send the data the browser will block the form and display an error message
		* validation constraints on `<input>` elements 
			* can be validated using the [pattern](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-pattern) attribute 
				* expects a case sensitive regular expression as its value 
					* if not empty and does not match it will be considered invalid 
			* the [required](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-required) attribute 
				* the form cannot be submitted if this input field is empty 
		* other validation constraints 
			* textarea does not support the pattern attribute 
			* all input and textarea elements can be constrained with [maxlength](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-maxlength)
			* number fields have a [min](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-min) and [max](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-max) that make anything below the min and above the max invalid 
		* customized error messages 
			* these front end validation error messages are standard browser behavior left to the whim of the browser local 
				* to customize the text and appearance of these messages you must use JS 
			* html5 has a [constraint validation api](https://www.w3.org/TR/html5/forms.html#the-constraint-validation-api)
				* allows you to check and customize the state of a form element 
				* allows you to change the text of the error message 
		* validating forms using JS
			* [html5 constraint validation api mozilla table](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Data_form_validation#The_HTML5_constraint_validation_API)
		* validating without api 
			* insperation and tips 
				* [smashing magazine](https://www.smashingmagazine.com/2009/07/web-form-validation-best-practices-and-tutorials/)
				* [smashing magazine](https://www.smashingmagazine.com/2012/06/form-field-validation-errors-only-approach/)
				* [six revision](http://sixrevisions.com/user-interface/best-practices-for-hints-and-validation-in-web-forms/)
				* [a list apart](http://alistapart.com/article/inline-validation-in-web-forms)
			* basically its a fucking nightmare 
			* [jquery has a plugin](http://bassistance.de/jquery-plugins/jquery-plugin-validation/)
	* how to build custom form widgets 
		* sometimes we build our own shit because the default solution is not sufficient 
		* design structure and semantics 
			* know what you want and why you want it 
				* define all the states of your widget 
				* define behavior of widget
			* the `<select>` example 
				* three states 
					* the normal state 
						* the page loads 
						* the widget was active and the user clicks anywhere outside the widget 	
						* the widget was active and the user moves the focus to another widget using the keyboard 
					* the active state 
						* the user clicks on it 
						* the user hits the tab key and it gains focus 
						* the widget was in its open state and the user clicks on the widget 			
					* the open state 
						* the widget is in any other state than open and the user clicks on it 					
				* behavior 
					* widget must be usable with a mouse, and a keyboard 
					* the value of the widget changes 
						* the user clicks on an option when the widget is in the open state 
						* the user hits the up or down arrow keys when the widget is in its active state 
					* the options of the widget 
						* when the widget is opened the selection option is highlighted 
						* when the mouse is over an option, the option is highlighted and the previously highlighted option is returned to its normal state 
		* [defining the html structure and semantics](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/How_to_build_custom_form_widgets#Defining_the_HTML_structure_and_semantics)
			```	
				<!-- the comments are not idomatic html i know -->
				//this the main container for the widget 	
				// the tabindex attribute is what allows the user to focus the widget 
					//better to set through js 
				<div class="select" tabindex="0">
					
					//this container will be used to display the current value of the widget 
					<span class="value">Cherry</span>
					
					//this container will contain all the option available for the widget 
					<ul class="optList">
						//each option only contain the value to be displayed 	
						// real value will be set later 
						<li class="option">Cherry</li>
						<li class="option">Lemon</li>		
						<li class="option">Banana</li>
						<li class="option">Strawberry</li>
						<li class="option">Apple</li>	
					</ul>
				</div>
			```
		* creating the look and feel using css 
			* split css into two parts 
				* required style
					* base level css to have the widget behave like a `<select>` element 
				* beutification 
					* the style built ontop of it that make it look fancy 
			* css 
				* required style 
					``` 
						.select {
							//this will create a positioning context for the list of options
							postion: relative; 
							
							//this will make our widget become part of the text flow and sizable at the same time 
							display: inline-block;			
						}
						
						//define the look and feel of the widget when it is in active state 
						.select.active,
						.select:focus {
							outline: none;
					
							// box shadow not required but it makes the active state visible with a visual cue
							box-shadow: 0 0 3px 1px #227755;
						}	
						
						//handling the list of options 
						.select .optList {
							//this will make sure the list of options will be displayed below the value and out of the html flow
							position: absolute;
							top: 100%;
							left: 0;
						}
						
						//handle when the list of options is hidden 
							//manage difference between active state and open state 	
						.select .optList.hidden {
							//hide the list in an accessible way 
							max-height: 0;
							visibility: hidden; 
						}
					``` 
				* beautification 
					```
						.select {
							// all sizes expressed with em value for accessibility reasons 
							font-size: 0.625em; 
							font-family: Verdana, Arial, sans-serif;
							
							-moz-box-sizing: border-box;
							box-sizing: border-box; 
						
							//we need extra room for the down arrow we will add
							padding : .1em 2.5em .2em .5em;
							width: 10em; 
							
							border: .2em solid #000;
							border-radius: .4em;
							box-shadow: 0 .1em .2em rgba( 0, 0, 0, .45);
						
							// first declaration is for browsers that do not support linear gradients 
							// second declaration is because webkit based browsers havent unprefixed it yet 
							background: #F0F0F0;
							background: -webkit-linear-gradient(90deg, #E3E3E3, #fcfcfc 50%, #f0f0f0);
							background: linear-gradient(0deg, #E3E3E3, #fcfcfc 50%, #f0f0f0);	
						}
				
						.select .value {
							// because the value can be wider than our widget we have to make sure it will not change the widgets width 
							display: inline-block;
							width: 100%;
							overflow: hidden;
						
							vertical-align: top;
					
							//and if the content overflows it bettwe to have a nice ellipsis
							white-space: nowrap;
							text-overflow: ellipsis;
						}
				
						// use the :after pseudo element to design the down arrow 
						.select:after {
							content: "U+25BC";
							position: absolute;
							z-index: 1;
							top: 0; 
							right: 0;
							
							-moz-box-sizing: border-box;
							box-sizing: border-box;		
							
							height: 100%;
 							width: 2em; 
							padding-top: .1em;
							
							border-left: .2em solid #000; 
							border-radius: 0 .1em .1em 0;
					
							background-color: #000; 
							color: #fff;	
							text-align: center;
						}
					
						//styling the list options 
						.select .optList {
							z-index: 2;
							
							//reset teh default style of the ul element 
							list-style: none;
							margin: 0;
							padding: 0;
						
							-moz-box-sizing: border-box;
							box-sizing: border-box; 
				
							//this will ensure that the values that are smaller than the widget the options will be as large 
							min-width: 100%; 
							
							max-height: 10em; 
							overflow-y: auto; 
							overflow-x: hidden;
			
							border: .2em solid #000; 
							border-top-width: .1em;
							border-radius: 0 0 .4em .4em;
						
							box-shadow: 0 .2em .4em rgba( 0, 0, 0, .4);
							background: #f0f0f0; 
						}
				
						//add a highlight class to be able to identify the value the user will pick 
						.select .option {
							padding: .2em .3em;
						}
				
						.select .highlight {
							background: #000;
							color: #FFFFF;
						}
					```
			* bring the widget to life with JS 
				* we are going to use the standard DOM api 
				* we are going to use 4 js featuers (ordered from riskiest to safest) 
					* [classList](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList)
					* [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
					* [forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
					* [querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Element/querySelector) and [querySelectorAll](https://developer.mozilla.org/en-US/docs/Web/API/Element/querySelectorAll)
				* add support for forEach to NodeList objects 
					```
						NodeList.prototype.forEach = function (callback) {
							Array.prototype.forEach.call(this, callback);
						}
					```
				* building event callbacks: the general behavior 
					```
						// will be used each time we want to deactivate a custome widget 
						function deactivateSelect(select) {
							//the widget is not active there is nothing to do 
							if (!select.classList.contains('active')) return;
						
							//we need to get the list of options for the custom widget 	
							var optList = select.querySelector('.optList');
							
							//we close the list of options 
							optList.classList.add("hidden");
				
							//deactivate the custom widget itself
							select.classList.remove('active');
						}
			
						//used each time the user wants to activate the widget 
						// parameters : DOM node with select class 
						//		list of all the Dom nodes with the select class 
						function activeSelect (select, selectList) {
							// the widget is already active there is nothing to do 
							if (select.classList.contains('active')) return;
							
							//turn off active state on all custom widgets 
							selectList.forEach(deactivateSelect);
							
							//turn on the active state for this specific widget 
							select.classList.add('active');
						}
						
						//function will be used each time the user wants to open/close the list of options 
						function toggleOptList(select) {
							//list is kept from the widget 
							var optList = select.querySelector('.optList');
							
							//we change the class of the list to show/hide it 
							optList.classList.toggle('hidden');
						}
					
						//function will be used each time we need to highlight an option 
						function highlightOption(select, option) {
							
							//get the list of all option available for our custom select element 
							var optionList = select.querySelectorAll('.option');
							
							//we remove the highlight from all options 
							optionList.forEach(function (other) {
								other.classList.remove('highlight');
							});
						
							//we highlight the right option 
							option.classList.add('highlight');
						}
					
						//bind the functions to appropriate events 
							
						//handle the event binding when the document is loaded 
						window.addEventListener('load', function() {
							var selectList = document.querySelectorAll('.select');
							
							//each custom widget needs to be initialized 
							selectList.forEach(function (select) {
							
								//as well as all its 'options' elements 
								var optionList = select.querySelectorAll('.option');
								
								//each time a user hovers their mouse over an option we highlight the given option 
								optionList.forEach(function (option) {
									option.addEventListener('mouseover', function() {
										highlightOption(select, option);
									});
								}):
								
								//each time the user clicks on a custom select element 
								select.addEventListener('click', function (event) {
									toggleOptList(select);
								});
						
								//widget gains focuse 	
								select.addEventListener ('focus', function(event) {
									activeSelect(select, selectList);
								});	
					
								//widget looses focus 
								select.addEventListener('blur', function(event) {
									deactivateSelect(select);
								}):
							}):
						}):
					```
				* handling the widgets value 
					* use a native widget as a vehicle 
					```
						//function updates the displayed value and synchronizes it with the native widget 
						// parameters
						//	1. select: DOM node with the class `select` containing the value to update 
						// 	2. index: the index of the value to be selected 
						function updateValue(select, index) {
							//get the native widget 
							var nativeWidget = select.previousElementSibling;
							
							//we also need to get the value placeholder of our custom widget 
							var value = select.querySelector('.value');
							
							//and we need the whole list of options 
							var optionList = select.querySelectorAll('.option');
								
							//we set the selected index to the index of our choice 
							nativeWidget.selectedIndex = index;
						
							//update the value placeholder 
							value.innerHTML = optionList[index].innerHTML;	
							
							//highlight the corresponding option of our own custom widget 
							highlightOptions(select, optionList[index]);	
						}; 
						
						//function returns the current selected index in the native widget 	
						//parameter : 
						// 	1. select: the DOM node with the class `select` related to the native widget 
						function getIndex(select) {
							//access the native widget for the give custom widget 
							var nativeWidget = select.previousElementSibling;
							return nativeWidget.selectedIndex;
						};

						//bind the native widget to the custom eone 
						//handle event binding when document is loaded 
						window.addEventListener('load', function () {
							var selectList = document.querySelectorAll('.select');
						
							//custom widget needs to be initialized 	
							selectList.forEach(function (select) {
								var optionList = select.querySelectorAll('.option'),
									selectedIndex = getIndex(select);
		
							//we make our custom widget focusable 
							select.tabIndex = 0;
						
							//we make the native widget no longer focusable 
							select.previousElementSibling.tabIndex = -1;

							// make sure that the default selected value is correctly displayed 
							updateValue(select, selectedIndex);
					
							//each time a user clicks on an option, we update the value accordingly 
							optionList.forEach(function (option, index){
								option.addEventListener('click', function(event) {
									updateValue(select, index);
								}):
							});
				
							//each time a user us its keyboard on a focused widget we update the value accordingly 
							select.addEventListener ('keyup', function (event) { 
								var length = optionList.length, 
									index = getIndex(select);
								
								// the user hit the down arrow we jump to the next option 
								if (event.keyCode === 40 && index < length - 1) { index ++;}
								
								// the user hit the up arrow we jump to the previous option 
								if (event.keyCode === 38 && index > 0 {index--;}
								
								updateValue(select, index);
							}):
						});
					});
				```
			* making it accessible 
				* assitive tech would have no idea how to deal with this element 
				* [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA)
					* accessible rich internet application 
					* makes the web more semantic 
				* [role attribute](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Techniques)
					* accepts a value that defines what an element is used for 
				* aria-selected attribute 
					* used to mark which option is currently selected 
			* as usual [jQuery has a thing for UI elements](http://jqueryui.com/)
	* [sending forms through javascript](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Sending_forms_through_JavaScript) 			
		* gaining control over the global interface 
			* remain in control of the user interface 
		* how is [ajax](https://developer.mozilla.org/en-US/docs/AJAX) different		
			* ajax techniques rely mostly on [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) (XHR) DOM objects
				* allows you to build http request, send them, and retrieve the results of those requests 
				* works with both xml and json 
					* neither fit the structure of form data requests 
						* form data request are url-encoded lists of key/value pairs 
						* for binary data the whole http request is changed to deal with it 
		* sending form data 
			* three ways to send form data 
				* [building a DOM in a hidden iframe (legacy)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Sending_forms_through_JavaScript#Building_a_DOM_in_a_hidden_iframe)
					* build a form using the DOM Api and then send the data into a hidden [iframe](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe) 
						* retrieve the content of the hidden `<iframe>` to access the result of what you sent 
					* this is a bad idea and you will get hacked 
				* [building an XMLHttpRequest manually](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Sending_forms_through_JavaScript#Building_an_XMLHttpRequest_manually)
					* to do this you must encode the data properly all data must be url-encoded 
						* here you manually encode data 
						* sounds like a bitch 
				* [using XMLHttpRequest and the FormData object](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Sending_forms_through_JavaScript#Using_XMLHttpRequest_and_the_FormData_object)
					* the [FormData] (https://developer.mozilla.org/en-US/docs/Web/API/FormData) object is dope
						* used in two ways 
							* build a set of data to transmit 
							* get the data represented by a given form element to manage how it gets sent 
						* FormData objects are write only objects, you cannot read them 
					* this is a good idea 
					* building a set of data to transmit example  
						* html 
							`<button type="button" onclick="sendData({test: 'ok'})">Click Me!</button>`
						* js 
							```
								function sendData(data) {
									var XHR = new XMLHttpRequest();
									var FD 	= new FormData();
								
									// we push our data into our FormData object 
									for (name in data) {
										FD.append(name, data[name]);
									} 
						
									//we define what will happeen if the data are successfullly sent 
									XHR.addEventListener('load', function(event) {
										alert('Yeah! Data sent and response loaded.');
									});

									//define what happens if this goes south 
									XHR.addEventListener('error', function(event) {
										alert('noooo! your shit broke');
									});
								
									//we setup our request 
									XHR.open('POST', 'http://ucommbieber.unl.edu/cors/cors.php');
									
									//we just send our FormData object, HTTP headers are set automatically 
									XHR.send(FD);
								}
							```
					* using formdata bound to a form element 
						* html 
							```
								<form id="myForm">
									<label for="myName">Send me your name:</label>
									<input id="myName" name="name" value="john">
									<input type="submit" value="send me!">
								</form>
							```
						* js 
							```	
								window.addEventListner ('load', function() {
									function sendData () {
										var XHR = new XMLHttpRequest();
										
										//bind form data object and the form elemetn 
										var FD = new FormData(form);
							
										// define what will happen if the data are successfully sent 
										XHR.addEventListener('load', function(event) {	
											alert(event.target.responseText);
										});	
			
										//define what will happen in case of error 
										XHR.addEventListener('error', function(event) {
											alert('nope shit broke');
										});
								
										//we setup our request 
										XHR.open('POST', 'http://uncommbierber.unl.edu/cors/cors.php');	
								
										//the data sent are the one the user provide in the form 
										XHR.send(FD);
									}


									// we need to access the form element 
									var form = document.getElementById('myForm');	
					
									// to takeover its submit event 
									form.addEventListener('submit', function(event){
										event.preventDefault();
										sendData();
									});
								});
							```
		* dealing with binary data 
			* many sources for binary data in modern web 
				* [FileReader](https://developer.mozilla.org/en-US/docs/Web/API/FileReader) api
					* more information on the [filereader api and web](https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications)
				* [canvas](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement) api
			* sending binary data with browsers that support [FormData](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/FormData)
		* use the FileReader api by hand to acces the binary data 
			* html 
				```
					<form id="myForm">
						<p>
							<label for="i1">text data:</label>
							<input id="i1" name='myText' value='Some text data'>
						</p>
						<p>
							<label for='i2'>file data:</label>
							<input id='i2' name='myFile' type='file'>
						</p>
						<button>Send Me!</button> 
					</form>
				```
			* js 
				```	
					//initialize scrip on pade load 
					window.addEventListner("load", function() {
						// this variable will be used to store the form data 
						var text = document.getElementById("i1");
						var file = {
							dom 	: document.getElementById("i2"),
							binary	: null
						};
						
						//we use the filereader api to access our file content 
						var reader = newFileReader 			
						
						//because the filereader api is asynchronous we need to store its result when it has finished reading the file 
						reader.addEventListener ('load', function() {
							file.binary = reader.result;	
						});
						
						// at page load if a file is already selected we read it 
						if(file.dom.files[0]){
							reader.readAsBinaryString(file.dom.files[0]);
						}
							
						//however we will read teh file once the user selected it 
						file.dom.addEventListener('change', function() {
							if (reader.readyState === FileReader.LOADING) {
								reader.abort();
							}
							
							reader.readAsBinaryString(file.dom.files[0]);
						});	

						//the sendData function is our main function 
						function sendData() {
							//first if there is a file selected we wait for it to be read 
							// if not we delatu the execution of the function 
							if(!file.binary && file.dom.files.length > 0) {
								setTimeout(sendData, 10);
								return; 
							}
							
							// to construct our multipart form data request 
							// need XMLHttpRequest instance 
							var XHR = new XMLHttpRequest();
					
							//need a seperator to define each part of the request 
							var boundary = "blob";
				
							// we will store our body request as a string 	
							var data = "";
				
							//if the user has selected a file 
							if (file.dom.files[0]) {
								//we start a new part in our body's request 
								data += "--" + boundary + "\r\n";
					
								//we sait its form data
								data += "content-disposition: form-data;"
								// we define the name of the form data 
									+ "name='" + file.dom.name + "';"
								// provide the real name of the file 
									+ 'filename="' + file.dom.files[0].name + '"\r\n';
								//we provide the mime type of the file 
								data += 'Content-Type: ' + file.dom.files[0].type + '\r\n';
			
								// there is always a blank line between the meta-data and the data 
								data += '\r\n';
								
								//we happen the binary data to our bodys request 
								data += file.binary + '\r\n';
							}
							
							//for text data its simple 
							// new part in our bodys request 
							data += "--" + boundary + "\r\n";
						
							//we said its form data and give it a name 
							data += "content-disposition: form-data; name='" + text.name + "'\r\n";
							
							//there is always a blank line between the meta-data and the data 
							data += '\r\n';
				
							// add the text data to our body request 
							data += text.value + '\r\n';
		
							// once we are done we close the body request 
							data += '--' + boundary + '--';
							
							//define what will happen if the data are sent successfully 
							XHR.addEventListener ('load', function(event) {
								alert('yeah! data sent and response loaded');
							});
						
							//define what will happen in case of error 
							XHR.addEventListener('error', function(event) {
								alert('shit broke');
							});
			
							// setup our request 
							XHR.open('POST', 'http://ucommbieber.unl.edu/cors/cors.php');
				
							//we add the required http header to handle multipart form data post request 
							XHR.setRequestHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
							XHR.setRequestHeader('Content-Length', data.length);
		
							//we sned the data 
							// for firefor it s not send()
							XHR.sendAsBinary(data);
						}
					
						/// need access to form 
						var form = document.getElementById('myForm');
			
						//take over the submit event 
						form.addEventListener( 'submit', function(event) {
							event.preventDefault();
							sendData();
						});
					});
				```
	* [using FormData objects](https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects)
		* creating a FormData object from scratch 
			* built purely from JS
				```
					var formData = new FormData();
					
					formData.append('username', "Groucho");
					formData.append('accountnum', 123456); //number converted to string 
				
					//html file inpu chosen by user 
					formData.append('userfile', fileInputElement.files[0]);
					
					//js file-lie object 
					var content = '<a id="a"><b id="b">hey!</b></a>'; // the body of the new file 
					var blob = new Blob([content], {type: 'text/xml'});

					formData.append('webmasterfile', bob);
					
					var request = new XMLHttpRequest();
					request.open('POST', "http://foo.com/submitform.php");
					request.send(formData);
				```				
		* retrieving a FormData object from an HTML form 
			* js
				```
					// form retrieved 
					var someFormElement = document.querySelector('form');
					var formData = new FormData(someFormElement);	
						
					// form sent 
					var request = new XMLHttpRequest();
					request.open('POST', 'submitform.php');
					request.send(formData);
				```
	* [using files from web applications](https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications)
		* yay files and browsers 
		* accessing selected files 
			* the file api makes it possible to access a [FileList](https://developer.mozilla.org/en-US/docs/Web/API/FileList) containing [File](https://developer.mozilla.org/en-US/docs/Web/API/File) selected by the user 
			* html 
				* `<input type="file" id="input">`
				* accessing one selected file 
					* js 
						```
							//vanila js 
							var selectedFile = document.getElementById('input').files[0];
						
							// jQuery 	
							var selectedFile = $('#input').get(0).files[0];
							var selectedFile = $('#input')[0].files[0];
					 	```
		* accessing selected files on a change event 
			* html 
				* `<input type="file" id="input" onchange="handleFiles(this.files)">`
				* when shit changes the function will be called 
				* can use the `multiple` attribute to allow multiple files
		* dynamically adding a change listener 
			* if input field created dynamically you need to manually add the event listener 
				* js 
					```
						var inputElement = document.getElementById('input');
						inputElement.addEventListener('change', handleFiles, false);
						function handleFiles(){
							var fileList = this.files;
							//handle the fucking files mate 
						}
					```
		* getting information about selected files 
			* check the length of `FileList` to see how many files are there 
				* js 
					* `var numFiles = list_of_files.length;`
			* individual file objects are retrieved like an array 	
				* js 
					* `var file = list_of_files[0]`
			* file object have three important attributes 
				* name 	
					* the file name as a readonly string 
				* size 
					* the size of the file in bytes as a read-only 64-bit integer 
				* type 
					* the MIME type of the file as a read-only string or "" if undetermined 
		* using hidden file input elements using the click() method 
			* html 
				```
					<input type="file" id="fileElem" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)">
					<a href="#" id="fileSelect">Select some files</a>
				```
			* js 
				```
					//handles click event 
					var fileSelect = document.getElementById('fileSelect'), 
						fileElem = document.getElementById('fileElem');
					
					fileSelect.addEventListener('click', function(e) {
						if (fileElem) {
							fileElem.click();
						}
						e.preventDefault();
					}, false);
				```
		* showing thumbnails of user-selected images 
			* js  
				```
					function handleFiles(files){
						for (var i=0; i < files.length; i++) {
							var file = files[i];
							var imageType = /^image\//;
								
							if (!imageType.test(file.type)){
								continue;
							}
						
							var img = document.createElement('img');
							img.classList.add('obj');
							img.file = file;
							preview.appendChild(img); //this assumes that preview is the div output for content 
							
							var reader = new FileReader();
							reader.onload = function(aImg) {return function(e) {aImg..src = e.target.result;};})(img);
							reader.readAsDataURL(file);
						}
					}
			* key point is adding the file attribute to each image 		
			* the filereader is to let the browser read a provided file 
		* uploading user selected-file 
		* handling the upload process for a file asynchronously 
		* using object urls to display pdf 
		* using object urls with other file types 
		
# June 28th - CSS, javascript, and file uploads but not research actually making the thing do the thing 

woooo learned enough. lets build 

#### questions 
	
* Why wont the thing [center with margin: 0 auto;](http://stackoverflow.com/questions/963636/why-cant-i-center-with-margin-0-auto)?
	* i cheated. made it a block element so that it would take the whole width of the elemnt and then used text-align: center cause it was text.
		* this centering shit is the devil 

* What is normal flow?

* How does css overflow work?


# June 29th - Enginner bullshit html properties 

okay so basically the try random shit until works strategy did not work. So now i need to slow down, understand how all the components work and actually engineer out a solution. Math not Science. 

#### questions 

* what does a document being unloaded mean?

* what is a web storage area?

* what is a context menu?

* what is the difference between [onmouseover](http://www.w3schools.com/tags/ev_onmouseover.asp) and [onmousemove](http://www.w3schools.com/tags/ev_onmousemove.asp)?

* what is an abort in the web media context?

* what is a `<track>` element?

* what is a seeking attribute?
	
* what is a message. is it connected to [this](http://www.w3schools.com/tags/ref_httpmessages.asp)?

* what are [DOM levels](http://stackoverflow.com/questions/6629093/what-are-dom-levels)? 

* what is the life cycle of an event?
	* three phases 
		* capture 
		* target 
		* bubbling

* what is an "event flow"?
	* basically the lifecycle of an event 

* how do window objects work?
	* represents an open window in a browser, can have multiple in a page using `<iframe>`


* what is a meta key? 

* what is the difference between a [node object and an element object](http://stackoverflow.com/questions/9979172/difference-between-node-object-and-element-object)?
	* node is an abstract class never really used but inherited from by different html objects including element 
		* in essense there is relatively no difference, except element has additional characteristics over node 

* what is a [DOMString](https://developer.mozilla.org/en-US/docs/Web/API/DOMString)?

* what is a [NamedNodeMap](https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap)?

* what is a [Number in the javascript context](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)?

* what is a [HTMLCollection](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection)?

* what is a [DOMTokenList](https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList)?

* what is a [shadow element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Shadow)?

* what is a [boolean in the context of javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?

* what is a [pointerEvent](https://developer.mozilla.org/en-US/docs/Web/API/PointerEvent)?

* what is a [shadowDom](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Shadow_DOM)?










* html objects 
	* html DOM nodes 
		* in the html DOM 
			* everything is a node 
			* the document is a document node 
			* all html elements are element nodes 
			* all html attributes are attribute nodes 
			* test inside html elements are text nodes 
			* comments are comment nodes 
	* [EventTarget](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget)
		* an interface implemented by objects that can receive events and may have listeners for them 
		* methods 
			* addEventListener()
				* register an event handler of a specific event type on the EventTarget 
			* removeEventListener()
				* removes an event listener from the EventTarget 
			* dispatchEvent()
				* dispatch an event to this EventTarget
	* [Node object](https://developer.mozilla.org/en-US/docs/Web/API/Node)
		* inherits from [EventTarget](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget)
		* essentially exists to be inherited from like sass placeholder classes 
			* DOM elements that inherit from it 
				* Document 
				* Element 
				* CharacterData 
				* ProcessingInstruction 
				* DocumentFragment 
				* DocumentType 
				* Notation 
				* Entity 
				* EntityReference 
		 * properties 
			* baseURI 
				* returns a DOMString representing the base URL 
			* childNodes
				* returns a live NodeList containing all the children of this node 
					* live means that if the children of the Node change the NodeList is automatically updated 
			* firstChild 
				* returns a Node representing the first direct child node of the node or null if there are no children 
			* lastChild 
				* returns a node representing the last direct child node of the node or null if there are no children 
			* nextSibling 
				* returns a Node representing the next node in the treee or null if there is no next node 
			* nodeName 
				* returns a DOMString containing the name of the node. 
			* nodePrincipal 
				* a [nsIPrincipal](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIPrincipal) representing the node principal 
			* nodeType 
				* returns an unsigned short representing the type of node 
					* ELEMENT_NODE: 1 
					* ATTRIBUTE_NODE: 2 - DEPRECATED 
					* TEXT_NODE: 3 
					* CDATA_SECTION_NODE: 4 - DEPRECATED 
					* ENTITY_REFERENCE_NODE: 4 - DEPRECATED 
					* ENTITY_NODE: 6 - DEPRECATED 
					* PROCESSING_INSTRUCTION_NODE: 7 
					* COMMENT_NODE: 8 
					* DOCUMENT_NODE: 9 
					* DOCUMENT_TYPE_NODE: 10 
					* DOCUMENT_FRAGMENT_NODE: 11 
					* NOTATION_NODE: 12 - DEPRECATED 
			* nodeValue
				* a DOMString representing the value of an object, for most Node types this returns null and set operations are ignored 
					* TEXT_NODE, COMMENT_NODE, PROCESSING_INSTRUCTION_NODE
						* value corresponds to the text data contained in the object 
			* ownderDocument
				* returns the document that this node belongs to, if none returns null 
			* parentNode 
				* returns a Node that is the parent of this node, if none returns null
			* parentElement 
				* returns an element that is the parent of this node, if none returns null 
			* previousSibling 
				* returns a node representing the previous node in the tree or null if none 
			* rootNode 
				* returns a node object representing the topmost node in tree, found by walking backwards allong the parentNode until top reached 
			* textContent
				* is a DOMString representing the textual content of an element and all its descendants 
		* methods 
			* inherits methods deom EventTarget 
			* appendChild()
				* insert a node as the last child node of this element 
			* cloneNode()
				* clone a node and optionally all of its contents. by default clones the content of the node 
			* compareDocumentPosition()
				* crazy shit 
			* contains()
				* returns a boolean value indicating whether a node is a descendant of a given node or not 
			* hasChildNodes()
				* returns a boolean indicating if the element has any child nodes or not 
			* insertBefore()
				* inserts the first node given in a parameter immediately before the second child of this element
			* isEqualNode()
				* returns a boolean which indicates whether or not two nodes are of the same type and all their defining data points match 
			* isSameNode()
				* returns a boolean value indicating whether or not the two nodes are the same 
			* normalize()
				* clean up all the text nodes under this element (merge adjacent, remove empty) 
			* removeChild()
				* removes a chile node from the current element which must be a child of the current node 
			* replaceChild()
				* replaces one child node of the current one with the second one given in parameter 
	* [Window object](http://www.w3schools.com/jsref/obj_window.asp)
		* represents an open window in a browser 
		* if a document contains frames (`<iframe>` tags) the browser creates one window object for the html document and one window object for each frame
		* properties 
			* closed 
				* returns a boolean value indicating whether a window has been closed or not 
			* defaultStatus 
				* sets or returns the default text in the statusbar of a window 
			* document 
				* returns the document object for the window 
			* frameElement 
				* returns the <iframe> element in which the current window is inserted 
			* frames 
				* returns all <iframe> elements in the current window 
			* history 
				* returns the history object for the window 
			* innerHeight
				* returns the inner height of a windows content area 
			* innerWidth 
				* returns the inner width of a windows content area 
			* length 
				* returns the number of <iframe> elements in the current window 
			* localStorage 
				* returns a reference to the local storage object used to store data. stores data with no expiration date 
			* location 
				* returns the location object for the window 
			* name 	
				* sets or returns the name of a window 
			* navigator 
				* returns the navigator object for the window 
			* opener 
				* returns a reference to the window that created the window 
			* outerHeight
				* returns the outer height of a window including toolbars/scrollbars 
			* outerWidth 
				* returns the outer width of a window inlcuding toolbars/scrollbars 
			* pageXOffset 
				* returns the pixels the current document has been scrolled (horizontally) from the upper left corner of the window 
			* pageYOffset 
				* returns the pixels the current document has been scrolled (vertically) from the upper left corner of the window 
			* parent 
				* returns the parent window of the current window 
			* screen 
				* returns the screen object for the window 
			* screenLeft 
				* returns the horizontal coordinate of the window relative to the screen 
			* screenTop
				* returns the vertical coordinate of the window relative to the screen 
			* screenX 
				* returns the horizontal coordinate of the window relative ot the screen 
			* screenY 
				* returns the vertical coordinate of the window relative to the screen 
			* session storage 
				* returns a reference to the local storage object used to store data
				* stores data for one session (lost when the browser tab is closed) 
			* scrollX
				* an alias of pageXOffset 
			* scrollY 
				* an alias of pageYOffset 
			* self 
				* returns the current window 
			* status 
				* sets or returns the text in the statusbar of a window 
			* top 
				* returns the topmost browser window 
		* methods 
			* alert()
				* displays an alert box with a message and an OK button 
			* atob()
				* decodes a base-64 encoded string 
			* blur()
				* removes focus from the current window 
			* btoa()
				* encodes a string in base-64 
			* clearInterval()
				* clears a timer set with setInterval()
			* clearTimeout()
				* clears a timer set with setTimeout()
			* close()
				* closes the current window 
			* confirm()
				* displays a dialog box with a message and an OK and a Cancel button 
			* focus()
				* sets focus to the current window 
			* getComputedStyle()
				* gets the current computed css styles applied to an element 
			* getSelection()
				* returns a selection object representing the range of text selected by the user 
			* matchMedia()
				* returns a MediaQueryList object representing the specified CSS media query string 
			* movesBy()
				* moves a window relative to its current position 
			* moveTo()
				* moves a window to the specified position 
			* open()
				* opens a new browser window 
			* print()
				* prints the content of the current window 
			* prompt() 
				* displays a dialog box that prompts the visitor for input 
			* resizeBy()
				* resizes the window by the specified pixels 
			* resizeTo()
				* resizes the window to the specified width and height 
			* scrollBy()
				* scrolls the document by the specified number of pixels 
			* scrollTo()
				* scrolls the document to the specified coordinates 
			* setInterval()
				* calls a function or evaluates an expression at specified intervals 
			* setTimeout()
				* calls a function or evaluates an expression after a specified number of miliseconds 
			* stop()
				* stops the window from loading 
	* [document object](http://www.w3schools.com/jsref/dom_obj_document.asp)
		* when an html document is loaded into a web browser it becomes a document object 
			* the document object is the root node of the html document and owns all the other nodes 
		* the document is part of the window object and accessed as window.document 
		* inherits from the Node object 
		* properties 
			* activeElement
				* returns the currently focused element in the document 
			* anchors 	
				* returns a collection of all <a> elements in the document that have a name attribute 
			* applets 
				* returns a collection of all <applet> elements in the document 
			* baseURI 
				* returns the absolute base URI of a document 
			* body 
				* sets or returns the documents body 
			* cookie 
				* returns all name/value pairs of cookies in the document 
			* doctype 
				* returns the document type declaration associated with the document 
			* documentElement 
				* returns the document element of the document 
			* documentMode 
				* returns the mode used by the browser to render the document 
			* documentURI 
				* sets or returns the location of the document 
			* domain 
				* returns the domain name of the server that loaded the document 
			* embeds 
				* returns a collection of all <embed> elements in the document 
			* forms 
				* returns a collection of all <form> elements in the document 
			* head 
				* returns the <head> element of the document 
			* images 
				* returns a collection of all <img> elements in the document 
			* implementation 
				* returns the DOMImplementation object that handles this document 
			* inputEncoding 
				* returns the encoding, the character set, used for the document 
			* lastModified 
				* returns the date and time the document was last modified 
			* links 
				* returns a collection of all <a> and <area> elements in the document that have a href attribute 
			* readyState 
				* returns the (loading) status of the document 
			* referrer 
				* returns the url of the document that loaded the current document 
			* scripts 
				* returns a collection of <script> elements in the document 
			* strictErrorChecking 
				* sets or returns whether error-checking is enforced or not 
			* title 
				* sets or returns the title of the document 
			* url 
				* returns the full url of the HTML document 
		* methods 
			* addEventListener()
				* attaches an event handler to the document 
			* adoptNode()
				* adopts a node from another document 
			* close()
				* cloes the output stream previously opened with document.open()
			* createAttribute()
				* creates an attribute node 
			* createComment()
				* creates a comment node with the specified text 
			* createDocumentFragment()
				* creates an empty documentFragment node 
			* createELement()
				* creates an element node 
			* createTextNode()
				* creates a Text node 
			* getElementById()
				* returns the element that has the ID attribute with the specified value 
			* getElementsByClassName()
				* returns a NodeList containing all elements with the specified class name 
			* getElementsByName()
				* returns a NodeList containing all elements with a specified name 
			* getElementsByTagName()
				* returns a NodeList containing all elements with the specified tag name 
			* hasFocus()
				* returns a boolean value indicating whether the document has focus 
			* importNode()
				* imports a node from another document 
			* normalize()
				* removes empty Text nodes, and joins adjacent nodes 
			* normalizeDocument()
				* removes empty text nodes and joins adjacent nodes 
			* open() 
				* opens an html ouput stream to collect output from document.write(), closed by document.close()
			* querySelector()
				* returns the first element that matches a specified CSS selector in the document 
			* querySelectorAll()
				* returns a static NodeList containing all elements that matches a specified CSS selector in the document 
			* removeEventListener()
				* removes an event handler from the document 
			* renameNode()
				* renames the specified node 
			* write()
				* writes an html expressions or js code to a document 
			* writeIn()
				* same as document.write() but adds a newline character after each statement 
	* [element](https://developer.mozilla.org/en-US/docs/Web/API/Element)
		* an object node of a document 
		* properties 
			* inherits from node 
			* attributes
				returns a NamedNodeMap that lists all attributes associated with the element 
			* childElementCount 
				* is a number representing the number of child nodes that are elements 
			* children 
				* is a live HTMLCollection containing all child elements of the element as a collection 
			* classList 
				* returns a DOMTokenList containing the list of class attributes 
			* className
				* is a DOMString representing the class of the element 
			* id 
				* is a DOMString representing the id of the element 
			* innerHTML 
				* is a DOMString representing the markup of the elements content 
			* lastElementChild 
				* is a element, the last direct child element of an element or null if the element has no element children 
			* localName 
				* a DOMString representing the local part of the qualified name of the element 
			* nextElementSibling 
				* is a element immediately following the given one in the tree or null if there is no sibling node 
			* previousElementSibling 
				* is a element immediately preceding the given one in the tree or null if there are no sibling element 
			* tagName 
				* returns a string with the name of the tag for the given element 
			* Experimental properties - no bueno production 
				* clientHeight
					* returns a Number representing the inner height of the element 
				* clientLeft 
					* returns a number representing the width of the left border of the element 
				* clientTop
					* returns a number representing the width of the top border of the element 	
				* clientWidth 
					* returns a number representing the inner width of the element 	
				* firstElementChild 
					* is a element the first direct child element of an element or null if there are no child elements 
				* outerHTML 
					* is a DOMString representing the markup of the element including its content when used as a setter replaces the element with nodes parsed from the given string 
				* scrollHeight 
					* returns a number representing the scroll view height of an element 
				* scrollLeft 
					* is a number representing the left scroll offset of the element 
				* scrollLeftMax 
					* returns a number representing the maximum left scroll offset possible for the element 
					* has yet to be standardized 
				* scrollTopMax 	
					* returns a number representing the maximum top scroll offset possible for the element 
					* has yet to be standardized 
				* scrollWidth 
					* returns a number representing the scroll view width of the element 
				* shadowRoot 
					* returns the youngest shadow root that is hosted by the element 
				* tabStop 
					* is a boolean indicating if the element can receive input focus via the tab key 
					* is not yet standardized
 	* methods 
		* inherits from Node and EventTarget 
		* addEventListener()
			* registers an event handler to a specific event type on the element 
		* dispatchEvent()
			* dispatches an event to this node in the DOM and returns a boolean that indicates that at least one handler has not canceled it 
		* getAttribute()
			* retrieves the value of the names attribute from the current node and returns it as an object 
		* getAttributeNS()
			* retrieves the value of the attribute with the specified name and namespace from the current node and returns it as an object 
		* getBoundingClientRect()
			* method returns the size of an element and its position relative to the viewport 
		* getClientRects()
			* returns a collection of rectangles that indicate the bounding rectangles for each line of text in client 
		* getElementByClassName()	
			* returns a live HTMLCollection containing all descendant elements of a particular tag name from the current element 
		* getElementsByTagName()
			* returns a live HTMLCollection containing all descendant elements of a particular tagname from the current element 
		* getElementsByTagNameNS()
			* returns a live HTMLCollection containing all descendant elements of a particular tagname and namespace from the current element 
		* hasAttribute()
			* returns a boolean indicating if the element has the specified attribute or not 
		* hasAttributeNS()
			* returns a boolean indicating if the element has the specified attribute in the specified namespace or not 
		* hasAtrributes()
			* returns a boolean indicating if the element has one or more HTML attributes present 
		* querySelector()
			* returns the first Node which matches the specified selector string relative to the element 
		* querySelectorAll()
			* returns a NodeList of nodes which match the specified selector string relative to the element 
		* releasePointerCapture()
			* releases pointer capture that was previously set for a specific pointer event 
		* remove()
			* removes the element from the children list of its parent 
		* removeAttribute()	
			* removes the names attribute from the current node 
		* removeAttributeNS()
			* removes the attribute with the specified name and namespace from the current node 
		* removeEventListener()	
			* removes an event listener from the element 
		* setAttribute()
			* sets the value of a named attribute of the current node 
		* setAttributeNS()
			* sets the value of the attribute witht he specified name and namespace from the current node 
		* setPointerCapture()
			* designates a specific element as the capture target of future pointer events 
		* experimental - no bueno production 
			* attachShadow()
				* attaches a shadow DOM tree to the specified element and returns a reference to its shadowRoot 
			* animate()
				* a shortcut method to create and run an animation on an element
				* returns the created animation object instance 
			* closest()
				* returns the element descendant of this element that is the closest ancestor of the elements selected by the selectors given in parameter
 			* createShadowRoot()
				* creates a shadow DOM on the element turning it into a shadow host
				* returns ShadowRoot
			* insertAdjacentElement()
				* inserts a given element node at a given position relative to the element it is invoked upon 
			* insertAdjacentHTML()
				* parses the text as HTML or XML and inserts the resulting nodes into the tree in the position given 
			* insertAdjacentText()
				* inserts a given text node at a given position relative to the element it is invoked upon 
			* matches()
				* returns a boolean indicating whether or not the element would be selected by the specified selector string 
			* requestFullscreen()
				* asynchronously ask the browser to make the element full-screen 
			* requestPointerLock()
				* allows to asynchrounously ask for the pointer to be locked on the given element 
			* scrollIntoView()
				* scrolls the page until the element gets into the view 
			* setCapture()
				* sets up mouse event capture redirecting all mouse events to this elements 
				* the api is not standardized 
			
		




##### events 

* html events 
	* can be something that the browser does 
	* can be something that a user does 
	* detectable by javascript 
	* event handlers 
		* scripts that are bound to events to perfom some sort of actions 
	* global event attributes 
		* window event attributes 
			* onafterprint 
				* event triggered after the document is printed 
			* onbeforeprint
				* event triggered before the document is printed 
			* onbeforeunload
				* event triggered when the document is about to be unloaded
			* onerror
				* event triggered when an error occurs 
			* [onhashchange](http://www.w3schools.com/tags/ev_onhashchange.asp)
				* event triggered there has been changes to the anchor part of a url 
			* onload
				* legacy 
				* event fired after the page is finished loading 
			* onmessage	
				* event fired when a message is triggered 
			* onoffline
				* event fired when the browser starts to work offline 
			* ononline 
				* event fired when the browser starts to work online 
			* onpagehide 
				* event fired when a user navigates away from a page 
			* onpageshow 
				* event fired when a user navigates to a page 
			* onpopstate
				* event fired when the windows history changes 
			* onresize 
				* event fired when the browser window is resized 
			* onstorage 
				* event fired when a web storage area is updated
			* onunload 
				* legacy 
				* event fired once a page has unloaded 
		* form events 
			* events triggered by actions inside html forms (applies to most html elements, designed in the context of forms)
			* onblur 
				* legacy 
				* event fired when an element loses focus 
			* onchange 
				* legacy 
				* event fired when the value of an element is changed 
			* oncontextmenu
				* event fired when a context menu is triggered 
			* onfocus 
				* legacy 
				* event fired when the element gets focus 
			* oninput 
				* event fired when an element gets user input 
			* oninvalid 
				* event fired when an element is invalid 
			* onreset 
				* event fired when the reset button in a form is clicked 
			* onsearch 
				* legacy 
				* event fired when the user writes into a `<input type="search">` field 
			* onselect 
				* legacy 
				* event fired after some text has been selected in an element 
			* onsubmit 
				* legacy 
				* event fired when a form is submitted 
		* keyboard events 
			* events trigged by the keyboard 
			* onkeydown 
				* legacy 
				* event fired when a user is pressing a key 		
			* onkeypress 
				* legacy 
				* event fired when a user is pressing a key 
			* onkeyup 
				* legacy 
				* event fired when a user releases a key 
		* mouse events 
			* events triggered by the mouse. these are important 
			* onclick
				* legacy 
				* event fired when a mouse clicks on an element 
			* ondblclick
				* legacy 
				* event fired when a mouse double clicks on an element 
			* onmousedown 
				* legacy 
				* event fired when a mouse button is pressed down on an element 
			* onmousemove 
				* legacy 
				* event fired when a mouse pointer is moving while it is over an element 
			* onmouseout 
				* legacy 
				* event fired when a mouse pointer moves out of an element 
			* onmouseover
				* legacy 	
				* event fired when a mouse pointer moves over an element 
			* onmouseup 
				* legacy 	
				* event fired when a mouse button is released over an element 	
			* ondrag 
				* event fired when an element is dragged 	
			* ondragend 
				* event fired when an element is no longer in drag motion 
			* ondragenter 
				* event fired when an element has been dragged to a valid drop target 
			* ondragleave 
				* event fired when an element has left the area of a valid drop target 
			* ondragover
				* event fired when an element is being dragged over a valid drop target 
			* ondragstart 
				* event fired when an element begins being dragged initially 
			* ondrop 
				* evetn fired when an element is being dragged is dropped 
			* onscroll 
				* event fired when an elements scroll bar is being scrolled 
			* onwheel 
				* event fired when the mouse wheel rolls up or down over an element 
		* clipboard events 
			* events that happen when you fuck with your clipboard 
			* oncopy 
				* legacy 
				* event fired when the user copies the content of an element 
			* oncut 
				* legacy 
				* event fires when the user cuts the content of an element 
			* onpaste
				* legacy 
				* event fires when the user pastes some content in an element 
		* media events 
			* events that are triggered by medias (applies to all html elements but is designed for media elements `<audio>`, `<embed>`, `<img>`, `<object>`, `<video>`)
			* onabort
				* legacy 
				* event fires when an abort?
			* oncanplay
				* event fired when a file is ready to start playing (buffered enough to begin)
			* oncanplaythrough
				* event fired when a file can be played all the way to the end wihtout pausing for buffering 
			* oncuechange 
				* event fired when the cue changes in a <track> element
			* ondurationchange 
				* event fired when the length of the media changes 
			* onemptied 	
				* event fired when something bad happens and the file is suddenly unavailable (designed for unexpected disconnects) 
			* onended 
				* event fired when the media has reached the end of its content 
			* onerror 
				* event fired when the file is being loaded 
			* onloadeddata 
				* event fired when the media data is loaded 
			* onloadedmetadata 
				* event fired when meta data (dimensions, duration) are loaded 
			* onloadstart 
				* event fired when the file begins to load before anything is actually loaded 
			* onpause 	
				* event fired when the media is paused either by the user or programmatically 
			* onplay 
				* event fired when the media is ready to start playing 
			* onplaying 
				* event fired when the media actually has started playing 
			* onprogress 
				* event fired when the browser is in the process of getting the media data 
			* onratechange 
				* event fired each time the playback rate changes 
			* onseeked 
				* event fired when the seeking attribute is set to false indicating that seeking has ended 
			* onseeking 
				* event fired when the seeking attribute is set to true indicating that seeking is active 
			* onstalled 
				* event fired when the browser is unable to fetch the media data for whatever reason 
			* onsuspend 
				* event fired when fetching the media data is stopped before it is completely loaded for whatever reason 
			* ontimeupdate 
				* event fired when the playing position has changed (designed for when a user fast forwards to a different point in the media) 
			* onvolumechange
				* event fired each time the volume is changed (including muting)
			* onwaiting 
				* event fired when the media has paused but is expected to resume (designed for pausing to buffer more data) 
		* misc events 
			* random events 
			* onerror
				* event fired when an error occurs while loading an external file 
			* onshow
				* event fired when a `<menu>` element is shown as a context menu 
			* ontoggle 
				* event fired when the user opens or closes the <details> element 
	* [event object](http://www.w3schools.com/jsref/dom_obj_event.asp) 
		* constants 
			* CAPTURING_PHASE	
				* DOM lv 1
				* the current event phase is the capture phase 
			* AT_TARGET 
				* DOM lv 2 
				* the current event is in the target phase 
					* being evaluated at the event target 
			* BUBBLING_PHASE
				* DOM lv3 
				* the current phase is the bubbling phase 
		* properties 
		 	* bubbles 
				* DOM lv 2 
				* returns whether or not a specific event is a bubbling event 
			* cancelable 
				* DOM lv 2 
				* returns whether or not an event can have its default action prevented 
			* currentTarget 
				* DOM lv 2 
				* returns the element whose event listeners triggered the event 
			* defaultPrevented 
				* DOM lv 3
				* returns whether or not the preventDefault() method was called for the event	
			* eventPhase 
				* DOM lv 2 
				* returns which phase of the event flow is currently being evaluated 
			* isTrusted 
				* DOM lv 3
				* returns whether or not an event is trusted 
			* target 
				* DOM lv 2 
				* returns the element that triggered the event 
			* timeStamp 
				* DOM lv 2 
				* returns the time at which the event was created 
			* type 
				* DOM lv 2 
				* returns the name of the event 
			* view 
				* DOM lv 2 
				* returns a reference to the window object where the event occured 
		* methods 
			* preventDefault()
				* DOM lv 2 
				* cancels the event if it is cancelable 
					* default action of event does not occur 
			* stopImmediatePropagation()
				* DOM lv 3 
				* prevents other listeners of the same event from being called 
			* stopPropagation()
				* DOM lv 2
				* prevents further propagation of an event during event flow 
	* [MouseEvent object](http://www.w3schools.com/jsref/dom_obj_event.asp)
		* event objects triggered by mouse events 
		* altKey 
			* DOM lv 2 
			* returns whetehr the alt key was pressed when the mouse event was triggered 
		* button 	
			* DOM lv 2 
			* returns which mouse button was pressed when the mouse even was triggered 
		* buttons 
			* DOM lv 3
			* returns which mouse buttons were pressed when the mouse event was triggered 
		* clientX
			* DOM lv 2 
			* returns the horizontal coordinate of the mouse pointer, relative to the current window, whne the mouse event was triggered 
		* clientY 
			* DOM lv 2 
			* returns the horizontal coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered 
		* ctrlKey 
			* DOM lv 2 
			* returns whether the key was pressed when the mouse event was triggered 
		* detail 
			* DOM lv 2 
			* returns a number that indicates how many times the mouse was clicked 
		* metaKey 
			* DOM lv 2
			* returns whether the meta key was pressed when an event was triggered
		* pageX 
			* DOM 0 i guess 
			* returns the horizontal coordinate of the mouse pointer, relative to the document, when the mouse event was triggered 
		* pageY 
			* DOM 0 i guess 
			* returns the vertical coordinate of the mouse pointer, relative to the document, when the mouse event was triggerd 
		* relatedTarget 
			* DOM lv 2 
			* returns the element related to the element that triggered the mouse event 
		* screenX
			* DOM lv 2 
			* returns the horizontal coordinate of the mouse pointer, relative to the screen, when an event is triggered 
		* screenY 
			* DOM lv 2 
			* returns the vertical coordinate of the mouse pointer, relative to the screen, when an event is triggered 
		* shiftKey 
			* DOM lv 2 
			* returns whether the shift key was pressed when an event was triggered 
		* which 
			* DOM lv 2 
			* returns which mouse button was pressed when the mouse event was triggered 
	* [DOM event flow](http://www.w3.org/TR/DOM-Level-3-Events/#event-flow)  
		* part of the [UI event specification](http://www.w3.org/TR/uievents/)
		* event flow describes how event objects propagate through a data structure 
			* basically the life cycle of an event 
		* [three phases](https://www.smashingmagazine.com/2013/11/an-introduction-to-dom-events)
			* capture phase 
				* the event starts at the window object and propagates its way down to the target elements parent 
				* event listeners bound to this phase handle the event before it reaches the target
				* fires on each node as it propagates down 
					* builds the propagation path and sets the path that the bubbling phase will take back 
			* target phase 	
				* the event reaches the target element 
				* event listeners bound to this phase handle the event once it has reached its target 
				* if the event is set to not bubble the event stops once this phase is over
				* events always target the most deeply nested elements
			* bubbling phase 
				* the event propagates through the targets ancestors in reverse order until it reaches the window 
				* event listeners bound to this phase handle the event before it reaches the window 
				* the event is fired on every node on its way back to the window from the target 
				* this behavior allows us to listen for events and catch them as they are bubbling back up 
					* prevents setting a million event handlers everywhere, since the event will pass by all the nodes on the propagation path 







		



	









