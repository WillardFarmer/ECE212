/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1a.s *********************************************/
/* Names of Students: Willard Farmer and Christopher Pontikes	 **/
/* Date: Feb 1 2018                                              **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/


move.l #0x2300000, %a2
move.l #0x2310000, %a3
move.l #100, %d7


Start:
cmpi.l #0,%d7
beq ExitProgram

move.l (%a2), %d2
cmpi.l #0xD, %d2
beq ExitProgram

cmpi.l #0x3A, %d2
blt Number
cmpi.l #0x47, %d2
blt CapLetter
cmpi.l #0x67, %d2
blt LowLetter

Invalid:

move.l #0xFFFFFFFF, (%a3)
bra Reset


Number:

cmpi.l #0x30, %d2
blt Invalid
sub.l #0x30, %d2
move.l %d2, (%a3)
bra Reset


LowLetter:

cmpi.l #0x61, %d2
blt Invalid
sub.l #0x20, %d2


CapLetter:

cmpi.l #0x41, %d2
blt Invalid
sub.l #0x37, %d2
move.l %d2, (%a3)
bra Reset


Reset:

add.l #4, %a2
add.l #4, %a3
sub.l #1, %d7
bra Start

ExitProgram:






/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
