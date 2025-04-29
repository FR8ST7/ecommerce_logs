#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>

int main(){
int fd[2];
pid_t pid;
char buffer[100];

if(pid==-1){
perror("failed");
return 1;
}
pid= fork();

if(pid<0){
perror("fork failed");
return 1;
}

else if(pid==0){
close(fd[0]);

char *msg="process completed";
write(fd[1],msg,strlen(msg)+1);
printf("child(pid:%d) msg sent",getpid());
close(fd[1]);
}

else{
close(fd[1]);
read(fd[0],buffer,sizeof(buffer));
printf("parent(pid:%d) msg received:%s",getpid(),buffer);
close(fd[0]);
}
return 0;
}
