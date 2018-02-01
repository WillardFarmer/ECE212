/******************************************************
This is the Initialization file to set memory location to zeros*
In this subroutine, it initializes memory locations to zeros.
The memory locations set to zero start at 
0x2310000
0x2320000

Input parameters: Nothing
Output parameters: Nothing
******************************************************/
.text

.global Set

Set:

lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)

move.l #0x2310000, %a2 /*get address of opcode */
move.l %a2,%a5
move.l #50, %d2
move.l #0, %d6

loop:move.l #0,(%a5) /*move zero into memory location*/

add.l #4, %a5 /*increment address of memory location by 4 to accomodate long value*/
add.l #1, %d6 /*increment counter by one*/
cmp.l %d6, %d2 /* compare counter with number of entries*/
beq nextone /*exit if they are equal*/
bra loop /*repeat loop*/

nextone:

move.l #0x2320000, %a2 /*get address of opcode */
move.l %a2,%a5
move.l #50, %d2
move.l #0, %d6 /* loop counter value */

loop1:move.l #0,(%a5) /*move zero into memory location*/

add.l #4, %a5 /*increment address of memory location by 4 to accomodate long value*/
add.l #1, %d6 /*increment counter by one*/
cmp.l %d6, %d2 /* compare counter with number of entries*/
beq nextone1 /*exit if they are equal*/
bra loop1 /*repeat loop1*/

nextone1:


movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 

rts

