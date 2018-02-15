/******************************************************
This is the Initialization file to load contents to memory.
In this subroutine, it initializes memory locations assigned values for
manipulation.
Because the contents in the .data section get placed at an arbitary memory
location, we want to force the data to be stored at a specific location.
In a nutshell, we are basically swapping memory contents.
The memory locations set are at 
0x2300000 - Number of data points
0x2300004 - Contains X points
0x2300008 - Contains Y points
0x230000C - Contains the address of temporary storage
0x2300010 - Contains the address of where to store you final value
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
/*move.l (%a2), (%a3) */ 



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
beq next1
add.l #4, %a2 
add.l #4, %a3 
sub.l #1, %d2
bra again1
 
next1:

movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 

rts

.data

Instruction:
.long 51
/*.long 0x33*/
.long 0x2310000 
.long 0x2320000 
.long 0x2330000 
.long 0x2340000
.long 0x2350000  


FirstBlock:
.long 0
.long 1
.long 2
.long 3
.long 4
.long 5
.long 6
.long 7
.long 8
.long 9
.long 10
/*10*/
.long 11
.long 12
.long 13
.long 14
.long 15
.long 16
.long 17
.long 18
.long 19
.long 20
/*20*/
.long 21
.long 22
.long 23
.long 24
.long 25
.long 26
.long 27
.long 28
.long 29
.long 30
/*30*/
.long 31
.long 32
.long 33
.long 34
.long 35
.long 36
.long 37
.long 38
.long 39
.long 40
/*40*/
.long 41
.long 42
.long 43
.long 44
.long 45
.long 46
.long 47
.long 48
.long 49
.long 50



 
SecondBlock:
.long 0x0
.long 0x1
.long 0x4
.long 0x9
.long 0x10
.long 0x19
.long 0x24
.long 0x31
.long 0x40
.long 0x51
.long 0x64
/*10*/
.long 0x79
.long 0x90
.long 0xA9
.long 0xC4
.long 0xE1
.long 0x100
.long 0x121
.long 0x144
.long 0x169
.long 0x190
/*20*/
.long 0x1B9
.long 0x1E4
.long 0x211
.long 0x240
.long 0x271
.long 0x2A4
.long 0x2D9
.long 0x310
.long 0x349
.long 0x384
/*30*/
.long 0x3C1
.long 0x400
.long 0x441
.long 0x484
.long 0x4C9
.long 0x510
.long 0x559
.long 0x5A4
.long 0x5F1
.long 0x640
/*40*/
.long 0x691
.long 0x6E4
.long 0x739
.long 0x790
.long 0x7E9
.long 0x844
.long 0x8A1
.long 0x900
.long 0x961
.long 0x9C4

