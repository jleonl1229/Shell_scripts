#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h> 

int main(int ac, char **av)
{
	long	i;
	off_t	total;
	int 	fd;

	if (ac != 2)
		return(write(2, "File name required\n", 19), 1);
	fd = open(av[1], O_RDWR);
	if (fd == -1)
		return(write(2, "File not found\n", 15), 1);
	lseek(fd, 0, SEEK_END);
	total = lseek(fd, 0, SEEK_CUR);
	if (lseek(fd, 0, SEEK_SET) == -1)
		return (write(2, "Error", 5), 1);
	i = 0;
	while (i < total)
	{
		write(fd, "\0", 1);
		i++;
	}
	printf("Total bytes in the file: %ld | Overrided: %ld\n", total, i);
	return (write(2, "\n", 1), close(fd), 0);
}
