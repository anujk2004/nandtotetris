#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include<ctype.h>
#include<windows.h>

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
void removespace(char *str);
void uppercase(char *str);
void pushtypecall(char *type , char reg,FILE *pFileout);
void pushcallcommon(char reg, FILE *pFileout);
void restore_this_that_arg(char *type , FILE *fileout);
void callfunction(char *callfn , int nvars , FILE *pFileout);

char filename[MAX_PATH] ;
char stfile[sizeof(filename)];
int calli =0;
int main(){ 

    // open output file ONCE
    FILE *pFileout = fopen("main.asm", "w");
    if (!pFileout) {
        perror("fopen output");
        return 1;
    }
            char sys[] = "Sys.init";
            fprintf(pFileout,"@256\n");
            fprintf(pFileout,"D=A\n");  
            fprintf(pFileout,"@SP\n");
            fprintf(pFileout,"M=D\n"); 
           
            callfunction(sys ,0 ,pFileout);
        WIN32_FIND_DATA findData;
    HANDLE hFind = FindFirstFile("*.vm", &findData);

    if (hFind == INVALID_HANDLE_VALUE) {
        printf("No VM files found.\n");
        return 0;
    }   

    do {
        strcpy(filename, findData.cFileName);

        strcpy(stfile, filename);
        stfile[strlen(stfile) - 3] = '\0'; // remove ".vm"

        printf("Translating %s\n", filename);

        FILE *pFile = fopen(filename, "r");
        if (!pFile) {
            perror("fopen input");
            continue;
        }

        char buffer[1024];
        check(buffer, sizeof(buffer), pFile, pFileout);

        fclose(pFile);

    } while (FindNextFile(hFind, &findData));

    fclose(pFileout);  // close only ONCE at the end
    FindClose(hFind);
    return 0;
}




void check(char *buffer ,int size , FILE *pFile , FILE *pFileout){
        int i=0;
        int j=0;
        int k=0;
      
    while (fgets(buffer, size, pFile)){
 
        char *comment= strstr( buffer, "//");

        if (comment){ 
            *comment = '\0'; 
           
        }
        // removespace(buffer);
        if(buffer[0] == '\0'){ 
          continue;
        }

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
        // labels and branching
        char *label = strstr(buffer,"label");
        char *go_to = strstr(buffer,"goto");
        char *ifgoto = strstr(buffer,"if-goto");
        char *function = strstr(buffer, "function");
        char *call = strstr(buffer,"call");
        char *retn= strstr(buffer,"return");
        
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
            negnot('!',pFileout);}



        char actualfun[128];
        if (function){
            char *temp = &function[9];
            int nvar  ;
            int pos =0;
            for(int i=0; i<strlen(temp); i++){
                
                if(isdigit(temp[i])){
                    break;}
                else{
                    actualfun[pos++]= temp[i];
                }}
                actualfun[pos]='\0';
               removespace(actualfun); 
            nvar = atoi(&temp[strlen(actualfun)+1]);
            
            uppercase(actualfun);
            fprintf(pFileout, "(%s)\n",actualfun) ;
            fprintf(pFileout,"@%d\n",nvar);
            fprintf(pFileout,"D=A\n");
            fprintf(pFileout,"(LOOP_%s)\n",actualfun);
            fprintf(pFileout,"@END_LOOP_%s\n",actualfun);
            fprintf(pFileout,"D;JEQ\n");
            fprintf(pFileout,"@SP\n");
            fprintf(pFileout,"A=M\n");
            fprintf(pFileout,"M=0\n");
            fprintf(pFileout,"@SP\n");
            fprintf(pFileout,"M=M+1\n");
            fprintf(pFileout,"D=D-1\n");
            fprintf(pFileout,"@LOOP_%s\n",actualfun);
            fprintf(pFileout,"0;JMP\n");
            fprintf(pFileout,"(END_LOOP_%s)\n",actualfun);
            }
            if(label){
            char* actlabel = &label[6];
            removespace(actlabel);
            uppercase(actualfun);
            uppercase(actlabel);
            fprintf(pFileout,"(%s$%s)\n",actualfun,actlabel) ;}

             if(ifgoto){
                removespace(&ifgoto[7]);
                fprintf(pFileout,"@SP\n");
                fprintf(pFileout,"AM=M-1\n");
                fprintf(pFileout,"D=M\n");
                uppercase(&ifgoto[7]);
                uppercase(actualfun);
                fprintf(pFileout,"@%s$%s\n",actualfun,&ifgoto[7]);
                fprintf(pFileout,"D;JNE\n"); }

            else if(go_to){
                removespace(&go_to[5]);
                uppercase(&go_to[5]);
                uppercase(actualfun);
                fprintf(pFileout, "@%s$%s\n",actualfun, &go_to[5]);
                fprintf(pFileout,"0;JMP\n");}
                

            if(call){

                char *temp = &call[4];
                char callfn [128];
                int pos =0;
                int nvar;
                for (int i = 0; i< strlen(temp);i++){
                    if(isdigit(temp[i])){
                        break;}
                    else{
                        callfn[pos++]=temp[i];
                    }}
                    callfn[pos]='\0';
                    removespace(callfn);
                    nvar = atoi(&temp[strlen(callfn)+1]);
                    callfunction(callfn ,nvar ,pFileout);
                    }
                    if (retn){
                        fprintf(pFileout,"@LCL\n");
                        fprintf(pFileout,"D=M\n");
                        fprintf(pFileout,"@R13\n");
                        fprintf(pFileout,"M=D\n");

                        fprintf(pFileout,"@5\n");
                        fprintf(pFileout,"A=D-A\n");
                        fprintf(pFileout,"D=M\n");
                        fprintf(pFileout,"@R14\n");
                        fprintf(pFileout,"M=D\n");

                        fprintf(pFileout,"@ARG\n");
                        fprintf(pFileout,"D=M+1\n");
                        fprintf(pFileout,"@SP\n");
                        fprintf(pFileout,"M=D\n");

                        restore_this_that_arg("THAT",pFileout);
                        restore_this_that_arg("THIS",pFileout);
                        restore_this_that_arg("ARG",pFileout);
                        restore_this_that_arg("LCL",pFileout);

                        fprintf(pFileout,"@R14\n");
                        fprintf(pFileout,"A=M\n");
                        fprintf(pFileout,"0;JMP\n");
                        
                    }

        }

}
void callfunction(char *callfn , int nvars , FILE *pFileout){
    fprintf(pFileout,"@RET_ADDRESS_%d\n",calli);
                    pushcallcommon('A',pFileout);
                    pushtypecall("LCL",'M',pFileout);
                    pushtypecall("ARG",'M',pFileout);
                    pushtypecall("THIS",'M',pFileout);
                    pushtypecall("THAT",'M',pFileout);

                     fprintf(pFileout,"@SP\n");
                     fprintf(pFileout,"D=M\n");
                     fprintf(pFileout,"@%d\n", nvars+5);
                     fprintf(pFileout,"D=D-A\n");
                     fprintf(pFileout,"@ARG\n");
                     fprintf(pFileout,"M=D\n");

                     fprintf(pFileout,"@SP\n");
                     fprintf(pFileout,"D=M\n");
                     fprintf(pFileout,"@LCL\n");
                     fprintf(pFileout,"M=D\n");

                     uppercase(callfn);
                     fprintf(pFileout,"@%s\n",callfn);
                     fprintf(pFileout,"0;JMP\n");
                     fprintf(pFileout,"(RET_ADDRESS_%d)\n", calli);

                     calli++;

}
void restore_this_that_arg(char *type , FILE *fileout){

    fprintf(fileout,"@R13\n");
    fprintf(fileout,"AM=M-1\n");
    fprintf(fileout,"D=M\n");
    fprintf(fileout,"@%s\n",type); 
    fprintf(fileout,"M=D\n");


}
void pushtypecall(char *type, char reg , FILE *pFileout){
                    fprintf(pFileout,"@%s\n",type);
                    pushcallcommon(reg , pFileout);}

void pushcallcommon(char reg, FILE *pFileout){
                    fprintf(pFileout,"D=%c\n",reg);
                    fprintf(pFileout,"@SP\n");
                    fprintf(pFileout,"A=M\n");
                    fprintf(pFileout,"M=D\n");
                    fprintf(pFileout,"@SP\n");
                    fprintf(pFileout,"M=M+1\n");

}
void uppercase( char *str){
    for (int i = 0 ; i< strlen(str);i++){
        str[i]= toupper(str[i]);
    }
}
void removespace(char *str){
    char *i = str;
    char *j = str;
    while (*j != 0) {
        if (*j != ' ' && *j != '\t' && *j != '\n' && *j != '\r') {
            *i = *j;
            i++;
        }  j++;
    }  
    *i = 0;         
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
    stfile[i]= filename[i];
    }
    

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