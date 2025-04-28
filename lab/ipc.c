#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>

int main() {
    int fd[2];
    pid_t pid;
    char buffer[100];

    // Create the pipe
    if (pipe(fd) == -1) {
        perror("pipe failed");
        return 1;
    }

    pid = fork();

    if (pid < 0) {
        perror("fork failed");
        return 1;
    } else if (pid == 0) {
        // Child process
        close(fd[0]); // Close unused read end

        char *message = "Hello from child!";
        write(fd[1], message, strlen(message) + 1); // send message (+1 to include '\0')

        printf("Child (PID %d) sent message.\n", getpid());
        close(fd[1]); // Close write end after writing
    } else {
        // Parent process
        close(fd[1]); // Close unused write end

        read(fd[0], buffer, sizeof(buffer));
        printf("Parent (PID %d) received message: %s\n", getpid(), buffer);
        close(fd[0]); // Close read end after reading
    }

    return 0;
}

