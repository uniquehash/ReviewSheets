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

* is there a [great resource on react forms](https://goshakkk.name/on-forms-react/)?
	* yes, Gosha Arinich has great stuff

* what are [controlled and uncontrolled form inputs](https://goshakkk.name/controlled-vs-uncontrolled-inputs-react/)?
	* uncontrolled form inputs
		* like traditional HTML form inputs
		```
			class Form extends Component {
				render() {
					return (
						<div>
							<input type="text"/>
						</div>
					);
				}
			}
		```
		* remembers what you typed 
		* get their value using a ref
			* pull the value from the field when you need it like on form submition
		* example `onClick` handler of a button
		```
			class Form extends Component {
				handleSubmitClick = () => {
					const name = this._name.value
					// do something with `name`
				}
				render() {
					return (
						<div>
							<input type="text" ref={input => this._name = input}/>
							<button onClick={this.handleSubmitClick}>Sign up</button>
						</div>
					);
				}
			}
		```
	* controlled input
		* a form element is controlled if you set its value via a prop
		* accepts 
			* its current value as a prop
			* a callback to change that value
			* `<input value={someValue} onChange={handleChange}/>`
		* value has to be in `state` somewhere
			* typically component that renders the input saves that in its state
				* though it can be saved in any `state`
			```
				class Form extends Component {
					constructor() {
						super()
						this.state={name: '',}
					}
					handleNameChange = (event) => {
						this.setState({name: event.target.value})
					}
					render() {
						return (
							<div>
								<input
									type="text"
									value={this.state.name}
									onChange={this.handleNameChange} />
							</div>
						)
					}
				}
			```
				* every time you type a new character `handleNameChange` is called
					* takes new value of the input and sets it in the state
			* this pattern pushes the value changes to the form component 
				* state and UI are always in sync
		* form component can respond to input changes immediately
			* in-place feedback, like validations
			* disabling the button unless all fields have valid data
			* enforcing a specific input format, like credit card numbers
	* feature set
		* uncontrolled
			* one-time value retrieval
			* validating on submit
		* controlled
			* one-time value retrieval
			* validating on submit
			* instant field validation
			* conditionally disabling submit button
			* enforcing input format 
			* several inputs for one piece of data
			* dynamic inputs
			
* how to [collect data from a wizard form](https://goshakkk.name/wizard-form-collect-info/)?
	* a wizard form is a multi-step form
	* several ways to do this
		* ask each step for its data 
			* always render all the steps and use CSS to hide the currently invisible step 
			* use refs to ask each step about its values
			* unmanageable
				* certain fields often need to be edited from several steps
				* always keeping all steps rendered is pretty hacky
				* users want to go back to the previous step and expect their data to be there still
		* change the owner of the form state
			* state lives in main form component 
			* steps receive the values as props and call the callbacks when the fields change
			* basically implement the controlled input pattern to whole forms
			```
				class CheckoutForm extends React.Component {
					constructor() {
						super()
						this.state = {name: '', shipping_line: '', billing_line: ''} 
						//not full code
					}
					goToNext() {
						const {step} = this.state
						if (step !== 3) { this.setState({step: step + 1}) }
						else {
							const values = {
								name: this.state.name,
								shipping_line: this.state.shipping_line,
								billing_line: this.state.billing_line
							}
							//submit to api
						}
					}
					// handleChange
					render() {
						switch (this.state.step) {
							case 1:
								return <Personal
									name={this.state.name}
									onChangeName={this.handleChange('name')}
									onSubmit={this.goToNext} />
							case 2:
								return <Shipping
									line={this.state.shipping_line}
									onChangeLine={this.handleChange('shipping_line')}
									onSubmit={this.goToNext} />
							case 3:
								return <Billing
									line={this.state.billing_line}
									onChangeLine={this.handleChange('billing_line')}
									onSubmit={this.goToNext} />
						}
					}
				}
			```
									
						
						
		* naive approach
			* render 3 different form components 
			* doesn't work


* what is a [ref in react](https://reactjs.org/docs/refs-and-the-dom.html)?
	* in typical react dataflow props are the only way that a parent components interacts with children
		* refs allows you to imperatively modify a chile outside of the typical dataflow
	* ref is a special attribute that you can attach to any component
		* ref attribute takes a callback function
		* callback will be executed immediately after the component is mounted or unmounted
		* when used on an HTML element
			* ref callback received the underlying DOM element as its argument
			* common pattern for accessing DOM elements
		* when used on a class component
			* ref call back receives the mounted instance on the component as its argument
		* you cannot use ref on functional components
	* when to use refs
		* managing focus, text selection, or media playback
		* triggering imperative animations
		* integrating with third-party DOM libraries
		* avoid using refs for anything that can be done declaratively

















