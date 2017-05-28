# overview of natural language processing - 5/21/2017


* what is [natural language processing](https://en.wikipedia.org/wiki/Natural_language_processing)?
	* acronym is nlp
	* concerned with the interactions between computers and human natural language
		* especially allowing computers to process large natural language corpora in a useful way
	* challenges in natural language processing
		* natural language understanding
		* natural language generation
		* connecting language and machine perception
		* managing human-computer dialog systems
	* history
		* field started in the 1950s
			* turing test as a criterion of intelligence
		* fully automatic translation 
			* 1954: 60 russian sentences into english, not great
			* 1966: not much progress
			* 1980s: statistical machine translation systems developed
		* conceptual ontologies
			* 1970s: structuring real-world information into computer understandable data
				* MARGIE, SAM, PAM, TaleSpin, QUALM, Politics, Plot Units
				* first chatbots start to emerge
		* machine learning algorithms
			* late 1980s: statistical revolution
				* decision trees
				* part-of-speech tagging
					* introduction of hidden markov models
			* current models:
				* cache language models
					* statistical models that make soft probabilistic decisions based on attaching real-values weights to the features making up the input data
				* unsupervised and semi-supervised learning 
					* able to learn from data that has not been hand-annotated with the desired answer
				* deep learning techniques acheiving great results
					* language modeling
					* parsing
					* ect...
	* statistical natural language processing
		* using system based machine learning algorithms instead of hand produced rules
		* many advantages
			* automatically focuses on the most common cases
			* can make use of statistical inference algorithms to produce models that are robust to:
				* unfamiliar input
					* containing words or structures that have not been seen before
				* erroneous input
					* misspelled words or words accidentally omitted
			* can be made more accurate simply by supplying more input data
	* major evalutations and tasks
		* syntax
			* lemmatization
				* the process of grouping together inflected forms of a word so they can be analysed as a single item
			* morphological segmentation
				* seperate words into individual morphemes and identify the class of the morphemes
			* part-of-speech tagging
				* given a sentence determine the part of speech for each word
			* parsing
				* determine the parse tree (grammatical analysis) of a given sentence
			* sentence breaking (sentence boundary disambiguation)
				* given a chunk of text, find the sentence boundaries
			* stemming
				* the process of reducing inflected words to their word stem
			* word segmentation
				* separate a chunk of continuous text into separate words
		* semantics
			* lexical semantics
				* what is computational meaning of individual words in context
			* machine translation
				* automatically translate text from one human language to another
			* named entity recognition (NER)
				* given a natural language corpora determine which items in the text map to proper names and the type of such name
			* natural language generation
				* convert information from computer databases or semantic intents into readable human language
			* natural language understanding
				* convert chunks of text into more formal representations such as first-order logic structures that are easier for computer programs to manipulate
			* optical character recognition
				* given an image representing printed text, determine the corresponding text
			* question answering
				* given human-language question determine its answer
			* recognizing textual entailment
				* given a chunk of text, identify the relationships among named entities
			* sentiment analysis
				* extract subjective information usually from a set of documents, often using online reviews to determine polariy about specific objects
			* topic segmentation and recognition
				* given a chunk of text, separate it into segments each of which is devoted to a topic, and identify the topic of the segment
			* word sense disambiguation
				* many words have more than one meaning
					* select the meaning which makes the most sense in context 
		* discourse
			* automatic summarization
				* produce a readable summary of a chunk of text
			* coreference resolution
				* given a sentence or larger chunk of text, determine which words refer to the same object
			* discourse analysis
				* identifying the discourse structure of connected text
					* nature of the discourse relationships beteween setences
				* recognizing and classifying the speech acts in a chunk of text
		* speech
			* speech recognition
				* given a sound clip of a person or people speaking determine the textual representation of the speech
			* speech segmentation
				* given a sound clip of a person or people speaking separate it into words
			* text-to-speech
				* artificial production of human speech


* what is a [natural language corpora](https://en.wikipedia.org/wiki/Corpus_linguistics)?
	* the study of language as expressed in corpora of real world text
	* digestive approach for deriving a set of abstract rules from a text for governing a natural language, and how that language relates to and with another language

* what is a [corpora](https://en.wikipedia.org/wiki/Text_corpus)?
	* a large and structured set of texts
	* used for many things
		* statistical analysis and hypothesis testing
		* checking occurrences
		* validating linguistic rules within a specific language territory

* what is [document classification](https://en.wikipedia.org/wiki/Document_classification)?
	* assign a document to one or more classes or categories
	* subject based classification
		* content-based
			* the weight given to particular subjects in a document determines the class to which the document is assigned
				* common library rule
					* at least 20% of the subject matter of a book should be about the class to which the book is assigned
		* request based	
			* anticipated request from users influences how documents are being classified
				* basically a policy based classification
	* automatic document classification
		* types
			* supervised document classification
				* an external mechanism provides information on the correct classification for documents
			* unsupervised document classification
				* the classification must be done entitely without reference to external information
			* semi-supervised document classification
				* parts of the documents are labled by the external mechanism
		* techniques
			* expectation maximization
				* an iterative method to find maximum liklihood or maximum a posteriori (MAP) estimates of parameters in a statistical method where the model depends on unobserved latent variables
			* naive bayes classifier
				* a simple probabilistic classifier
					* based on applying bayes theorem 
					* strong independence assumptions between the features
			* tf-idf
				* a statistic intended to reflect how important a word is to a document in a collection of corpus
			* instantaneously trained neural networks
			* latent semantic indexing
			* support vector machines
				* supervised learning models with associated learning algorithms that analyze data used for classification and regression analysis
			* artificial neural network
			* k-nearest neighbour algorithms
			* decision trees
			* concept mining
			* rough set-based classifier
			* multiple-instance learning
		* applications
			* spam filtering
				* process which tries to discern email spam messages from legitimate emails
			* email routing
				* sending an email sent to a general address to a specific address or mailboc depending on topic
			* language identification
				* automatically determining the language of a text
			* genre classification
				* automatically determining the genre of a text
			* readability assessment
				* automatically determining the degree of readability of a text
			* sentiment analysis
				* determining the attitude of a speaker or a writer with respect to some topic or the overall contextual polarity of a document
			* article triage
				* selecting articles that are relevant for manual literature curation

* what is a [naive bayes classifier](https://en.wikipedia.org/wiki/Naive_Bayes_classifier)?
	* a simple probabilistic classifier
		* based on applying bayes theorem 
		* strong independence assumptions between the features
	* used often for text categorization
		* the problem of classifying text
		* for text categorization it is competitive with advanced methods such as support vector machines
	* introduction
		* simple technique for constructing classifiers
			* models that assign class labels to problem instances represented as vectors of feature values where the class labels are drawn from some finite set
		* a family of algorithms based on a common principle
			* the value of a particular feature is independent of the value of any other feature given the class variables
		* works very well with little data sets but out performed by other approaches such as boosted trees or random forests

* what does [independence mean in probabilistic models](https://en.wikipedia.org/wiki/Independence_(probability_theory))?
	* two events are independent if the occurrence of one does not affect the probability of occurrence of the other

* how does [spam filtering work in the context of nlp](https://en.wikipedia.org/wiki/Naive_Bayes_spam_filtering)?

* what is the [expectation-maximization algorithm](https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm) and how does it work?
	* an iterative method to find maximum liklihood or maximum a posteriori (MAP) estimates of parameters in a statistical method where the model depends on unobserved latent variables

* what does [maximum a posteriori mean in the context of statistical modeling](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation)?
	* an estimate of an unknown quantity that equals the mode of the posterior distribution
	* used to obtain a point estimate of an unobserved quantity on the basis of emperical data

* what does [posterior probability mean in the context of statistical modeling](https://en.wikipedia.org/wiki/Posterior_probability)
	* the posterior probability of a random event is the conditional probability that is assigned after the relevant evidence of background is taken into account
	* posterior probability distribution is the probability distribution of an unknown quantity treated as random variables conditional on the evidence obtained from an experiment
		* posterior here refers to after taking into account the relevant evidence related to the particular case being examined 

* what does [point estimation mean in the context of statistics](https://en.wikipedia.org/wiki/Point_estimation)?
	* point estimation involves the use of sample data to calculate a single value which is to serve as a best guess or best estimate of an unknown population parameter
	* contrasted with interval estimation

* what does [interval estimation mean in the context of statistics](https://en.wikipedia.org/wiki/Interval_estimation)?
	* the use of sample data to calculate an interval of possible values of an unknown population parameter

* what does [maximum likelihood estimation mean in the context of statistical modeling](https://en.wikipedia.org/wiki/Maximum_likelihood_estimation)
	* method of estimating the parameters of a statistical model given observations by finding the parameter values that maximize the likelihood of making the observations given the parameters
	* can be thought of as a special case of the maximum a posteriori estimation
		* either
			* assumes a uniform prior distribution of parameters
		* or
			* unregularized variant
				* a variant of maximum a posteriori that is ignores the prior

* what does [regularization mean in the context of statistics](https://en.wikipedia.org/wiki/Regularization_(mathematics))?
	* a process of itroducing additional information in order to solve an ill-posed problem or to prevent overfitting

* what is a [well-posed problem in the context of mathematics](https://en.wikipedia.org/wiki/Well-posed_problem)?
	* mathematical models of physical phenomena should have the following 3 properties
		* a solution exists
		* the solution is unique
		* the solution's behavior changes continuously with the initial conditions
	* ill-posed problems
		* problems that do not satisfy the above criteria

* what is an [inverse problem in the context of science](https://en.wikipedia.org/wiki/Inverse_problem)?
	* the process of calculating from a set of observations the causal factors that produced them

* what does [overfitting mean in the context of statistics](https://en.wikipedia.org/wiki/Overfitting)?
	* statistical model describes random error or noise instead of the underlying relationship
		* occurs when model is excessively complex
			* too many parameters relative to the number of observations
		* has poor predictive performance because it reacts to minor fluctuations in the training data

* what are [latent variables in the context of statistics](https://en.wikipedia.org/wiki/Latent_variable)?
	* variables that are not directly observed but are rather inferred from other variables that are observed

* what is [tf-idf in the context of information retrieval](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)?
	* short for term frequency-inverse document frequency
		* a statistic intended to reflect how important a word is to a document in a collection of corpus
	* used as a weighting factor in:
		* information retrieval
		* text mining
		* user modeling
	* the tf-idf value increases proportionally to the number of times a word appears in the document, but offset by the frequency of the word in the corpus
		* helps adjust for the fact that some words appear more frequently in general 

* what are [support vector machines in the context of machine learning](https://en.wikipedia.org/wiki/Support_vector_machine)?
	* supervised learning models with associated learning algorithms that analyze data used for classification and regression analysis
	* given a set of training examples each marked as belonging to one or the other of two categories an SVM training algorithm builds a model that assigns new examples to one category or the other
		* non-probabilistic binary linear classifier

* what does [word embedding mean in the context of natural language processing](https://en.wikipedia.org/wiki/Word_embedding)?
	* a collective name for a set of language modeling and feature learning techniques where words or phrases from the vocabulary are mapped to vectors of real numbers

* what does [n-gram mean in the context of probability](https://en.wikipedia.org/wiki/N-gram)?
	* n-gram is a contiguous sequence of n items from a given sequence of text or speech
	* items can be:
		* phonemes
		* syllables
		* letters
		* words
		* base pairs
	* when n-grams are words they may also be called shingles

* what are [stop words in the context of computing](https://en.wikipedia.org/wiki/Stop_words)?
	* words which are filtered out before or after processing of natual language data



























