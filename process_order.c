#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define NUM_PROCESSES 3 // Number of theme-related processes

// Function to simulate an e-commerce operation
void perform_task(int task_id) {
    printf("Process %d (PID: %d) started\n", task_id, getpid());
    sleep(2); // Simulate work
    printf("Process %d (PID: %d) completed\n", task_id, getpid());
    exit(0);
}

int main() {
    pid_t pids[NUM_PROCESSES];
    int status;
    FILE *log_file = fopen("process_status.log", "w");

    if (log_file == NULL) {
        perror("Error opening log file");
        return 1;
    }

    fprintf(log_file, "E-commerce Process Status Log\n");
    fprintf(log_file, "---------------------------------\n");

    for (int i = 0; i < NUM_PROCESSES; i++) {
        pids[i] = fork();

        if (pids[i] < 0) {
            perror("Fork failed");
            exit(1);
        } 
        else if (pids[i] == 0) {
            // Child process
            perform_task(i + 1);
        } 
        else {
            // Parent process
            fprintf(log_file, "Process %d started (PID: %d)\n", i + 1, pids[i]);
        }
    }

    // Parent waits for all child processes
    for (int i = 0; i < NUM_PROCESSES; i++) {
        pid_t finished_pid = waitpid(pids[i], &status, 0);
        if (WIFEXITED(status)) {
            fprintf(log_file, "Process (PID: %d) exited with status %d\n", finished_pid, WEXITSTATUS(status));
        } 
        else {
            fprintf(log_file, "Process (PID: %d) terminated abnormally\n", finished_pid);
        }
    }

    fclose(log_file);
    printf("Process tracking complete. Check 'process_status.log' for details.\n");
    return 0;
}