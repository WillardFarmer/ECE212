/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Display
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3c.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Display:
/*Write your program here******************************************/

move.l %d7, -(%sp)
move.l #0x2300000, %a2
move.l #0x2310000, %a3

jsr cr
jsr cr

pea NumEntries
jsr iprintf
move.l 24(%sp), (%sp)
jsr value
addq.l #4, %sp
jsr cr


/*Entry list*/
move.l 20(%sp), %d7		/*Counter*/
pea NumEntList
jsr iprintf
addq.l #4, %sp

InputList:
jsr cr
move.l (%a2)+, -(%sp)
jsr value
addq.l #4, %sp
subq.l #1, %d7
tst.l %d7
bne InputList

jsr cr

pea MinNum
jsr iprintf
move.l (%a3)+, (%sp)
jsr value
addq.l #4, %sp
jsr cr

pea MaxNum
jsr iprintf
move.l (%a3)+, (%sp)
jsr value
addq.l #4, %sp
jsr cr

pea MeanNum
jsr iprintf
move.l (%a3)+, (%sp)
jsr value
addq.l #4, %sp
jsr cr

pea NumDiv1
jsr iprintf
move.l 28(%sp), (%sp)
jsr value
pea NumDiv2
jsr iprintf
move.l 24(%sp), (%sp)
jsr value
addq.l #8, %sp
jsr cr


/*Divisor list*/
move.l 24(%sp), %d7		/*Counter*/
pea NumDivList
jsr iprintf
addq.l #4, %sp

DivisorList:
jsr cr
move.l (%a3)+, -(%sp)
jsr value
addq.l #4, %sp
subq.l #1, %d7
tst.l %d7
bne DivisorList

jsr cr

pea Ended
jsr iprintf
addq.l #4, %sp
jsr cr

move.l (%sp)+, %d7


rts 

/*End of Subroutine **************************************************/ 
.data

NumEntries:
.string "The number of entries was "
MinNum:
.string "Min Number =: "
MaxNum:
.string "Max Number =: "
MeanNum:
.string "Mean Number =: "
NumDiv1:
.string "There are "
NumDiv2:
.string " number(s) divisible by "
NumEntList:
.string "The inputed numbers are:"
NumDivList:
.string "The divisible numbers are:"
Ended:
.string "Program ended"
/*All Strings placed here **************************************************/




/*End of Strings **************************************************/
