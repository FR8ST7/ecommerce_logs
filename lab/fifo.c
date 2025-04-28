#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
    char buf[100];
    mkfifo("fifo", 0666);
    if (fork() == 0) {
        int fd = open("fifo", O_WRONLY);
        dprintf(fd, "Child PID: %d", getpid());
        close(fd);
    } else {
        int fd = open("fifo", O_RDONLY);
        read(fd, buf, sizeof(buf));
        printf("Parent got: %s\n", buf);
        close(fd);
        unlink("fifo");
    }
    return 0;
}

