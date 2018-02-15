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
.long 0x6
.long 0x2350000
.long 0x2340000
.long 0x2330000
.long 0x2320000
.long 0x2310000



FirstBlock:
.long 0xA
.long 0xB
.long 0xC
.long 0xD
.long 0xE
.long 0xF



SecondBlock:
.long 0xF
.long 0xE
.long 0xD
.long 0xC
.long 0xB
.long 0xA

