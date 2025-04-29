#include <stdio.h>
#include <unistd.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(){
pid_t pid;
pid= fork();

if(pid<0){
perror("fork");
return 1;
}

if(pid==0){
setpriority(PRIO_PROCESS,0,10);
printf("child(pid:%d)\n",getpid());
for(int i=0;i<5;i++){
printf("working process : %d",i);
}
}
else{
setpriority(PRIO_PROCESS,0,5);
printf("parent(pid:%d) created process\n",getpid());
wait(NULL);
printf("all process are priotized\n");
}
return 0;
}

