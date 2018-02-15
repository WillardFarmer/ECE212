/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2a.s *********************************************/
/* Names of Students: Willard Farmer and Chris Pontikes ***********/
/* Date: 2/15/2018                                       **********/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/

/*Part A **********************************************************/

move.l 0x2300004, %A2	/*Array 1*/
move.l 0x2300008, %A3	/*Array 2*/
move.l 0x230000C, %A4	/*Output Array*/


move.l (%A2), %D2		/*D2 sum*/
add.l (%A3), %D2
move.l %D2, (%A4)

move.l 4(%A2), %D2
add.l 4(%A3), %D2
move.l %D2, 4(%A4)

move.l 8(%A2), %D2
add.l 8(%A3), %D2
move.l %D2, 8(%A4)


/*Part B **********************************************************/

move.l 0x2300000, %D7 	/*Size*/
move.l 0x2300004, %A2	/*Array 1*/
move.l 0x2300008, %A3	/*Array 2*/
move.l 0x230000C, %A4	/*Output Array*/

move.l %A3, %D3		/*D3 array offset*/
sub.l %A2, %D3

LoopB:
move.l (%A2,%D3), %D2
add.l (%A2),%D2
move.l %D2, (%A4)

subq.l #1, %D7
beq	End
addq.l #4,%A2
addq.l #4,%A4
bra LoopB

End:


/*Part C **********************************************************/


move.l 0x2300000, %D7 	/*Size*/
move.l 0x2300004, %A2	/*Array 1*/
move.l 0x2300008, %A3	/*Array 2*/
move.l 0x230000C, %A4	/*Output Array*/

LoopC:
move.l (%A2)+, %D2
add.l (%A3)+, %D2
move.l %D2, (%A4)+

subq.l #1, %D7
beq	Exit
bra LoopC

Exit:


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
