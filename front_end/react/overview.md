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


