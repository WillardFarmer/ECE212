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
.long 2
.long 3
.long 5
.long 7
.long 8
.long 9
.long 11
.long 13
.long 15
.long 16
/*10*/
.long 18
.long 19
.long 20
.long 22
.long 24
.long 26
.long 28
.long 29
.long 30
.long 32
/*20*/
.long 34
.long 35
.long 37
.long 38
.long 40
.long 41
.long 43
.long 44
.long 46
.long 48
/*30*/
.long 50
.long 52
.long 53
.long 54
.long 55
.long 57
.long 59
.long 60
.long 62
.long 63
/*40*/
.long 65
.long 67
.long 68
.long 70
.long 71
.long 73
.long 75
.long 76
.long 78
.long 80



 
SecondBlock:
.long 0
.long 4
.long 9
.long 25
.long 49
.long 64
.long 81
.long 121
.long 169
.long 225
.long 256
/*10*/
.long 324
.long 361
.long 400
.long 484
.long 576
.long 676
.long 784
.long 841
.long 900
.long 1024
/*20*/
.long 1156
.long 1225
.long 1369
.long 1444
.long 1600
.long 1681
.long 1849
.long 1936
.long 2116
.long 2304
/*30*/
.long 2500
.long 2704
.long 2809
.long 2916
.long 3025
.long 3249
.long 3481
.long 3600
.long 3844
.long 3969
/*40*/
.long 4225
.long 4489
.long 4624
.long 4900
.long 5041
.long 5329
.long 5625
.long 5776
.long 6084
.long 6400

