// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//pseudocode:
//  n=R0;
//  sum=0;
//
//  LOOP:
//  if (n == 0) {
//    goto RETURN;
//  } else {
//    sum = sum + R1;
//    n = n-1;
//    goto LOOP;
//  }
//
//  RETURN:
//  R2 = sum;

 
    @R0     // initialise n to the value of R0
    D=M
    @n
    M=D

    @sum    // initialise sum to 0
    M=0

    (LOOP)
    @n
    D=M
    @RETURN
    D;JEQ   // if n is zero, goto END

    @R1
    D=M
    @sum
    M=M+D   // add the value of R1 to sum

    @n
    M=M-1   // deduct 1 from the value of n

    @LOOP
    0;JMP   // goto LOOP

    (RETURN)
    @sum
    D=M
    @R2
    M=D     // store the value of sum in R2

    (END)
    @END
    0;JMP