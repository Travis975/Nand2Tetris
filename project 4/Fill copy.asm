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

// Set the value of i
(SET)
@8192  // The amount of 16 bit pixel lines to cover
D=A
@i     // Sets i to 8192
M=D

(KBDLISTEN)
@i       // i is also the number of iterations
M=M-1
D=M      // Decrement i by 1 till 0
@SET
D;JLT    // Reset i if i<0 

@KBD
D=M
@BLACK
D;JNE     //If a key is pressed jump to black
@WHITE
D;JEQ    //If no key is pressed jump to white

// Fill in the screen with black
(BLACK)
@SCREEN
D=A
@i
A=D+M
M=-1
@KBDLISTEN
0;JMP

//Clear the screen
(WHITE)
@SCREEN
D=A
@i
A=D+M
M=0
@KBDLISTEN
0;JMP

(END)
@END
0;JMP