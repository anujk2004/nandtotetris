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


// function Classone.set 0

(CLASSONE.SET)
@0
D=A
(LOOP_CLASSONE.SET)
@END_LOOP_CLASSONE.SET
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_CLASSONE.SET
0;JMP
(END_LOOP_CLASSONE.SET)

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

// 	pop static 0

@SP
M=M-1
A=M
D=M
@class1.0
M=D

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

// 	pop static 1

@SP
M=M-1
A=M
D=M
@class1.1
M=D

// 	push constant 0

@0
D=A
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

// 


// function Classone.get 0

(CLASSONE.GET)
@0
D=A
(LOOP_CLASSONE.GET)
@END_LOOP_CLASSONE.GET
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_CLASSONE.GET
0;JMP
(END_LOOP_CLASSONE.GET)

// 	push static 0

@class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push static 1

@class1.1
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

// 


// function Classtwo.set 0

(CLASSTWO.SET)
@0
D=A
(LOOP_CLASSTWO.SET)
@END_LOOP_CLASSTWO.SET
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_CLASSTWO.SET
0;JMP
(END_LOOP_CLASSTWO.SET)

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

// 	pop static 0

@SP
M=M-1
A=M
D=M
@class2.0
M=D

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

// 	pop static 1

@SP
M=M-1
A=M
D=M
@class2.1
M=D

// 	push constant 0

@0
D=A
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

// 


// function Classtwo.get 0

(CLASSTWO.GET)
@0
D=A
(LOOP_CLASSTWO.GET)
@END_LOOP_CLASSTWO.GET
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP_CLASSTWO.GET
0;JMP
(END_LOOP_CLASSTWO.GET)

// 	push static 0

@class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push static 1

@class2.1
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

// 	push constant 6

@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 8

@8
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	call Class1.set 2

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
@CLASS
0;JMP
(RET_ADDRESS_1)

// 	pop temp 0 
@SP
M=M-1
A=M
D=M
@5
M=D

// 	push constant 23

@23
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 15

@15
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	call Class2.set 2

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
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@CLASS
0;JMP
(RET_ADDRESS_2)

// 	pop temp 0 
@SP
M=M-1
A=M
D=M
@5
M=D

// 	call Class1.get 0

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
@CLASS
0;JMP
(RET_ADDRESS_3)

// 	call Class2.get 0

@RET_ADDRESS_4
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
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@CLASS
0;JMP
(RET_ADDRESS_4)

// label END

(SYS.INIT$END)

// 	goto END
@SYS.INIT$END
0;JMP
