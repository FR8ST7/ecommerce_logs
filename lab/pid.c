#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>  // Include this for wait()

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        FILE *log = fopen("ecommerce_logs/reports/usage_report.log", "a");
        if (log) {
            fprintf(log, "Child PID: %d, Parent PID: %d\n", getpid(), getppid());
            fclose(log);
        }
        exit(0);
    } else {
        wait(NULL);  // Now properly declared
    }
    return 0;
}

