#Notes on using FB 


## js SDK initialization 
* Below is initialization code from the FB documentation
 ```
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
 ```
    //initiates the fb login and passes it parameters 
    window.fbAsyncInit = function() {
    	FB.init({
        	appId      : 'your-app-id',
        	xfbml      : false,
        	version    : 'v2.3'
      	});
    };

    //I'm gonna go through this code line by line
	(function(yourDocument, scriptTag, arbritaryId){
	    var fbSDKjs, firstLinkedScript = yourDocument.getElementsByTagName(scriptTag)[0];
      	if (yourDocument.getElementById(arbritaryId)){return;} 
    	fbSDKjs = yourDocument.createElement(scriptTag); fbSDKjs.id = arbritaryId;
    	fbSDKjs.src = "http://connect.facebook.net/en_US/sdk.js";
        firstLinkedScript.parentNode.insertBefore(fbSDKjs, firstLinkedScript);
    } (document, 'script', 'facebook-jssdk') );
 ```
