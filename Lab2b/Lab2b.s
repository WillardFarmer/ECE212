/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/

move.l 0x2300000, %D7 	/*Size*/
move.l 0x2300004, %A2	/*X*/
move.l 0x2300008, %A3	/*Y*/
move.l 0x230000C, %A4	/*Temp*/
move.l 0x2300010, %A5	/*final address*/
clr %D4	/*Sum*/
subq.l #1, %D7

Loop:	/*Temp allocation*/
move.l 4(%A3), %D2
add.l (%A3)+, %D2
move.l 4(%A2), %D3
sub.l (%A2)+, %D3

cmp.l #1, %D3
beq One
asl.l #1, %D2
One:
add.l %D2, %D4
subq.l #1, %D7
bgt Loop


asr.l #1, %D4
bcc NoCarry
addq.l #1, %D4
NoCarry:
move.l %D4, (%A5)




/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
