// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Start with R2 at 0

@R2
M=0

// Jump to the first step in LOOP if R0>0

@R0
D=M
@LOOP
D;JGT

// If R0=0 then:

@END
0;JMP

//Adds R1 to R2 then removes 1 from R0.
//If R0>0 loop  again.

(LOOP)
@R2           // Get R2
D=M

@R1           // Add R1 to R2
D=D+M

@R2           // Write results back in R2
M=D

@R0           // Reduce R0 by 1
D=M-1
M=D

@LOOP         // If R0>0 then loop
D;JGT   

(END)     
@END
0;JMP

