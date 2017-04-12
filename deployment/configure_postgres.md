# configuring postgres 



* postgres pattern in deployment
	* go into the postgres user
        	* have a "deploy" system user
         	* create a db user called "deplpoy"
         	* allow the system user to aunthenticate to the db via trust (config file)
                	* allows the system user "deploy" to connect to db without a password
		* create your databases and proceed as normal 
