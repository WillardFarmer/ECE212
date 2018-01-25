/******************************************************
This is the Initialization file to load contents to memory.
In this subroutine, it initializes memory locations assigned values for
manipulation.
Because the contents in the .data section get placed at an arbitary memory
location, we want to force the data to be stored at a specific location.
In a nutshell, we are basically swapping memory contents.
The memory locations set are at 
0x2300004 - Contains address of first array
0x2300008 - Contains address of second array
Input parameters: Nothing
Output parameters: Nothing
******************************************************/
 
 
.text

.equ Opcode, 0x2300000

.global Intialization

Intialization:

lea      -40(%a7),%a7 
movem.l %d2-%d7/%a2-%a5,(%a7)

move.l #Opcode, %a3 
lea Instruction, %a2
move.l (%a2), %d2 
again: 
cmpi.l #0, %d2
beq next
add.l #4, %a2
move.l (%a2), (%a3)
add.l #4, %a3
 
sub.l #1, %d2
bra again 





next:


movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 

rts

.data

Instruction:
.long 0xC
.long 0x1 
.long 0x2
.long 0x3
.long 0x4
.long 0x5
.long 0x6
.long 0x7
.long 0x8
.long 0x9
.long 0x11111111
.long 0x48454C4C
.long 0x4F000000






