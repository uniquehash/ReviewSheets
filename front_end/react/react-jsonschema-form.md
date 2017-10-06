# notes on react-jsonschema-form

* what is [react-jsonschema-form](https://github.com/mozilla-services/react-jsonschema-form)?
    * a simple react component capable of building HTML forms out of a JSON schema, using bootstrap semantics by default
        * [demo](https://mozilla-services.github.io/react-jsonschema-form/)
    * json objects are rendered to forms via the magic of JS
        * create react app example `App.js` with imported boostrap styling
        ```
            import React, {Component} from "react"
            import Form from "react-jsonschema-form"
            import './App.css'
            import 'bootstrap/dist/css/bootstrap.css'
            
            const schema = {
              title: "Todo",
              type: "object",
              required: ['title'],
              properties: {
                title: {type: "string", title: "Title", default: "A new task"},
                done: {type: "boolean", title: "Done?", default: false}
              }
            }            
            const log = (type) => console.log.bind(console, type)           
            class App extends Component {
              render() {
                const margin="margin: 20px 20px;"
                return (
                  <div style={{margin: 20}}>
                    <Form schema={schema}
                          onChange={log("changed")}
                          onSubmit={log("submitted")}
                          onError={log("errors")}/>
                  </div>
                )
              }
            }
            export default App
        ```            
    * form initialization
        * prefilling a form with existing data is done by passing a `formData` prop object matching a schema
        ```
            const formData = {
                title: "First task",
                done: true
            };
            render ((
                <Form   schema={schema}
                        formData={formData} />
            ), document.getElementById("app"));
        ```
        * if form has a single field
            * pass a single value: `formData='charlie'`
        * if parent component can re-render make sure to listen to the `onChange` event to update the data passed to `formData`
    * form event handlers
        * form submission
            * pass a function as the `onSubmit` prop of your Form component to listen to when the form is submitted
            * passed as a result object having a `formData` attribute which is the valid form data
            ```
                const onSubmit = ({formData} => console.log("yay I'm valid!")
                render ((
                    <Form   schema={schema}
                            onSubmit={onSubmit}/>
                ), document.getElementById("app")
            ```
        * form error event handler
            * to react when submitted form data are invalid pass an `onError` handler 
            * passed the list of encoutered errors
            ```
                const onError = (errors) => console.log("I have", errors.length, "errors to fix")
                render ((
                    <Form   schema={schema}
                            onError={onError}/>
                ), document.getElementById("app")
            ```
        * form data changes
            * to be notified everytime the data in the form is updated pass an `onChange` handler
            * receives the same arguments as `onSubmit` any time the value is updated in the form
        * form field blur events
            * to trigger events or modify external state when a field has been touched pass `onBlur` handler
            * receives the id of the input that was blurred and the field value
        * form field focus events
            * to trigger events or modify external state when a field has been focused pass `onFocus` handler
            * receives the id of the input that is focused and the field value

            
            
            
            
            
            
            
