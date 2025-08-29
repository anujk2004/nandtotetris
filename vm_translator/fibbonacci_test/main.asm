@256
D=A
@SP
M=D
@RET_ADDRESS_0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@SYS.INIT
0;JMP
(RET_ADDRESS_0)

// 


// 


// function Main.fibonacci 0

(MAIN.FIBONACCI)
@0
D=A
(LOOP_MAIN.FIBONACCI)
@END_LOOP_MAIN.FIBONACCI
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_MAIN.FIBONACCI
0;JMP
(END_LOOP_MAIN.FIBONACCI)

// 	push argument 0

@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 2

@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	lt                     

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@LT_TRUE_0
D;JLT
@SP
A=M
M=0
@LT_END_0
0;JMP
(LT_TRUE_0)
@SP
A=M
M=-1
(LT_END_0)
@SP
M=M+1

// 	if-goto N_LT_2        

@SP
AM=M-1
D=M
@MAIN.FIBONACCI$N_LT_2
D;JNE

// 	goto N_GE_2

@MAIN.FIBONACCI$N_GE_2
0;JMP

// label N_LT_2               
(MAIN.FIBONACCI$N_LT_2)

// 	push argument 0        

@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	return

@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP

// label N_GE_2               
(MAIN.FIBONACCI$N_GE_2)

// 	push argument 0

@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 2

@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	sub

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

// 	call Main.fibonacci 1  
@RET_ADDRESS_1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@MAIN.FIBONACCI
0;JMP
(RET_ADDRESS_1)

// 	push argument 0

@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	sub

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

// 	call Main.fibonacci 1  
@RET_ADDRESS_2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@MAIN.FIBONACCI
0;JMP
(RET_ADDRESS_2)

// 	add                    
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1

// 	return

@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP

// 


// 


// function Sys.init 0

(SYS.INIT)
@0
D=A
(LOOP_SYS.INIT)
@END_LOOP_SYS.INIT
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_SYS.INIT
0;JMP
(END_LOOP_SYS.INIT)

//     

// 	push constant 4

@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	

// 	call Main.fibonacci 1

@RET_ADDRESS_3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@MAIN.FIBONACCI
0;JMP
(RET_ADDRESS_3)

// label END  

(SYS.INIT$END)

// 	goto END  
@SYS.INIT$END
0;JMP
