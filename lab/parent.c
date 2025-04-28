#include <stdio.h>
#include <unistd.h>   // for fork()
#include <sys/types.h> // for pid_t

int main() {
    pid_t pid;

    pid = fork(); // create a new process

    if (pid < 0) {
        // fork() failed
        perror("fork failed");
        return 1;
    }
    else if (pid == 0) {
        // Child process
        printf("This is the child process! PID: %d\n", getpid());
    }
    else {
        // Parent process
        printf("This is the parent process! PID: %d, Child PID: %d\n", getpid(), pid);
    }

    return 0;
}

