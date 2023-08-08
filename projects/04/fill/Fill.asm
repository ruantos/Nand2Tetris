// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(CONDICIONAL)
    @KBD
    D=M

    @PRETO
    D;JGT

    @BRANCO
    0;JMP

(BRANCO)
    @i
    M=0
    (LACOA)
        @8192
        D=A
        @limite
        M=D
        @i
        D=D-M
        @CONDICIONAL
        D;JEQ

        @i
        D=M
        @SCREEN
        A=A+D
        M=0

        @i
        M=M+1
        @LACOA
        0;JMP        

(PRETO)
    @i
    M=0
    (LACOB)
        @8192
        D=A
        @limite
        M=D
        @i
        D=D-M
        @CONDICIONAL
        D;JEQ

        @i
        D=M
        @SCREEN
        A=A+D
        M=-1

        @i
        M=M+1
        @LACOB
        0;JMP        


