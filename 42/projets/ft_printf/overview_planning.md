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
	* minimum field-width
	* precision

the way i'm gonna organize the research is through my tried an true question answer format. after words i'l probably organize it into a guide and plan of attack.

* ft_printf feature set, expanded view

