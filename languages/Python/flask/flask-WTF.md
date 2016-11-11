# [flask-WTF](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms)


#Configuration
	project_root_folder/config.py
	set configuration for flask-WTF
		set WTF_CSRF_ENABLED to True
		enter a SECRET_KEY
		prevents cross-site request forgery
	Add OpenID providers
	
#User login form 
	project_root_folder/app/forms.py 
	import Form class from framework
	import form field classes needed 
		StringField
			user input field user can enter string data into
		BooleanField
			user input field user can enter boolean data into
	import validator function
		DataRequired
			checks that the field is not submitted null

#Form templates 
	project_root_folder/app/templates/login.html
	expects a form object instantiated from the form class we defined stored in a template arguent named form.
		data passed to template in view
	form.hidden_tag()	
		hidden field that implements CSRF prevention 
		necessary in all forms with CSRF enabled 
	form.field_name
		property of form created that contains variable names to access our form fields
	
	(improving field validation)
	form fields have error messages 
		for loop to present them
		form.variable.errors	
	
	(Dealing with OpenIDs)
	add java script to interact with the client side and collect openid stuff
	change copy to suit 
	

#Form views
	project_root_folder/app/views.py
	import our LoginForm object from our forms.py file with .forms
	methods argument is an array 
		tells the framework that this view function accepts both GET and POST request 
	uses the render_template function and passes it variables 
		template
		form 
	
	(Receiving form data)
	import functions from flask-WTF
		flash
			a quick way to show a message on the next page presented to the user
		redirect
			redirects user towards the html
		validate_on_submit 
			does all the form processing work 
			gathers all the data and runs validators attached to fields 
	
	(Dealing with OpenIDs)
	pass the view the open id array	



#with control statement 
	{% with %}
	{% endwith %}	





















