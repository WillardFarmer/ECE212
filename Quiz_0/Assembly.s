/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global TestAsmCall

TestAsmCall:
lea      -40(%a7),%a7
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Assembly.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Quiz Starts Here******************************************/


/********************************************************************************/
/********************************************************************************/
/* Welcome to Quiz **********************************************************/
pea Welcome /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */




/*START**************************************************************************/
clr.l %d2
/*Question 1 %D2 = ?*************************************************************************/

pea Question1 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

move.l #12345678, %d2
/*Question 2 %D2 = ?*************************************************************************/

pea Question2 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

movea.l #0x2300000, %a2
/*Question 3 %A2 = ?*************************************************************************/


pea Question3 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

move.l 0x2300000, %d3
/*Question 4 %d3 = ?*********/

pea Question4 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

/* loop */
clr.l %d5
move.l #4,%d4
loop:add.l (%a2),%d5
add.l #4,%a2
sub.l #1, %d4
cmpi.l #0,%d4
beq exit
bra loop

exit:
/*Question 5 %d5 = ?*********/


pea Question5 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */


clr.l %d5
move.b 0x2300024, %d5
/*Question 6 %d5 = ?*********/

pea Question6 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */


clr.l %d5
move.w 0x2300024, %d5
/*Question 7 %d5 = ?*********/


pea Question7 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */


clr.l %d5
move.l 0x2300024, %d5
/*Question 8 %d5 = ?*********/

pea Question8 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */


clr.l %d5
move.l #0x11111111, %d5
and.l #00000003,%d5
lsl.l #1,%d5
/*Question 9 %d5 = ?*********/

pea Question9 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */


/*Question 10 0x2300028-0x230002C in Ascii = ?*********/

pea Question10 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

pea TestEnd /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

exit1:

/*END of program******************************************************************************/
/*--------------------------------------------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5
lea      40(%a7),%a7

rts /*return from subroutine */
/*--------------------------------------------------------------------------------*/

/*All Data should be placed here ie) Strings****************************************/
.data
ds.b 10
Welcome:
.string "Start Quiz"

Question1:
.string "Q1 Contents in register D2?"

Question2:
.string "Q2 Contents in register D2?"

Question3:
.string "Q3 Contents in register A2?"


Question4:
.string "Q4 Contents in register D3?"

Question5:
.string "Q5 Contents in register D5?"

Question6:
.string "Q6 Contents in register D5?"

Question7:
.string "Q7 Contents in register D5?"

Question8:
.string "Q8 Contents in register D5?"

Question9:
.string "Q9 Contents in register D5?"

Question10:
.string "Q10 What is stored in Memory 0x2300028-0x230002C in ASCII?"

TestEnd:
.string "End Quiz "

/************************************************************************************/

