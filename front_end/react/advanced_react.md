# notes on advanced notions in react

* what is in the [react/redux ecosystem](https://learn.tylermcginnis.com/courses/51210/lectures/945037)?
    * redux
        * a state management tool
    * react router redux
        * stores state related to url in redux store
    * immutable.js
        * redux needs immutability
        * JS is bad at immutability
    * CSS modules
        * component based styling is dope
        * js based styling is bad
        * CSS modules gives you the benefit of component based styling with the feature of css based styling
    * firebase
        * no backend
        * auth
        * scalability
        * real time

* what is [redux](https://learn.tylermcginnis.com/courses/51210/lectures/945037)?
    * a state management tool
    * takes all the state out of the components
        * puts in a central location unrelated to components
  
* what is [an action in redux](https://learn.tylermcginnis.com/courses/51210/lectures/945044)?
    * an action is an object that describes a change that is to be made to the single state tree
        * has a type
        * any and all information required by the action

* what is [an action creator in redux](https://learn.tylermcginnis.com/courses/51210/lectures/945044)?
    * a function that wraps around an action easing creation and returning an action

* what is [a reducer in redux](https://learn.tylermcginnis.com/courses/51210/lectures/945044)?
    * receives the current application state as well as the current action
        * creates a new copy of the apps state modified with what is described by the action
        * sets the state with that new copy
   * reducers can be composed
 
* what is [a dispatch function in redux](https://learn.tylermcginnis.com/courses/51210/lectures/945048)?
    * passed an action
    * invokes reducer
    * passes the current state as well as the action which was given to dispatch
    * react-redux
        * allows us to connect our component to redux and when we do it passes dispatch as props
        
* what is [createStore in redux](https://learn.tylermcginnis.com/courses/redux/lectures/946346)?
	* a method that will create a single state tree or a store in your application
	* takes either a single reducer or an object with a many of reducers
		* createStore will go through each reducer calling them with an undefined state to receive their initial state
	* with react
		* connect react components to the redux store using a Provider property
		
* what is [a Provider in redux-react](https://learn.tylermcginnis.com/courses/redux/lectures/9463460)?
	*  a component that takes a redux store and allows all its children to access the store

* what is the [connect method in redux-react](https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* a method that wraps around or presentation component and returns a container component connected to redux
	* first argument that connect receives is a function
		* specifies exactly what properties from our single state tree we want to pass into the component we are connecting
		* this function is often called `mapStateToProps` by convention	
	* second argument that connect receives is a function
		* allows us to bind functions to dispatch
		* often called `mapDispatchToProps` by convention
* what is the [difference between a container component and a presentational component](https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* container component
		* handles logic and is connected to redux
	* presentational component
		* receives props and renders UI

* what is the [dispatch function in react-redux](https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* will take an action creater and if connected to redux with `connect` will be able to update the state of our store

* what does [mapStateToProps do in redux-react](https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* a function that takes a state and returns the pieces of the state that should be mapped to props for the presentational component

* what does [mapDispatchToProps do in redux-react(https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* a function that takes the dispatch function and returns the action creator objects wrapped in dispatch 

* what does [importing * as actions do in redux-react](https://learn.tylermcginnis.com/courses/redux/lectures/973469)?
	* imports the contents of file of actions as an object with action creators as keys

* what is [redux thunks in redux](https://learn.tylermcginnis.com/courses/redux/lectures/946352)?
	* a pattern of returning a function from an action creator
	* allows us to ecapsulate a bunch of logic for cleaner code
	* requires configuration

* what is [middleware in the context of redux](https://learn.tylermcginnis.com/courses/redux/lectures/946353)?
	* allows us to hook into the point between dispatching an actual action and the moment it reaches a reducer 
		* take the action that is being dispatched
		* do something with it
		* pass it on to the reducer



















