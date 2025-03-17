#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void task(const char *taskName, const char *logFile) {
    FILE *file = fopen(logFile, "a");
    if (file) {
        fprintf(file, "%s completed by process %d\n", taskName, getpid());
        fclose(file);
    }
}

int main() {
    pid_t pid1 = fork();
    if (pid1 == 0) {
        task("Cataloging", "ecommerce_logs/reports/usage_report.log");
        exit(0);
    }

    pid_t pid2 = fork();
    if (pid2 == 0) {
        task("Borrowing", "ecommerce_logs/customers/customer1.log");
        exit(0);
    }

    pid_t pid3 = fork();
    if (pid3 == 0) {
        task("Returning", "ecommerce_logs/orders/order1.log");
        exit(0);
    }

    wait(NULL);
    wait(NULL);
    wait(NULL);
    printf("All processes completed.\n");
    return 0;
}

