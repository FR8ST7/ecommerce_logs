#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int fd[2];
    pipe(fd);

    pid_t pid = fork();
    if (pid == 0) {
        close(fd[0]);
        char message[] = "Payment processed.";
        write(fd[1], message, sizeof(message));
        close(fd[1]);
        exit(0);
    } else {
        close(fd[1]);
        char buffer[100];
        read(fd[0], buffer, sizeof(buffer));
        printf("Parent received: %s\n", buffer);
        close(fd[0]);
    }
    return 0;
}

