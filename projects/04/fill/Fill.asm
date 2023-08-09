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

(CHECAGEM)
    @KBD
    D=M             //Vê o valor do teclado e armazena em D

    @ATIVADO
    D;JGT           //Se D maior que 0, ative a função que pinta a tela de preto

    @DESATIVADO
    0;JMP           //Senão, pinte de branco.

(ATIVADO)
    @iteracao
    M=0             //Seta a variável 'iteração' para 0
    (LACOA)
        @8192
        D=A             //Seta o limite em 8192
        @iteracao
        D=D-M           //Tira a diferença entre o limite e o número de iterações realizadas
        @CHECAGEM
        D;JEQ           //Se a diferença for menor ou igual a 0, volta para a checagem. Caso não, segue com o processo·


        @iteracao
        D=M
        @SCREEN
        A=A+D                   //Aponta para o endereço da tela a ser pintado.
        M=-1            //Pinta o endereço selecionado para ser pintado

        @iteracao       
        M=M+1           //contabiliza a iteração
        @LACOA
        0;JMP           //Recomeça o processo
    

(DESATIVADO)
    @iteracao
    M=0             //Seta a variável 'iteração' para 0
    (LACOB)
        @8192
        D=A             //Seta o limite em 8192
        @iteracao
        D=D-M           //Tira a diferença entre o limite e o número de iterações realizadas
        @CHECAGEM
        D;JEQ           //Se a diferença for menor ou igual a 0, volta para a checagem. Caso não, segue com o processo·


        @iteracao
        D=M
        @SCREEN
        A=D+A                   //Aponta para o endereço da tela a ser pintado.
        M=0            //Pinta o endereço selecionado para ser pintado

        @iteracao       
        M=M+1           //Começa o processo contabilizando a iteração
        @LACOB
        0;JMP           //Recomeça o processo


