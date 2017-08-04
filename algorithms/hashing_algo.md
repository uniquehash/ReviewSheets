# overview of hashing algorithms

* what is a [hash function](https://en.wikipedia.org/wiki/Hash_function)?
	* any function that can be used to map data of arbitrary size to data of fized size
		* value returned known as
			* hash values
			* hash codes
			* digests
			* hashes
	* uses
		* hash tables
			* a table with O(1) look up
		* caches
			* used to build caches for large data sets stored in slow media
			* basically a hash table with simple overwrite on collisions
		* bloom filters
			* a space-efficient probabilistic data structure that is used to test whether an element is a member of a set
			* david thought these were beautiful
		* protecting data
			* can be used to uniquely identify secret information
				* hash must be collision-resistant
					* very few collisions
			* two types
				* cryptographic hash functions
				* provably secure hash functions
					* most secure but too slow for most practical purposes
		* geometric hashing
			* used to solve proximity problems in two dimensional planes or three dimensional space
				* finding closest pair in a set of points
				* similar shapes in a list of shapes
				* similar images in an image database
	* properties
		* determinism
			* for any given input it must always generate the same hash value
		* uniformity
			* a good hash function should map the expected inputs as evenly as possible over its output range
			* each output should have roughly the same probability of occuring 
		* range
			* defined range
				* the output of the hash function has a fixed size 
				* every output can be represented using the same number of bits
			* variable range
				* though a hashing function can be fixed it may need to map to a variable ouput range
					* can be achieved by using modulo 
					* very important that the hashing function maintains uniformity for this range
			* variable range with minimal movement (dynamic hash function)
				* honestly can't understand this right now and moving on but it's apparently useful for distributed hash tables
		* data normalization
			* the input data should be normalized before hashing
			* if working with complex data structures then some sort of standard serialization or normalization should be done before hashing
		* continuity
			* hash functions that are used to search for similar data must be as continuous as possible
				* two inputs that differ by a little should be mapped to equal or nearly equal values
			* used in hash tables for nearest neighbor search
		* non-invertible
			* required for cryptographic hashes
				* not realistic to reconstruct the input datum x from it's hash value without spending absurd amounts of computing time
	* hash function algorithms
		* trivial hash function
			* if your ouput range is larger than the input range then the data itself can be reinterpreted as the hash value
			* this is basically what we did for printf :)
		* perfect hashing
			* injective 
				* each valid input maps to a different hash value
			* known as a perfect hash function
				* no collisions
		* minimal perfect hashing
			* a hashig function that yields a hash table without vacant slots
		* hashing uniformly distributed data
		* hashing data with other distributions
		* hashing variable-length data
		* special-purpose hash functions
		* rolling hash
		* universal hashing
		* hashing with checksum functions
		* multiplicative hashing
		* hashing with cryptographic hash functions
		* hashing by nonlinear table lookup
		* efficient hashing of strings
	* oliver's thoughts
		* two kinds of hashing functions
			* divergent
				* hashing functions where similar strings create extremely different hash values
				* useful in hash tables and the like
			* convergent
				* hashing functions where similar strings create the same hash value
				* useful for approximating similarity
			* super cool i had always assumed that there would only be divergent hashing functions since i've only thought of them in the case of hash tables but by no means is this a property of hashing functions. it is simply a property of hashing functions used in hash tables
			* interesting avoiding collisions is part of the uniformity property of hashing functions so my above conclusion is incorrect but actually sounds like something that would be interesting to exploit
			* wooooo my idea is actually thing people do in very specific cases
		* hashing is super fucking cool