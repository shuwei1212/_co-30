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
// Fill.asm
// 按下任意鍵：整個螢幕變黑
// 沒有按鍵：整個螢幕變白

(LOOP)
    @KBD
    D=M
    @BLACK
    D;JNE

// 沒有按鍵 → 白色
(WHITE)
    @SCREEN
    D=A
    @addr
    M=D

(WHITE_LOOP)
    @addr
    A=M
    M=0

    @addr
    M=M+1

    D=M
    @SCREEN
    D=D-A
    @8192
    D=D-A
    @LOOP
    D;JGE

    @WHITE_LOOP
    0;JMP

// 有按鍵 → 黑色
(BLACK)
    @SCREEN
    D=A
    @addr
    M=D

(BLACK_LOOP)
    @addr
    A=M
    M=-1

    @addr
    M=M+1

    D=M
    @SCREEN
    D=D-A
    @8192
    D=D-A
    @LOOP
    D;JGE

    @BLACK_LOOP
    0;JMP