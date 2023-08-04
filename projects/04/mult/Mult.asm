// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


@soma
M=0
@R1
D=M
@i
M=D

(LOOP)
@i
MD=M-1
@FINALIZACAO
D;JLT
@R0
D=M
@soma
M=D+M
@LOOP
0;JMP



(FINALIZACAO)
@soma
D=M
@R2
M=D

(FIM)
@FIM
0;JMP
