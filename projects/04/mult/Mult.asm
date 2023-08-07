// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

@soma  //Cria variável soma e inicia ela em 0 
M=0

@R1             
D=M             //Guarda o valor de R1 em um endereço temporário
@controle        //Cria uma variável 'controle' que receberá o valor de R1.
M=D             // Será responsável pela quantidade de vezes que somaremos a variável soma com o valor de R0
                
(CALCULO)
@controle       //Checa se a variável de controle é maior que zero, caso não seja, vai para o fim do programa.
D=M
@FIM
D;JLE

@R0             // A variável soma recebe o valor do registrador R0, mas o valor que já possuia. 
D=M
@soma
M=M+D

@controle           // Após fazer uma soma, decresce a variável controle
M=M-1

@CALCULO            //Volta para o começo da função
0;JMP


(FIM)           //Coloca o valor de soma no registrador 2 
@soma
D=M
@R2
M=D
@LOOP
0;JMP

(LOOP)          //LOOP infinito 
@LOOP
0;JMP