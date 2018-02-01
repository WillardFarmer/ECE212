/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1b.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/

move.l #0x2300000, %a2
move.l #0x2320000, %a3
move.l #100, %d7

Start:
cmpi.l #0,%d7
beq ExitProgram

move.l (%a2), %d2
cmpi.l #0xD, %d2
beq ExitProgram

cmpi.l #0x41, %d2
blt Invalid
cmpi.l #0x5B, %d2
blt UppLetter
cmpi.l #0x61, %d2
blt Invalid
cmpi.l #0x7B, %d2
blt LowLetter


Invalid:
move.l #0xFFFFFFFF, (%a3)
bra Reset


UppLetter:
add.l #0x20, %d2
move.l %d2, (%a3)
bra Reset

LowLetter:
sub.l #0x20, %d2
move.l %d2, (%a3)

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
