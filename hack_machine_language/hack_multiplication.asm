// R0 = multiplicand (e.g., 2)
@2
D=A
@R0
M=D

// R1 = multiplier (e.g., 5)
@5
D=A
@R1
M=D

// R3 = result (initialize to 0)
@R3
M=0

// i = 0
@0
D=A
@i
M=D

(LOOP)
@i
D=M       // D = i
@R1
D=D-M     // D = i - R1
@FINALRESULT1
D;JEQ     // if i == R1, end loop

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

(FINALRESULT1)
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

(LOOP2)
@a
D=M
@R1
D=D-M
@FINALRESULT2
D;JEQ

@R2
D=M
@R5
M=D+M

@a
M=M+1

@LOOP2
0;JMP



(FINALRESULT2)
@R5
D=M
@R4
M=D


@END

(END)
@END
0;JMP     // infinite loop
