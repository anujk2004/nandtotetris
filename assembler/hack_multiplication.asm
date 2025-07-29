
@2
D=A
@R0
M=D


@5
D=A
@R1
M=D


@R3
M=0


@0
D=A
@i
M=D

(LOOP)
@i
D=M       // D = i
@R1
D=D-M   
@FINALRESULT
D;JEQ   

// R3 += R0
@R0
D=M
@R3
M=D+M

// i++
@i
M=M+1

@LOOP
0;JMP

(FINALRESULT)
@R3
D=M

@R2
M=D

@0
D=A
@a
M=D

@0
D=A
@R5
M=D

(LOOPT)
@a
D=M
@R1
D=D-M
@FINALRESULTT
D;JEQ

@R2
D=M
@R5
M=D+M

@a
M=M+1

@LOOPT
0;JMP



(FINALRESULTT)
@R5
D=M
@R4
M=D


@END

(END)
@END
0;JMP     // infinite loop
