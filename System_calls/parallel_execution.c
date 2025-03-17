#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void logTransaction(const char *message, const char *file) {
    FILE *log = fopen(file, "a");
    if (log) {
        fprintf(log, "%s by PID %d\n", message, getpid());
        fclose(log);
    }
}

int main() {
    pid_t pid1 = fork();
    if (pid1 == 0) {
        logTransaction("Processing payment", "ecommerce_logs/payments/payment1.log");
        exit(0);
    }

    pid_t pid2 = fork();
    if (pid2 == 0) {
        logTransaction("Processing refund", "ecommerce_logs/refunds/refund1.log");
        exit(0);
    }

    wait(NULL);
    wait(NULL);
    printf("All transactions completed.\n");
    return 0;
}

