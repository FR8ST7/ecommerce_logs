#include <stdio.h>

int main(){
FILE *file= fopen("product.txt","w");
if(file==NULL){
printf("empty");
}
fprintf(file,"Product: Smartphone\n");
fprintf(file,"Quantity: 50\n");
fclose(file);
printf("done");
return 0;
}
