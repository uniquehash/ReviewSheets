#Notes on using FB 


## [js SDK initialization](https://developers.facebook.com/docs/javascript/quickstart/v2.1)
* Make sure to register and retrieve your application id before you start!
* Below is initialization code from the [FB documentation](https://developers.facebook.com/docs/javascript/quickstart/v2.1)
 ```JavaScript
 <script type="text/javascript">
    
    //initiates the fb login and passes it parameters 
    window.fbAsyncInit = function() {
    	FB.init({
        	appId      : 'your-app-id',
        	xfbml      : true,
        	version    : 'v2.3'
      	});
    }; //end of the fbAsyncInit

    (function(d, s, id){
        	var js, fjs = d.getElementsByTagName(s)[0];
        	if (d.getElementById(id)) {return;}
        	js = d.createElement(s); js.id = id;
        	js.src = "//connect.facebook.net/en_US/sdk.js";
        	fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk') );
 ```
* Below is my version, same code just renamed some of the variables for better clarity 
 ```javascript
 <script type="text/javascript">

    //initiates the fb login and passes it parameters 
    window.fbAsyncInit = function() {
    	FB.init({
        	appId      : 'your-app-id', //you need to enter your applications id here
        	xfbml      : true,
        	version    : 'v2.3'
      	});
    }; //end of the fbAsyncInit

    //I'm gonna go through the code from here line by line
	(function(yourDocument, scriptTag, arbritaryId){
	    var fbSDKjs, firstLinkedScript = yourDocument.getElementsByTagName(scriptTag)[0];
      	if (yourDocument.getElementById(arbritaryId)){return;} 
    	fbSDKjs = yourDocument.createElement(scriptTag); fbSDKjs.id = arbritaryId;
    	fbSDKjs.src = "https://connect.facebook.net/en_US/sdk.js";
        firstLinkedScript.parentNode.insertBefore(fbSDKjs, firstLinkedScript);
    } (document, 'script', 'facebook-jssdk') );
 ```
 * Now let's look at it line by line 
 ```javascript
 	(function(yourDocument, scriptTag, arbritaryId){
 ```
 * An annonymous function with arguments that are passed from `(document, 'script', 'facebook-jssdk')`
 * yourDocument is the first argument passed below the function. in this case it is the current document object. 
 * scriptTag is the second argument passed below the function. in this case it is the string "script"
 * arbritaryId is the third argument passed below the function. in this case it is the string "facebook-jssdk"
 ```javascript
 	var fbSDKjs, firstLinkedScript = yourDocument.getElementsByTagName(scriptTag)[0];
 ```
 * getElementByTagName returns an [HTMLCollection](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection) object that is populated with tag elements
 	* the value of scriptTag determines the type of tag
 	* in this case they are [HTMLScriptElements](https://developer.mozilla.org/en-US/docs/Web/API/HTMLScriptElement#Properties)
 	* elements are accessed like an array
 * creates the fbSDKjs variable and initializes the firstLinkedScript variable to the 0 element in the htmlCollection
 * if scriptTag is not a valid tag firstLinkedScript will be undefined 
 * if scriptTag is not the string "script" then it will be passed the wrong tag and not work. 
 * summary:
 	* essentially it assigns the variable firstLinkedScript to the first script linked in the html document yourDocument
    * it also creates but does not initialize the fbSDKjs variable 
 ```javascript
   	if (yourDocument.getElementById(arbritaryId)){return;} 
 ```
 * searches the variable yourDocument for an element who's id is the value of arbritaryId which in this case is ("facebook-jssdk")
 * if it finds an element with an id attribute of arbritaryId then it assumes you have already linked the sdk and returns stopping the function 
 ```javascript
    fbSDKjs = yourDocument.createElement(scriptTag); fbSDKjs.id = arbritaryId;
 ```
 * creates a element of type scriptTag, which in this case is a script tag element, and assigns the id attribute of this element to be the value of the arbritaryId variable
 ```javascript
    fbSDKjs.src = "http://connect.facebook.net/en_US/sdk.js";
 ```
 * assigns the src attribute of the fbSDKjs scriptelement to the actual facebook sdk.js
 * fbSDKjs is now an empty script with a src towards the facebook sdk and an id "facebook-jssdk"
 ```javascript
   	firstLinkedScript.parentNode.insertBefore(fbSDKjs, firstLinkedScript);
 ```
 * [parentNode](https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode) gets the parent of the firstLinkedScript element, this parent is the HEAD element. 
 * [insertBefore](https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore) function inserts the first argument(fbSDKjs) right before the second argument(firstLinkedScript);
 * we have to call the function from firstLinkedScript parent node because the element is inserted as a child of the node that calls the function, thus would not work if the caller was not the parent of the referenced node (second argument)
 ```javascript
    } (document, 'script', 'facebook-jssdk') );
 ```
 * the arguments that will be passed to the annonymous function 

* Now we have initialized the SDK we can start using it!

## Loging in with FaceBook 

### [Checking the login status](https://developers.facebook.com/docs/facebook-login/login-flow-for-web/#checklogin)
* To check to see if the end user is logged into facebook we are going to have to add code to the `window.fbAsyncInit` function.

```JavaScript
    //initiates the fb login and passes it parameters 
    window.fbAsyncInit = function() {
    	FB.init({
        	appId      : 'your-app-id', //you need to enter your applications id here
        	xfbml      : true,
        	version    : 'v2.3'
      	});
    
    	//this had to be in the fbAsyncInit function otherwise the FB object is not recognized 
    	FB.getLoginStatus(function(response) {

            //handles the callback from the response, the response is a JSON object 
            statusChangeCallback(response);
    	});

    }; //end of the fbAsyncInit
```
 * The FB.getLoginStatus function has to be inside the window.fbAsyncInit annonymous function otherwise the FB object will not be recognized. 
 * The FB.getLoginStatus function retrieves a [JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/) object
 * This [JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/) object has two properties 
 	* status: the current login status of the end user using the app 
 		* **connected**: The end user is logged into Facebook and your app
 		* **not_authorized**: The end user is logged into Facebook but not your app
 		* **unknown**: The end user is not logged into Facebook at all
 	* authResponse: has a value if the status property of the response is **connected** otherwise it is undefined. It contains
 		* **accessToken**: an access token for end user using the app
 		* **expiresIn**: the amount of time in milli seconds that the **accessToken** will expire and must be renewed
 		* **signedRequest**: a signed parameter with information about the end user using the app
 		* **userID**: the ID of the end user
 * Now we must create the function to handle the response, we pass the [JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/) object to the `statusChangeCallback(response)` function through the response variable
```javascript
   		<script type="text/javascript">
	        //this called with the response from FB from the check login status function 
	        function statusChangeCallback(response) {
	            console.log('statusChangeCallback');
	            console.log(response);	   

	            if (response.status === 'connected') {
	                console.log("The end user is logged into Facebook!");
	            }
	            else if (response.status === 'not_authorized') {
	                console.log("The end user has not logged into your app!");
	            } 
	            else {
	                console.log("The end user is not logged into Facebook at all!");
	            }
	        }
        </script>
	</body>
```
 * This code is pretty self explanatory! But we are going to through it anyway. 
 * First we print to the console the [JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/) object we received from FB
 * Then we check the status property of the [JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/) object
 	* if the status is `connected` then we print to the console that the end user is logged in!
 	* if the status is `not_authorized` then we print to the console that the end user needs to log into the app!
 	* if the status is anything other then the above options, then we print to the console that the end user needs to log into Facebook!
 * Note: I placed this code in a script tag before the the `</body>` tag but this code could of been placed anywhere 

### [Logging in the end user](https://developers.facebook.com/docs/facebook-login/login-flow-for-web/#logindialog)
* There are two way to log a end user into Facebook. The easy way and the hard way. 
    * The easy way is to simply use [Facebook's built in html button](https://developers.facebook.com/docs/plugins/login-button) that is part of the SDK.

     ```html
        <fb:login-button></fb:login-button>
     ``` 

        * The code above will generate a completely functional Facebook login button that end users can use to log into their Facbook account and by extension your Facebook app. 
        * Using the Facebook button above however does leave something to be desired. As you may have imagined the Facebook button has many available attributes we can add on to it, a full description available in the [documentation](https://developers.facebook.com/docs/plugins/login-button). 
        * We will however only focus on a few:
            * **data-scope**: The permissions our Facebook application is requesting from the user.
            * **data-size**: The size of our Facebook button
            * **onlogin**:  A JavaScript function to trigger when the login process is complete, similar to the native onclick attribute
        * out sample Facebook button is shown below. 

     ```html
        <fb:login-button data-scope="public_profile, email" data-size="xlarge" onlogin="FB.getLoginStatus();"></fb:login-button>
     ```
        * here we are asking for permission to access the end users public profile and email, we selected the largest size button available, and we trigger our checkLoginState function after the user completes the login, to make sure the login was successful. 
    * The hard way is to use a normal html button and add the login logic programically. 
        * The first step is to write a function to check if the end user is logged into Facebook or not. We will put it after statusChangeCallback()
        ```javascript
        

        ```








