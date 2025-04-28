#include <stdio.h>
#include <unistd.h>
#include <sys/resource.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();
    if (pid < 0) { perror("fork"); return 1; }

    int prio = (pid == 0) ? 10 : -5;
    if (setpriority(PRIO_PROCESS, 0, prio) == -1) { perror("setpriority"); exit(1); }

    printf("%s (PID %d)%s\n", pid == 0 ? "Child" : "Parent", getpid(), pid > 0 ? " created child" : "");
    
    for (int i = 0; i < 5; i++) {
        printf("%s working %d\n", pid == 0 ? "Child" : "Parent", i);
        sleep(1);
    }

    return 0;
}

