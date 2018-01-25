/******************************************************
This is the Initialization file to set memory location to zeros*
In this subroutine, it initializes memory locations to zeros.
The memory locations set to zero start at where the sum of the
two arrays should be stored.
Input parameters: Nothing
Output parameters: Nothing
******************************************************/
.text

.equ Opcode, 0x2300000

.global Set

Set:

lea      -40(%a7),%a7 
movem.l %d2-%d7/%a2-%a5,(%a7)

move.l #Opcode, %a2 
move.l #50, %d2 
move.l #0, %d6


loop:move.l #0,(%a2) 

add.l #4, %a2
add.l #1, %d6 
cmp.l %d6, %d2 
beq nextone 
bra loop

nextone:


movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 

rts

