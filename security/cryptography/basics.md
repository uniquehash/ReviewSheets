# basics of crypto

* any intro resources into [understanding an overview and basic intro to cryptography](https://www.tutorialspoint.com/cryptography/index.htm)?
	* origin
		* humans have two inherit needs
			* communicate and share information
			* communicate selectively
		* cryptography
			* the art and science of concealing the messages to introduce secrecy in information security 
			* two greek words
				* krypto
					* hidden
				* graphene
					* writing
		* history
			* hieroglyph
				* oldest cryptographic technique
				* hieroglyph writing only known by select people
			* ciphers
				* caesar shift cipher
					* relies on shifting the letters of a message by an agreed number
					* recipient then shifts the letters back by the same number to obtain the original message
			* steganography
				* people not only want to protect the secrecy of information but also make sure unauthorized people have no evidence that the information exists	
					* invisible watermarking
				* this can be data encoded into an image 
		* evolution
			* vigenere coding
				* 15th century
				* offered moving letters in the message with a number of variable places instead of moving them the same number of places
			* enigma rotor machine
				* 20th century
				* mechanical and electromechanical machines 
				* provided more advanced and efficient means of coding information
			* WWII
				* cryptography and cryptoanalysis become excessively mathematical
	* modern cryptography
		* difference between classic cryptography and modern cryptography
			* classic
				* manipulates traditional characters like letters and digits
				* mainly based on security through obscurity
				* requires the entire cryptosystem for communicating confidentially
			* modern
				* operates on binary bit sequences
				* relies on publicly known mathematical algorithms
					* the attacker knowing how it works does not make it any less secure
				* requires parties interested in secure communication to possess the secret key only
		* context of cryptography
			* cryptology can be divided into two branches
				* cryptography
					* the art and science of making a cryptosystem that is capable of providing information security
					* deals with actual securing of digital data
					* refers to the design of mechanisms based on mathematical algorithms that provide fundamental information secruity services
				* cryptoanalysis
					* the art and science of breaking the cipher text
					* the study of cryptographic mechanisms with the intention to break thme
		* security services of cryptography
			* CIA triad and non-repudiation
				* confidentiality
					* ensures that only authorized entity have and had accessed the data
				* data integrity
					* ensures that the data is as originally intended and has not been modified by any unauthorized entity
				* authentication
					* ensures the identity of the originator
					* message authentication
						* identifies the originator of the message without any regard router or system that has sent the message
					* entity authentication
						* is assurance that data has been received from a specific entity, say a particular website
				* non-repudiation
					* an entity cannot refute the ownership of a previous commitment or an action
		* cryptography primitives
			* the tools and techniques in cryptography
				* encryption
					* confidentiality
				* hash functions
					* 50/50 integrity
				* (MAC) message authentication codes
					* integrity
					* authentication
					* 50/50 non-repudiation
				* digital signatures
					* integrity
					* authentication
					* non-repudiation
	* cryptosystems
		* a cryptosystem is an implementation of cryptographic techniques and their accompanying infastructure to provide information security services
			* can also be referred to as a cipher system
		* simple model
			* ![simple cryptosystem](https://www.tutorialspoint.com/cryptography/images/cryptosystem.jpg "simple cryptosystem")
					
				

















































