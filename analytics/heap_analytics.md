# heap analytics 
	* 11/10/2016 -> 11/12/2016

#### overview

heap analytics is a analytics tool for websites. basically the link is added and all user interactions are tracked. From their blog I can tell that most of their work is dealing with databases. I can extrapolate from this that most analytics platforms are basically database management services. Which intrinsicly kinda make sense. Collecting the data is a one-time charge tool, managing data is a forever service. Forever always makes more money then once. Plus has an inherit enviroment lock. 

heap analytics can be thought of as ad-hoc analysis across a userbase's entire activity stream.


#### technical specs
	* web
		* load time
			* client side script hosted on cloudfront's global CDN
				* allows extrmely fast load time regardless of loaction
				* script is less than 6kb
		* cross-browser testing
			* tested with all modern browsers
				* firefox 3+
				* safari 5+ 
				* ie 6+
				* chrome *
				* opera 11+
				* mobile safari * 
				* mobile chrome *
		* network impact
			* batches all events and submits a request to servers every 2 seconds
				* minimal network overhead
		* performance 
			* minimal CPU overhead


#### how it's built (couldn't help it)

* [How Heap Works part1: 10 million indexes and counting](https://web.archive.org/web/20161110190733/http://blog.heapanalytics.com/how-heap-works-part-1-10-million-indexes-and-counting/)
	* First off heap is constantly tracking and storing everything that the user does on the website. This being beyond fairly crazy this allows them to reinterpret the data since recording time with no data loss. So if you start recording a new metric, you have all of the data up to that point.

	* They use `PostgresSQL partial indexes` to allow them to find all instances of a particular defined event
		* basically they create a partial index for each of there customer created events
		* postgres automatically adds new data to the appropriate index

	* they now maintain more than 10 million partial indexes
		* they shard all of their data by customer
		* each table in the database holds only one customer's data
			* only a few thousand indexs at most
		* custom events are rare
		* indexes don't take up much space on disk

	* downside of partial indexes
		* cost of CPU required to build and maintain them
			* were one customer to go ham they'd have issues		
		* using `CREATE INDEX CONCURRENTLY`
			* postgress can only create partial indexes in series for a single table and must wait for all existing transactions to be finished
				* makes sense but blows
		* using `CREATE INDEX`			
			* can't write to a table while normal index build is taking place
				* fuckkkkkk
				* they handle it by having their data ingestion pipeline defer writing a customer's events to postgreSQL when they are creating an index
					* means they have to store the data in some temporary buffer while they wait for the index to be built
						* makes the engineer in me cringe and the hacker smile

* [How We Estimated Our AWS Costs Before Shipping Any Code](https://web.archive.org/web/20161110192931/http://blog.heapanalytics.com/how-we-estimated-our-aws-costs-before-shipping-any-code-2/)
	* the smallest unit of information for heap is a user interaction
		* every user interaction triggers a DOM event (modeled as a JSON object)
			```
				{
					referrer: 'https://www.google.com/search?q=banana',
					url: 'https//www.bananalytics.com/',
					type: 'click',
					target: 'div#gallery div.next',
					timestamp: 1387974232845
				}
			```
		* a raw event occupies ~1kb of space
		* multiple events per user session to generate `323 kb` or raw uncompressed data
			* user sessions last between 23 seconds and 5 minutes
				* sessions rarely generate more than 1 event per second
					* when event is restricted to highsignal events 
						* click, submit, change, push state events, page views
	* architectual assumptions
		* queries need to be fast
			* I/O bound 
				* keep as much of the working set in memory as possible
		* last month of data lives in RAM
			* most analysis will be on recent data
		* data older than a month lives in SSD
		* on-demand instances for everything
			* more investment makes project not worth it

* events
	* dom event can be created using a visual tool overlay
	* page events can be created by selecting links on heap

* funnels
	* funnels are a way to see how many users make it through a multi-step process
		* use events in series to design the funnel
	* group by 
		* demographic
			* allows you to segment data based on demographics
		* count of
			* segment data by user counts of events

* list
	* see what users are doing in deep detail
		* literally full deph of each user
			* fuckkkkkkk
		* clicking on undefined events gives you information about that event
			* can then name it
	* filter list same way that funnels do

* graphs
	* allow you to trends over time segment analysis 
	* any event or segment that is defined can be graphed
	* view by path
		* see all things after domain

* retention analysis
	* track different cohorts
	* create
		* select a start event
			* single initial event
		* select a return event
			* repeated activity

* segments
	* any subset of users
	* allow you to do more granular analysis 

* deep dive on defining events
	* 


#### questions

* what is a partial index?
	* an index over a subset of rows in a table

* what does database sharding really mean?

* what is a 'data ingestion pipeline'?
	* i assume it is their system for managing received data, kinda like a preprocessor

* what does [CPU bound](https://en.wikipedia.org/wiki/CPU-bound) mean?
	* time to complete a task is determined principally by the speed of the central processor. 

* what does [I/O bound](https://en.wikipedia.org/wiki/I/O_bound) mean?
	* time to complete a task is determined principally by the period spent waiting for input/output operations to complete



#### defining an event

* what is an event 
	* the basic block of reports
	* event analysis are completely retroactive 

* methods of defining events
	* event visualizer
		* allows you to graphically create events
			* provide a name click define event
				* options 
					* limit to current page
						* restricts the event only the ones that have occured on the current page
					* include similar elements
						* defines an event more broadly so that it targets multiple similar elements 
					* more options
						* directly modify underlying CSS selector of the event 
							* tag
							* id
							* classname
							* href
							* target text
		* by hovering over an event in the dropdown overlay the visualizer will highlight any element to which it refers
	* event creator
		* more fine-grained control over event definitions 
			* precise page path for a pageview event
			* target CSS selector for a click event
				* only tags, classes and identifiers are supported in hierarchical CSS selectors
					* advanced CSS features are not yet supported
	* snapshots
		* provides extra context around an event
		* event visualizer
			* launch event visualizer
			* select an element
			* add custom property
		* event creator
			* select + set property 
			* manually configure snapshotted data for use in custom properties
		* custom properties are configured on a per-event basis
			* custom properties are not retroactive
			* not available on iOS
			* text in element	
				* specify a DOM element selector
					* direct descendent selectors and pseudo-classes are supported in snapshots
				* each time the event occurs 
					* full text inside the first matching DOM element gets extracted, trimmed, and attached to the event as a property
			* value of javascript
				* specify any javascript expression
				* each time the event occurs the javascript expression gets evaluated and the return value gets attached to the event as a property
					* use the variable `event` to refer to the triggering DOM event
	* event combos
		* combine multiple events into a composite event
		* useful for markup changes

#### defining a segment

* segments
	* any subset of your users can be a segment

* types of segments
	* time-bounded segments
		* define segment in terms of whether a user has done a specific event within the last:
			* day	
			* week
			* month
		* segments membership changes everyday
		* can be graphed using size and segment or used as filters
		* options
			* size of segment
				* calculated at midnight each day
				* graph `in prior week` 
					* using size of segment each days data point will represent the number of users who logged in at least once in the 7 days leading to that point
				* graph `in prior month` 
					* number of users over the prior 30 days
				* graph `in prior day`
					* number of users over the past 24hours
			* filter
				* `in prior x` time amount from current moment
	
#### data format

* Users
	* maps directly to a unique client-side cookie
	* properties
		* `UserID`
			* randomely generated user ID
		* `Date First Seen`
			* timestamp when the user was first seen by Heap 
		* `Initial Platform`, `Initial Device Type`, `Initial Country`, `Initial Region`, `Initial City`
			* the initial value of these fields are set on the users first session
		* `Initial Referrer`, `Initial Browser`, `Initial Landing Page`, `Initial Search Keyword`
			* web only
			* the initial value of these fields are set on the users first session
		* `Initial UTM Source`, `Initial UTM Medium`, `Initial UTM Term`, `Initial UTM Content`, `Initial UTM Campaign`
			* web only
			* the initial value of these fields are set on the users first session

* Sessions
	* for web a session ends after 30 minutes of inactivity from the user 
	* properties
		* `SessionID`
			* randomly generated ID number
		* `UserID`
			* ID of associated user
		* `Time`
			* timestamp when session began
		* `Platform`
			* users operating system
		* `Device Type`
			* device type, options are 
				* Mobile
				* Tablet
				* Desktop
		* `Country`, `Region`, `City`
			* users geological data
		* `referrer`
			* web
			* webpage that linked to your site and initiated the session 
				* if user navigated to site directly or referral headers were stripped 
					* value will appear as `direct`
		* `Landing Page`
			* the first page of the current session
		* `Browser`
			* users browser
		* `Search Keyword`
			* search term that brought the user to your app
		* `UTM Source`, `UTM Medium`, `UTM Term`, `UTM Content`, `UTM Campaign`
			* GA-based URL tags associated with the sessions initial pageview

* Events
	* the raw client-side actions users perfromed on application
	* properties
		* `Type`
			* for web
				* `view page`
				* `click`
				* `submit`
				* `change`
		* `UserID`
			* ID of associated user
		* `SessionID`
			* ID of associated sessions
		* `Target Tag`
			* tagname of the event targets DOM element 
		* `Target ID`
			* id of the event targets DOM element
		* `Target Class`
			* classname of the event targets DOM element
		* `Href`
			* href property of link
		* `Domain` 
			* the current domain including subdomain 
		* `Hash`
			* the part of the current URL following the hash sign 
		* `Path`
			* the parts of the current url following your domain
		* `Query`
			* the query paramas of the pages current URL 
		* `Title`
			* the title of the current HTML page

* hiding elements from heap
	* sensitive elements can be hide with the `heap-ignore` attribute 
		* `<input type='text' heap-ignore='true'>

#### analyze data

* Funnel
	* let you see drop-off and conversions in any multi-step process
		* measures the number of unique users who have performed a set of actions
	* funnels are basically tracking event after event
	* shows unique users not count
	* does not have to be immediately sequential
	* conversion windows
		* default
			* the conversion rate over the entire date range chosen
		* can get more refined results using the dropdown
		* options 
			* group by
				* can group conversion by different properties
	* debugging funnel
		* if uncertain about funnel use page views rather than button clicks or form submissions
		* becareful of leaky funnels
			* consider if the user can take another route through the funnel
	* filtering
		* funnels can only be filtered by user-level properties
			* event level properties can change from step to step thus unreliable
			* you can hack around this though

* list
	* shows granular user-level data of how people are interacting with the app
		* presents list of users in reverse chronological order based on the most recent activity
		* heap shows properties associated with that individual as well as their events grouped by sessions
	* list results
		* each user has a unique Heap `User ID`
			* can be replaced with either an email address or a handle via the custom identify api
		* left-hand side of each user entry we can see al user properties associated with person
	* can be filtered by segments

* graph
	* allows you to construct visualizations of your data over time
	* create graph
		* select an event 
	* options
		* `Query`
			* made up of analysis type and events, filters, groupings, and segment comparisons
		* `Date Range`
			* date range to limit the data
			* default
				* previous week
			* supports
				* time ranges refer to numerical equivalence not calendar
				* `Past Week`
				* `Past Month`
				* `Past 3 Months`
				* `Past Year`
		* `Granularity`
			* determines the interval of graph
				* `Hour`
				* `Day`
				* `Week`
				* `Month`
			* default
				* `Day`
		* `Chart Type`
			* selects the type of chart
			* default	
				* line
			* supports
				* bar 
				* graph
				* pie chart
				* table format
				* line
		* `Trailing Average`
			* changes graph from individual day counts to the average of 
				* 7 days
				* 4 weeks 
				* 3 months
	* query types
		* types of graph views 
		* count 
			* the number of times an event occurs each 
				* hour
				* day 
				* week	
				* month
		* count unique
			* the number of unique or individual users 	
		* size of segment
			* size of a segment by day
		* sum, average, max, min
			* when used with numerical event properties 
				* graph the total, average, or max/min per day/week/month based on granularity
		* average time between
			* the average time it takes to complete event two after performing event one
			* the granularity changes the time limit to be included in the calculation
		* conversion rate between
			* tracks the percentage of users who did event one and then did event two
	* filters
		* filter by particular user-level data
	* group by 
		* group data by different groups
	* comparing segments
		* compare segments by using the compare clause 
	* multi-event graphs
		* view multiple events at once






































		





























