#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        printf("Child process running (PID: %d)\n", getpid());
        sleep(2);
        printf("Child process exiting.\n");
        exit(0);
    } else {
        printf("Parent waiting...\n");
        wait(NULL);
        printf("Child process terminated.\n");
    }
    return 0;
}

