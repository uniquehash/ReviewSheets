# general notes on the field of probability theory, this one hurt google. it really hurt. im gonna need to learn a shit ton to get this done.

markov
	https://www.youtube.com/watch?v=63HHmjlh794&t=675s
	http://linkis.com/setosa.io/ev/markov-/aQv2l

https://en.wikipedia.org/wiki/Probability_theory
https://en.wikipedia.org/wiki/Random_variable
https://en.wikipedia.org/wiki/Event_(probability_theory)
https://en.wikipedia.org/wiki/Sample_space
https://en.wikipedia.org/wiki/Experiment_(probability_theory)
https://en.wikipedia.org/wiki/Stochastic_process
https://en.wikipedia.org/wiki/Markov_chain


https://www.youtube.com/user/knowitvideos
http://setosa.io/ev/



* what is [probability theory in the first place](https://en.wikipedia.org/wiki/Probability_theory)?
	* a branch of mathematics concerned with probability
		* the analysis of random phenomena
	* the central objects of probability theory
		* random variables
		* stochastic processes
		* events
	* it is not possible to predict precisely results of random events
		* if a sequence of individual events is influenced by other factors
			* will exhibit certain patterns
				* can be studied and predicted
	* mathematical results describing patterns influenced by other factos 
		* law of large numbers
		* central limit theorem
	* the mathematical foundation for statistics
	* methods of probability theory apply to descriptions of complex systems given only partial knowledge of their state
		* statistical mechanics
	* this shit is completely over my head


* what are [random variables in the field of probability theory](https://en.wikipedia.org/wiki/Random_variable)?
	* a variable quantity whosepossible value depend, in random manner, on a set of random outcomes events

* what are [events in the field of probability theory](https://en.wikipedia.org/wiki/Event_(probability_theory))?
	* a set of outcomes of an experiment to which a probability is assigned
		* unlike a sample space which is simply a set of outcomes
	* a single outcome may be an element of many different events
	* different evetns in an experiment are usually not equally likely since they may include very different groups of outcomes

* what is a [sample space in the field of probability theory](https://en.wikipedia.org/wiki/Sample_space)?
	* the set of all possible outcomes or results of an experiment
	* usually denoted using set notation
		* possible outcomes are listed as elements in the set
	* multiple sample
		* for many experiments there may be more than one plausible sample space available
			* depending on what result is of interest to the experimenter
		* to find the most complete description of outcomes
			* find the cartesian product of all the sample spaces
	* equally likely outcomes
		* when all the outcomes of an experiment can be considered to be approximately equal
			* then the probability of an event is simple to describe mathematically
				* P(event) = number of outcomes in event / number of outcomes in sample space
	* simple random sample
		* a sample in which every individual in the population is equally likely to be included
			* mathematically
				* the sample space of simple random samples of a given size from a given population is composed of equally likely outcomes
	* infinitely large sample spaces
		* in an elementary approach to probability
			* any subset of the sample space is usually called an event
			* problamatic when the sample space is infinite
		* infinite sample space
			* σ-algebra
				* only measurable subsets of the sample space 
			* events in cases with an infinite sample size
				* only measurable subsets of the sample size (σ-algebra) / the sample size itself

* what is an [experiment in the field of probability theory](https://en.wikipedia.org/wiki/Experiment_(probability_theory))?
	* any procedure that can be infinitely repeated and has a well defined set of possible outcomes, known as the sample space
		* random 
			* an experiment is random if it has more than one possible outcome
			* Bernoulli trial
				* a random experiment that has exactly two (mutually exclusive) possible outcomes
		* deterministic
			* an experiment is deterministic if it has only one outcome
	* after conducting many trials of the same experiment and pooling the results an experimenter can beging to assess the empirical probabilities of the various outcomes and events that can occur		
	* experiments and trials
		* random experiments are often conducted repeatedly
			* the collective results can be subjected to statistical analysis
		* composed experiment
			* fixed number of repetitions of the same experiment
		* trials
			* individual repetitions within an experiment
	* mathematical description
		* random experiments are modelled by a mathematical construct known as a probility space



* what are [empirical probabilities in the field of probability theory](https://en.wikipedia.org/wiki/Empirical_probability)?
	* the empirical probability of an event is the ratio of the number of outcomes in which a specified event occurs to the total number of trials
		* not in a theoritical sample space but in an actual experiment
	* estimates probabilities from experience and observation


* what is [probability space in the context of probability theory](https://en.wikipedia.org/wiki/Probability_space)?
	* a mathematical constructs that model a real-world experiment or process consisting of states that occur randomly
		* constructed with a specific kind of sittuation or experiment in mind
	* one proposes that each time a situation of that kind arises
		* the set of possible outcomes is the same
		* the probabilities are also the same
	* probability space consist of three parts
		* Ω: sample space
			* the set of all possible outcomes
		* ![{\displaystyle {\mathcal {F}}} {\mathcal {F}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/205d4b91000d9dcf1a5bbabdfa6a8395fa60b676 "set of events"): set of events
			* each event is a set containing zero or more outcomes
		* ![{\displaystyle P} P](https://wikimedia.org/api/rest_v1/media/math/render/svg/b4dc73bf40314945ff376bd363916a738548d40a "assignment of probabilities to the event"): the assignment of probabilities to the event
			* a function from events to probabilities

* what are [outcomes in the field of probability theory](https://en.wikipedia.org/wiki/Outcome_(probability))?
	* a possible result of an experiment
		* each possible outcome of a particular experiment is unique and different outcomes are mutually exclusive
	* all of the possible outcomes of an experiment form the elements of a sample space

* what is a [stochastic process in the field of probability theory](https://en.wikipedia.org/wiki/Stochastic_process)?
	* a stochastic process is also known as a random process
	* mathematical object usually defined as a collection of random variables
		* widely used as mathematical models of systems and phenomena that appear to vary in a random manner
	* can be divided into various categories
		* random walks
		* martingales
		* markov processes
			* wiener process
				* important stochastic process
			* poisson process
				* important stochastic process
		* Lévy processes
		* gaussian processes
		* random fields
		* renewal processes
		* branching processes

* what is a [markov process in the field of probability theory](https://en.wikipedia.org/wiki/Markov_chain)?
	* a stochastic (random) process that satisfies the markov property
		* markov property
			* a process satisfies the markov property if one can make predictions for the future of the process based solely on its present state just as well as one could knowing the process's full history
				* conditional on the present state of the system, its future and past states are independent
































