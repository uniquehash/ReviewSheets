# research - lem_in - 04/17/2017

* what is the break down of the subject?
	* objectives
		* program will receive data with parameters via stdout, this describes an ant farm
			* number_of_ants
			* the_rooms
			* the_links
		* valid input
			* commands that are preliminated by `#`
				* unknown commands are ignored
			* rooms
				* `name coord_x coord_y`
					* `0 44 13`
					* `fret 99 34`
				* restricted input
					* rooms never start with L or # character
					* room coordinates are always integers
			* links	
				* `name1-name2`
					* `0-fret`
			* special input
				* `##start`
					* ant farm entrance
				* `##end`
					* ant farm exit
			* non-complient or empty lines automatically stop the reading and processing of the acquired data
			* if there isn't enough data to process normally display "ERROR"
	* general instructions
		* executable `lem-in`
		* author file
		* allowed functions
			* malloc
			* free
			* read
			* write
			* strerror
			* perror
			* exit
	* mandatory
		* get n ants across the farm
		* only one ant per room at a time
		* display results on the stdout
			* number of ants
			* the_rooms
			* the_links
			* empty line
			* the paths of ants

* where can i find an example map?
	* [wouterbeets](https://github.com/Wouterbeets/Lem-in)
	* [generator](https://github.com/cmehay/lem-in_generator)

