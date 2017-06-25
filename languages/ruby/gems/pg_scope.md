# research on the ruby gem pg_scope

builds ActiveRecord named scopes that take advantage of PostgreSQL's full text search


* what is [pg_search](https://github.com/Casecommons/pg_search)?
	* builds ActiveRecord named scopes that take advantage of PostgreSQL's full text search
	* supports two different techniques for searching
		* multi-search
			* creates one global search index composed from many different Active Record classes that can be mixed together
			* generally what an application wide search relies on
		* search scopes
			* advanced searching against only one Active Record class
			* generally what autocompleters or filtering a list uses

* how do [search scopes work](https://github.com/Casecommons/pg_search#pg_search_scope)?
	* search_scopes are defined scopes to be searched?
		* parameters
			* scope name
			* options hash
				* required options
					* `:against`
						* tells pg_search_scope which column or columns to search against

* what would building a [search scope for one column look like](https://github.com/Casecommons/pg_search#searching-against-one-column)?
	* to search a table of blogpost by title
	```
		class BlogPost < ActiveRecord::Base
			include PgSearch
			pg_search_scope :search_by_title, :against => :title
		end
	```
	* now in our controllers or wherever we call the code to execute our search by title is extremely simple
	```
		BlogPost.create!(:title => "Recent Developments in the World of Pastrami")
		BlogPost.create!(:title => "Prosciutto and You: A Retrospective")
		BlogPost.search_by_title("pastrami") # => [#<BlogPost id: 2, title: "Recent Developments in the World of Pastrami">]
	```


* what would building a [search scope for multiple columns look like](https://github.com/Casecommons/pg_search#searching-against-multiple-columns)?
	* searching the first and last name to find a person
	```
		class Person < ActiveRecord::Base
			include PgSearch
			pg_search_scope :search_by_full_name, :against => [:first_name, :last_name]
		end
	```
	* executing a search for people in our code is super easy
	```
		person_1 = Person.create!(:first_name => "Grant", :last_name => "Hill")
		person_2 = Person.create!(:first_name => "Hugh", :last_name => "Grant")
		
		Person.search_by_full_name("Grant") # => [person_1, person_2]
		Person.search_by_full_name("Grant Hill") # => [person_1]
	```











































