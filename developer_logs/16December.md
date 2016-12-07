# December

### December 1st 2016 - printf

fixed the bug wooooooooooooooo makes me happy. C is fun. my string shift function was comparing null string and then iterating through, which of course broke into the memory of the next global which happened to be the conversions. this caused the conversions to be tagged on to the length are instead of their appropriate place. silly bug == squashed. 

er... what should i do next? not sure, i should re-asses the sittuation and remap it, it's a fuzzy picture right now. i think it's just a bunch of conversions, then handling the flags and then good to go for testing. 

* conversions
	* `d`
		* signed decimal notation (done woot!)
	* `D`
		* signed decimal notation (done woot!)

	* `i`
		* signed decimal notation (done woot!)

	* `u`
		* unsigned decimal notation (done woot!)
	* `U`
		* unsigned decimal notation (done woot!)

	* `o`
		* unsigned octal notation (done woot!)
	* `O`
		* unsigned octal notation (done woot!)
	* `x` 
		* unsigned hexadecimal notation (done woot!)
	* `X`
		* unsigned hexadecimal notation (done woot!)
	* `p`
		* print pointer address in hexadecimal with '0x' (done woot!)
	* `c`
		* int converted to an unsigned char and resulting character is written
	* `C`
		* `c` with `l` modifier (wide char)
	* `s`
		* `char*` argument shoul be a pointer to an array of characters 
		* research dog
	* `S`
		* `s` with `l` modifier
		* research dog

i'll worry about everything else later, since usually you need to have the stuff converted before you can really do anything anyway

### December 2nd 2016 - printf

so now i'm up to the `c`, and `s` flag. these are rather complicated. i'm gonna need to change all my shit to work with `unsigned char`. that blows. not dealing with it tonight. good luck future oliver reading this :), and fuck you too.

### December 5th 2016 - printf

it's finally time to work on the `char` and `char*` conversions. these are kinda different. i'm gonna need to do a bunch of research. first thing first is doing this `setlocal` thing. 

* `man setlocale`
	* function that set's the C library's notion of natural language formatting style for particular sets of routines.
	* recoginizes several caregories of routines 
		* `LC_ALL`
			* set the entire locale generically 
		* `LC_COLLATE`
			* set a locale for string collation routines
			* controls alphabetic ordering in `strcoll()` and `strxfrm()`
		* `LC_CTYPE`
			* set a locale for the `ctype(3)` and `multibyte(3)` function
			* this controls recognition of upper and lower case, alphabetic or non-alphabetic characters, and so on
		* `LC_MESSAGES`
			* set a locale for message catalogs, see `catopen(3)` function
		* `LC_MONETARY`
			* set a locale for formatting monetary values
			* this affects the `localeconv()` function 
		* `LC_NUMERIC`
			* set a locale for formatting numbers
			* this controls the formatting of decimal points in input and output of floating point numbers in functions such as `printf()` and `scanf()`, as well as values returned by `localeconv()`
		* `LC_TIME`
			* set a locale for fotmatting dates and times using the `strftime()` function
	* only three locales are defined by the defaule `""` empty string denoting the native environment

i need to do more research on UTF-8 characters. it seems if i just convert the `wchar_t` into a `char` with the appropriate shifting or something it will work.

* notes on health care
	* call up provider 
	* tell them my age ect...
	* $47,000
	* just google it, don't go through healthcare.gov
	* get a bronze plan don't ask for gov assitance

creating `utf-8` encoded `char` is a total pain in the ass. not quite sure what to do about it. noooooooooooo. i just realized what i have to do. it's fucking tragic. i'm going to need to do all the binary stuff first, and then build a weird atoi that will convert a `char *` into a integer value (from base 2). might as well make it's own insane function with a bunch of static functions and have it return a `char *` which will effectively be the multi-byte sequence we so desperatily desire.

* convert our `wchar_t` into a `char *`
	* pray
	* convert `wchar_t` into a binary `char*`
	* pad the `char*` with `0` on the left until we have the appropriate number of characters
		* depends on how many bytes will be in our final `utf-8` character
	* mark our seperations in the binary `char*` with some character
	* apply the `utf-8` encoding to each of the subsections 
	* convert each subsection into an integer representation stored in a `char` 
	* stich a `char*` together from the subsections and return it

that's my initial plan. gonna talk to some people before i implement it cause i really don't feel like doing all that and if someone has a better way to implement this conversion, i am most def game. there's no way everyone did the conversion this way. oh @Matt-Hurd is a good person to talk to about this insanity.

turns out there is a better way. it's basically the same thing but using bitwise operators instead of interacting with them as `char*`. which means i'm going to have to learn how to use them. bout time anyway i learned to use them. 

### December 6th 2016 - printf

i must finally learn how to use bitwise operators. such is life. 

* how do bitwise operators work?
	* they perform operations on the bit level
	* operators
		* `&`
			* binary AND operator 
			* copies a bit to the result if it exists in both operands
		* `|`
			* binary OR operator 
			* copies a bit if it exists in either operand
		* `^`
			* binary XOR operator
			* copies a bit if it is set in one operand but not both
		* `~`
			* binary one's complement operator 
			* is unary and has the effect of `flipping` bits
		* `<<`
			* binary left shift operator
			* the left operands value is moved left by the number of bits specified by the right operand
		* `>>` 
			* binary right shift operator
			* the left operands value is moved right by the number of bits specified by the right operand
	
how bitwise operators work is fairly straight forward. the real question is how to use bitwise operators in a useful way. 

lets see. since i know the rules of `utf-8`, including the boundaries i can add the leading bit appropriate for the number of bytes used, then shift the each continution byte by two and and flip the first bit.

* design of bitwise conversion from `wchar_t` to multi-byte `char`
	* determine number of bytes using the `utf-8` ranges
	* insert leading byte high-order bits and fill in remaining bits with appropriate set from the `wchar_t`
	* insert the continuation byte marker on each of the remaining bytes, bit shifting appropriately allong the way 
	* figure out how to make the computer do all that

okay so i need to use a bitmask. new design.

* design of bitwise conversion from `wchar_t` to multi-byte `char`
	* determine number of bytes using the `utf-8` ranges
	* bitshift right `wchar_t` to the appropriate number of bits for leading byte
	* assign a `char` to the value of the shifted `wchar_t`
	* insert leading byte markers to beginning of `char`
	* bitshift right `wchar_t` to the appropriate number of bits for continuation bytes
	* assign a `char` to the value of the shifted `wchat_t`
	* insert continuing byte maker to the beginning of `char`

this is pretty much sudo code, so the implementation shouldn't be too painful.

this is going to be a lot clearer if i have a function to display my thing in binary for the size of the type. in other words, i should implement a printf conversion that will display the num represented in half-byte binary form. this will be my first bonus conversion :).

woooo finished it. now on to `s`.











