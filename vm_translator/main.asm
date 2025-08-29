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

// push constant 3030

@3030
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 0

@SP
M=M-1
A=M
D=M
@THIS
M=D

// push constant 3040

@3040
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 1

@SP
M=M-1
A=M
D=M
@THAT
M=D

// push constant 32

@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop this 2

@2
D=A
@THIS
D=M+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

// push constant 46

@46
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop that 6

@6
D=A
@THAT
D=M+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

// push pointer 0

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push pointer 1

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// add

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

// push this 2

@2
D=A
@THIS
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub

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

// push that 6

@6
D=A
@THAT
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1

// add

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

// push constant 17

@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17

@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@EQ_TRUE_0
D;JEQ
@SP
A=M
M=0
@EQ_END_0
0;JMP
(EQ_TRUE_0)
@SP
A=M
M=-1
(EQ_END_0)
@SP
M=M+1

// push constant 17

@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 16

@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@EQ_TRUE_1
D;JEQ
@SP
A=M
M=0
@EQ_END_1
0;JMP
(EQ_TRUE_1)
@SP
A=M
M=-1
(EQ_END_1)
@SP
M=M+1

// push constant 16

@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17

@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@EQ_TRUE_2
D;JEQ
@SP
A=M
M=0
@EQ_END_2
0;JMP
(EQ_TRUE_2)
@SP
A=M
M=-1
(EQ_END_2)
@SP
M=M+1

// push constant 892

@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891

@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt

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

// push constant 891

@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 892

@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@LT_TRUE_1
D;JLT
@SP
A=M
M=0
@LT_END_1
0;JMP
(LT_TRUE_1)
@SP
A=M
M=-1
(LT_END_1)
@SP
M=M+1

// push constant 891

@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891

@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@LT_TRUE_2
D;JLT
@SP
A=M
M=0
@LT_END_2
0;JMP
(LT_TRUE_2)
@SP
A=M
M=-1
(LT_END_2)
@SP
M=M+1

// push constant 32767

@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766

@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@GT_TRUE_0
D;JGT
@SP
A=M
M=0
@GT_END_0
0;JMP
(GT_TRUE_0)
@SP
A=M
M=-1
(GT_END_0)
@SP
M=M+1

// push constant 32766

@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767

@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@GT_TRUE_1
D;JGT
@SP
A=M
M=0
@GT_END_1
0;JMP
(GT_TRUE_1)
@SP
A=M
M=-1
(GT_END_1)
@SP
M=M+1

// push constant 32766

@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766

@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@GT_TRUE_2
D;JGT
@SP
A=M
M=0
@GT_END_2
0;JMP
(GT_TRUE_2)
@SP
A=M
M=-1
(GT_END_2)
@SP
M=M+1

// push constant 57

@57
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 31

@31
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 53

@53
D=A
@SP
A=M
M=D
@SP
M=M+1

// add

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

// push constant 112

@112
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub

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

// neg

@SP
M=M-1
A=M
M=-M
@SP
M=M+1

// and

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M&D
@SP
M=M+1

// push constant 82

@82
D=A
@SP
A=M
M=D
@SP
M=M+1

// or

@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// not

@SP
M=M-1
A=M
M=!M
@SP
M=M+1

// push constant 111

@111
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 333

@333
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 888

@888
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop static 8

@SP
M=M-1
A=M
D=M
@checkstatictest.8
M=D

// pop static 3

@SP
M=M-1
A=M
D=M
@checkstatictest.3
M=D

// pop static 1

@SP
M=M-1
A=M
D=M
@checkstatictest.1
M=D

// push static 3

@checkstatictest.3
D=M
@SP
A=M
M=D
@SP
M=M+1

// push static 1

@checkstatictest.1
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub

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

// push static 8

@checkstatictest.8
D=M
@SP
A=M
M=D
@SP
M=M+1

// add

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
