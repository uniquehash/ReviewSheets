# overview - ft_printf - 11/7/2016

printf is basically a cluster fuck. this a project were investing a lot of time in designing a good architecture will have a profound effect and be really worth it. to build a good architecture i need to have a lot of information about the whole project. this means i will need to do a shit ton of reearch. that's going to be tedious and fairly boring so i need to as quickly as possible find the interesting angle in it so it can hook me. already the ability to use print f liberally in future functions is a pretty sweet win. 

remember to make putchar work with utf-8 characters

* requirements at a glance
	* prototype printf in the same way
	* conversions to implement: 14
		* `s, S, p, d, D, i, o, O, u, U, x, X, c, C`
	* basic flags to implement: 4
		* `#, 0, -, +` and `space`
	* advanced flags to implement: 5
		* `hh, h, l, ll, j, z`
	* escape the percent sign with a double percent

the way i'm gonna organize the research is through my tried an true question answer format. after words i'l probably organize it into a guide and plan of attack.

* questions to answer
	* what is printf?
		* produces output according to a specified format.
		* prints to the standard output
		* it is controlled by a `format string` that specifies how subsequent arguments accessed or variable-length arguments of stdarg(3) are converted for output
			* this `format string` is composed of zero or more instructions
				* ordinary characters
					* these are copied to the output stream
				* conversion specifications
					* results in fetching zero or more subusequent arguments.
					* prefixed with a `%` character
					* the arguments must correspond (after type promotion) with the conversion specifier
		* `format string` structure
			* optional field consisting of a deciml digit string followed by a `$` specifying the next argument to access
			* zero or more flags
			* optional separator characters
			* optional decimal digit string specigying a minimum field width
			* optional precision in the form of `.` followed by an optional digit string
			* optional length modifier that specifies the size of the argument
			* a character that specifies the type of conversion to be applied
		* returns
			* the number of characters printed excluding the trailing `\0`
			* return a negative value if an error occurs

	* what is the detailed structure of the `format string`?
		* in order of sequence
			* prefix `%`
			* a decimal digit string followed by a `$` specifying the next argument to access
				* optional field
				* if this field is not provided the argument following the last argument accessed will be used
				* arguments are numbered starting at 1
				* if unaccessed arguments in the `format string` are interspersed with ones that are accessed the result will be indeterminate
			* zero or more flags
				* `#`
					* convert value to an alternate form
					* no effect for `c`, `d`, `i`, `n`, `p`, `s`
					* `o`
						* the precision of the number is increased to force the first character of the output string to a zero
					* `x` & `X`
						* non-zero result has the string `0x` prepended to it
					* `a`, `A`, `e`, `E`, `f`, `F`, `g`, `G`
						* the result always contains a decimal point even if no digit follow it
					* `g`, `G`
						* trailing zeros are not removed from the result as they would be otherwise
				* `0`
					* zero padding
					* for all conversions except `n`
						* the converted value is padded on the left with zeros rather than blanks
						* if a precision is given with a numeric conversion (`d`, `i`, `o`, `u`, `x`, `X`) the 0 flag is ignored
				* `-`
					* negative field width flag
					* converted value should be left adjusted on the field boundary
					* except for `n`
						* padded on right with blanks 
					* overrides a `0` if both are given 
				* ` `
					* for `a`, `A`, `d`, `e`, `E`, `f`, `F`, `g`, `G`, `i`
					* a blank should be left before a positive number produced by a signed conversion
				* `+`
					* a sign must always be placed before a number produced by a signed conversion
					* overrides a ` ` if both are used
				* `'`
					* decimal conversion `d`, `u`, `i` or the integral portion of a floating point conversion `f`, `F` should be grouped and separated by thousands using the non-monetary separator returned by localeconv(3)
			* separator character
				* optional field
				* values
					* `,`, `;`, `:`, `_`
				* used to for separating multiple values when printing an Altivec or SSE vector, or other multi-value unit
					* an extension to the printf() specification 
			* minimum field width
				* optional field
				* decimal digit string
				* if the converted value has fewer characters than the field width, it will be padded with spaces on the left (or right if the left-adjustment flag has been given) to fill out the field width
			* precision 
				* optional field
				* a `.` followed by an optional digit string
				* if the digit string is omitted, the precision is taken as zero
					* minimum number of digits for `d`, `i`, `o`, `u`, `x`, `X`
					* minimum number of digits to appear after the decimal point for `a`, `A`, `e`, `E`, `f`, `F`
					* the maximum number of significant digits for `g`, `G`
					* the maximum number of characters to be printed from a string for `s`
			* length modifier
				* optional field
				* specifies the size of the argument
					* converted value must be of this type
				* for `d`, `i`, `n`, `o`, `u`, `x`, `X`					
					| Modifier  | d, i          | o, u, x, X  			| n 			|
					| --------  | -------------:| --------------------: | ------------: |
					| hh       	| signed char 	| unsigned char 		| signed char*	|
					| h      	| short      	| unsigned short 		| short* 		|
					| l 		| long      	| unsigned long  		| long* 		|
					| ll		| long long		| unsigned long long	| long long*	|
					| j			| intmax_t		| uintmax_t				| intmax_t*		|
					| t			| ptrdiff_t		| (see note)			| ptrdiff_t*	|
					| z			| (see note)	| size_t				| (see note)	|
					| q			| quad_t		| u_quad_t				| quad_t*		|					
					* the `t` modifier when applied to `o`, `u`, `x`, `X` conversions indicates that the argument is on an unsigned type equivilent in size to a `ptrdiff_t` 
					* the `z` modifier when applied to `d`, `i` conversions indicates that the argument is of a signed type equivalent in size to a `size_t` 
						* when applied to `n` 
							* the argument is a pointer to a signed type equivalent in size to a `size_t`
				* for `a`, `A`, `e`, `E`, `f`, `F`, `g`, `G`
					```
						| Modifier  | a, A, e, E, f, F, g, G						|
						| --------: | --------------------------------------------: |												
						| l 		| double (ignored, same behavior as without it) |
						| L			| long double									|
					```
				* for `c`, `s`
					```
						| Modifier  | c			| s			|
						| --------: | --------:	| --------: |												
						| l 		| wint_t 	| wchar_t*	|						
					```

			* type conversion
				* represented by a character
				* a field width or precision, or both, may be indicated by:
					* `*`
					* `*` followed by one or more decimal digits and a `$` instead of a digit string
						* an int argument supplies the field width or precision
							* a negative field width is treated as a left adjustment flag followed by a positive field width
							* a negative precision is treated as though it were missing
						* if single format directive mixes possional and non-positional arguments, the results are undefined
				* specifiers and their meanings
					* `d`, `i`, `o`, `u`, `x`, `X`
						* the int argument is converted to its appropriate notation:
							* signed decimal (`d` and `i`)
							* unsigned octal(`o`)
								* notation
									* preced value with a `0`: 023 in octal = 19 in base 10
							* unsigned decimal(`u`)
							* unsigned hexadecimal(`x` and `X`)
								* the letters "abcdef" are used for `x`
								* the letters "ABCDEF" are used for `X`
								* notation
									* preced value with a `0x` or `0X`: 0x23 in octal = 35 in base 10
						* the precision if any gives the minimum number of digits that must appear
							* if the converted value requires fewer digits, it is padded on the left with zeros
					* `D`, `O`, `U`
						* deprecated
						* the long int argument is converted to its appropriate notation:
							* signed decimal (D)
							* unsigend octal (O)
							* unsigned decimal (U)
						* follows the rules of `ld`, `lo`, `lu`
					* `e`, `E`	
						* `E` uses the letter E rather than e to introduce the exponent
							* the exponent always contains at least two digits
								* if the value is zero the exponent is 00
						* the double argument is rounded and converted in the style [-]d.ddde+-dd
							* one digit before the decimal-point character
							* number of digits after the decimal-point character is equal to the precision
								* if the precision is missing it is taken as 6
								* if the precision is 0 no decimal point character appears							
							* for `a`, `A`, `e`, `E`, `f`, `g`, `G`:
								* positive and negative infinity are represented as 'inf' and '-inf' respectively when using the lowercase conversion and 'INF' and '-INF' when using the uppercase conversion
								* NaN is represented as nan when using the lowercase conversions
								* NaN is represented as NAN when using the uppercase conversions
					* `f`, `F`
						* this is fixed-point notation
						* the double argument is rounded and converted to decimal notation in the style [-]ddd.ddd
							* the number of digits after the decimal-point character is equal to the precision specification
								* if the precision is missing it defaults to 6
								* if the precision is explicitely 0 no decimal-point character appears
								* if a decimal point appears at least one digit appears before it
					* `g`, `G`
						* the double argument is converted in style `f` or `e` (`F` or `E` for `G` conversions)
							* the precision specifies the number of significant digits
								* if the precision is missing 6 digits is default
								* if the precision is 0 it is treated as 1
						* `e` is ued if the exponent from its conversion is less than -4 or greater than or equal to the precision
						* trailing zeroes are removed from the fractional part of the result
						* a decimal point appears only if it is followed by at least one digit
					* `a`, `A`
						* the double argument is rounded and converted to hexadecimal notation in style [-]0xh.hhhp[+-]d
							* the number of digits after the hexadecimal-point character is equal to the precision specification
							* if the precision is missing it is taken as enough to represent the floating point number exactly and no rounding occurs 
							* if the precision is zero no hexademical-point character appears
							* the p is a literal character 'p' and the exponent consists of a positive or negative sign followed by a decimal number representing an exponent of 2
							* the `A` conversion uses the letter `P` to separate the mantissa and exponent
					* `c`
						* the int argument is converted to an unsigned char, and the resulting character is written
					* `C`
						* treated as `c` with the `l` length modifier applied
					* `s`
						* the char* argument is expected to be a pointer to an array of character type 
							* characters from the array are written up to and excluding a terminating `NULL` character
							* if a precision is specified no more than the number specified are written 
								* if a precision is given no null character need be present
								* if the precision is not specified or is greater than the size of the array the array must contain a terminating `NULL` character
					* `S`
						* treated as `s` with the `l` length modifier applied
					* `p`
						* the void* pointer argument is printed in hexadecimal 
					* `n`
						* the number of characters written so far is stored into the integer indicated by the int* pointer argument 
						* no argument is converted
					* `%`
						* a '%' is written not argument is converted. 
					* in no case does a non-existing or small field width cause truncation of a numeric field
						* if the result of a conversion is wider than the field width the field is expanded to contain the conversion result

	* what is an [Altivec](https://en.wikipedia.org/wiki/AltiVec)?
		* a single-precision floating point and integer SIMD instruction set 

	* what is a [SIMD](https://en.wikipedia.org/wiki/SIMD)?
		* SIMD: Single instruction, multiple data
		* a class of parrallel computers in Flynn's taxonomy
		* this shit is cool
		* basically allows the compiler to parallelize operations that are naturally parallelized
	
	* what is [Flynn's taxonomy](https://en.wikipedia.org/wiki/Flynn%27s_taxonomy)?
		* a classifiction of computer architectures proposed by [Michael J. Flynn](https://en.wikipedia.org/wiki/Michael_J._Flynn)
			* 4 classifications
				* SISD: Single instruction stream, single data stream
					* a sequention computer which exploits no parallelism in either the instruction or data streams
						* single control unit (CU) fetches single instruction stream (IS) from memory
						* CU generates appropriate control signals to direct single processing element (PE) to operate on single data stream (DS) 
						* basically everything happens one operation at a time, 0 parallelism
				* SIMD: Single instruction stream, multiple data streams
					* a computer which exploits multiple data streams against a single instruction stream to perform operations which may be naturally parallelized 	
						* array processor 
						* graphics processing unit
				* MISD: Multiple instruction streams, single data streams
					* multiple instructions operate on one data stream
						* uncommon architecture which is generally used for fault tolerance
						* heterogeneous systems operate on the same data stream and must agree on the result
							* space shuttle fligh control computer is an example (apparently)
				* MIMD: Multiple instruction streams, multiple data streams
					* multiple autonomous processors simultaneously executing different instructions on different data
					* these architectures include multi-core superscalar processors and distributed systems using either one shared memory space or a distributed memory space


	* what is a SSE vector?
		* [SSE](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) is am SIMD instruction set extension to the x86 architecture
		* basically an SMID which means it's set up to be parallelized

	* what is [type promotion](http://stackoverflow.com/questions/2280663/in-a-c-expression-where-unsigned-int-and-signed-int-are-present-which-type-will)?
		* the process of changing the type of a variable if it cannot contain it's value or is in an expression with a larger data type
			* [how c handles type promotion](https://www.eskimo.com/~scs/cclass/int/sx4cb.html)
				* `char`, `short int` are converted into `int` right off the bat
				* operation involves two operands:
					* if one is `long double` other is converted to `long double`
					* if one is `double` other is converted to `double`
					* if one is `float` the other is converted to `float`
					* if one is `long int` the other is converted to `long int`
				* if an operation involves both signed and unsigned integers:
					* if the unsigned operand is the smaller data type such that the larger signed datatype could represent all values of the smaller unsigned type
						* the unsigned value is converted to the larger, signed type and the result has the larger signed type
					* if the signed type cannot represent all values of the unsigned type
						* both values are converted to a common unsigned type and the result has that unsigned type
				* when a value is assigned to a variable using the assignment operator:
					* automatically converted to the type of the variable if: 
						* both the value and the variable have arithmetic types
						* both the value and the variable are pointers and one or the other is of type `void *`

	* how is the stdio printf function prototyped?
		* `int printf(const char* restrict format, ...)`
			* what does format mean?
			* what do the three dots represent?
				* it's something called an ellipsis
				* also means the function is not a variadic function

	* what is an ellipsis and what is a [variadic function](https://en.wikipedia.org/wiki/Variadic_function#Variadic_functions_in_C.2C_Objective-C.2C_C.2B.2B.2C_and_D)?
		* seems that ellipsis are only used in variadic functions
		* you use `<stdarg>` to access these arbritary parameters

	* what is `<stdarg>`(man)?
		* declares a type `va_list`
		* provides 3 macros for stepping through a list of arguments whose number and types are not known to called functions
		* the calling function must declare an object of type `va_list` to be used by `va_start()`, `va_arg()`, `va_end()`
			* `va_start()`
				* must be called first 
				* initializes `va_list` called `ap`
			* `va_arg()`
				* accepts `ap` as an argument
				* each call to `va_arg()` modifies `ap` so that the next call returns the next argument
			* `va_end()`
				* signals that there are no further arguments and causes `ap` to be invalidated
		* each call to `va_start()` must be matched to `va_end()`
		* every parameter in the variadic function is actually included in the `va_list`
			* i think



	* what is fixed-point notation?

	* what is the point of the `e` and `E` flag is it scientific notation?

	* what is a mantissa?

	* what is a shift sequence in the context of printf?






