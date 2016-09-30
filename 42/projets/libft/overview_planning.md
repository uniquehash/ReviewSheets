# overview and planning for libft projects 

this project is about developing a custom standard c library to use in future projects. we will be recreating the work done in the piscine as well as adding extra functionality 

#### structure 

* 3 parts to this projects 

	* Part 1 - libc functions 
		* interpret the manual
		* create robust test set for each function in the standard c lib
		* re-implement with appropriate prefix 
		* apply same test to both sets of functions, compare the difference

	* part 2 - additional functions 
		* interpret the subject 
		* initial implementation 
		* create robust test set 
		* refactor implementation 

	* bonus - manipulating list 
		* interpret the subject 
		* initial implementation 
		* create robust test set 
		* refactor implementation 

##### classification

* raw memory - 7 total
	* memset
		* writes `len` bytes of value `c` (converted to an unsigned char) to the string `b`
	* bzero
		* function writes `n` zeroed bytes to the string `s`. if `n` is zero bzero() does nothing.
	* memcpy
		* function copies `n` bytes from memory area `src` to memory area `dst`. if `dst` and `src` overlap, behavior is undefined. applications in which `dst` and `src` might overlap should use memmove instead.
	* memccpy
		* function copies bytes from string `src` to string `dst`. if the character `c` (as converted to an unsigned char) occurs in the string `src`. the copy stops and a pointer to the byte after the copy of `c` in the string `dst` is returned. otherwise, `n` bytes are copied, and a NULL pointer is returned. the source and destination string should not overlap as the behavior is undefined 
	* memmove
		* function copies `len` bytes from string src to string `dst`. the two strings may overlap; the copy is always done in a non-destructive manner. 
	* memchr
		* function locates the first occurrence of `c` (converted to an unsigned char) in string `s`
	* memcmp
		* function compares byte string `s1` against byte string `s2`. both strings are assumed to be `n` bytes long.

* string manipulation - 17 total
	* strlen
		* function computes the length of the string `s`.	
	* toupper
		* function converts a lower-case letter to the corresponding upper-case letter. the argument must be representable as an unsigned char or the value of EOF. 
	* tolower
		* function converts an upper-case letter to the corresponding lower-case letter. the argument must be representable as an unsigned char or the value of EOF
	* ft_strclr
		* sets every character of the string to the value `\0`
	* strcpy
		* function copies the string `src` to `dst` (including the terminating `\0` character.)
		* the source and destination should not overlap, behavior is undefined
	* strncpy
		* function copies at most `len` characters from `src` into `dst`. ig `src` is less than `len` characters long, the remainder of `dst` is filled with `\0` characters. otherwise, `dst` is not terminated 
	* strcat
		* function append a copy of the null-terminated string `s2` to the end of the null-terminated string `s1`, then add a terminating `\0`. the string `s1` must have sufficient space to hold the result.
		* the source and destination behavior shuold not overlap, as the behavior is undefined
	* strncat
		* function appends a copy of the null-terminated string `s2` to the end of the null-terminated string `s1`, then add a terminating `\0`. the string `s1` must have sufficient space to hold the result. 
		* appends not more than `n` characters from `s2`, and then adds a terminating `\0`.
	* strlcat
		* function concatenates strings. designed to be safer more consistent, and less error prone replacment for `strncat`. unlike those functions `strlcat` takes the full size of the buffer (not just the length) and gurantees to NUL-terminate the result (as long as there is at least one byte free in `dst`). only operates on true `C``strings i.e. both `src` and `dst` must be NULL-terminated. 
		* function appends the NULL-terminated string `src` to the end of `dst`. it will append at most `size - strlen(dst) - 1 bytes`, NULL-terminating the result.
		* the source and the destination should not overlap, as the behavior is undefined.
	* strchr
		* function locates the first occurance of `c` (converted to a char) in the string point to by `s`. the terminating NULL character is considered to be part of the string; therefore if `c` is `\0` the function locates the terminating `\0`. 
	* strrchr
		* function locates the last occurance of `c` (converted to a char) in the string point to by `s`. the terminating NULL character is considered to be part of the string; therefore if `c` is `\0` the function locates the terminating `\0`
	* strcmp
		* function lexicographically compares the NULL-terminated strings `s1` and `s2`.
	* strncmp
		* function compares not more than `n` characters. because it is designed for comparing strings rather than binary code, characters that appear after a `\0` character are not compared. 	
	* ft_strequ
		* lexicographical comparison between `s1` and `s2`. if the 2 strings are identical the function returns 1, or 0 otherwise
	* ft_strnequ
		* lexicographical comparison between `s1` and `s2` up to `n` characters or until a `\0` is reached. if the 2 strings are identical, the function returns 1, or 0 otherwise. 
	* strstr
		* function locates the first occurance of the NULL-terminated string `little` in the null-terminated string `big`
	* strnstr
		* function locates the first occurance of the NULL-terminated string `little` in the string `big` where not more than `len` characters are searched. characters that appear after a `\0` character are not searched. since this is a FreeBSD specific API it should only be used when portability is not a concern.
	
	
* type conversion - 2 total
	* atoi
		* function converts the initial portion of the string pointed to by `str` to int representation 
	* ft_itoa
		* allocate with malloc(3) and returns a "fresh" string ending with '\0'representing the integer `n` given as argument.
		negative numbers must be supported. if allocation fails the function returns NULL.

* write - 8 total
	* ft_putchar
		* outputs the character `c` to the standard output
	* ft_putstr
		* outputs the string `s` to the standard output
	* ft_putendl
		* outputs the string `s` to the standard output followed by a '\n'
	* ft_putnbr
		* outputs the integer `n` to the standard output
	* ft_putchar_fd
		* outputs the char `c` to the file descriptor `fd`
	* ft_putstr_fd
		* outputs the string `s` to the file descriptor `fd`
	* ft_putendl_fd
		* outputs the string `s` to the file descriptor `fd` followed by a '\n'
	* ft_putnbr_fd
		* outputs the integer `n` to the file descriptor `fd`

* type checking - 5 total
	* isalpha
		* function tests for any character for which isupper, or islower is true. the value of the argumnet must be representable as an unsigned char or the value of EOF
	* isdigit
		* function tests for a decimal digit character 
	* isalnum
		* function tests for any character for which isalpha or isdigit is true
	* isascii
		* function tests for an ASCII character, which is any character between 0 and octal 0177 inclusive 
	* isprint
		* function tests for any printing character, including space(' '). the value of the argument must be representable as an unsigned char or the value of EOF.

* memory allocation - 7 total
	* ft_memalloc
		* allocates (with malloc(3)) and returns a "fresh" memory area. the memory allocated is initialized to 0. if the allocation fails, the function returns NULL.
	* ft_strnew
		* allocates with malloc(3) and returns a "fresh" string NULL-terminated with `\0`. each character of the string is initialized at `\0`. if the allocation fails the function returns NULL
	* strdup
		* function allocates sufficient memory for a copy of the string `s1`, does the copy, and returns a pointer to it. the pointer may be used as an argument to the function free(3). 
		* if insufficient memory is available, NULL is returned and `errno` is set to ENOMEM.
	* ft_strsub
		* allocates with malloc(3) and returns a "fresh" substring from the string given as argument. the substring begins at index `start` and is of size `len`. if `start` and `len` aren't refering to a valid substring, the behavior is undefined. if the allocation fails the function returns NULL.
	* ft_strjoin
		* allocates with malloc(3) and returns a "fresh" string ending with `\0`, result of the concatenation of `s1` and `s2`. if the allocation fails the function returns NULL.
	* ft_strtrim
		* allocates with malloc(3) and returns a copy of the string given as argument without whitespaces at the beginning or at the end of the string. will be considered as whitespaces the following characters ' ', '\n', '\t'. if `s` has no whitespaces at the beginning or at the end, the function returns a copy of `s` if the allocation fails the function returns NULL		
	* ft_strsplit
		* allocates with malloc(3) and returns an array of "fresh" strings (all ending with '\0' including the array itself) obtained by spliting `s` using the character `c` as a delimiter. if the allocation fails the function returns NULL. 

* memory freeing - 2 total
	* ft_memdel
		* takes as a parameter the address of a memory area that needs to be freed with free(3), then puts the pointer to NULL
	* ft_strdel
		* takes as a parameter the address of a string that needs to be freed with free(3), then sets its pointer to NULL

* function pointer - 4 total
	* ft_striter
		* applies to function `f` to each character of the string passed as an argument. each character is passed by address to `f` to be modified if necessary
	* ft_striteri
		* applies the function `f` to each character of the string passed as argument, and passing its index as first argument. each character is passed by address to `f` to be modified if necessary.
	* ft_strmap
		* applies the function `f` to each character of the string given as argument to create a "fresh" new string malloc(3) resulting from the successive applictions of `f`
	* ft_strmapi
		* applies the function `f` to each character of the string passed as argument by giving its index as first argument to create a "fresh" new string with malloc(3) resulting from the successive applications of `f`


##### part 1 

short overview of each function. full explaination in docs.

* memset
	* prototype 
		* `void* memset(void *b, int c, size_t len)`
	* description 
		* writes `len` bytes of value `c` (converted to an unsigned char) to the string `b`
	* return value 
		* returns first argument `void *b`

* bzero
	* prototype 
		* `void bzero(void *s, size_t n)
	* description
		* function writes `n` zeroed bytes to the string `s`. if `n` is zero bzero() does nothing.
	* return value
		* void  - nothing

* memcpy
	* prototype
		* `void* memcpy(void *restrict dst, const void *restrict src, size_t n)`
	* description 
		* function copies `n` bytes from memory area `src` to memory area `dst`. if `dst` and `src` overlap, behavior is undefined. applications in which `dst` and `src` might overlap should use memmove instead.
	* return value 
		* the original value of dst

* memccpy
	* prototype 
		* `void* memccpy(void *restrict dst, const void *restrict src, int c, size_t n)`
	* description 
		* function copies bytes from string `src` to string `dst`. if the character `c` (as converted to an unsigned char) occurs in the string `src`. the copy stops and a pointer to the byte after the copy of `c` in the string `dst` is returned. otherwise, `n` bytes are copied, and a NULL pointer is returned. the source and destination string should not overlap as the behavior is undefined 
	* return value 
		* if the character `c` occurs in string `src` 
			* returns a pointer to the byte after the copy of `c` in string `dst`
		* else 
			* returns NULL pointer 

* memmove
	* prototype 
		* `void* memmove(void *dst, const void *src, size_t len)`
	* decription 
		* function copies `len` bytes from string src to string `dst`. the two strings may overlap; the copy is always done in a non-destructive manner. 
	* return value 
		* the original value of `dst`

* memchr
	* prototype 
		* `void* memchr(const void *s, int c, size_t n)`
	* description
		* function locates the first occurrence of `c` (converted to an unsigned char) in string `s`
	* return value
		* function returns a pointer to the byte located, or NULL if no such byte exists withing `n` bytes.

* memcmp
	* prototype
		* `int memcmp(const void *s1, const void *s2, size_t n)`
	* description
		* function compares byte string `s1` against byte string `s2`. both strings are assumed to be `n` bytes long.
	* return value
		* function returns zero if the two strings are identical, otherwise returns the difference between the first two differing bytes (treated as unsigned char values, so that `\200` is greater than `\0`, for example). zero-length strings are always identical 

* strlen
	* prototype
		* `size_t strlen(const char *s)`
	* description
		* function computes the length of the string `s`.
	* return value 
		* function returns the number of characters that precede the terminating NUL character.

* strdup
	* prototype
		* `char* strdup(const char *s1)`
	* description
		* function allocates sufficient memory for a copy of the string `s1`, does the copy, and returns a pointer to it. the pointer may be used as an argument to the function free(3). 
		* if insufficient memory is available, NULL is returned and `errno` is set to ENOMEM.
	* return value 
		* function returns a pointer to the copy of the string 

* strcpy
	* prototype
		* `char* strcpy(char* dst, const char* src)`
	* description
		* function copies the string `src` to `dst` (including the terminating `\0` character.)
		* the source and destination should not overlap, behavior is undefined
	* return value
		* function returns `dst`

* strncpy
	* prototype
		* `char* strncpy(char* dst, const char* src, size_t len)`
	* description
		* function copies at most `len` characters from `src` into `dst`. ig `src` is less than `len` characters long, the remainder of `dst` is filled with `\0` characters. otherwise, `dst` is not terminated 
	* return value
		* function returns `dst`

* strcat
	* prototype 
		* `char* strcat(char* restrict s1, const char* restrict s2)`
	* description
		* function append a copy of the null-terminated string `s2` to the end of the null-terminated string `s1`, then add a terminating `\0`. the string `s1` must have sufficient space to hold the result.
		* the source and destination behavior shuold not overlap, as the behavior is undefined
	* return value 
		* function returns the pointer `s1`

* strncat
	* prototype
		* `char* strncat(char* restrict s1, const char* restrict s2, size_t n)`
	* description
		* function appends a copy of the null-terminated string `s2` to the end of the null-terminated string `s1`, then add a terminating `\0`. the string `s1` must have sufficient space to hold the result. 
		* appends not more than `n` characters from `s2`, and then adds a terminating `\0`.
	* return value 
		* function returns the pointer `s1`

* strlcat
	* prototype
		* `size_t strlcat(char* restrict dst, const char* restrict src, size_t size)`
	* description 
		* function concatenates strings. designed to be safer more consistent, and less error prone replacment for `strncat`. unlike those functions `strlcat` takes the full size of the buffer (not just the length) and gurantees to NUL-terminate the result (as long as there is at least one byte free in `dst`). only operates on true `C``strings i.e. both `src` and `dst` must be NULL-terminated. 
		* function appends the NULL-terminated string `src` to the end of `dst`. it will append at most `size - strlen(dst) - 1 bytes`, NULL-terminating the result.
		* the source and the destination should not overlap, as the behavior is undefined. 
	* return value 
		* functions return the total length of the string they tried to create. the initial length of `dst` plus the length of `src`. (done to make truncation detection simple)
		* if `size` characters are traveresed without finding a NULL, the length of the string is considered to be `size` and the destination string will not be NULL-terminated (since there was no space for the NULL). this keeps it from running off the end of a string. In practice this should not happen, as it means that either `size` is incorrect or that `dst` is not a proper ``C`` string. the check exists to prevent potential security problems in incorrect code. 

* strchr
	* prototype
		* `char* strchr(const char* s, int c)`
	* description
		* function locates the first occurance of `c` (converted to a char) in the string point to by `s`. the terminating NULL character is considered to be part of the string; therefore if `c` is `\0` the function locates the terminating `\0`. 
	* return value
		* function returns a pointer to the located character, or NULL if the character does not appear in the string. 

* strrchr
	* prototype
		* `char* strrchr(const char* s, int c)`
	* description
		* function locates the last occurance of `c` (converted to a char) in the string point to by `s`. the terminating NULL character is considered to be part of the string; therefore if `c` is `\0` the function locates the terminating `\0`
	* return value 
		* return a pointer to the located character, or NULL if the character does not appear in the string

* strstr
	* prototype
		* `char* strstr(const char* big, const char* little)`
	* description
		* function locates the first occurance of the NULL-terminated string `little` in the null-terminated string `big`
	* return value
		* if `little` is an empty string, `big` is returned; if `little` occurs nowhere in `big`, NULL is returned; otherwise a pointer to the first character of the first occurance of `little` is returned. 

* strnstr
	* prototype
		* `char* strnstr(const char* big, const char* little, size_t len)`
	* description
		* function locates the first occurance of the NULL-terminated string `little` in the string `big` where not more than `len` characters are searched. characters that appear after a `\0` character are not searched. since this is a FreeBSD specific API it should nly be used when portability is not a concern.
	* return value
		* if `little` is an empty string, `big` is returned; if `little` occurs nowhere in `big`, NULL is returned; otherwise a pointer to the first character of the first occurrence of `little` is returned.

* strcmp
	* prototype
		* `int strcmp(const char* s1, const char* s2)`
	* description
		* function lexicographically compares the NULL-terminated strings `s1` and `s2`.
	* return value
		* functions return an integer greater than, equal to, or less than 0, according as the string `s1` is greater than, equal to, or less than the string `s2`. the comparison is done using unsigned characters, so that `\200` is greater than `\0`.

* strncmp
	* prototype
		* `int strncmp(const char* s1, const char* s1)`
	* description
		* function compares not more than `n` characters. because it is designed for comparing strings rather than binary code, characters that appear after a `\0` character are not compared. 
	* return value 
		* function returns an integer greater than, equal to, or less than 0, according as the string `s1` is greater than, equal to, or less than the string `s2`. the comparison is done using unsigned characters, so that `\200` is greater than `\0`

* atoi
	* prototype
		* `int atoi(const char* str)`
	* description
		* function converts the initial portion of the string pointed to by `str` to int representation 
	* return value
		* function returns an int representation of the number

* isalpha
	* prototype
		* `int isalpha(int c)`
	* description
		* function tests for any character for which isupper, or islower is true. the value of the argumnet must be representable as an unsigned char or the value of EOF
		* basically alphabette characters
	* return value
		* function returns zero if character tests false and returns non-zero if the character tests true

* isdigit
	* prototype
		* `int isdigit(int c)`
	* description
		* function tests for a decimal digit character 
		* checks for digit 
	* return value
		* returns zero if the character tests false and return non-zero if the character tests true 

* isalnum
	* prototype
		* `int isalnum(int c)`
	* description 
		* function tests for any character for which isalpha or isdigit is true
		* the value of the argument must be representable as an unsigned char or the value of EOF 
	* return value 
		* function returns zero if the character tests false and returns non-zero if the character tests true.

* isascii
	* prototype
		* `int isascii(int c)`
	* description
		* function tests for an ASCII character, which is any character between 0 and octal 0177 inclusive 
	* return value
		* returns zero if the character tests false and returns non-zero if the character tests true.

* isprint
	* prototype
		* `int isprint(int c)`
	* description
		* function tests for any printing character, including space(' '). the value of the argument must be representable as an unsigned char or the value of EOF.
	* return values 
		* function returns zero if the character tests false and returns non-zero if the character tests true. 

* toupper
	* prototype
		* `int toupper(int c)`
	* description
		* function converts a lower-case letter to the corresponding upper-case letter. the argument must be representable as an unsigned char or the value of EOF. 
	* return value 
		* if the argument is a lower-case letter, it returns the corresponding upper-case letter if there is one; otherwise the argument is returned unchanged. 

* tolower
	* prototype
		* `int tolower(int c)`
	* description
		* function converts an upper-case letter to the corresponding lower-case letter. the argument must be representable as an unsigned char or the value of EOF
	* return value 
		* if the argument is an upper-case letter, it returns the corresponding lower-case letter. if there is on; otherwise the argument is returned unchanged. 

##### part 2

* ft_memalloc
	* prototype
		* `void* ft_memalloc(size_t size)`
	* description
		* allocates (with malloc(3)) and returns a "fresh" memory area. the memory allocated is initialized to 0. if the allocation fails, the function returns NULL.
		* `size` is the size of the memory that needs to be allocated
		* libc functions (malloc(3))
	* return value
		* the allocate memory area

* ft_memdel
	* prototype
		* `void ft_memdel(void** ap)`
	* description
		* takes as a parameter the address of a memory area that needs to be freed with free(3), then puts the pointer to NULL
		* `ap` is the address to a pointer that must be freed 
		* libc function free(3)
	* return value
		* none

* ft_strnew
	* prototype
		* `char* ft_strnew(size_t size)`
	* description
		* allocates with malloc(3) and returns a "fresh" string NULL-terminated with `\0`. each character of the string is initialized at `\0`. if the allocation fails the function returns NULL
		* `size` is the size of the string to be allocated
		* libc function malloc(3)
	* return value 
		* the string allocated and initialized to 0

* ft_strdel
	* prototype
		* `void ft_strdel(char** as)`
	* description
		* takes as a parameter the address of a string that needs to be freed with free(3), then sets its pointer to NULL
		* `as` the string's address that needs to be freed and its pointer set to NULL
		* libc function free(3)
	* return value 
		* none

* ft_strclr
	* prototype
		* `void ft_strclr(char* s)`
	* description
		* sets every character of the string to the value `\0`
		* `s` the string that needs to be cleared 
	* return value 
		* none

* ft_striter
	* prototype
		* `void ft_striter(char *s, void (*f)(char*)`
	* description
		* applies to function `f` to each character of the string passed as an argument. each character is passed by address to `f` to be modified if necessary
		* `s` the string to iterate
		* `f` the function to apply to each character of `s`
	* return value
		* none

* ft_striteri
	* prototype
		* `void ft_striteri(char* s, void (*f)(unsigned int, char*))`
	* description
		* applies the function `f` to each character of the string passed as argument, and passing its index as first argument. each character is passed by address to `f` to be modified if necessary.
		* `s` the string to iterate
		* `f` the function to apply to each character of `s` and its index
	* return value 
		* none 

* ft_strmap
	* prototype
		* `char* ft_strmap(char* const s, char (*f)(char))`
	* description
		* applies the function `f` to each character of the string given as argument to create a "fresh" new string malloc(3) resulting from the successive applictions of `f`
		* `s` the string to map
		* `f` the function to apply to each character of `s`
		* libc function malloc(3)
	* return value
		* the "fresh" string created from the successive applications of `f`

* ft_strmapi
	* prototype
		* `char* ft_strmapi(char const *s, char (*f)(unsigned int, char))`
	* description
		* applies the function `f` to each character of the string passed as argument by giving its index as first argument to create a "fresh" new string with malloc(3) resulting from the successive applications of `f`
		* `s` the string to map
		* `f` the function to apply to each character of `s` and its index 
		* libc function malloc(3)
	* return value 
		* the "fresh" string created from the successive applications of `f`

* ft_strequ
	* prototype
		* `int ft_strequ(char const *s1, char const *s2)`
	* description
		* lexicographical comparison between `s1` and `s2`. if the 2 strings are identical the function returns 1, or 0 otherwise
		* `s1` the first string to be compared 
		* `s2` the second string to be compared
	* return value 
		* 1 or 0 according to if the 2 strings are identical or not

* ft_strnequ
	* prototype
		* `int ft_srnequ(char const *s1, char const *s2, size_t n)`
	* description
		* lexicographical comparison between `s1` and `s2` up to `n` characters or until a `\0` is reached. if the 2 strings are identical, the function returns 1, or 0 otherwise. 
		* `s1` the first string to be compared
		* `s2` the second string to be compared
		* `n` the maximum number of characters to be compared
	* return values
		* 1 or 0 according to if the 2 strings are identical or not

* ft_strsub
	* prototype
		* `char* ft_strsub(char const *s, unsigned int start, size_t len)`
	* description
		* allocates with malloc(3) and returns a "fresh" substring from the string given as argument. the substring begins at index `start` and is of size `len`. if `start` and `len` aren't refering to a valid substring, the behavior is undefined. if the allocation fails the function returns NULL.
		* `s` the string from which to create the substring
		* `start` the start index of the substring
		* `len` the size of the substring
		* libc function malloc(3)
	* return value
		* the substring

* ft_strjoin
	* prototype
		* `char* ft_strjoin(char const *s1, char const *s2)`
	* description
		* allocates with malloc(3) and returns a "fresh" string ending with `\0`, result of the concatenation of `s1` and `s2`. if the allocation fails the function returns NULL.
		* `s1` the prefix string
		* `s2` the suffix string
		* libc function malloc(3)
	* return value
		* the "fresh" string result of the concatenation of the 2 strings.

* ft_strtrim
	* prototype
		* `char* ft_strtrim(char const *s)`
	* description
		* allocates with malloc(3) and returns a copy of the string given as argument without whitespaces at the beginning or at the end of the string. will be considered as whitespaces the following characters ' ', '\n', '\t'. if `s` has no whitespaces at the beginning or at the end, the function returns a copy of `s` if the allocation fails the function returns NULL
		* `s` the string to be trimed
		* libc function malloc(3)
	* return value
		* the "fresh" trimmed string or a copy of `s`

* ft_strsplit
	* prototype
		* `char* ft_strsplit(char const *s, char c)`
	* description
		* allocates with malloc(3) and returns an array of "fresh" strings (all ending with '\0' including the array itself) obtained by spliting `s` using the character `c` as a delimiter. if the allocation fails the function returns NULL. 
		* `s` the string to split
		* `c` the delimiter character
		* libc functions malloc(3), free(3)
	* return value
		* the array of "fresh" strings result of the split

* ft_itoa
	* prototype
		* `char* ft_itoa(int n)`
	* description
		* allocate with malloc(3) and returns a "fresh" string ending with '\0'representing the integer `n` given as argument.
		negative numbers must be supported. if allocation fails the function returns NULL.
		* `n` the integer to be transformed into a string
		* libc function malloc(3)
	* return value
		* the string representing the integer passed as argument

* ft_putchar
	* prototype
		* `void ft_putchar(char c)`
	* description
		* outputs the character `c` to the standard output
		* `c` the character to output
		* libc function write(2)
	* return value
		* none

* ft_putstr
	* prototype
		* `void ft_putstr(char const *s)`
	* description
		* outputs the string `s` to the standard output
		* `s` the string to output
		* libc function write(2)
	* return value
		* none

* ft_putendl
	* prototype
		* `void ft_putendl(char const *s)`
	* description
		* outputs the string `s` to the standard output followed by a '\n'
		* `s` the string to ouput
		* libc function write(2)
	* return value
		* none

* ft_putnbr
	* prototype
		* `void ft_putnbr(int n)`
	* description 
		* outputs the integer `n` to the standard output
		* `n` the integer to output
		* libc function write(2)
	* return value 
		* none

* ft_putchar_fd
	* prototype
		* `void ft_putchar_fd(char c, int fd)`
	* description
		* outputs the char `c` to the file descriptor `fd`
		* `c` the character to output
		* `fd` the file descriptor
		* libc function write(2)
	* return value 
		* none

* ft_putstr_fd
	* prototype
		* `void ft_putstr_fd(char const *s, int fd)`
	* description
		* outputs the string `s` to the file descriptor `fd`
		* `s` the string to output
		* `fd` the file descriptor 
		* libc function write(2)
	* return value
		* none

* ft_putendl_fd
	* prototype
		* `void ft_putendl_fd(char const *s, int fd)`
	* description
		* outputs the string `s` to the file descriptor `fd` followed by a '\n'
		* `s` the string to output
		* `fd` the file descriptor 
		* libc function write(2)
	* return value 
		* none

* ft_putnbr_fd
	* prototype
		* `void ft_putnbr_fd(int n, int fd)`
	* description
		* outputs the integer `n` to the file descriptor `fd`
		* `n` the integer to print 
		* `fd` the file descriptor 
		* libc function write(2)
	* return value 
		* none



















































































































