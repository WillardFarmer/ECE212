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
move.l (%a2), (%a3)
add.l #4, %a2 
add.l #4, %a3 
move.l (%a2), (%a3) 
add.l #4, %a2 
add.l #4, %a3 
move.l (%a2), (%a3)
add.l #4, %a2 
add.l #4, %a3 
move.l (%a2), (%a3) 
add.l #4, %a2 
add.l #4, %a3 
move.l (%a2), (%a3) 
add.l #4, %a2 
add.l #4, %a3 
move.l (%a2), (%a3) 


move.l #Opcode, %a4 
move.l 4(%a4), %a3
move.l (%a4), %d2
lea FirstBlock, %a2 
again: move.l (%a2), (%a3) 
cmpi.l #1, %d2
beq next
add.l #4, %a2 
add.l #4, %a3 
sub.l #1, %d2
bra again 

next:
move.l #Opcode, %a4 
move.l 8(%a4), %a3
move.l (%a4), %d2 
lea SecondBlock, %a2 
again1: move.l (%a2), (%a3)
cmpi.l #1, %d2 
beq out  
add.l #4, %a2 
add.l #4, %a3
sub.l #1, %d2 
bra again1 

out:

movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 

rts

.data

Instruction:
.long 0xC
.long 0x23A0000
.long 0x2350000
.long 0x23C0000
.long 0x2320000
.long 0x23F0000



FirstBlock:
.long 0x5A
.long 0x7B
.long 0x4C
.long 0x8D
.long 0x3E
.long 0x4F
.long 0xA5
.long 0xB6
.long 0xC4
.long 0xD3
.long 0xE4
.long 0xF7


SecondBlock:
.long 0x5F
.long 0x4E
.long 0x4D
.long 0x7C
.long 0x5B
.long 0x5A
.long 0xA5
.long 0xB4
.long 0xC3
.long 0xD4
.long 0xE4
.long 0xF2
