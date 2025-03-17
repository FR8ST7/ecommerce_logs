#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        printf("Child process exiting (PID: %d)\n", getpid());
        exit(0);
    } else {
        printf("Parent process running... Check 'ps' output for zombie\n");
        sleep(10); // Keep parent alive
    }
    return 0;
}

