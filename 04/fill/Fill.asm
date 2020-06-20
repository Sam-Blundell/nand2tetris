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

// pseudocode
// LOOP:
// n = @kbd;
// if (@KBD != 0) {
//        BLACK:
//        if (n == 24576) {
//            goto LOOP;
//        } else {
//            RAM[n] = -1;
//            n = n + 1;
//            goto BLACK;
//        }
//    } else {
//        WHITE:
//        if (n == 24576) {
//            goto LOOP;
//        } else {
//            RAM[n] = 0;
//            n = n + 1;
//            goto WHITE;
//        }
//    }

    @SCREEN    // set start of Array at first screen register
    D=A
    @arr
    M=D

    @8192   // set last register offset for screen loop
    D=A
    @n
    M=D
    
    (MAIN)
    @i      // set iterator
    M=0;

    @KBD    // check keyboard and go to either subroutine
    D=M
    @BLACK
    D;JNE

    (WHITE)
    @i
    D=M
    @n
    D=D-M
    @MAIN
    D;JEQ

    @SCREEN
    D=A
    @i
    D=D+M
    A=D
    M=0

    @i
    M=M+1
    @WHITE
    0;JMP

    (BLACK)
    @i
    D=M
    @n
    D=D-M
    @MAIN
    D;JEQ

    @SCREEN
    D=A
    @i
    D=D+M
    A=D
    M=-1

    @i
    M=M+1
    @BLACK
    0;JMP