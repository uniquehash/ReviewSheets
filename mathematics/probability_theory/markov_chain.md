# notes on markoc chains. lord help me. this shit is haaaaaaaaaarrrrrrrrrd

* what is a [markov process in the field of probability theory](https://en.wikipedia.org/wiki/Markov_chain)?
	* a stochastic (random) process that satisfies the markov property
		* markov property
			* a process satisfies the markov property if one can make predictions for the future of the process based solely on its present state just as well as one could knowing the process's full history
				* conditional on the present state of the system, its future and past states are independent

* what is the [markov property in the field of probability theory](https://en.wikipedia.org/wiki/Markov_property)?
	* a stochastic (random) process has the markov property if the conditional probability distribution of future states of the process depends only upon the present state not on the sequence of events that preceded it
	* strong markov property
		* same as markov property except that the meaning of present is defined in terms of a random variable known as a stopping time
	* markov assumption
		* used to describe a model where the markov property is assumed to hold 
			* hidden markov models have this assumption
	* markov random field
		* extends the markov property to two or more dimensions or to random variables defined for an interconnected network of items
			* ising model is an example
	* markov chain
		* a discrete-time stochastic process satisfying the markov property

* what is a [conditional probility distribution in the field of probability theory](https://en.wikipedia.org/wiki/Conditional_probability_distribution)?
	* given two jointly distributed random variables X and Y, the conditional probability distribution of Y given X is the probability distribution of Y when X is known to be a particular value

* what is [probability distribution in the field of probability theory](https://en.wikipedia.org/wiki/Probability_distribution)?
	* a mathematical function that can be thought of as providing the probabilit of occurence of different possible outcomes in an experiment
		* basically P in probability space

* what is a [markov chain in the field of probability theory](https://en.wikipedia.org/wiki/Markov_chain)?
	* a type of markov process that has either discrete state space or discrete index set
		* precise definition of a markov chain varies but always contains some sort of discrete interval
	* many applications as statistical models of real-world processes
		* studying cruise control systems in motor vehicles
		* queues or lines of customers arriving at an airport
		* exchange rates of currencies

* what are [absorbing markov chains in the field of probability theory](https://en.wikipedia.org/wiki/Absorbing_Markov_chain)?
	* an absorbing markov chain is a markov chain that contain at least one absorbant states and that all states have a path to an absorbant state
		* absorbant state is a state where once reached it does not leave
			* i.e. once reached it becomes stable
	* [steps to finding the absorbtion probabilities of a markov chain](https://math.dartmouth.edu/archive/m20x06/public_html/Lecture14.pdf)
		* create transition matrix
			* a matrix filled with the probabilities of each state changing
		* turn it into a canonical form
			* reorganize the matrix such that the absorbing states follow the transient states
			* the canonical form can be broken into sections
				* ![canonical form](https://wikimedia.org/api/rest_v1/media/math/render/svg/97645f614d72a3fdcd42763e4fd74b1817f2e5bc "canonical form")
		* find the fundamental matrix
			* fundamental matrix
				* inverse matrix of (identity matrix of (Q) - Q)
		* compute the absorption probabilities
			* absorption probabilities = fundamental matrix * (R found within the canonical form)























