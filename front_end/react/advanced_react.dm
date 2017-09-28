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

* what is [a dispatch function in redux](https://learn.tylermcginnis.com/courses/51210/lectures/945048)?
    * passed an action
    * invokes reducer
    * passes the current state as well as the action which was given to dispatch
    * react-redux
        * allows us to connect our component to redux and when we do it passes dispatch as props
        
























