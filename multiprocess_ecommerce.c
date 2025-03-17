#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

// Define log file path
#define LOG_FILE "ecommerce_logs/process_log.txt"

// Function to log process details
void log_process(const char *operation) {
    int log_fd = open(LOG_FILE, O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (log_fd < 0) {
        perror("Error opening log file");
        exit(1);
    }

    char buffer[256];
    int len = snprintf(buffer, sizeof(buffer), "Operation: %s | PID: %d | PPID: %d\n", operation, getpid(), getppid());
    write(log_fd, buffer, len);
    close(log_fd);
}

// Function to catalog products
void catalog_products() {
    log_process("Cataloging Products");
    printf("📦 Cataloging products... (PID: %d, PPID: %d)\n", getpid(), getppid());
}

// Function to process an order
void process_order() {
    log_process("Processing Order");
    printf("✅ Processing order... (PID: %d, PPID: %d)\n", getpid(), getppid());
}

// Function to handle product returns
void process_return() {
    log_process("Handling Return");
    printf("🔄 Handling product return... (PID: %d, PPID: %d)\n", getpid(), getppid());
}

int main() {
    // Ensure log directory exists
    system("mkdir -p ecommerce_logs");

    pid_t pid1, pid2, pid3;

    // Create first child process for cataloging
    pid1 = fork();
    if (pid1 == 0) {
        catalog_products();
        exit(0);
    }

    // Create second child process for order processing
    pid2 = fork();
    if (pid2 == 0) {
        process_order();
        exit(0);
    }

    // Create third child process for handling returns
    pid3 = fork();
    if (pid3 == 0) {
        process_return();
        exit(0);
    }

    // Parent process waits for all children
    wait(NULL);
    wait(NULL);
    wait(NULL);

    printf("All e-commerce operations completed!\n");
    return 0;
}