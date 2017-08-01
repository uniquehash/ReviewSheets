# overview of compression algorithms

* what is the [rabin-karp algorithm](https://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_algorithm)?
	* a string searching algorithm
	* uses hashing to find any one of a set of pattern strings in a text 
	

* what are [string searching algorithms](https://en.wikipedia.org/wiki/String_searching_algorithm)?
	* also known as string matching algorithms
	* a class of string algorithms
	* tries to find a place where one or several strings are found within a larger string or text
	* the algorithms can be classified by the number of patterns each use
		* single pattern algorithms
			* naïve string search
				* probably just checks every single possible sequence
			* rabin-karp string search
				* uses hashing to find any one of a set of pattern strings in a text
			* finite-state automaton based search
				* avoid backtracking by constructing deterministic finite automaton that recognize stored search string
			* knuth-morris-pratt 
				* searches for occurrences of a "word" w within a main "text string"  s by employing the observation that when a mismatch occurs, the word itself embodies sufficient information to determine where the next match could begin, thus bypassing re-examination of previously matched characters
			* boyer-moore string search
				* the standard benchmark for practical string search
				* preprocesses the string being searched for but not the string being searched 
					* uses information gathered during the preprocess step to skip the sections of the text, resulting in a lower constant factor than other string search algorithms
			* bitap
				* also known as the shift-or, shift-and, or baeza-yates-gonnet algorithm
				* an approximate string matching algorithm
				* tells whether a given text contains a substring which is "approximately equal" to a given pattern, where approximate equality is defined in terms of levenshtein distance 
		* algorithms using a finite set of patterns
			* aho-corasick string matching
				* a dictionary matching algorithm that locates elements of a finite set of strings within an input text
					* matches all string simultaneously
			* commentz-walter 
				* it can search for multiple patterns at once
				* combines aho-corasick with fast matching of boyer-moore
			* rabin-karp string search algorithm
				* uses hashing to find anyone of a set of pattern strings in a text
		* algorithms using an infinite number of patterns
			* regular grammar
			* regulat expression

* what are [string algorithms](https://en.wikipedia.org/wiki/String_(computer_science)#String_processing_algorithms)?
	* basically alllll of the ways you can interact with strings
	* a class of algorithms for processing strings each with various trade-offs
		* string searching
			* try to find a place where one or several strings are found within a larger string or text
		* string manipulation 
			* functions used to manipulate a string or query information about a string
		* sorting algorithms
			* an algorithm that puts elements of a list in a certain order
		* regular expression
			* a sequence of characters that define a search pattern 
		* parsing
			* a set of functions that take input data and extract information into a some form of structured data
		* sequence mining
			* a topic of data mining concerned with finding statistically relevant patterns between data examples where the values are delivered in a sequence