# overview of the get_next_line project

build a function that will retrieve the next line of a file.

# plan

* get libft all connected and stuff with make file
* read a document all the way through
* figure the rest of this shit out

* we have two central cases 
	* determine if the function should read from the file or if the static variable is sufficient
		* when the \n character is within the read buffer
			* puts x characters into the line pointer
			* if there is overflow saves it to the static variable 
			* free everything that needs to be freed 
		* when the \n character is not within the read buffer
			* reads again
			* strmcats the buffer
			* redetermines whether the character is within the read buffer
