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

move.l #0x2300000, %a2 /*Initialize Inputs (refered to as 'ascii') to address register 2*/
move.l #0x2310000, %a3 /*Initialize Outputs to address register 3*/
move.l #100, %d7       /*Counter, maximum 100 cycles*/

Start:
cmpi.l #0,%d7          /*Check for counter limit*/
beq ExitProgram        /*Exits programs if limit is hit*/

move.l (%a2), %d2      /*Move ascii hex to D2*/
cmpi.l #0xD, %d2       /*Check for 'Enter'*/
beq ExitProgram        /*Exits program for 'Enter'*/

cmpi.l #0x3A, %d2      /*Check if ascii is less than ':'*/
blt Number             /*Jump to numbers*/
cmpi.l #0x47, %d2      /*Check if ascii is less than '['*/
blt CapLetter          /*Jump to Upper Case letters*/
cmpi.l #0x67, %d2      /*Check if ascii is less than '{'*/
blt LowLetter          /*Jump to Lower Case letters*/

Invalid:
move.l #0xFFFFFFFF, (%a3) /*Outputs error value*/
bra Reset                 /*New cycle*/

Number:
cmpi.l #0x30, %d2      /*Check if ascii is less than '0'*/
blt Invalid            /*Not a number, so jump to Invalid*/
sub.l #0x30, %d2       /*Convert ascii to number format*/
move.l %d2, (%a3)      /*Outputs ascii*/
bra Reset              /*New cycle*/

LowLetter:
cmpi.l #0x61, %d2      /*Check if ascii is less than 'a'*/
blt Invalid            /*Not a Lower Case Letter, so jump to invalid*/
sub.l #0x20, %d2       /*Convert ascii to Upper Case*/

CapLetter:
cmpi.l #0x41, %d2      /*Check if ascii is less than 'a'*/
blt Invalid            /*Not an Upper Case Letter, so jump to invalid*/
sub.l #0x37, %d2       /*Convert ascii to desired format*/
move.l %d2, (%a3)      /*Outputs ascii*/
bra Reset              /*New cycle*/

Reset:
add.l #4, %a2          /*Have a2 point to next input*/
add.l #4, %a3          /*Have a3 point to next output*/
sub.l #1, %d7          /*Decrements counter by 1*/
bra Start

ExitProgram:

/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
