/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2.s **********************************************/
/* Names of Students: Willard Farmer and Chris Pontikes ***********/
/* Date: 2018-02-15                                              **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/

move.l 0x2300000, %D7	    /*Size*/
move.l 0x2300004, %A2	    /*X*/
move.l 0x2300008, %A3	    /*Y*/
move.l 0x230000C, %A4	    /*Temp storage (unused)*/
move.l 0x2300010, %A5	    /*final address*/
clr %D4			    /*Initialize Sum*/
subq.l #1, %D7		    /*Initial decrement of %D7*/

Loop:			    
move.l 4(%A3), %D2	    /*Moves second Y value into %D2*/
add.l (%A3)+, %D2	    /*Add the first Y value and increment*/
move.l 4(%A2), %D3	    /*find and store the distance   */ 
sub.l (%A2)+, %D3	    /*between X values		    */

cmp.l #1, %D3		    /*Check if the distance is one*/
beq One			    /*If so then no multiplication is required*/
asl.l #1, %D2		    /*Overwise multiply the Y values by 2*/
One:
add.l %D2, %D4		    /*Add the area to the sum %D4*/
subq.l #1, %D7		    /*Decrement counter*/
bgt Loop		    /*Loop*/


asr.l #1, %D4		    /*Average all Y values to find area*/
bcc NoCarry		    /*Check for carry*/
addq.l #1, %D4		    /*Round up*/
NoCarry:
move.l %D4, (%A5)	    /*Move the final sum to its specified address*/




/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
