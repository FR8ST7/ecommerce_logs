#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>

int main() {
    struct timeval start, end;
    gettimeofday(&start, NULL);

    pid_t pid = fork();
    if (pid == 0) {
        sleep(2);
        exit(0);
    }
    wait(NULL);

    gettimeofday(&end, NULL);
    double exec_time = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1e6;
    printf("Execution time: %f seconds\n", exec_time);

    return 0;
}

