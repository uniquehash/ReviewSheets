# notes on the sfml api 


sfml is a cross platform software development library designed to provide a simple API to various multimedia components in computers

* what is [sfml](https://en.wikipedia.org/wiki/Simple_and_Fast_Multimedia_Library)?
	* [simple and fast multimedia library](https://www.sfml-dev.org/)
	* a cross platform software development library designed to provide a simple API to various multimedia components in computers
	* capabilities
		* creating and inputing to windows
		* creating and managing OpenGL contexts
	* modules
		* system
			* vector and Unicode string classes 
			* portable threading
			* timer facilities
		* window
			* window and input device management including support for joysticks
			* OpenGL context management
		* graphics
			* hardware acceleration of 2D graphics including sprites, polygons and text rendering
		* audio
			* hardware accelerated spatialised audio playback and recording
		* network
			* TCP and UDP network sockets
			* data encapsulation
			* HTTP and FTP classes

* how does the [window module work](https://www.sfml-dev.org/tutorials/2.4/window-window.php)?
	* windows are literal window container
	* window have multiple styles
	* parameters
		* size and widow subclass thing
		* title of window
		* optional style
		* optional OpenGL options
	* feature set
		* you can create multiple windows
		* multiple monitors are not correctly supported yet
		* events must be polled in the windows thread
			* `pollEvent` and `waitEvent` of the event loop must be called in the same thread that created the window
		* on osx windows and events must be managed by the main thread

* how does the [graphics module work](https://www.sfml-dev.org/tutorials/2.4/)?
	*  
