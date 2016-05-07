
#April 3rd

Learning from the big nerd ranch book. Exploring objective-C, this is going to be annoyingly fun, yet another language hahaha. Will be keeping track of different abstractions and how the whole system works together. I need to follow my own advice and ask the tutorial questions. I need to record all my questions. 

####Question 
* What is the architecture of and app lifecycle of an iOS app?
* What is the Xcode workspace window?
* MVC is a design pattern, what is a design pattern?
* What are other design patterns?

####Vocabulary 

* Workspace window
	* Interface for creating and managing projects

Projects 
A main unit of development in Xcode
Includes all elements needed to build thing, as well as the relationship between each   
  thing	

Navigator area 
	The lefthand side of the workspace window

Navigators 
	Tools that show the developer different components of the entire project

Project navigator 
	Shows a hierarchical representation of how the project is organized but does not 
  equate to the actual file structure 

Editor area 
An area where you make changes to the code and do bulk of the programmatic and 
  configurational work.	

(MVC) Model-View-Controller
	Design pattern used in iOS development. All objects used are either a view object, a 
  model object, or a controller object.


View objects 
	Objects visible to the user, like buttons, text fields, and sliders. They make up the 
  applications user interface. 

Model objects
	Objects that hold data and know nothing about the user interface. So the information 
  side of things.

Controller object 
	Objects that manage an application. They configure the views that the users sees and 
  make sure that the view and model objects keep in sync. They handle the code logic 
  to make shit happen

MVC data flow

USER INPUT ------- user interacts with view object ---------> 
VIEWS ------ view sends message to controller ------> 
CONTROLLER ------- controller updates model objects ----> 
MODEL -------- controller takes data from model objects that its views are interested in ------> 
CONTROLLER ---- controller updates view with changes in model object ---------> 
VIEWS ----> RECIEVES MORE USER INPUT


#April 5th 

Mmm using Objective-C is going to really force me to understand how the whole iOS system exists and works. Which is really good. I wonder how things are gonna go. Kinda ridiculous that i’m relearning all of this shit. Then again i didn’t really learn iOS the first time around did i. I learned how to follow pre-established patterns to create things other people have already created. I did not reach understanding i reached replication. Meh fuck it. Time to do it right.

You have to drag outlets from the controller object to the view object, which kind of makes sense, since the controllers kinda tell the views what to do. I do not like this drag and click shit. 

You drag from the view object to the target action object. I guess this means that the directionality of the way you drag things kinda shows data flow. Like the view sends an action to the controller, the controller sends an update to the view. 

####Questions 
Is it normal to start off an app by building controller objects? Is that standard procedure?
This drag and point shit is ridiculous is there a way to do it completely programmatically?
What is the distinction between @interface and @implementation in the .m file?
What the fuck is a .m file? Please don’t tell me it stands for .main
Does the drag direction show data flow?
If i want to make a button click change the title of the button, would i need an outlet from the controller pointing to the button and an action from the button pointing to a target?
Why the hell is there a dash in the syntax before the IBaction in @implementation?
What does the @ symbol mean in iOS it sure is used a lot?
What are Cocoa Touch’s naming conventions?
What does the iOS application life cycle look like?
How much of a role does the app delegate play in everything?

####Vocabulary 

Method 
	Is a list of instructions to be executed 

XIB
	Stands for XML interface builder

Interface builder 
	A visual tool where you can add and arrange objects to create a graphical user 
  interface
	An object editor, create and configure objects like buttons and labels and then save 
  them into an archive. 
Divides editor area into two sections 
	Dock 
		Left hand side 
		Icon view
Lists the objects in the XIB file as icons
Useful when screen real estate is running low
Outline view
	List the objects in the XIB file in words
	Useful for learning purposes 
	Canvas 
		Right hand side

Utility area
	To the right of the editor area and has two sections 
		Inspector 
			Top section of the utility area 
			Contains settings for the file or object that is selected in the editor area
			Attributes inspector 
				Contains the ability to configure and change some attributes of 
  view objects
Connections inspector 
	Contains a record of all the connections for the selected object
		Library	
			List items that you can add to a file or project
			Object library
				Contains the objects that you can add to a XIB file to compose 
  your interface.
	At the top of each section is a selector for different types of inspectors and libraries

Bundle
	A directory containing the application\'s executable and any resources the executable 
  uses

NIB files 
	XIB files are compiled into NIB files
	NIB files are copied into an application\'s bundle
	At runtime the application will read in, or load, the NIB file when it’s interface is 
  needed. 

Connection 
	Let’ one object know where another object is in memory so that the two objects can 
  communicate
There are two kinds of connections that can be made in the interface builder
	Outlet 
		Points to an object 
	Action 
		A method that gets triggered by a button or some other view that the 
user can interact with, like a slider or a picker

Placeholder 
	Stands in for another object in the running application

Action 
	A message that is sent to an object

Target	
	The object that receives the action from the VIEW object
	Depending on the code contained in the target it triggers things to happen

App delegate 
	Starting point of an application 
	Manages a single top-level UIWindow for the application 
	After the launch point but before the app is ready for user app delegate receives 
  message application:didFinishLaunchingWithOptions: 
	Here the application can be setup for the user
	Must make sure that the interface is ready before the user has a chance to 
  interact with it

Root view controller 
	Look it up 

Classes - green is a prefix - blue is a class 

UIViewController 
	A CONTROLLER object 
BNRQuizViewController 

IBOutlet
	IB stands for interface builder, the notation informs the preprocessor what its fucking 
  With
An outlet is used to point a variable in the controller to a corresponding view object, 
  allowing the controller to communicate and alter the view

IBAction

UILabel
	UI stands for user interface
	A UILabel object is a VIEW object that displays text 

UIButton
	A VIEW object that is a basic interactive tool for the user to exert control over the 
  application
	When tapped it sends a message to a target object
		The message sent is an action 
			The action is the name of the method that contains the code to be 
  executed in response to the button being tapped

UIWindow

Keywords

@property 
@interface
@implementation 
(instancetype)


#April 13th

I got the fucking thing to work!!! When you’re not using storyboard you have to make sure the main interface thing is blank. I guess it must be pointing to something that doesn’t exist or something. 


#April 28th - Ruby

Okay man gonna drink this beer and learn how to script yo mac using ruby. This is the first time i fucking straight doc learn so this should be interesting. Im pretty sure im ready for it. Going to start with high level use of appscript via the fork known as rb-scpt.

I love my fucking terminal. 

Remember to require rb-scpt not appscript

####Questions

What does the : symbol mean in ruby?
What does the => symbol mean in ruby?
Why do the api calls end in .make?
What are scalar types?
What is a first-class query?
What is ASDictionary?

Woah get to learn about apple events super bonus. 

####Vocabulary

Apple events
	High-level message-based interprocess communication 
	Contains typed data describing 
		Attributes 
		How the event should be handled, such as the event’s ‘name’ and
  whether or not a reply is required 
Parameters
Any data to be passed as arguments to the event handler that receives   
  the event
Data types include 
	Common scalar types such as booleans, integers, floats, strings, dates, and file 
  References
Ordered lists
Records (key-value lists where each key is a four-letter code)
Object specifiers, used to construct first-class queries, commonly referred to as   
  application references, that identify objects within an application. These query   
  objects are roughly comparable to XPath or CSS selectors 

Apple scriptable application 
	An application that provides an apple event interface for third-party to use
	Contains a built-in definition of its scripting interface in the form of aete or sdef resources 
  these are programmatically retrieved and used to 
		Support automatic translation of human-readable terminology to four-letter codes 
  in high-level bridges such as AppleScript and appscript 
		Generate basic human-readable documentation by applications such as 
  AppleScript editor and ASDictionary 

(AEOM) Apple event object model 
An idealized, user oriented representation of the application internal data model.
The structure of the object model

Appscript
	Three layers
		AE
			Low-level, mostly Ruby wrapper around mac os X’s apple event manager 
  api
	AEM
		A mid-level wrapper around AE, providing an object-oriented API for 
  building relational AEOM queries and dispatching events
		Appscript 
			High-level wrapper around AEM, providing automatic translation between 
  human readable application terminology and corresponding four-letter   
  codes, and representing relational AEOM queries in an OO-like syntax 
  for ease of use.


#April 30th - Ruby

It’s a saturday gonna learn the rail way. Apparently there are symbols in ruby which are convention constants that are immutable. Immutable means it can’t be changed and that there is only one instance of it. Which is cool to know, thank you David Hargat.

The getting started guide uses WEBrick, will be transitioning to Rack at some point. Both of which are middleware libraries to make server shit easier

Installed vundle and turned on syntax for vim. My vim is now ready to become the most powerful text editor in the world.




####Questions

Seriously what does => mean?
	Assignment of keys to values in hashes : is currently more idiomatic
		thank you Pawan Dubey go HH

some ruby Symbols 
	:plain
		Option to the render command that renders without markdown


