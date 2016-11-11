#[Flask and Databases](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iv-database)

#[Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping)
	programming technique for converting data between incompatible type systems in object-oriented 
	kinda of like a virtual object database to be used within programming languages 

#[Flask-SQLAlchemy docs]("https://pythonhosted.org/Flask-SQLAlchemy/index.html")


#Configuration
	project_root_folder/config.py
	import os functionality 
	add path to db file
	add path to folder where we store SQLALCHEMY-migrate data files 	basedir is the path to a file name

#__init__.py
	project_root_folder/app/__init__.py
	import sqlalchemy
	create db object
	import models 

#The database model
	project_root_folder/app/models.py
	import db 
	create user class schema with orm wrapper
		id primary key
		nickname	
		email
	fields are instances of the db.Column class
	__repr__
		tells python how to print the objects of this class 

	(Database relationships) 
	create posts class
		id
		body
		timestamp
		user_id	(foreign key)
	register the user_id as a foreign key of user class property id
	add db relationship to new field posts
		one-to-many relationship
			defined on the single point of contact side
			backref 
				field added to the objects of the many class that points back at the one object 
	use db.session object to interact with db
	

#Creating the database
	create a python script to run command line commands 
		
#Migrating the Database 
	create a python script to run migration command line commands
	SQLAlchemy migrate 
		compares the structure of the database from the database URI (app.db) to the structure of our models (app/models.py)
		the differences between the two are recorded as a migration script inside the migration repository 
		the script knows how to apply a migration or undo it version control 
	don't be stupid with db migration 

#Database upgrading and downgrading
	database will be upgraded to latest revision using script 

#Database downgrade 
	database will be downgraded one revision


