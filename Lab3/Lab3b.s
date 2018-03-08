/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Stats
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3b.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Stats:
/*Write your program here******************************************/

sub.l #40, %sp
movem.l %d2-%d7/%a2-%a5, (%sp)

move.l #0x2300000, %a2
move.l #0x2310000, %a3

move.l (%a2), %d2 				/*Min*/
move.l (%a2), %d3				/*Max*/
clr.l %d4				/*Mean*/
clr.l %d5				/*Div Num*/
clr.l %d6				/*Div temp*/
move.l 12(%sp), %d7 	/*Counter*/

/*****Loop Start*****/
ForLoop:

/*Min*/
cmp.l 4(%a2), %d2
blt

/*Max*/

/*Mean*/

/*Div*/

rts 

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
