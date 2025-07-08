#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void comment(char *buffer , int size ,FILE *pFile);
void ramlocation(char *buffer , int size ,FILE *pFile);

int main(){
    //printf("start\n");
    FILE *pFile = fopen("check1.asm", "r");
      FILE *pFileout= fopen("output.hack", "w");
        if(pFileout == NULL){
        printf("Could not open file\n");
       return 1;
    }

    char buffer[1024];
   
    if(pFile == NULL){
        printf("Could not open file\n");
        return 1;
    }


    //comment(buffer , sizeof(buffer) ,pFile);
    ramlocation(buffer , sizeof(buffer) ,pFile);
    fprintf(pFileout, "%s", buffer);
      fclose(pFileout);
return 0;
}

void ramlocation(char *buffer , int size , FILE *pFile){
    while (fgets(buffer, size, pFile)){
        char binary[16] = {0}; 
        if (*buffer == '@') {
            int value = atoi(&buffer[1]);  
           // printf("%d ", value);
                 
            for (int i = 15; i >= 0; i--) {
                binary[15 - i] = ((value >> i) & 1) ? '1' : '0';
            }
           snprintf(buffer, size, "%s\n", binary);
            //printf("%s", buffer); 
        }
        if (buffer[0] =='D'){
            for(int i = 15; i>12 ;i--){
                binary[15-i] = '1';
            }
            snprintf(buffer, size, "%s\n", binary);
        }
    
          printf("%s", buffer); 
       
    }

    fclose(pFile);
}


void comment(char *buffer , int size ,FILE *pFile){
   
   
    while(fgets(buffer , size, pFile) !=NULL){
     
        
        char *comment =strstr(buffer, "//");
     
        if (comment){
            *comment = '\0';
            }
       

        printf("%s", buffer);
       
    } 
    ramlocation(buffer , size ,pFile);
    fclose(pFile);
   
}