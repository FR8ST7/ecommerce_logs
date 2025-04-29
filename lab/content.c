#include <stdio.h>

int main(){
FILE *file= fopen("lib_info.txt","w");
if(file==NULL){
printf("error");
return 1;
}
fprintf(file, "Title: \"learn linux in 30 days\"\n");
fprintf(file, "Author: \"John Smith\"\n");
fprintf(file, "Title: \"Copies:15\"\n");
fclose(file);
printf("file created...\n");
return 0;
}
