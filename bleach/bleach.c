#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h> 
#define BUFFER_SIZE 99999

int main(int ac, char **av)
{
	int	i;
	char	*buffer;
	int	bytes_read;
	int 	fd;

	if (ac != 2)
		return(write(1, "File name required\n", 19), 1);
	fd = open(av[1], O_RDWR);
	if (fd == -1)
		return(write(1, "File not found\n", 15), 1);
	buffer = malloc(sizeof(char) * BUFFER_SIZE);
	bytes_read = read(fd, buffer, BUFFER_SIZE);
	i = 0;
	if (lseek(fd, i, SEEK_SET) == -1)
		return (write(1, "Error", 5), 1);
	while (i < bytes_read)
	{
		write(fd, "\0", 1);
		i++;
	}
	printf("%d\n", bytes_read);
	return (write(fd, "\n", 1), free(buffer), close(fd), 0);
}
