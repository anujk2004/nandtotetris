#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//dest
char destM [3]={'0','0','1'};
char destD [3]={'0','1','0'};
char destMD [3]={'0','1','1'};
char destA [3]={'1','0','0'};
char destAM [3]={'1','0','1'};
char destAD [3]={'1','1','0'};
char destAMD [3]={'1','1','1'};
//comp          c1  c2  c3  c4  c5  c6     
char comp0[6] ={'1','0','1','0','1','0'};
char comp1[6] ={'1','1','1','1','1','1'};
char compmin1[6]={'1','1','1','0','1','0'};
char compD[6]={'0','0','1','1','0','0'};
char compA[6]={'1','1','0','0','0','0'};
char compnotD[6]={'0','0','1','1','0','1'};
char compnotA[6]={'1','1','0','0','0','1'};
char compminD[6]={'0','0','1','1','1','1'};
char compminA[6]={'1','1','0','0','1','1'};
char compmDpls1[6]={'0','1','1','1','1','1'};
char compApls1[6]={'1','1','0','1','1','1'};
char compDmin1[6]={'0','0','1','1','1','0'};
char compAmin1[6]={'1','1','0','0','1','0'};
char compDplsA[6]={'0','0','0','0','1','0'};
char compDminA[6]={'0','1','0','0','1','1'};
char compAminD[6]={'0','0','0','1','1','1'};
char compDandA[6]={'0','0','0','0','0','0'};
char compDorA[6]={'0','1','0','1','0','1'};
//jump
char jgt[3]={'0','0','1'};
char jeq[3]={'0','1','0'};
char jge[3]={'0','1','1'};
char jlt[3]={'1','0','0'};
char jne[3]={'1','0','1'};
char jle[3]={'1','1','0'};
char jmp[3]={'1','1','1'};

void bininstruct(char *buffer , int size ,FILE *pFile, FILE *pFileout);
void remove_spaces(char *str );
void atvalue(int count);
int main(){
    //printf("start\n");

    FILE *pFile = fopen("check1.asm", "r");
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


    bininstruct(buffer , sizeof(buffer) ,pFile , pFileout);
    
      fclose(pFileout);
      fclose(pFile);
return 0;
}

void bininstruct(char *buffer , int size , FILE *pFile, FILE *pFileout){

     int count=0;
    while (fgets(buffer, size, pFile)){

        remove_spaces(buffer );
         char *newline= strstr(buffer,"//");
         if (newline){
            *newline='\0';
         }
         if (buffer[0] == '\0') {
        continue;
         }
           
        
     
        //printf("here");
        char binary[17] = {0}; 
        char *comp =strstr(buffer, "=");
        char *notD = strstr(buffer , "!D");
        char *notA = strstr(buffer , "!A");
        char *notM = strstr(buffer , "!M");
        char *min1 = strstr(buffer,"-1");
        char *minD = strstr(buffer,"-D");
        char *minA = strstr(buffer,"-A");
        char *minM = strstr(buffer,"-M");
        char *Dpls1 = strstr(buffer,"D+1");
        char *Apls1 = strstr(buffer,"A+1");
        char *Mpls1 = strstr(buffer,"M+1");
        char *DplsA = strstr(buffer,"D+A");
        char *DplsM = strstr(buffer,"D+M");
        char *Dmin1 = strstr(buffer,"D-1");
        char *DminA = strstr(buffer,"D-A");
        char *DminM = strstr(buffer,"D-M");
        char *Amin1 = strstr(buffer,"A-1");
        char *AminD = strstr(buffer,"A-D");
        char *Mmin1 = strstr(buffer,"M-1");
        char *MminD = strstr(buffer,"M-D");
        char *DandM = strstr(buffer,"D&M");
        char *DandA = strstr(buffer,"D&A");
        char *DorA= strstr(buffer,"D|A");
        char *DorM = strstr(buffer,"D|M");
        char *semicol = strstr(buffer,";");
       
        char *at = strstr(buffer,"@");
        char *labels = strstr(buffer,"(");
        int value  ; 
        
        
    
          atvalue(count);
         count ++;
            
        
   
    
           if (at) {

            //existing symbol table
            char *Rreg =strstr(at,"R"); //reg R0..R15
            char *screen = strstr(at,"SCREEN");
            char *kbd = strstr(at , "KBD");
            char *sp = strstr(at , "SP");
            char *lcl = strstr(at , "LCL");
            char *arg = strstr(at , "ARG");
            char *this = strstr(at , "THIS");
            char *that = strstr(at , "THAT");
            if(at[1] =='0'|| at[1] =='1'|| at[1] =='2'|| at[1] =='3'|| at[1] =='4'|| at[1] =='5'|| at[1] =='6'|| at[1] =='7'|| at[1] =='8'|| at[1] =='9')
             {value = atoi(&at[1]);}
            if(Rreg){
                value=atoi(&Rreg[1]);
                if(value >15){
                    printf(" no reg exist");
                    value = -1;
                }
            }
            if (screen){value = 16384;}
            else if(kbd){value = 24576;}
             else if (sp){value = 0;}
             else if (lcl){value = 1;}
             else if (arg){value = 2;}
             else if (this){value = 3;}
            else if (that){value = 4;}
 
    
        }

            for (int i = 15; i >=0; i--) {
               binary[15- i] = ((value >> i) & 1) ? '1' : '0';}
          // snprintf(buffer, size, "%s\n", binary);
         
         
        
        if(buffer[0]== 'M'|| buffer[0]=='A'||buffer[0]=='D' || buffer[0]=='0'){
            for (int i=0; i<3; i++){
                binary[i]='1';}
               if(buffer[0]=='M'){
                    if(buffer[1]=='D'){
                        for(int i =0; i<sizeof(destM); i++){
                         binary[10+i]= destMD[i];}}
                    else{
                        for(int i =0; i<sizeof(destM); i++){
                         binary[10+i]= destM[i];} }
               } 
               if(buffer[0]=='D'){
                    for(int i=0; i<sizeof(destD);i++){
                        binary[10+i]=destD[i];}
               }
               if(buffer[0]=='A'){
                        for(int i=0; i<sizeof(destD);i++){
                            binary[10+i]=destA[i];}

                        if(buffer[1]=='M'){
                           for(int i=0; i<sizeof(destD);i++){
                            binary[10+i]=destAM[i];}

                                 if(buffer[2]=='D'){
                                    for(int i=0; i<sizeof(destD);i++){
                                     binary[10+i]=destAMD[i];}
                                    }}
                        if(buffer[1]=='D'){
                             for(int i=0; i<sizeof(destD);i++){
                            binary[10+i]=destAD[i];}}           }     }

 
        //comp   
if (comp ){

       char *M1 = strstr(comp , "M");
       if(M1){
            binary[3]='1';}
       else{
        binary[3] ='0';}
       
    for(int i=0; i< sizeof(jgt);i++ ){
    binary[13+i] = '0';}

    
       switch (comp[1])
       {case '0':
           for (int i =0 ; i<sizeof(comp0); i++){
                binary[i+4]=comp0[i];
            }
        break;
        case '1':
            for (int i =0 ; i<sizeof(comp1); i++){
                binary[i+4]=comp1[i];
            }
        break;
        case 'D':
          for (int i =0 ; i<sizeof(compD); i++){
                binary[i+4]=compD[i];
            }
        break;
        case 'M':
        binary[3]='1';
        case 'A':
              for (int i =0 ; i<sizeof(compA); i++){
                binary[i+4]=compA[i];
            }     
        break;     
       default:  NULL;
        break;
       }

    if(notD){ 
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compnotD[i];}}
    if(notA||notM){
            for(int i=0; i< sizeof(compnotA);i++ ){
                binary[4+i] = compnotA[i];} }
    if(Dmin1){ 
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compDmin1[i];} }
    else if(Amin1 || Mmin1){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compAmin1[i];}}
    else if(AminD||MminD){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compAminD[i];}}
    else if(DminA||DminM){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compDminA[i];}}
    else if(minD){
            for(int i=0; i< sizeof(compminD);i++ ){
                binary[4+i] = compminD[i]; }}
    else if(minA || minM){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compminA[i];}}
    else if(min1){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compmin1[i];}}
    if(Dpls1){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compmDpls1[i];}}
    if(Apls1 || Mpls1){ 
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compApls1[i];}}
    if(DplsA || DplsM ){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compDplsA[i];}}
    if(DandA || DandM ){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compDandA[i];}}
    if(DorA || DorM ){
            for(int i=0; i< sizeof(compnotD);i++ ){
                binary[4+i] = compDorA[i];}}
            }

    // //for D,0;jump case
    if(buffer[0] == 'M'|| buffer[0] =='A'|| buffer[0]=='D'|| buffer[0]=='0'){
        if ((comp == NULL) && (semicol)){
                if(buffer[0]=='0'){
                    binary[3]='0';
                      for(int i=0; i<sizeof(destD);i++){
                        binary[10+i]='0';}
                        for(int i =0; i<sizeof(comp0); i++){
                            binary[i+4]=comp0[i];
                        }
                }

            
                 if(buffer[0]=='D'){
                    binary[3]='0';
                      for(int i=0; i<sizeof(destD);i++){
                        binary[10+i]='0';}
                        for(int i =0; i<sizeof(compD); i++){
                            binary[i+4]=compD[i];
                        }
                }
                
            
        }
    }

if(semicol){
    char *JGT= strstr(semicol,"JGT");
    char *JEQ= strstr(semicol,"JEQ");
    char *JGE= strstr(semicol,"JGE");
    char *JLT= strstr(semicol,"JLT");
    char *JNE= strstr(semicol,"JNE");
    char *JLE= strstr(semicol,"JLE");
    char *JMP= strstr(semicol,"JMP");

    if(JGT){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jgt[i];}}
    if(JEQ){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jeq[i];}}
    if(JGE){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jge[i];}}
    if(JLT){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jlt[i];}}
    if(JNE){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jne[i];}}
    if(JLE){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jle[i];}}
    if(JMP){
        for(int i=0; i<sizeof(jgt);i++){
            binary[13+i]=jmp[i];}}
    }
       
       snprintf(buffer, size, "%s\n", binary);
        printf("  %s",buffer); 
        fprintf(pFileout, "%s", buffer);
      
    }   
   
    fclose(pFileout);
    fclose(pFile);
}

void remove_spaces(char *str ) {
    
    char *i = str;
    char *j = str;
    while (*j != 0) {
        if (*j != ' ' && *j != '\t' && *j != '\n' && *j != '\r') {
            *i = *j;
            i++;
        }
           j++;
    }  
    *i = 0;         
}

void atvalue(int count){
    printf("%d",count);
}