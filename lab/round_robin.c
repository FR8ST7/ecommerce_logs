#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork failed");
        return 1;
    }
    else if (pid == 0) {
        // Child process
        for (int i = 0; i < 5; i++) {
            printf("Child (PID %d) working round %d\n", getpid(), i);
            sleep(1); // Simulate child doing work
        }
    }
    else {
        // Parent process
        for (int i = 0; i < 5; i++) {
            sleep(1); // Wait same time as child (like time slice)
            printf("Parent (PID %d) working round %d\n", getpid(), i);
        }
        wait(NULL); // Wait for child to finish
    }

    return 0;
}

