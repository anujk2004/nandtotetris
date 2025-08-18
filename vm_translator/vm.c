#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void check(char *buffer ,int size , FILE *pFile , FILE *pFileout);
void pushsegment(char *buffer , FILE *pFileout  );
void popsegment(char *buffer , FILE *pFileout  );
void pushlcl_arg_this_that(int storevalue,char *type, FILE *pFileout);
void poplcl_arg_this_that(int storevalue,char *type, FILE *pFileout);
void pushtemp_pointer( FILE *pFileout);
void poptemp_pointer( FILE *pFileout);
void addsubandor(char type , FILE *pFileout);
void eqltgt(char *type ,int count, FILE *pFileout);
void negnot(char type , FILE *pFileout);

char filename[] =  "checkpointertest.vm";
char stfile[sizeof(filename)];

int main(){
    
    FILE *pFile = fopen(filename, "r");
    FILE *pFileout= fopen("pointertest.asm", "w");
    char buffer[1024];
        if(pFileout == NULL){
        printf("Could not open file\n");
       return 1;
        }

         if(pFile == NULL){
        printf("Could not open file\n");
       return 1;
        }
        check(buffer ,sizeof(buffer) ,pFile , pFileout);
        fclose(pFileout);
        fclose(pFile);
return 0;
}

void check(char *buffer ,int size , FILE *pFile , FILE *pFileout){
        int i=0;
        int j=0;
        int k=0;
    while (fgets(buffer, size, pFile)){
 
        char *comment= strstr( buffer, "//");
        char *push = strstr(buffer , "push");
        char *pop = strstr(buffer , "pop");
        //arithmetic
        char *add = strstr(buffer, "add");
        char *sub = strstr(buffer, "sub");
        char *neg = strstr(buffer, "neg");
        char *eq = strstr(buffer, "eq");
        char *gt = strstr(buffer , "gt");
        char *lt = strstr(buffer, "lt");
        char *and= strstr(buffer ,"and");
        char *or= strstr(buffer ,"or");
        char *not= strstr(buffer ,"not");


        if (comment){ 
            *comment = '\0'; 
            
        }
        if(buffer[0]=='\0'){
            sprintf(buffer , "\n");
        }
        if(buffer[0] == '\n'){ 
          continue;
        }
        

        printf("// %s", buffer);
        fprintf(pFileout , "\n// %s\n" , buffer );
        if(push){
            pushsegment(&buffer[5], pFileout);}
        if(pop){
            popsegment(&buffer[4],pFileout);}
        if(add){
            addsubandor('+',pFileout); }
        if(sub){
            addsubandor('-',pFileout);}
        if(neg){
            negnot('-',pFileout);}
        if(eq){  
            eqltgt("EQ",i,pFileout);
            i++;}
        if(gt){
            eqltgt("GT",j,pFileout);
            j++;}
        if(lt){
            eqltgt("LT",k,pFileout);
            k++;}
        if(and){
            addsubandor('&',pFileout);}
        if(or){
            addsubandor('|',pFileout);}
        if(not){
            negnot('!',pFileout);}}
    
}
void popsegment( char *buffer , FILE *pFileout){
    
    for (int i=0; i< (strlen(filename)-3); i++){
    stfile[i]= filename[i];}

    int storevalue;
    char *local = strstr(buffer , "local");
    char *argument = strstr( buffer, "argument");
    char *this = strstr( buffer, "this");
    char *that = strstr( buffer, "that");
    char *temp = strstr(buffer ,"temp" );
    char *pointer = strstr(buffer , "pointer");
    char *stat = strstr(buffer,"static");
    
    if(local){
        storevalue= atoi(&local[6]);
        poplcl_arg_this_that(storevalue,"LCL",pFileout);
    }
        if(argument){
        storevalue= atoi(&argument[9]);
        poplcl_arg_this_that(storevalue,"ARG",pFileout);
    }
        if(this){
        storevalue= atoi(&this[5]);
        poplcl_arg_this_that(storevalue,"THIS",pFileout);
    }
        if(that){
        storevalue= atoi(&that[5]);
        poplcl_arg_this_that(storevalue,"THAT",pFileout);
    }

    if(temp){
        storevalue= atoi(&temp[5]);
        poptemp_pointer(pFileout);
       fprintf(pFileout, "@%d\n", storevalue +5);
       fprintf(pFileout, "M=D\n");

    }
    if(pointer){
        if(atoi(&pointer[8])==0){
            poptemp_pointer(pFileout);
            fprintf(pFileout, "@THIS\n"); 
            fprintf(pFileout, "M=D\n");  }

        else if(atoi(&pointer[8])==1){
           poptemp_pointer(pFileout);
            fprintf(pFileout, "@THAT\n"); 
            fprintf(pFileout, "M=D\n");  }
    }
    if (stat){
        storevalue= atoi(&stat[7]);
        poptemp_pointer(pFileout);
        fprintf(pFileout, "@%s.%d\n",stfile,storevalue);
        fprintf(pFileout, "M=D\n");
    }

}
void pushsegment(char *buffer, FILE *pFileout){
    // printf("%s" , buffer);
    for (int i=0; i< (strlen(filename)-3); i++){
    stfile[i]= filename[i];}

    int storevalue;
    char *constant = strstr( buffer, "constant");
    char *local = strstr(buffer , "local");
    char *argument = strstr( buffer, "argument");
    char *this = strstr( buffer, "this");
    char *that = strstr( buffer, "that");
    char *temp = strstr(buffer ,"temp" );
    char *pointer = strstr(buffer , "pointer");
    char *stat = strstr(buffer, "static");

    if(constant){
      storevalue = atoi(&constant[9]);
      fprintf(pFileout, "@%d\n" , storevalue);
      fprintf(pFileout, "D=A\n");
      fprintf(pFileout, "@SP\n");
      fprintf(pFileout, "A=M\n");
      fprintf(pFileout, "M=D\n");
      fprintf(pFileout, "@SP\n");
      fprintf(pFileout, "M=M+1\n");    
    }

    if(local){
        storevalue= atoi(&local[6]);
        pushlcl_arg_this_that(storevalue,"LCL",pFileout);}
    if(argument){
        storevalue= atoi(&argument[9]);
        pushlcl_arg_this_that(storevalue,"ARG",pFileout);}
     if(this){
        storevalue= atoi(&this[5]);
        pushlcl_arg_this_that(storevalue,"THIS",pFileout);}
    if(that){
        storevalue= atoi(&that[5]);
        pushlcl_arg_this_that(storevalue,"THAT",pFileout);}
    if (temp){
        storevalue= atoi(&temp[5]);
        fprintf(pFileout, "@%d\n" , storevalue + 5);
        pushtemp_pointer( pFileout);
    }
    if(pointer){
        if (atoi(&pointer[8]) == 0){
            fprintf(pFileout, "@THIS\n");
            pushtemp_pointer( pFileout);
        }
        else if (atoi(&pointer[8]) ==1){
            fprintf(pFileout, "@THAT\n");
            pushtemp_pointer( pFileout);
        }
    
    }
    if(stat){
        storevalue= atoi(&stat[6]);
        fprintf(pFileout, "@%s.%d\n",stfile,storevalue);
        pushtemp_pointer(pFileout);
    }
 
}
void poplcl_arg_this_that(int storevalue,char *type, FILE *pFileout){
        fprintf(pFileout, "@%d\n", storevalue);
        fprintf(pFileout, "D=A\n");
        fprintf(pFileout, "@%s\n",type);
        fprintf(pFileout, "D=M+D\n");
        fprintf(pFileout, "@R13\n");
        fprintf(pFileout, "M=D\n");
        fprintf(pFileout, "@SP\n");
        fprintf(pFileout, "M=M-1\n");
        fprintf(pFileout, "A=M\n");
        fprintf(pFileout, "D=M\n");
        fprintf(pFileout, "@R13\n");
        fprintf(pFileout, "A=M\n");
        fprintf(pFileout, "M=D\n");

}
void pushlcl_arg_this_that(int storevalue,char *type, FILE *pFileout){
        fprintf(pFileout, "@%d\n" , storevalue);
        fprintf(pFileout, "D=A\n");
        fprintf(pFileout, "@%s\n",type);
        fprintf(pFileout, "A=M+D\n");
        fprintf(pFileout, "D=M\n");
        fprintf(pFileout, "@SP\n");
        fprintf(pFileout, "A=M\n");
        fprintf(pFileout, "M=D\n");
        fprintf(pFileout, "@SP\n");
        fprintf(pFileout, "M=M+1\n");

}
void pushtemp_pointer( FILE *pFileout){
            
            fprintf(pFileout, "D=M\n");
            fprintf(pFileout, "@SP\n");
            fprintf(pFileout, "A=M\n");
            fprintf(pFileout, "M=D\n");
            fprintf(pFileout, "@SP\n");
            fprintf(pFileout, "M=M+1\n");
    
}
void poptemp_pointer( FILE *pFileout){
        fprintf(pFileout, "@SP\n"); 
       fprintf(pFileout, "M=M-1\n");
       fprintf(pFileout, "A=M\n");
       fprintf(pFileout, "D=M\n");

}
void addsubandor(char type , FILE *pFileout){
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M-1\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "D=M\n");
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M-1\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "M=M%cD\n" ,type);
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M+1\n");

}
void eqltgt(char *type ,int count, FILE *pFileout){
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M-1\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "D=M\n");
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M-1\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "D=M-D\n");
            fprintf(pFileout , "@%s_TRUE_%d\n",type,count);
            fprintf(pFileout , "D;J%s\n",type);
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "M=0\n");
            fprintf(pFileout , "@%s_END_%d\n",type,count);
            fprintf(pFileout , "0;JMP\n");
            fprintf(pFileout , "(%s_TRUE_%d)\n",type,count);
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "M=-1\n");
            fprintf(pFileout , "(%s_END_%d)\n",type,count);
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M+1\n");
}
void negnot(char type , FILE *pFileout){
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M-1\n");
            fprintf(pFileout , "A=M\n");
            fprintf(pFileout , "M=%cM\n",type);
            fprintf(pFileout , "@SP\n");
            fprintf(pFileout , "M=M+1\n");

}