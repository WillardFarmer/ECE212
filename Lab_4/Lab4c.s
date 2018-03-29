/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global LedSub
.extern cr
.extern iprintf
.extern getchr
.extern TurnOnLed
.extern TurnOffLed
.extern Row
.extern Column
.extern Delay
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab4c.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
LedSub:
/*Write your program here******************************************/

sub.l #40, %sp
movem.l %d2-%d7/%a2-%a5, (%sp)

move.l 44(%sp), %a2
clr.l %d7		/*outer loop, rows*/
clr.l %d6		/*inner loop, columns*/


Rows:
Columns:
btst.b %d6, (%A2, %d7)
beq Skip
addq.l #1, %d5 /*test*/
/*
move.l %d6, -(%sp)
jsr Column
move.l (%sp)+, %d2
move.l %d7, -(%sp)
jsr Row
move.l (%sp)+, %d2
jsr TurnOnLed
move.l #300, -(%sp)	/*<------Delay*
jsr Delay
move.l (%sp)+, %d2
jsr TurnOffLed
*/


Skip:

addq.l #1, %d6
cmp.l #8, %d6
blt  Columns

clr.l %d6
addq.l #1, %d7
cmp.l #8, %d7
blt Rows




movem.l (%sp), %d2-%d7/%a2-%a5
add.l #40, %sp


rts 
/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
/******************************************************/
