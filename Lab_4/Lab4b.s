/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global convert
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
/* File Name: Lab4b.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
convert:
/*Write your program here******************************************/

sub.l #40, %sp
movem.l %d2-%d7/%a2-%a5, (%sp)

move.l 44(%sp), -(%sp)
jsr convert1
move.l (%sp), 48(%sp)
addq.l #4, %sp

movem.l (%sp), %d2-%d7/%a2-%a5
add.l #40, %sp



rts 
/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/


/*End of Strings **************************************************/
