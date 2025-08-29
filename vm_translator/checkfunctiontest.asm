
// function SimpleFunction.test 2

(SIMPLEFUNCTION.TEST)
@2
D=A
(LOOP_SIMPLEFUNCTION.TEST)
@END_LOOP_SIMPLEFUNCTION.TEST
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_SIMPLEFUNCTION.TEST
0;JMP
(END_LOOP_SIMPLEFUNCTION.TEST)

// 	push local 0

@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push local 1

@1
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

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

// 	not

@SP
M=M-1
A=M
M=!M
@SP
M=M+1

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

// 	push argument 1

@1
D=A
@ARG
A=M+D
D=M
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
