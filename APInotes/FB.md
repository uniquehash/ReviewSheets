#Notes on using FB 


## js SDK initialization 
* Below is initialization code from the FB documentation
 ```JavaScript
 <script type="text/javascript">
    
    //initiates the fb login and passes it parameters 
    window.fbAsyncInit = function() {
    	FB.init({
        	appId      : 'your-app-id',
        	xfbml      : false,
        	version    : 'v2.3'
      	});
    };

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
        	xfbml      : false,
        	version    : 'v2.3'
      	});
    };

    //I'm gonna go through the code from here line by line
	(function(yourDocument, scriptTag, arbritaryId){
	    var fbSDKjs, firstLinkedScript = yourDocument.getElementsByTagName(scriptTag)[0];
      	if (yourDocument.getElementById(arbritaryId)){return;} 
    	fbSDKjs = yourDocument.createElement(scriptTag); fbSDKjs.id = arbritaryId;
    	fbSDKjs.src = "http://connect.facebook.net/en_US/sdk.js";
        firstLinkedScript.parentNode.insertBefore(fbSDKjs, firstLinkedScript);
    } (document, 'script', 'facebook-jssdk') );
 ```
 * Make sure to register and retrieve your application id before you start!
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
 * getElementByTagName returns an htmlCollection object that is populated with tag elements, the value of scriptTag determines the type of tag, elements are accessed like an array
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
 * gets the parent of the firstLinkedScript element, this parent is the HEAD element. 
 * insertBefore function inserts the first argument(fbSDKjs) right before the second argument(firstLinkedScript);
 * we have to call the function from firstLinkedScript parent node because the element is inserted as a child of the node that calls the function, thus would not work if the caller was not the parent of the referenced node (second argument)
 ```javascript
    } (document, 'script', 'facebook-jssdk') );
 ```
 * the arguments that will be passed to the annonymous function 
















