/******************************************************
This is the Initialization file to load contents to memory.
In this subroutine, it initializes memory locations assigned values for
manipulation.
Because the contents in the .data section get placed at an arbitary memory
location, we want to force the data to be stored at a specific location.
In a nutshell, we are basically swapping memory contents.
The memory locations set are at 
0x2300000 - address of data to be stored
Input parameters: Nothing
Output parameters: Nothing
******************************************************/


.text


.equ AddressOne, 0x2300000 /* initialize AddressOne variable */


.global Intialization

Intialization:

lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)



/* for the first data array */
move.l #22, %d2 /* load counter, this will vary based on array size */
move.l #AddressOne, %a3 /*move address of AddressOne into A3 */
lea FirstBlock, %a2  /* move address of FirstBlock into A2 */
again: move.l (%a2), (%a3) /*swap memory */
cmpi.l #0, %d2 /*compare 0 with counter D2 */
beq out/* branch to next if equal */
add.l #4, %a2  /* increment address of A2 by 4 for long word*/
add.l #4, %a3 /* increment address of A3 by 4 for long word*/
sub.l #1, %d2 /*subtract counter by 1*/
bra again /* repeat loop */


out:

movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 

rts



.data


FirstBlock:
.long 0x30
.long 0x31
.long 0x32
.long 0x33
.long 0x34
.long 0x35
.long 0x36
.long 0x37
.long 0x38
.long 0x39
.long 0x41
.long 0x42
.long 0x43
.long 0x44
.long 0x45
.long 0x46
.long 0x61
.long 0x62
.long 0x63
.long 0x64
.long 0x65
.long 0x66
.long 0x0d



