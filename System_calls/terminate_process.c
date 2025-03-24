#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

int main() {
    int pid;
    printf("Enter PID to terminate: ");
    scanf("%d", &pid);

    // Check if process exists
    if (kill(pid, 0) == 0) {  // kill(pid, 0) only checks existence, doesn't terminate
        if (kill(pid, SIGKILL) == 0) {
            printf("Process %d terminated successfully.\n", pid);
        } else {
            perror("Error terminating process");
        }
    } else {
        printf("error:Process %d terminated.\n", pid);
    }

    return 0;
}

