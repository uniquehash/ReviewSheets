# day12

# questions 

* what is a buffer?
	* a intermediary between two sources, a abstraction layer.
	* a place to store something temporarily in order to mitigate the differences between inpu and output speed

# explore 

* files introduction 
	* file descriptor 
		* an integer 
		* can be used to manipulate the file 
		* its an id basically
		* file descriptors are put of write 
		* standard file descriptors 
			* 0 -> stdin 
			* 1 -> stdout 
			* 2 -> stderr

* file manipulation - open 
	* `man 2 open`
		* `int open(char *path, int flags[, mode_t perm]);`
		* path = file 
		* flags = open option 
		* perm = permission 
	* returns 
		* file descriptor (int) or -1 in error 
	* flags 
		* there are three flads possible to open a file 
			* O_RDONLY 
				* read only 
			* O_WRONLY
				* write only
			* O_RDWR
				* read write only
			* extra flags 
				* O_CREAT
					* if file does not exist create it 
				* O_TRUNC
					* if file exist write from first octet 
				* O_APPEND
					* if file does not exist write from last octet
	* example: 
	* initial 
	```
		#include <sys/types.h>
		#include <sys/stat.h>
		#include <fcntl.h>

		int	main()
		{
			int fd;

			fd = open("alph", O_RDONLY);
			ft_putnbr(fd);
			return (0);
		}
	```
	* read write create 
	```
		#include <sys/types.h>
		#inlcude <sys/stat.h>
		#include <fcntl.h>

		int main()
		{
			int fd;

			fd = open("42", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);
			ft_putnbr(fd);
			return (0);
		}
	```
	* error handling 
	```
		#include <sys/types.h>
		#include <sys/stat.h>
		#include <fcntl.h>

		int main()
		{
			int fd;

			fd = open("/dev/42", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);
			if (fd == -1)
				ft_putstr("open() failed\n");
			ft_putnbr(fd);
			return (0);
		}
	```
	* close 
		* `man 2 close` 
			* `int close(int fd);`
				* fd = file descriptor 
			* return 
				* 0 or -1 if error
		* example: 
		```
			#include <sys/types.h> 
			#include <sys/stat.h> 
			#include <fcntl.h> 

			int main()
			{
				int fd;

				fd = open("42", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);
				if (fd == -1)
				{
					ft_putstr("open() failed\n");
					return (1);
				}
				ft_putnbr(fd);
				if (close(fd) == -1)
				{
					ft_putstr("close() failed\n");
					return (1);
				}
				return (0);
			}

* file manipulation - read 
	* `man 2 read`
		* `int read(int fd, char *buf, int count);`
			* fd
				* file descriptor to read 
			* buf 
				* buffer of destination 
			* count 
				* number of bytes to read 
		* return 
			* nomber of bytes read or -1 if error 
	* example: 
		* initial 
		```
			#include <sys/types.h> 
			#include <sys/stat.h>
			#include <fcntl.h> 
			#include <unist.h> 

			#define BUF_SIZE 4096
	
			int main()
			{
				int fd; 
				int ret;
				char buf[BUF_SIZE + 1];

				fd = open("42", O_RDONLY);
				if (fd == -1)
				{
					ft_putstr("open() error");
					return (1);
				}
				ret = read(fd, buf, BUF_SIZE);
				buf[ret] = '\0';
				ft_putnbr(ret);
				ft_putstr(buf);
				if (close(fd) == -1)
				{
					ft_putstr("close() error");
					return (1);
				}
				return (0);
			}
		```
		* loop on read 
		```
			#inlcude <sys/types.h>
			#include <sys/stat.h>
			#include <fcntl.h> 
			#inlcude <unistd.h>

			#define BUF_SIZE 10

			int main()
			{
				int fd;
				int ret;
				char buf[BUF_SIZE + 1];


				fd = open("42", O_RDONLY);
				if (fd == -1)
				{
					ft_putstr("open() error");
					return (1);
				}
				while (ret = read(fd, buf, BUF_SIZE))
				{
					buf[ret] = '\0';
					ft_putnbr(ret);
					ft_putstr(buf);
				}
				ft_putnbr(ret);
				if (close(fd) == -1)
				{
					ft_putstr("close() error");
					return (1);
				}
				return (0);
			}
		```

* file manipulation - write 
	* `man 2 write` 
		* `int write(int fd, char *buf, int count);`
			* fd
				* file descriptor to write to 
			* buf
				* buffer source 
			* count
				* number of bytes to write too
		* return 
			* number of bytes written or -1 
	* example: 
		* initial - write char 
		```
			#include <sys/types.h> 
			#include <sys/stat.h> 
			#inlcude <fcntl.h>

			void ft_putchar(int fd, char c)
			{
				write(fd, &c, 1);
			}

			int main()
			{
				int fd; 
	
				fd = open("42", O_WRONLY | O_CREAT | O_APPEND, S_IRUSR | S_IWUSR);
				if (fd == -1) 
				{
					ft_putstr("open() error");
					return (1);
				}
				ft_putnbr(fd);
				ft_putchar(fd, 'Z');
				if (close(fd) == -1)
				{
					ft_putstr("close() error");
					return (1);
				}
				return (0);
			}
		```
			#include <sys/types.h> 
			#include <sys/stat.h>
			#include <fcntl.h> 

			void ft_putstr_fd(int fd, char *str)
			{
				write(fd, &c, 1);
			}
		
			int main ()
			{
				int fd;

				fd = open("42"m O_WRONLY | O_CREAT | O_APPEND, S_IRUSR | S_IWUSR);
				if (fd == -1)
				{
					ft_putstr("open() error");
					return (1);
				}
				ft_putnbr(fd);
				ft_putstr_fd(fd, "Hello world !");
				if (close(fd) == -1)
				{
					ft_putstr("close() error");
					return (1);
				}
				return (0);
			}
		```

* file manipulation - Lseek
	* offset 
		* there is a reading head that rest on next line to read 
			* this is the difference between the last byte read and 0
		* the offset is the head of reading 
	* `man 2 lseek`
		* `int lseek(int fd, int offset, int mode);`
			* fd 
				* file descriptor 
			* offset 
				* offset of the result of calculation 
			* mode 
				* calculation mode of new offset 
		* return 
			* new offset or -1 if error 
	* example: 
		* initial 
		```
			#include <sys/types.h> 
			#include <sys/stat.h> 
			#include <fcntl.h>
			#include <unistd.h>

			#define BUF_SIZE 10

			int main()
			{
				int fd;
				int ret; 
				char buf[BUF_SIZE + 1];

				fd = open("42", O_RDONLY);
				if (fd == -1)
				{
					ft_putstr("open() error");
					return (1);
				}
				while (ret = read(fd, buf, BUF_SIZE))
				{
					buf[ret] = '\0';
					ft_putnbr(ret);
					ft_putstr(buf);
					lseek(fd, -10, SEEK_END);
				}
				ft_putnbr(ret);
				if (close(fd) == -1)
				{
					ft_putstr("close() error");
					return (1);
				}
				return (0);
			}
		```

* libraries
	* <sys/types.h> 
		* basically a bunch defined types to call
	* <sys/stat.h> 
		* defined the structure of data returned by `fstat()`, `lstat()`, `stat()`
			* st_ino and st_dev uniquely identify the file 
			* used for the file permissions and flags 
	* <fcntl.h>
		* has to do with file descriptors ?
	* <unistd.h>
		* this actually enables the close, open, read, and write commands

* read 
	* attempts to read `nbyte` bytes of data from the object referenced by the descriptor `fildes` into the buffer pointed by `buf`
	* on objects capable of seeking
		* read starts at a position given by the pointer associated with `fildes`
			* upon return the pointer is incremented by number of bytes read
			* this is the head reader 
	* if successful returns the number of bytes actually read and placed in the buffer 
		* end of file
			* 0 returned 
			* -1 is returned 
				* errno is set to indicate an error 

* cat
	* reads files sequentially writing them to the standard output ad it goes
	* executes command line operators in the order that they come
	* if `file` is a single dash (-) or absent 
		* reads from stdin until recieves a EOF ^D character

* Errno 
	* system error constants 
	* defines and conditionally exports all the error constants defined in your system errno.h file 
		* has a single export tag, ":posix"
	* errno keeps the int value 
	* printed to stderror displays the string value 

























		
