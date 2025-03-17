#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return 1;
    } else if (pid == 0) {
        printf("Child process (Book Issuing): PID = %d, PPID = %d\n", getpid(), getppid());
        FILE *file = fopen("ecommerce_logs/books/books.log", "a");
        if (file) {
            fprintf(file, "Book issued by process %d\n", getpid());
            fclose(file);
        }
        exit(0);
    } else {
        wait(NULL);
        printf("Parent process: Child completed\n");
    }
    return 0;
}

