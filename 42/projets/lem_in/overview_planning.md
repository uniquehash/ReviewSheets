# overview - lem_in - 04/17/2017

* allowed functions
	* malloc
	* free
	* read
	* write
	* strerror
	* perror
	* exit

* mandatory functionality
	* parse map from a file
	* get n ants across the farm
	* only one ant per room at a time
	* display results on the stdout
		* number of ants
		* the_rooms
		* the_links
		* empty line
		* the paths of ants

* basic design
	* parser
		* read from file
		* reading line by line
			* gnl
				* num of ants
				* rooms
					* keyword `##start` and `##end`					
					* split spaces on valid lines
						* name
				* links
					* only valid rooms
					* append name to each others list
	* data
		* linked list containing all of the rooms
		* linked list with the starting room at its begining for traversing
			* linked list with all the rooms it's connected to
		* linked list with the current path
			* will be added to and removed from 
	* output
		* uncertain