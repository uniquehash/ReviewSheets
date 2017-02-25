# notes on 42 mini project Ceryneian Hind

* Use 42’s API to find where people are located in the zones.
	* write script that takes a file as a parameter with one login per line and returns the location of each person
	* handle errors and absent locations very carefully and logically

* end point that matters
	* `GET /v2/users/:user_id/locations`

* basic plan
	* parse input file
		* check syntactic validity
	* pipe each login to the api end point to receive the location
		* handle the response
			* check invalid input 
			* parse it to find the actual location
	* print to screan in a pretty fashion

