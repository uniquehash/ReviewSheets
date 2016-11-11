# heap analytics 
	* 11/10/2016

#### overview

heap analytics is a analytics tool for websites. basically the link is added and all user interactions are tracked. From their blog I can tell that most of their work is dealing with databases. I can extrapolate from this that most analytics platforms are basically database management services. Which intrinsicly kinda make sense. Collecting the data is a one-time charge tool, managing data is a forever service. Forever always makes more money then once. Plus has an inherit enviroment lock. 

heap analytics can be thought of as ad-hoc analysis across a userbase's entire activity stream.



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



