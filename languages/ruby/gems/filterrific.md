# research on filterrific ruby gem

a rails engine plugin that makes it easy to filter, search, and sort your ActiveRecord lists

* what is [filterrific](http://filterrific.clearcove.ca/)?
	* a rails engine plugin that makes it easy to filter, search, and sort your ActiveRecord lists
	* [github](https://github.com/jhund/filterrific)
	* works in three parts
		* view api
			* display the list of matching records and the form to update filter settings
			* update the filter settings via AJAX form submission
			* reset the filter settings
		* model api
			* apply filterrific to the model
			* specify which scopes are available to filterrific 
				* safety mechanism to prevent unauthorized access to db
				* like `strong_params` for filter settings
			* define default filter settings
			* filterrific relies heavily on ActiveRecord scopes for filtering understanding them is key
		* controller api	
			* initialize filter settings from params, persistence or defaults
			* execute the ActiveRecord query to load the filtered records
			* persist the current filter settings
			* send the ActiveRecord collection to the view for rendering
			* reset the filter settings
* what are [active record scopes in rails](http://guides.rubyonrails.org/active_record_querying.html#scopes)?
	* allows you to specify commonly-used queries and basically wrap them in a method, allowing them to be called as a method would
	* all scope methods return an `ActiveRecord::Relation object` which has it's own set of methods that can be called
	* simple scope example finding articles that have been published
	```
		class Article < ApplicationRecord
			scope :published, -> { where(published: true) }
		end
	```
	* can also be defined like a class method
	```
		class Article < ApplicationRecord
			def self.published
				where (published: true)
			end
		end
	```
	* scopes are chainable within scopes
	```
		class Article < ApplicationRecord
			scope :published, 		-> { where (published: true) }
			scope :published_and_commented, -> { published.where("comments_count > 0") }
		end
	```
	* scopes can receive arguments
	```
		class Article < ApplicationRecord
			scope :created_before, -> (time) { where ("created_at < ?", time) }
		end
	```
		* generally the class method syntax is the prefered way to write argument accepting scopes

* what are [filterrific scope patterns](http://filterrific.clearcove.ca/pages/active_record_scope_patterns.html)?
	* scope patterns are filtering parradigms to be added to filterrific models to increase their value
	* common scope patterns
		* sanitize your SQL!
			* all filter settings shoud be sanitized before applying them to a filterrific model
			* OK: `where(country_id: param)`
			* OK: `where('students.country_id = ?', param)`
			* NOT OK: `where("students.country_id = '#{param}'")`
		* filter by column values
			* filter records with a given attribute or foreign key of a `belongs_to` association
			* scopes have a naming convention `with_%{column name}`
			* example
			```
				#filters on 'country_id' foreign key
				scope :with_country_id, lambda { |country_ids| where (country_id: [*country_ids]) }
				
				#filters on 'gender' attribute
				scope :with_gender, lambda { |genders| where (gender: [*genders]) }
			```
		* search
		* sort
		* filter by existence of has_many association 
		* filter by non-existence of has_many association 
		* filter by existence of many-to-many association
		* filter by non-existence of many-to-many association
		* filter by ranges
		* multiple form inputs for single scope
		* scopes vs. class methods

* what's the nitty gritty of the [filterrific view api](http://filterrific.clearcove.ca/pages/action_view_api.html)?
	* the filterrific form is a form ready to send AJAX
	* the search results are generated via a rails partial	
		* the top of the partial has `id="filterrific_results"`
	* there is a little javascript to put it all together
		* this template updates the student list after the filter settings were changed
	* breakdown
		* basically filterrific automatically sends an AJAX to an endpoint and then updates the results partial via some abstracted javascript
			* this is why the controller is important

* what is the nitty gritty of the [filterrific controller api](http://filterrific.clearcove.ca/pages/action_controller_api.html)?
	* the controller code is in the controller of the model being searched through
	* it is important to have a respond of html and js such that the endpoint can respond to both types of interactions
	* breakdown
		* filterrific receives and passes the options selected by the user from the frontend to the model layer calibrating the filterrific search
		* then a ActiveRecord Relation is retrieved from the model layer and passed as an instance variable
		* the controller then responds to the AJAX passing down the instance variable

* what is the nitty gritty of the [filterrific model api](http://filterrific.clearcove.ca/pages/active_record_model_api.html)?
	* enable filterrific for the student class by calling the constant
		* this component is actually probably what we may want to use a different gem for, since each component of the api is technically independent of each other
	* scopes must be enabled to for filterific to be able to use them in the decleration and future function



































