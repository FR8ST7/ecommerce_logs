#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork();  // Create a child process

    if (pid == 0) {  // Child process
        printf("Child Process: PID = %d, Parent PID = %d\n", getpid(), getppid());

        FILE *log = fopen("usage_report.log", "a");
        if (log) {
            fprintf(log, "Child PID: %d, Parent PID: %d\n", getpid(), getppid());
            fclose(log);
        } else {
            perror("Error opening log file");
        }

        sleep(5);  // Give time to check process before infinite loop
        while (1); // Keep child running
    } 
    else if (pid > 0) {  // Parent process
        printf("Parent Process: PID = %d\n", getpid());

        FILE *log = fopen("usage_report.log", "a");
        if (log) {
            fprintf(log, "Parent PID: %d\n", getpid());
            fclose(log);
        } else {
            perror("Error opening log file");
        }

        sleep(5);  // Give time to check process before infinite loop
        while (1); // Keep parent running
    } 
    else {  // Error handling
        perror("Fork failed");
        exit(1);
    }

    return 0;
}

