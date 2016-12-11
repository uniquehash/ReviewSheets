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
		* int converted to an unsigned char and resulting character is written (done woot!)
	* `C`
		* `c` with `l` modifier (wide char) (done woot!)
	* `s`
		* `char*` argument shoul be a pointer to an array of characters  (done woot!)
		* research dog
	* `S`
		* `s` with `l` modifier (done woot!)
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


### December 7th 2016 - jeremiah project

The project will be an application of Python and SQL that we learned in this class, with an emphasis on using Python to get the data, and then using SQL to analyze your data.

* You are expected to do the following:
	* Find a source of data that you find interesting. You can find various examples below.
	* Based on the data you collect, create a database that can be used to store your data. You are encouraged to create an ER diagram first and then translate the ER diagram into a set of tables in MySQL.
 	* Load the data in the database and run at least 5 "interesting" SQL queries (including queries with joins and group by). Analyze the results of these queries, and explain (potentially with some visualizations) the interesting insights that you learned from this data analysis.

questions

growth rate by race of computer and mathematical occupations?

what was the average number of hours worked by race?

which occupation is likely to be working the most hours by race?

which salaried occupation by race is working the most hours?


### December 8th 2016 - ft_printf

okay length modifiers and conversions are done. i should complete printf cycle completely and split it up and make it real nice before i move forward with other modifiers, since this would techniquely be minimum requirements.

first off what does that even mean. 

it means that i should have a printf that will insert the appropriate shit into the string, and work for multiple conversions.

okay so multiple conversions is no biggie. buttttttt multiple conversions in the case of "%%%%" is a totally fucked. like ughhhhhhhhh. because of course it condenses to a single "%" since my set up takes the _whole_ _string_. which means i need to change how i'm thinking about the loop. i'm going to need to have two pointers. one of them is the finished pile. this pile doesn't get search, doesn't get fucked with it's just good to go. then i'll have the rest of the string pile. which is what has yet to be processed. what it means is that i'm going to have to do some string joining in my loop structure, instead of keeping it in the parsing subset of functions. this actually kinda makes more intuitive sense anyway. 

### December 10th 2016 - printf 

i closed the loop! wooo now moving to precision i guess. 

so precision is interesting. first off im gonna need to make a modifier processor set of functions. these functions will consildate what needs to be done for each modifier as well grab what ever they may need from va_args.

as far as precision itself there are a few things to think about. 

* precision 
	* `%diou`
		* insert leading 0's before the most significant digit
	* `%x`
		* insert leading f's before the most significant digit
		* for signed number these go before the `-` sign	
	* `s`
		* dictates the maximum number of characters to be printed	
	* `%pc` 
		* ignores precision

* test to run on system printf
	```
		printf("numerals precision\n");
		printf("printf: %%.d    %.d\n", 99);		
		printf("printf: %%.0d   %.0d\n", 99);
		printf("printf: %%.5d   %.5d\n", 99);
		printf("printf: %%.5d   %.5d\n", 99);
		printf("printf: %%.*d   %.*d\n", 4, 99);
		printf("printf: %%.*d   %.*d\n\n", -100, 99);
		printf("printf: %%.d    %.d\n", -44);		
		printf("printf: %%.0d   %.0d\n", -44);
		printf("printf: %%.5d   %.5d\n", -44);
		printf("printf: %%.5d   %.5d\n", -44);
		printf("printf: %%.*d   %.*d\n", 4, -44);
		printf("printf: %%.*d   %.*d\n\n", -100, -44);
		printf("printf: %%.o    %.o\n", 99);		
		printf("printf: %%.0o   %.0o\n", 99);
		printf("printf: %%.5o   %.5o\n", 99);
		printf("printf: %%.5o   %.5o\n", 99);
		printf("printf: %%.*o   %.*o\n", 4, 99);
		printf("printf: %%.*o   %.*o\n\n", -100, 99);
		printf("printf: %%.x    %.x\n", -44);		
		printf("printf: %%.0x   %.0x\n", -44);
		printf("printf: %%.5x   %.5x\n", -44);
		printf("printf: %%.5x   %.5x\n", -44);
		printf("printf: %%.*x   %.*x\n", 4, -44);
		printf("printf: %%.*x   %.*x\n\n", -100, -44);

		printf("pointer precision\n");
		printf("printf: %%.p    %.p\n", s0);		
		printf("printf: %%.0p   %.0p\n", s0);
		printf("printf: %%.1p   %.1p\n", s0);
		printf("printf: %%.5p   %.5p\n", s0);
		printf("printf: %%.*p   %.*p\n", 4, s0);
		printf("printf: %%.*p   %.*p\n\n", -100, s0);

		printf("char precision\n");
		printf("printf: %%.c    %.c\n", 'f');		
		printf("printf: %%.0c   %.0c\n", 'f');
		printf("printf: %%.1c   %.1c\n", 'f');
		printf("printf: %%.5c   %.5c\n", 'f');
		printf("printf: %%.*c   %.*c\n", 4, 'f');
		printf("printf: %%.*c   %.*c\n\n", -100, 'f');

		printf("char* precision\n");
		printf("printf: %%.s    %.s\n", "ssss");		
		printf("printf: %%.0s   %.0s\n", "ssss");
		printf("printf: %%.2s   %.2s\n", "ssss");
		printf("printf: %%.20s  %.20s\n", "ssss");
		printf("printf: %%.15s  %.15s\n", s);
		printf("printf: %%.*s   %.*s\n", 10, "ssss");
		printf("printf: %%.*s   %.*s\n\n", -100, "ssss");
	```

holy shit that was tiring. well. precision flags are done. oh yea. va_arg fun time to remember. upcasting a negative signed int to a signed long through va_args flips the data type.

* test code part 2 for precision
	```
		printf("numerals precision\n");
		   printf("   printf: %%.d    %.d\n", 99);		
		ft_printf("ft_printf: %%.d    %.d\n", 99);		
		   printf("   printf: %%.0d   %.0d\n", 99);
		ft_printf("ft_printf: %%.0d   %.0d\n", 99);
		   printf("   printf: %%.5d   %.5d\n", 9555549);
		ft_printf("ft_printf: %%.5d   %.5d\n", 9555549);
		   printf("   printf: %%.5d   %.5d\n", 99);
		ft_printf("ft_printf: %%.5d   %.5d\n", 99);
		   printf("   printf: %%.*d   %.*d\n", 4, 99);
		ft_printf("ft_printf: %%.*d   %.*d\n", 4, 99);
		   printf("   printf: %%.*d   %.*d\n", -100, 99);
		ft_printf("ft_printf: %%.*d   %.*d\n\n", -100, 99);
		   printf("   printf: %%.d    %.d\n", -44);		
		ft_printf("ft_printf: %%.d    %.d\n", -44);		
		   printf("   printf: %%.0d   %.0d\n", -44);
		ft_printf("ft_printf: %%.0d   %.0d\n", -44);
		   printf("   printf: %%.5d   %.5d\n", -44);
		ft_printf("ft_printf: %%.5d   %.5d\n", -44);
		   printf("   printf: %%.5d   %.5d\n", -44);
		ft_printf("ft_printf: %%.5d   %.5d\n", -44);
		   printf("   printf: %%.*d   %.*d\n", 4, -44);
		ft_printf("ft_printf: %%.*d   %.*d\n", 4, -44);
		   printf("   printf: %%.*d   %.*d\n", -100, -44);
		ft_printf("ft_printf: %%.*d   %.*d\n\n", -100, -44);
		   printf("   printf: %%.o    %.o\n", 99);		
		ft_printf("ft_printf: %%.o    %.o\n", 99);		
		   printf("   printf: %%.0o   %.0o\n", 99);
		ft_printf("ft_printf: %%.0o   %.0o\n", 99);
		   printf("   printf: %%.5o   %.5o\n", 99);
		ft_printf("ft_printf: %%.5o   %.5o\n", 99);
		   printf("   printf: %%.5o   %.5o\n", 99);
		ft_printf("ft_printf: %%.5o   %.5o\n", 99);
		   printf("   printf: %%.*o   %.*o\n", 4, 99);
		ft_printf("ft_printf: %%.*o   %.*o\n", 4, 99);
		   printf("   printf: %%.*o   %.*o\n", -100, 99);
		ft_printf("ft_printf: %%.*o   %.*o\n\n", -100, 99);
		   printf("   printf: %%.x    %.x\n", -44);		
		ft_printf("ft_printf: %%.x    %.x\n", -44);		
		   printf("   printf: %%.0x   %.0x\n", -44);
		ft_printf("ft_printf: %%.0x   %.0x\n", -44);
		   printf("   printf: %%.5x   %.5x\n", -44);
		ft_printf("ft_printf: %%.5x   %.5x\n", -44);
		   printf("   printf: %%.5x   %.5x\n", -44);
		ft_printf("ft_printf: %%.5x   %.5x\n", -44);
		   printf("   printf: %%.*x   %.*x\n", 4, -44);
		ft_printf("ft_printf: %%.*x   %.*x\n", 4, -44);
		   printf("   printf: %%.*x   %.*x\n", -100, -44);
		ft_printf("ft_printf: %%.*x   %.*x\n\n", -100, -44);

		printf("pointer precision\n");
		   printf("   printf: %%.p    %.p\n", &s0);		
		ft_printf("ft_printf: %%.p    %.p\n", &s0);		
		   printf("   printf: %%.0p   %.0p\n", &s0);
		ft_printf("ft_printf: %%.0p   %.0p\n", &s0);
		   printf("   printf: %%.1p   %.1p\n", &s0);
		ft_printf("ft_printf: %%.1p   %.1p\n", &s0);
		   printf("   printf: %%.5p   %.5p\n", &s0);
		ft_printf("ft_printf: %%.5p   %.5p\n", &s0);
		   printf("   printf: %%.*p   %.*p\n", 4, &s0);
		ft_printf("ft_printf: %%.*p   %.*p\n", 4, &s0);
		   printf("   printf: %%.*p   %.*p\n", -100, &s0);
		ft_printf("ft_printf: %%.*p   %.*p\n\n", -100, &s0);

		printf("char precision\n");
		   printf("   printf: %%.c    %.c\n", 'f');		
		ft_printf("ft_printf: %%.c    %.c\n", 'f');		
		   printf("   printf: %%.0c   %.0c\n", 'f');
		ft_printf("ft_printf: %%.0c   %.0c\n", 'f');
		   printf("   printf: %%.1c   %.1c\n", 'f');
		ft_printf("ft_printf: %%.1c   %.1c\n", 'f');
		   printf("   printf: %%.5c   %.5c\n", 'f');
		ft_printf("ft_printf: %%.5c   %.5c\n", 'f');
		   printf("   printf: %%.*c   %.*c\n", 4, 'f');
		ft_printf("ft_printf: %%.*c   %.*c\n", 4, 'f');
		   printf("   printf: %%.*c   %.*c\n", -100, 'f');
		ft_printf("ft_printf: %%.*c   %.*c\n\n", -100, 'f');

		printf("char* precision\n");
		   printf("   printf: %%.s    %.s\n", "ssss");		
		ft_printf("ft_printf: %%.s    %.s\n", "ssss");		
		   printf("   printf: %%.0s   %.0s\n", "ssss");
		ft_printf("ft_printf: %%.0s   %.0s\n", "ssss");
		   printf("   printf: %%.2s   %.2s\n", "ssss");
		ft_printf("ft_printf: %%.2s   %.2s\n", "ssss");
		   printf("   printf: %%.20s  %.20s\n", "ssss");
		ft_printf("ft_printf: %%.20s  %.20s\n", "ssss");
		   printf("   printf: %%.15s  %.15s\n", s);
		ft_printf("ft_printf: %%.15s  %.15s\n", s);
		   printf("   printf: %%.*s: 10 %.*s\n", 10, "ssss");
		ft_printf("ft_printf: %%.*s: 10 %.*s\n", 10, "ssss");
		   printf("   printf: %%.*s: -100 %.*s\n", -100, "ssss");
		ft_printf("ft_printf: %%.*s: -100 %.*s\n\n", -100, "ssss");
	```

ha the beauty of working from midnight to 8 am is that when you wake up at 3pm you already put in 8 hours of hustle.

now to conquer minimum field width modifier.

woooooooooo. minimum field width behaves exactly as i would expect it too for numeral. basically the conversion plus the precision is considered the "conversion" at the time the minimum field width is applied. which means that i can just strlen my conversion and we be good. i should refactor my stuff from repurposing the precision string and mfieldwidth string to transfer the single `char` that represents it to a char that's part of my structure. cleaner that way, and more extensible.

* test code part 1 for mfw
	```
		printf("numerals mfw\n");
		   printf("   printf: %%d->%d\n", 99);		
		   printf("   printf: %%0d->%0d\n", 99);
		   printf("   printf: %%5d->%5d\n", 99);	
		   printf("   printf: %%*d->%*d\n", 4, 99);
		   printf("   printf: %%*d->%*d\n", -100, 99);
		   printf("   printf: %%d->%d\n", -44);		
		   printf("   printf: %%0d->%0d\n", -44);
		   printf("   printf: %%5d->%5d\n", -44);
		   printf("   printf: %%5d->%5d\n", -44);
		   printf("   printf: %%*d->%*d\n", 4, -44);
		   printf("   printf: %%*d->%*d\n", -100, -44);
		   printf("   printf: %%5.d->%5.d\n", 99);
		   printf("   printf: %%5.0d->%5.0d\n", 99);
		   printf("   printf: %%5.2d->%5.2d\n", 99);
		   printf("   printf: %%5.5d->%5.5d\n", 99);
		   printf("   printf: %%5.10d->%5.10d\n", 99);
		   printf("   printf: %%5.5d->%5.5d\n", 82984298249);
		   printf("   printf: %%5.10d->%5.10d\n\n", 82984298249);

		   printf("   printf: %%o->%o\n", 99);		
		   printf("   printf: %%0o->%0o\n", 99);
		   printf("   printf: %%5o->%5o\n", 99);
		   printf("   printf: %%5o->%5o\n", 99);
		   printf("   printf: %%*o->%*o\n", 4, 99);
		   printf("   printf: %%*o->%*o\n", -100, 99);
		   printf("   printf: %%5.o->%5.o\n", 99);
		   printf("   printf: %%5.0o->%5.0o\n", 99);
		   printf("   printf: %%5.2o->%5.2o\n", 99);
		   printf("   printf: %%5.5o->%5.5o\n", 99);
		   printf("   printf: %%5.10o->%5.10o\n", 99);
		   printf("   printf: %%5.5o->%5.5o\n", 82984298249);
		   printf("   printf: %%5.10o->%5.10o\n\n", 82984298249);

		   printf("   printf: %%x->%x\n", -44);			
		   printf("   printf: %%0x->%0x\n", -44);	
		   printf("   printf: %%5x->%5x\n", -44);	
		   printf("   printf: %%5x->%5x\n", -44);	
		   printf("   printf: %%*x->%*x\n", 4, -44);
		   printf("   printf: %%*x->%*x\n", -100, -44);
		   printf("   printf: %%5.x->%5.x\n", 99);
		   printf("   printf: %%5.0x->%5.0x\n", 99);
		   printf("   printf: %%5.2x->%5.2x\n", 99);
		   printf("   printf: %%5.5x->%5.5x\n", 99);
		   printf("   printf: %%5.10x->%5.10x\n", 99);
		   printf("   printf: %%5.5x->%5.5x\n", 82984298249);
		   printf("   printf: %%5.10x->%5.10x\n\n", 82984298249);

		printf("pointer mfw\n");
		   printf("   printf: %%p->%p\n", s0);			
		   printf("   printf: %%0p->%0p\n", s0);	
		   printf("   printf: %%1p->%1p\n", s0);	
		   printf("   printf: %%5p->%5p\n", s0);	
		   printf("   printf: %%*p->%*p\n", 4, s0);	
		   printf("   printf: %%*p->%*p\n\n", -100, s0);	

		printf("char mfw\n");
		   printf("   printf: %%c->%c\n", 'f');			
		   printf("   printf: %%0c->%0c\n", 'f');	
		   printf("   printf: %%1c->%1c\n", 'f');	
		   printf("   printf: %%5c->%5c\n", 'f');	
		   printf("   printf: %%*c->%*c\n", 4, 'f');	
		   printf("   printf: %%*c->%*c\n\n", -100, 'f');	


		printf("char* mfw\n");
		   printf("   printf: %%s->%s\n", "ssss");		
		   printf("   printf: %%0s->%0s\n", "ssss");
		   printf("   printf: %%2s->%2s\n", "ssss");
		   printf("   printf: %%20s->%20s\n", "ssss");
		   printf("   printf: %%15s->%15s\n", s);
		   printf("   printf: %%*s->%*s\n", 10, "ssss");
		   printf("   printf: %%*s->%*s\n", -100, "ssss");
		   printf("   printf: %%0.s->%0.s\n", "ssss");
		   printf("   printf: %%3.2s->%3.2s\n", "ssss");
		   printf("   printf: %%20.5s->%20.5s\n", "ssss");
		   printf("   printf: %%15.40s->%15.40s\n", s);
		   printf("   printf: %%*s.3->%*.3s\n", 10, "ssss");
		   printf("   printf: %%*s->%*.4s\n\n", -100, "ssss");
	```



* test code part 2 for mfw
	```
		printf("numerals mfw\n");
		   printf("   printf: %%d->%d\n", 99);		
		ft_printf("ft_printf: %%d->%d\n", 99);		
		   printf("   printf: %%0d->%0d\n", 99);
		ft_printf("ft_printf: %%0d->%0d\n", 99);
		   printf("   printf: %%5d->%5d\n", 99);	
		ft_printf("ft_printf: %%5d->%5d\n", 99);	
		   printf("   printf: %%*d->%*d\n", 4, 99);
		ft_printf("ft_printf: %%*d->%*d\n", 4, 99);
		   printf("   printf: %%*d->%*d\n", -100, 99);
		ft_printf("ft_printf: %%*d->%*d\n", -100, 99);
		   printf("   printf: %%d->%d\n", -44);		
		ft_printf("ft_printf: %%d->%d\n", -44);		
		   printf("   printf: %%0d->%0d\n", -44);
		ft_printf("ft_printf: %%0d->%0d\n", -44);
		   printf("   printf: %%5d->%5d\n", -44);
		ft_printf("ft_printf: %%5d->%5d\n", -44);
		   printf("   printf: %%5d->%5d\n", -44);
		ft_printf("ft_printf: %%5d->%5d\n", -44);
		   printf("   printf: %%*d->%*d\n", 4, -44);
		ft_printf("ft_printf: %%*d->%*d\n", 4, -44);
		   printf("   printf: %%*d->%*d\n", -100, -44);
		ft_printf("ft_printf: %%*d->%*d\n", -100, -44);
		   printf("   printf: %%5.d->%5.d\n", 99);
		ft_printf("ft_printf: %%5.d->%5.d\n", 99);
		   printf("   printf: %%5.0d->%5.0d\n", 99);
		ft_printf("ft_printf: %%5.0d->%5.0d\n", 99);
		   printf("   printf: %%5.2d->%5.2d\n", 99);
		ft_printf("ft_printf: %%5.2d->%5.2d\n", 99);
		   printf("   printf: %%5.5d->%5.5d\n", 99);
		ft_printf("ft_printf: %%5.5d->%5.5d\n", 99);
		   printf("   printf: %%5.10d->%5.10d\n", 99);
		ft_printf("ft_printf: %%5.10d->%5.10d\n", 99);
		   printf("   printf: %%5.5d->%5.5d\n", 82984298249);
		ft_printf("ft_printf: %%5.5d->%5.5d\n", 82984298249);
		   printf("   printf: %%5.10d->%5.10d\n", 82984298249);
		ft_printf("ft_printf: %%5.10d->%5.10d\n\n", 82984298249);

		   printf("   printf: %%o->%o\n", 99);		
		ft_printf("ft_printf: %%o->%o\n", 99);		
		   printf("   printf: %%0o->%0o\n", 99);
		ft_printf("ft_printf: %%0o->%0o\n", 99);
		   printf("   printf: %%5o->%5o\n", 99);
		ft_printf("ft_printf: %%5o->%5o\n", 99);
		   printf("   printf: %%5o->%5o\n", 99);
		ft_printf("ft_printf: %%5o->%5o\n", 99);
		   printf("   printf: %%*o->%*o\n", 4, 99);
		ft_printf("ft_printf: %%*o->%*o\n", 4, 99);
		   printf("   printf: %%*o->%*o\n", -100, 99);
		ft_printf("ft_printf: %%*o->%*o\n", -100, 99);
		   printf("   printf: %%5.o->%5.o\n", 99);
		ft_printf("ft_printf: %%5.o->%5.o\n", 99);
		   printf("   printf: %%5.0o->%5.0o\n", 99);
		ft_printf("ft_printf: %%5.0o->%5.0o\n", 99);
		   printf("   printf: %%5.2o->%5.2o\n", 99);
		ft_printf("ft_printf: %%5.2o->%5.2o\n", 99);
		   printf("   printf: %%5.5o->%5.5o\n", 99);
		ft_printf("ft_printf: %%5.5o->%5.5o\n", 99);
		   printf("   printf: %%5.10o->%5.10o\n", 99);
		ft_printf("ft_printf: %%5.10o->%5.10o\n", 99);
		   printf("   printf: %%5.5o->%5.5o\n", 82984298249);
		ft_printf("ft_printf: %%5.5o->%5.5o\n", 82984298249);
		   printf("   printf: %%5.10o->%5.10o\n", 82984298249);
		ft_printf("ft_printf: %%5.10o->%5.10o\n\n", 82984298249);

		   printf("   printf: %%x->%x\n", -44);		
		ft_printf("ft_printf: %%x->%x\n", -44);		
		   printf("   printf: %%0x->%0x\n", -44);
		ft_printf("ft_printf: %%0x->%0x\n", -44);
		   printf("   printf: %%5x->%5x\n", -44);
		ft_printf("ft_printf: %%5x->%5x\n", -44);
		   printf("   printf: %%5x->%5x\n", -44);
		ft_printf("ft_printf: %%5x->%5x\n", -44);
		   printf("   printf: %%*x->%*x\n", 4, -44);
		ft_printf("ft_printf: %%*x->%*x\n", 4, -44);
		   printf("   printf: %%*x->%*x\n", -100, -44);
		ft_printf("ft_printf: %%*x->%*x\n", -100, -44);
		   printf("   printf: %%5.x->%5.x\n", 99);
		ft_printf("ft_printf: %%5.x->%5.x\n", 99);
		   printf("   printf: %%5.0x->%5.0x\n", 99);
		ft_printf("ft_printf: %%5.0x->%5.0x\n", 99);
		   printf("   printf: %%5.2x->%5.2x\n", 99);
		ft_printf("ft_printf: %%5.2x->%5.2x\n", 99);
		   printf("   printf: %%5.5x->%5.5x\n", 99);
		ft_printf("ft_printf: %%5.5x->%5.5x\n", 99);
		   printf("   printf: %%5.10x->%5.10x\n", 99);
		ft_printf("ft_printf: %%5.10x->%5.10x\n", 99);
		   printf("   printf: %%5.5x->%5.5x\n", 82984298249);
		ft_printf("ft_printf: %%5.5x->%5.5x\n", 82984298249);
		   printf("   printf: %%5.10x->%5.10x\n", 82984298249);
		ft_printf("ft_printf: %%5.10x->%5.10x\n\n", 82984298249);


		printf("pointer mfw\n");
		   printf("   printf: %%p->%p\n", s0);		
		ft_printf("ft_printf: %%p->%p\n", s0);		
		   printf("   printf: %%0p->%0p\n", s0);
		ft_printf("ft_printf: %%0p->%0p\n", s0);
		   printf("   printf: %%1p->%1p\n", s0);
		ft_printf("ft_printf: %%1p->%1p\n", s0);
		   printf("   printf: %%5p->%5p\n", s0);
		ft_printf("ft_printf: %%5p->%5p\n", s0);
		   printf("   printf: %%*p->%*p\n", 4, s0);
		ft_printf("ft_printf: %%*p->%*p\n", 4, s0);
		   printf("   printf: %%*p->%*p\n", -100, s0);
		ft_printf("ft_printf: %%*p->%*p\n\n", -100, s0);

		printf("char mfw\n");
		   printf("   printf: %%c->%c\n", 'f');		
		ft_printf("ft_printf: %%c->%c\n", 'f');		
		   printf("   printf: %%0c->%0c\n", 'f');
		ft_printf("ft_printf: %%0c->%0c\n", 'f');
		   printf("   printf: %%1c->%1c\n", 'f');
		ft_printf("ft_printf: %%1c->%1c\n", 'f');
		   printf("   printf: %%5c->%5c\n", 'f');
		ft_printf("ft_printf: %%5c->%5c\n", 'f');
		   printf("   printf: %%*c->%*c\n", 4, 'f');
		ft_printf("ft_printf: %%*c->%*c\n", 4, 'f');
		   printf("   printf: %%*c->%*c\n", -100, 'f');
		ft_printf("ft_printf: %%*c->%*c\n\n", -100, 'f');


		printf("char* mfw\n");
		   printf("   printf: %%s->%s\n", "ssss");		
		ft_printf("ft_printf: %%s->%s\n", "ssss");		
		   printf("   printf: %%0s->%0s\n", "ssss");
		ft_printf("ft_printf: %%0s->%0s\n", "ssss");
		   printf("   printf: %%2s->%2s\n", "ssss");
		ft_printf("ft_printf: %%2s->%2s\n", "ssss");
		   printf("   printf: %%20s->%20s\n", "ssss");
		ft_printf("ft_printf: %%20s->%20s\n", "ssss");
		   printf("   printf: %%15s->%15s\n", s);
		ft_printf("ft_printf: %%15s->%15s\n", s);
		   printf("   printf: %%*s->%*s\n", 10, "ssss");
		ft_printf("ft_printf: %%*s->%*s\n", 10, "ssss");
		   printf("   printf: %%*s->%*s\n", -100, "ssss");
		ft_printf("ft_printf: %%*s->%*s\n", -100, "ssss");
		   printf("   printf: %%0.s->%0.s\n", "ssss");
		ft_printf("ft_printf: %%0.s->%0.s\n", "ssss");
		   printf("   printf: %%3.2s->%3.2s\n", "ssss");
		ft_printf("ft_printf: %%3.2s->%3.2s\n", "ssss");
		   printf("   printf: %%20.5s->%20.5s\n", "ssss");
		ft_printf("ft_printf: %%20.5s->%20.5s\n", "ssss");
		   printf("   printf: %%15.40s->%15.40s\n", s);
		ft_printf("ft_printf: %%15.40s->%15.40s\n", s);
		   printf("   printf: %%*s.3->%*.3s\n", 10, "ssss");
		ft_printf("ft_printf: %%*s.3->%*.3s\n", 10, "ssss");
		   printf("   printf: %%*s->%*.4s\n", -100, "ssss");
		ft_printf("ft_printf: %%*s->%*.4s\n\n", -100, "ssss");
	```

shweeeeeet. minimum field width is good to go. all that's left is flags? then the og testing.
alright time to transition to tgf. fuck man life is hard hahahah (but not really).

* tasks
	* edit
		* full description:
			* change character limit to 10,000 characters
			* reflect line breaks in display
	
		* in sharing settings, change the word 'shared' to the word 'PICKED' in the case where the sharing has *not* been saved yet
		
	* research
		* we could do it by having a unique link on a facebook ad, clicking it automatically starts the profile creation process, and gives you the free account
		
	* feature 
		* inviting family members through facebook
			* find people who you know on facebook because you may not have their email address		

it looks like i've got edits, edge case additions, a feature, and research to do. 

sequence wise it will be better to do the research earlier and fresher. fresher because it will be more boring and will require more conscious attention, earlier because it will take time for my brain to convert the information gained from the research into something that resembles a solution. 

the feature i can't asses until i talk to philip. 

edge case and edit can both be done tired since they are defined task that require little wide creativity. though even in this edge case requires more thought than edit.

* feature - invite family members 
	* [facebook basically killed the feature](https://developers.facebook.com/docs/facebook-login/review/faqs#invite_to_app)
	* we can use a [send dialog](https://developers.facebook.com/docs/sharing/reference/send-dialog) where the user will be able to send a facebook message to someone they type in facebook with a link to the app. 

* research the super fast fb onboard
	* fairly certain we can use a "form" to basically get all the data we want to create there free account
	* [facebook lead ads](https://www.facebook.com/business/help/1462876307360828?__mref=message_bubble) can do exactly what we want. 
		* work on both desktop and mobile
		* need to use [zapier](https://zapier.com/developer/documentation/v2/#what-is-zapier) for integration
			* can be hooked up to [mailchimp](http://kb.mailchimp.com/integrations/facebook/add-subscribers-with-facebook-lead-ads)
			* can create a custom app to do shit
		* or hack together a scraper to download the list every like 5 mintues 
			* i'm sure facebook doesn't want this and would suck
	* this would basically allow us to create a user almost instantaniously from facebook

the create account from facebook thing is pretty sick. 

### December 11th 2016

* tasks
	* edit
		* full description:
			* ~change character limit to 10,000 characters~
			* ~reflect line breaks in display~
	
		* ~in sharing settings, change the word 'shared' to the word 'PICKED' in the case where the sharing has *not* been saved yet~

now it's time to take care of the edits. 

alright finished everything. 





