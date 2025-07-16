#include <stdio.h>
#include <string.h>
#include <stdlib.h>



void ramlocation(char *buffer , int size ,FILE *pFile, FILE *pFileout);
int main(){
    //printf("start\n");

    FILE *pFile = fopen("check4_rect.asm", "r");
      FILE *pFileout= fopen("E:\\nand2tetris\\assembler\\output.hack", "w");
        if(pFileout == NULL){
        printf("Could not open file\n");
       return 1;
    }
   char buffer[1024];
   
    if(pFile == NULL){
        printf("Could not open file\n");
        return 1;
    }


    ramlocation(buffer , sizeof(buffer) ,pFile , pFileout);
    
      fclose(pFileout);
      fclose(pFile);
return 0;
}

void ramlocation(char *buffer , int size , FILE *pFile, FILE *pFileout){


    while (fgets(buffer, size, pFile)){
        //printf("here");
        char binary[17] = {0}; 
         
        if (*buffer == '@') {
            //printf("here");
            int value = atoi(&buffer[1]);  
           
            for (int i = 15; i >=0; i--) {
               binary[15- i] = ((value >> i) & 1) ? '1' : '0';
            }
          // snprintf(buffer, size, "%s\n", binary);
        }
        
        char *comp =strstr(buffer, "=");
        // if (comp){
        // printf("%c",*(comp +2));
        //   }
        char *jump = strstr(buffer ,"J");

          // for D;jump case
             
        //dest
       switch (*buffer)
       {
       case 'D':
        
                for (int j = 15 ; j>12 ; j--){
                binary[15-j] = '1';}
                
              
            
            binary[10]='0';
            binary[11]='1';
            binary[12] ='0';

               if(buffer[1]==';'){
                     binary[4]='0';
                binary[5]='0';
                binary[6] ='1';
             binary[7]='1';
                binary[8]='0';
            binary[9] ='0';
             binary[10]='0';
            binary[11]='0';
            binary[12] ='0';
                 binary[13]='0';
            binary[14]='0';
            binary[15] ='0';
                    
                }
        // snprintf(buffer, size, "%s\n", binary);
        break;
       
         case 'M':
         
            for (int j= 15 ; j>12 ; j--){
                binary[15-j] = '1';}
             
            
            if(buffer[1]=='D'){
                binary[10]='0';
                binary[11]='1';
                binary[12] ='1';
            }
            else{
                binary[10]='0';
                binary[11]='0';
                binary[12] ='1';
            }
        //snprintf(buffer, size, "%s\n", binary); 
        break;

         case 'A':
        
                for (int j =15 ; j>12; j--){
                binary[15-j] = '1';}
                
            
        if(buffer[1]=='D'){
                binary[10]='1';
                binary[11]='1';
                binary[12] ='0';
        }
        else if (buffer[1]== 'M'){
            if (buffer[2]=='D'){
                binary[10]='1';
                binary[11]='1';
                binary[12] ='1';
            }
            else{
                binary[10]='1';
                binary[11]='0';
                binary[12] ='1';
            }        
        }   
        else{
                binary[10]='1';
                binary[11]='0';
                binary[12] ='0';}
        //snprintf(buffer, size, "%s\n", binary);
        break;
       default:
       NULL;
        break;
       }
        binary[3]='0';
              
        //comp   
if (comp ){
        binary[13]='0';
        binary[14]='0';
        binary[15]='0';
       switch (comp[1])
       {
        
       case '0':
           
            binary[4]='1';//c1
                binary[5] ='0';
                    binary[6]='1';
                binary[7]='0';
                binary[8] ='1';
                binary[9] ='0'; //c6
             
        break;

         case '1':
            
            binary[4]='1';//c1
                binary[5] ='1';
                    binary[6]='1';
                binary[7]='1';
                binary[8] ='1';
                binary[9] ='1'; //c6
             
        break;

         case '-':
          binary[4]='1';//c1
                binary[5] ='1';
                    binary[6]='0';
                binary[7]='0';
                binary[8] ='1';
                binary[9] ='1'; //c6
            
           if (comp[2]=='D'){
               
            
            binary[4]='0';//c1
                binary[5] ='0';
                    binary[6]='1';
                binary[7]='1';
                binary[8] ='1';
                binary[9] ='1'; //c6
              break;
            }
            else if (comp[2]=='1'){
                
            binary[4]='1';//c1
                binary[5] ='1';
                    binary[6]='1';
                binary[7]='0';
                binary[8] ='1';
                binary[9] ='0'; //c6
            }
            else if (comp[2]=='M'){
                binary[3]='1'; //a
            
            }
            
        break;
        
        case '!':
            binary[4]='1';//c1
                binary[5] ='1';
                    binary[6]='0';
                binary[7]='0';
                binary[8] ='0';
                binary[9] ='1'; //c6
            
                if (comp[2]=='D'){
                     binary[4]='0';//c1
                binary[5] ='0';
                    binary[6]='1';
                binary[7]='1';
                binary[8] ='0';
                binary[9] ='1'; //c6
                
           
            }
            else if (comp[2]=='M'){
                binary[3]='1';
            }
        break;

        case 'D':
              binary[4]='0';//c1
                binary[5] ='0';
                    binary[6]='1';
                binary[7]='1';
                binary[8] ='0';
                binary[9] ='0'; //c6

                    if(comp[2]=='&'){
                      binary[4]='0';//c1
                    binary[5] ='0';
                    binary[6]='0';
                        binary[7]='0';
                    binary[8] ='0';
                    binary[9] ='0'; //c6
                    
                        if(comp[3]=='M'){
                            binary[3]='1';
                    }
                

                }
                 if(comp[2]=='|'){
                      binary[4]='0';//c1
                binary[5] ='1';
                    binary[6]='0';
                binary[7]='1';
                binary[8] ='0';
                binary[9] ='1'; //c6
                    
                    if(comp[3]=='M'){
                        binary[3]='1';
                    }
            
                }
                if(comp[2]=='+'){
                    binary[4]='0';//c1
                binary[5] ='0';
                    binary[6]='0';
                binary[7]='0';
                binary[8] ='1';
                binary[9] ='0'; //c6
                    if(comp[3]=='1'){
                        binary[4]='0';//c1
                        binary[5] ='1';
                        binary[6]='1';
                        binary[7]='1';
                        binary[8] ='1';
                        binary[9] ='1'; //c6
                    }
                    if(comp[3]=='M'){
                        binary[3]='1';
                    }

                }
                if (comp[2]=='-'){
                    binary[4]='0';//c1
                        binary[5] ='1';
                        binary[6]='0';
                        binary[7]='0';
                        binary[8] ='1';
                        binary[9] ='1'; //c6

                        if(comp[3]=='1'){
                            binary[4]='0';//c1
                        binary[5] ='0';
                        binary[6]='1';
                        binary[7]='1';
                        binary[8] ='1';
                        binary[9] ='0'; //c6
                        }

                        if(comp[3]=='M'){
                            binary[3]='1';
                        }
                }
        break;
       
        case 'M':
                binary[3]='1';
        case 'A':
                binary[4]='1';//c1
                    binary[5] ='1';
                    binary[6]='0';
                    binary[7]='0';
                    binary[8] ='0';
                    binary[9] ='0'; //c6

                    if(comp[2]=='+'){
                        binary[4]='1';//c1
                        binary[5] ='1';
                        binary[6]='0';
                        binary[7]='1';
                        binary[8] ='1';
                        binary[9] ='1'; //c6
                    }

                     if(comp[2]=='-'){
                        binary[4]='1';//c1
                        binary[5] ='1';
                        binary[6]='0';
                        binary[7]='0';
                        binary[8] ='1';
                        binary[9] ='0'; //c6


                            if(comp[3]=='D'){
                                binary[4]='0';//c1
                        binary[5] ='0';
                        binary[6]='0';
                        binary[7]='1';
                        binary[8] ='1';
                        binary[9] ='1'; //c6
                                
                            }
                    }
                    
            break;
       default: 
       NULL;
        break;
       }}


if(jump){

    switch (jump[1])
    {
    case 'G':
        binary[15] = '1';
        if(jump[2]=='E'){
            // 13,14,15 defualt here is 001
            binary[14]='1';
        }
        break;
    case 'L':
        binary[13]='1';
        if (jump[2]=='E'){
             // 13,14,15 defualt here is 100
             binary[14]='1';
        }
        break;
    case 'E':
        binary[14]='1';


    break;

    case 'N':
    binary[13]='1';
    binary[15]='1';
    break;
        case 'M':
        // this always happens with 0;jump
        binary[0]='1';
        binary[1]='1';
          binary[2]='1';

          binary[3]='0';//a
        binary[4]='1';//c1
          binary[5]='0';

          binary[6]='1';
        binary[7]='0';
          binary[8]='1';

          binary[9]='1';//c6
          //dest is null here
        binary[10]='0';
          binary[11]='0';
          binary[12]='0';
          //jump
          binary[13]='1';
        binary[14]='1';
          binary[15]='1';
        break;
    default:
    NULL;
        break;
    }

    }
      
       snprintf(buffer, size, "%s\n", binary);
        printf("%s", buffer); 
        fprintf(pFileout, "%s", buffer);
    }
    fclose(pFileout);
    fclose(pFile);
}
