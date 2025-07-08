
(LOOP)
@KBD
D=M       
@LOOP
D;JEQ      

@SCREEN
D=A
@addr
M=D        

@8192      
D=A
@count
M=D       


	
(FILL)

@count
D=M
@END
D;JEQ
	
	
@addr
A=M
M=-1 

@addr
M=M+1 
M=M+1 
M=M+1
M=M+1	
M=M+1		
@count
M=M-1 

@FILL
0;JMP     


(END)
@END
0;JMP
