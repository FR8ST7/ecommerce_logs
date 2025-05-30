#include <stdio.h>
#include <unistd.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();
    if (pid < 0) { 
    perror("fork"); 
    return 1; 
    }

    if (pid == 0) { // Child
        setpriority(PRIO_PROCESS, 0, 10); // lower priority
        printf("Child (PID %d)\n", getpid());
        for (int i = 0; i < 5; i++) {
            printf("Child working %d\n", i);
            sleep(1);
        }
    } else { // Parent
        setpriority(PRIO_PROCESS, 0, 5); // small positive nice value
        printf("Parent (PID %d) created child\n", getpid());
        wait(NULL); // Wait for child to finish
        printf("Parent: Child completed\n");
    }

    return 0;
}

