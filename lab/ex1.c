#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
pid_t pid;
pid=fork();

if (pid<0){
perror("failed");
return 1;
}
else if(pid==0){
printf("child:%d",getpid());
}
else{
printf("parent:%d , child:%d",getpid(),pid);
}
return 0;
}
