# overview - ft_printf - 11/7/2016

printf is basically a cluster fuck. this a project were investing a lot of time in designing a good architecture will have a profound effect and be really worth it. to build a good architecture i need to have a lot of information about the whole project. this means i will need to do a shit ton of reearch. that's going to be tedious and fairly boring so i need to as quickly as possible find the interesting angle in it so it can hook me. already the ability to use print f liberally in future functions is a pretty sweet win. 

remember to make putchar work with utf-8 characters

* requirements at a glance
	* prototype printf in the same way
	* conversions to implement: 14		
		* `s, S, p, d, D, i, o, O, u, U, x, X, c, C`
		* pre-test completed
	* basic flags to implement: 4
		* `#, 0, -, +` and `space`
	* advanced flags to implement: 5		
		* `hh, h, l, ll, j, z`
		* pre-test completed
	* escape the percent sign with a double percent
		* pre-test completed
	* minimum field-width
		* pre-test completed
	* precision
		* pre-test completed

* order of modifiers
	* flag
	* minimum field width
	* precision
	* length
	* conversion

* globals
	* g_sequence_symbols 
	* g_flag_symbols 
	* g_mfieldwidth_symbols 
	* g_precision_symbols
	* g_length_symbols[7] 
	* g_conversion_symbols 

* conversion struct 
	* t_mod
		* `char	*flag`
		* `char *length`
		* `char *conversion`
		* `char *substring`
		* `char *mfieldwidth`
		* `char *precision`
		* `int 	mfw`
		* `int	prec`
		* `size_t sequence_start_index`
		* `size_t sequence_end_index`

the way i'm gonna organize the research is through my tried an true question answer format. after words i'l probably organize it into a guide and plan of attack.

* format string conversions feature set, expanded view
	* prefix `%`
	* zero or more flags
		* `#`
			* convert value to an alternate form
			* no effect for `c`, `d`, `i`, `p`, `s`
			* `o`
				* the precision of the number is increased to force the first character of the output string to a zero
			* `x` & `X`
				* non-zero result has the string `0x` prepended to it			
		* `0`
			* zero padding
			* the converted value is padded on the left with zeros instead of blanks
			* if the precision is given with a numeric conversion the `0` flag is ignored
		* `-`
			* negative field width flag			
			* padded on right with blanks
			* overrides a `0` if both are given
		* ` `
			* `d`, `i`
				* a blank should be left before a positive number produced by a signed conversion
		* `+`
			* a sign must always be placed before a number produced by a signed conversion
			* overrides a ` ` if both are used
	* minimum field width
		* optional
		* decimal digit string
		* if the converted value has fewer characters than the field width it will be padded with spaces on the left
	* precision
		* optional field
		* a `.` followed by an optional digit string
		* if the digit string is ommited the precision is taken as zero
			* `d`, `i`, `o`, `u`, `x`, `X`
				* minimum number of digits
			* `a`, `A`, `e`, `E`, `f`, `F`
				* minimum number of digits to appear after the decimal point
			* `g`, `G`
				* maximum number of significant digits
			* `s`
				* maximum number of characters to be printed from a string
	* length modifier
		* for `d`, `i`, `o`, `u`, `x`, `X`
			* `hh`
				* `d`, `i` 				--> `signed char`
				* `o`, `u`, `x`, `X`	--> `unsigned char`
				* `n`					--> `signed char*`
			* `h`
				* `d`, `i` 				--> `short`
				* `o`, `u`, `x`, `X`	--> `unsigned short`
				* `n`					--> `short*`
			* `l`
				* `d`, `i` 				--> `long`
				* `o`, `u`, `x`, `X`	--> `unsigned long`
				* `n`					--> `long*`
			* `ll`
				* `d`, `i` 				--> `long long`
				* `o`, `u`, `x`, `X`	--> `unsigned long long`
				* `n`					--> `long long*`
			* `j`
				* `d`, `i` 				--> `intmax_t`
				* `o`, `u`, `x`, `X`	--> `uintmax_t`
				* `n`					--> `intmax_t*`
			* `z`
				* `d`, `i` 				--> argument is of a signed type equivalent to `size_t`
				* `o`, `u`, `x`, `X`	--> `size_t`
				* `n`					--> argument is a pointer to a signed type equivalent to `size_t`
		* for `c`, `s`
			* `l`
				* `c` --> `wchar_t`
				* `s` --> `wchar_t*`
	* type conversion
		* `s` & `S`
			* `s`
				* the `char*` argument is expected to be a pointer to an array of characters 
					* characters from the array are written up to and excluding the `NULL` character
					* if a precision is specified no more than the number of specified are written
						* if a precision is given no `NULL` character need be present 
						* if the precision is not specified or is greater than the size of the array the array must contain a terminating `NULL` character
				* do more research
			* `S`
				* treated as `s` with the `l` length modifier applied						
		* `p`
			* the `void*` pointer argument is printed in hexadecimal
		* `d` & `D`
			* signed decimal notation
		* `i`
			* signed decimal notation
		* `o` & `O`
			* unsigned octal notation
				* preced value with a `0`: 19 decimal -> 023 octal
		* `u` & `U`
			* unsigned decimal
		* `x` & `X`
			* unsigned hexadecimal
				* the letters "abcdef" are used for `x`
				* the letters "ABCDEF" are used for `X`
				* notation
					* preced value with a `0x` or `0X`: 35 decimal = 0x23 octal
		* `c` & `C`
			* `c`
				* the int argument is converted to an unsigned char and the resulting character is written
			* `C`
				* treated as `c` with the `l` modifier applied

this is sick, i love good architecture. cause of the set up implementing these conversions is taking no time at all. legit just did 6 in 30 minutes. those were the gimmes though. now i'm approaching the complicated ones. these are the hexadecimal, pointer, and char/string ones. these are not simple math conversions. 




