# overview of react - 4/27/2017

little overview of react before diving in.






* [what is react](https://en.wikipedia.org/wiki/React_(JavaScript_library))?
	* open-source JS library for building user interfaces
	* maintained by Facebook
	* allows developrs to create large web applications that use data which can change over time without reloading the page.
		* attempts to be fast, simple and scalable
	* features
		* one-way data flow
			* properties
				* a set of immutable values passed to a components renderer as properties in its HTML tag				
			* properties flow down; actions flow up
				* components cannot directly modify any properties passed to it, but can be passed callback functions that do modify values
		* virtual DOM
			* an in-memory data structure cache
			* computes diffs and updates the browser's displayed DOM efficiently
			* write code as if the entire page is rendered on each change while the react libraries only renders subcomponents that actually change
		* JSX
			* stands for javascript extension syntax
			* allows quoting of HTML and uses HTML tag syntax to render subcomponents
			* a react specific grammar extension to JS
		* Architecture beyond HTML
			* more then rendring HTML in the browser
			* dynamic charts that render to <canvas> tags
			* isomorphic loading to render identical HTML on both the server and client
		* react native
			* provides react architecture to native iOS and Android applications

* what are [elements in the context of React](https://facebook.github.io/react/docs/rendering-elements.html)?
	* elements are the smallest building block of react apps
		* they describe what you want to see on the screen
	* elements are immutable
		* once created it's children and attributes cannot be changed
	* elements are only updated when it is necessary to bring the DOM to the desired state

* what are [components in the context of React](https://facebook.github.io/react/docs/components-and-props.html)?
	* these allow you to split the UI into 
		* independent
		* reusable pieces
		* think about each piece in isolation
	* components at their core
		* accept arbitrary inputs called props
		* return elements describing what should appear on the screen
	* component identifiers always start with capital letters
	* components must return a single root element

* what are [props in the context of React](https://facebook.github.io/react/docs/components-and-props.html)?

* why use [react in the first place](https://learn.tylermcginnis.com/courses/50507/lectures/760073)?
	* composition
		* composition of components
			* components are strongly encapsulated
		* individual components manage their own state 
			* set clear boundaries
	* unidirectional dataflow
		* UI is updated from state
	* declarative
		* tell computer what you want not how you want it done
		* benefits
			* reduce side effects
			* minimize mutability
			* more readable code
			* less bugs
	* explicit mutations
		* whenever we want to update state in application we must do so explicitely
	* just javascript 

* what are [the pieces in the react ecosystem](https://learn.tylermcginnis.com/courses/50507/lectures/760073)?
	* react
		* purely the view layer
	* react router
		* allow use to map a specific url with a specific component
	* webpack
		* bundler
		* takes entry point and all files through data transformation modules 
		* bundles them into a single file 
		* output them into new file
	* babel
		* transpiler
	* axios
		* allow us to make http requests

* how do we [basically use webpack](https://learn.tylermcginnis.com/courses/50507/lectures/762538#/questions/1)?
	* webpack takes your code, transforms it, then bundles it
	* three main things webpack needs to know 
		* the starting point of your application 
		* which transformations to make on your code
		* which location it should save the new transformed code
	* create a file `webpack.config.js` containing our webpack configuration



















































