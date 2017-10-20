# notes on flask

* what is [flask](https://en.wikipedia.org/wiki/Flask_(web_framework))?
	* a micro web framework written in python and based on the Werkzeug toolkit and jinja2 template enginge

* what are [major design decisions in flask](http://flask.pocoo.org/docs/0.12/design/#design-decisions-in-flask)?
	* the explicit application object
		* python web applications based on WSGI have to have one central callable object that implements the actual application
		* `Flask` class
			* each flask application has to create an instance of this class itself and pass it the name of the module but why can Flask not do that itself
		* with explicit application object
		```
			from flask import Flask
			app = Flask(__name__)
			
			@app.route('/')
			def index():
				return 'hello world!'
		```
		* without explicit application object
		```
			from hypothetical_flask import route
			
			@route('/')
			def index():
				return 'hello world!'
		```
		* reasons for having an explicit application objects
			* implici application objects require that there may only be one instance at a time
				* during unittesting you may need to have more than one application at the same time
			* you can subclass the base class `Flask` to alter specific behavior
			* package name
				* when you create a Flask instance you usually pass it `__name__` as the package name
				* Flask depends on that information to properly load resources relative to your module 
				* python can access the package to figure out where the templates and static files are stored
				* overall less brittle
			* explicit is better than implicit
				* the object is your WSGI application
				* if you want to apply a WSGI middleware just wrap the WSGI application i.e. your object
	* the routing system
		* Flask uses the Werkzeug routing system which was designed to automatically order routes by complexity
		* routes can be declared in arbitrary order and they will still work as expected
		* routes in Werkzeug try to ensure that URLs are unique
			* automatically redirect to a canonical URL if a route is ambiguous
	* one template engine
		* you can only use one template engine
		* Jinja2 is configured for you
		* each template engines have an understanding of how things work
			* with similar interfaces
		* Jinja2
			* extensive filter system
			* particular template inheritance
			* support for reusable blocks
			* uses unicode for all operations
			* supports iterative template rendering
			* configurable syntax
			* more
		* a templare abstraction layer that would not take the unique features of the template engines away is out of scope for Flask
	* thread locals
		* Flask uses thread local objects 
			* context local objects
		* you put your own things on g
			* request
			* session
			* extra objects
	* what Flask is and what Flask is not
		* Flask will never have a database layer
		* flask just bridges to werkzeug to implement a proper WSGI application and to Jinja2 to handle templating
		* binds to a few common standard library packages such as logging 
		* everything else is to be extended
 
* how do to [build a minimal flask app](http://flask.pocoo.org/docs/0.12/quickstart/)?
	* a minimal flask app
	```
		from flask import Flask
		app = Flask(__name__)
		
		@app.route('/')
		def hello_world():
			return "Hello, World!"
	```
		* imported `Flask` class
			* the instance `app` is our WSGI application
		* create an instance of the class
			* first argument is the name of the applications module or package
				* using a single module use `__name__`
					* depending on if it is started as application or imported as module the name will be different 
				* will tell Flask where to look for templates and static files
		* use the `route()` decorator to tell flask what URL should trigger our function
		* function is given a name which is allso used to generate URLs for that particular function and returns the message we want to display in the users browser
		* run the application using the flask command 
			* first export the `FLASK_APP` environment variable
			```
				export FLASK_app=hello.py
				flask run
				 * Running on http://127.0.0.1:5000/
			```
	* debug mode
		* to have server reload after every code change and turn on a debugger 
			* change debug level
	```
		export FLASK_DEBUG=1
		flask run
	```
	* routing
		* `route()` decorator is used to bind a function to a url
		* these are simple urls
	```
		@app.route('/')
		def index():
			return 'Index Page'
		
		@app.route('/hello')
		def hello():
			return 'Hello, World'
	```
		* these are more complex variable rules
	```
		@app.route('/user/<username>')
		def show_user_profile(username):
			# show the user profile for that user
			return 'User %s' % username
		@app.route('/post/<int:post_id>')
		def show_post(post_id):
			# show the post with the given id, the id is an integer
			return 'Post %d' % post_id
	```
		* list of converters
			* string
				* accepts any text without a slash
			* int
				* accepts integers
			* float
				* like int but for floating point values
			* path
				* like the default but also accepts slashes
			* any
				* matches one of the items provided
			* uuid
				* accepts uuid strings
	* unique urls / redirection behavior
		* flask rules are based on Werkzaugs routing module
			* ensures beautiful and unique urls based on precedents laid down by Apache and earlier HTTP servers
	```
		@app.route('/projects/')
		def projects():
			return 'The project page'
		@app.route('/about')
		def about():
			return 'The about page'
	```
		* url with trailing slash
			* accessing it without a trailing slash will cause Flask to redirect to the canonical url with the trailing slash
		* url without a trailing slash
			* accessing it with a trailing slash will produce 404
	* url building
		* flask can generate urls 
		* `url_for()`
			* accepts the name of the function as the first argument and a number of keyword arguments
				* each corresponds to the variable part of the URL rule
				* unknown variable parts are appended to the url as query parameters
	```
		from flask import Flask, url_for
		app = Flask(__name__)
		
		@app.route('/')
		def index(): pass
		
		@app.route('/login')
		def login(): pass
		
		@app.route('/user/<username>')
		def profile(username): pass
		
		with app.test_request_context():
			print url_for('index')				# /
			print url_for('login')				# /login
			print url_for('login', next='/')		# /login?next=/
			print url_for('profile', username='John Doe')	# /user/John%20Doe
	```
		* `test_request_context()`
			* tells flask to behave as though it is handling a request 
		* why build urls using `url_for()`
			* reversing is often more descriptive than hard-coding the urls
			* allows you to change urls in one go instead of changing them everywhere
			* url building will handle escaping of spceial characters and unicode data transparently for you
			* if your application is placed outside of the url root `url_for()` will handle that
	* http methods
		* by default a route only answers to `GET` requests
			* can be changed by providing `methods` argument to the `route()` decorator
	```
		from flask import request
		
		@app.route('/login', methods=['GET', 'POST'])
		def login():
			if request.method == 'POST':
				do_the_login()
			else:
				show_the_login_form()
	```
		* if `GET` is present `HEAD` will be added automatically for you
		* this is mostly handled by Werkzeug module
	* static files
		* these are kept in a folder called `static` in your package
		* to generate urls for static files use the `static` endpoint name
			* `url_for('static', filename='style.css')
	* rendering templates
		* Jinja2 template engine handles this
		* render a template using the `render_template()` method
			* provide name of template
			* variables to be passed to the template engine as keyword arguments
	```
		from flask import render_template
		@app.route('/hello/')
		@app.route('/hello/<name>')
		def hello(name=None):
			return render_template('hello.html', name=name)
	```
		* flask looks for templates in the `templates` folder
			* case 1: a module
		```
			/application.py
			/templates
				/hello.html
		```
			* case 2: a packge
		```
			/application
				/__init__.py
				/templates
					/hello.html
		```
		* you can use the full power of Jinja2 templates 
			* check their docs for what that means
		* inside templates you have access to
			* `request`
			* `session`
			* `g`
			* `get_flashed_messages()`
		* templates are especially useful if inheritance is used
		* automatic escaping is enabled 
			* if `name` contains HTML it will be escaped automatically
		* if you can trust a variable and know it will be safe HTML
			* you can mark it safe
				* `Markup` class
				* `|safe` filter 
	* the request object
		* common operations in the request object
	```
		from flask import request
		@app.route('/login', methods=['POST', 'GET'])
		def login():
			error = None
			if request.method == 'POST':
				if valid_login(request.form['username'],
						request.form['password']):
					return log_the_user_in(request.form['username'])
				else:
					error = 'Invalid username/password'
			# the code below is executed if the request method
			# was GET or the credentials were invalid
			return render_template('login.html', error=error)
	```
		* what happens if the key does not exist in the `form` attribute
			* `KeyError` is raised
		* to access parameters in the url you can use the args attribute
			* `searchword = request.args.get('key', '')`
	* file uploads
		* you can handle uploading files with flask easily
		* do not forget to set the `enctype="multipart/form-data"`
		* uploaded files are stored in memory or at a temporary location on the filesystem
			* access by looking at the `files` attribute on the request object
		* each uploaded file is stored in that dictionary
			* has a `save()` method to store that file on the filesystem
	```
		from flask import request
		@app.route('/upload', methods=['GET', 'POST'])
		def upload_file():
			if request.method == 'POST':
				f = request.files['the_file']
				f.save('/var/www/uploads/uploaded_file.txt')
			...
	```
		* to know what the file was named on the client access `filename` attribute
			* to use that file name pass it through `secure_filename()` function
	```
		from flask import request
		from werkzeug.utils import secure_filename
		@app.route('/upload', methods=['GET', 'POST'])
		def upload_file():
			if request.method == 'POST':
				f = request.files['the_file']
				f.save('/var/www/uploads/' + secure_filename(f.filename))
			...
	```
	* cookies
		* to access cookies you can use the `cookies` attribute
		* to set cookies you can use the `set_cookie()` method of response objects
		* reading cookies
	```
		from flask import request
		@app.route('/')
		def index():
			username = request.cookies.get('username')
			# use cookies.get(key) instead of cookies[key] to not get a keyError if the cookie is missing
	```
		* storing cookies
	```
		from flask import make_response
		@app.route('/')
		def index():
			resp = make_response(render_template(...))
			resp.set_cookie('username', 'the username')
			return resp
	```
		* cookies are set on response objects 
	* redirects and errors
		* to redirect a user to another endpoint use the `redirect()` function
		* to abort a request early with an error code use the `abort()` function
	```
		from flask import abort, redirect, url_for
		@app.route('/')
		def index():
			return redirect(url_for('login'))
		@app.route('/login')
		def login():
			abort(401)
			this_is_never_executed()
	```
		* by default a black and white error page is shown for each error code
			* customize with `errorhandler()`
		```
			from flask import render_template
			@app.errorhandler(404)
			def page_not_found(error):
				return render_template('page_not_found.html'), 404
		```
		* default status code for `render_template()` is 200
	* about responses
		* the return from a view function is automatically converted into a response object for you
		* if the return value is a string
			* converted into a response object with
				* string as response body
				* 200 ok status code
				* text/html mimetype
		* flask rules for conversion
			* if a response object of the correct type is returned it is directly returned from the view
			* if it is a string a response object is created with that data and the default parameters
			* if a tuple is returned the items in the tuple can provide extra information
				* form
					* `(response, status, headers)`
					* `(response, headers)`
			* if none of that works flask will assume the return value is a valid wsgi application and convert that into a response object
		* if you want to get hold of the resulting response object inside the view you can use the `make_response()` function
	```
		@app.errorhandler(404)
		def not_found(error):
			return render_template('error.html'), 404
	```
		* wrap the return expression with `make_response()` and get the response object to modify it
	```
		@app.errorhandler(404)
		def not_found(error):
			resp = make_response(render_template('error.html'), 404)
			resp.headers['X-Something'] = 'A value'
			return resp
	```
	* sessions
		*  allows you to store information specific to a user from one request to the next
		* implemented on top of cookies for you and signs the cookies cryptographically
			* user cannot modify them
		* in order to use sessions you have to set a secret key
	```
		from flask import Flask, session, redirect, url_for, escape, request
		app = Flask(__name__)
		@app.route('/')
		def index():
			if 'username' in session:
				return 'Logged in as %s' % escape(session['username'])
			return 'You are not logged in'
		@app.route('/login', methods=['GET', 'POST'])
		def login():
			if request.method == 'POST':
				session['username'] = request.form['username']
				return redirect(url_for('index'))
			return '''
				<form method="post">
					<p><input type=text name=username>
					<p><input type=submit value=Login>
				</form>
			'''
		@app.route('/logout')
		def logout():
			# remove the username from the session if its there
			session.pop('username', None)
			return redirect(url_for('index'))
		# set the secret key the super secret key
		app.secret_key = 'blahblahblahsecretkey'
	```
		* `escape()` method does escaping for you if you are not using the template engine
	* message flashing
		* makes it possible to record a message at the end of a request and access it on the next request
		* to flash use the `flash()` method
		* to get hold of the messages use `get_flashed_message()`
	* logging
		* loggin is usefull
	```
		app.logger.debug('A value for debugging')
		app.logger.warning('A warning occured (%d apples)', 42)
		app.logger.error('An error occurred')
	```
		* attached `logger` is a standard `Logger` they have their own docs to view
	* hooking in WSGI middlewares
		* to add WSGI middlewares to your application you can wrap the internal WSGI application
		* example middleware from Werkzeug package to work around bugs in lighttpd
	```
		from werkzeug.contrib.fixers import LighttpdCGIRootFix
		app.wsgi_app = LighttpdCGIRootFix(app.wsgi_app)
	```
	* using flask extensions
		* extensions are packages that help you accomplish common tasks





































