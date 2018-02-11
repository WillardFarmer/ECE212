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
/* Names of Students: Willard Farmer and Christopher Pontikes    **/
/* Date: Feb 1 2018                                              **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

move.l #0x2300000, %a2    /*Initialize Inputs (refered to as 'ascii') to address register 2*/
move.l #0x2320000, %a3    /*Initialize Outputs to address register 3*/
move.l #100, %d7          /*Counter, maximum 100 cycles*/

Start:
cmpi.l #0,%d7             /*Check for counter limit*/
beq ExitProgram           /*Exits programs if limit is hit*/

move.l (%a2), %d2         /*Move ascii hex to D2*/
cmpi.l #0xD, %d2          /*Check for 'Enter'*/
beq ExitProgram           /*Exits program for 'Enter'*/

cmpi.l #0x41, %d2         /*Check if ascii is less than 'A'*/
blt Invalid               /*Invalid input*/
cmpi.l #0x5B, %d2         /*Check if ascii is less than '['*/
blt UppLetter             /*Jump to Upper Case letter*/
cmpi.l #0x61, %d2         /*Check if ascii is less than 'a'*/
blt Invalid               /*Invalid input*/
cmpi.l #0x7B, %d2         /*Check if ascii is less than '{'*/
blt LowLetter             /*Jump to Lower Case letter*/

Invalid:
move.l #0xFFFFFFFF, (%a3) /*Output error value*/
bra Reset                 /*New cycle*/

UppLetter:
add.l #0x20, %d2          /*Change Upper Case to Lower Case*/
move.l %d2, (%a3)         /*Output ascii Lower Case letter*/
bra Reset                 /*New cycle*/

LowLetter:
sub.l #0x20, %d2/         /*Change Lower Case to Upper Case*/
move.l %d2, (%a3)         /*Output ascii Upper Case letter*/

Reset:
add.l #4, %a2             /*Have a2 point to next input*/
add.l #4, %a3             /*Have a3 point to next output*/
sub.l #1, %d7             /*Decrements counter by 1*/
bra Start

ExitProgram:

/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
