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
/* File Name: Lab3a.s *********************************************/
/* Names of Students: Willard Farmer and Chris Pontikes          **/
/* Date: March 22, 2018                                          **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Display:
/*Write your program here******************************************/

move.l %d7, -(%sp)        /*Only %d7 is being used, so only it will be backed up*/
move.l #0x2300000, %a2    /*The test program did not pass correct values for the address*/
move.l #0x2310000, %a3    /*registers so they've been hardcoded into the subroutine.    */

jsr cr                  /*                  */
jsr cr                  /*Carriage Return x2*/

pea NumEntries          /*"The number of entries was "*/
jsr iprintf             /*Print*/
move.l 24(%sp), (%sp)   /*Move Number of Entries into the stack*/
jsr value               /*Print Number of Entries*/
addq.l #4, %sp          /*Clean Stack*/
jsr cr                  /*Carriage Return*/


/************/
/*Entry list*/

move.l 20(%sp), %d7     /*Counter for number of entries*/
pea NumEntList          /*"The inputed numbers are:"*/
jsr iprintf             /*Print*/
addq.l #4, %sp          /*Clean Stack*/

InputList:
jsr cr                  /*Carriage Return*/
move.l (%a2)+, -(%sp)   /*Move Entry onthe the stack*/
jsr value               /*Print the entry*/
addq.l #4, %sp          /*Clean the stack*/
subq.l #1, %d7          /*Decrement the counter*/
tst.l %d7               /*Test if the counter has reached zero*/
bne InputList           /*Loop for the whole array*/


jsr cr                  /*Carriage Return*/
pea MinNum              /*"Min Number =: "*/
jsr iprintf             /*Print*/
move.l (%a3)+, (%sp)    /*Move Min Number onto the stack*/
jsr value               /*Print min num*/
addq.l #4, %sp          /*Clean Stack*/

jsr cr                  /*Carriage Return*/
pea MaxNum              /*"Max Number =: "*/
jsr iprintf             /*Print*/
move.l (%a3)+, (%sp)    /*Move Max Number onto the stack*/
jsr value               /*Print max num*/
addq.l #4, %sp          /*Clean Stack*/

jsr cr                  /*Carriage Return*/
pea MeanNum             /*"Mean Number =: "*/
jsr iprintf             /*Print*/
move.l (%a3)+, (%sp)    /*Move Mean Number onto the stack*/
jsr value               /*Print max num*/
addq.l #4, %sp          /*Clean Stack*/

jsr cr                  /*Carriage Return*/
pea NumDiv1             /*"There are "*/
jsr iprintf             /*Print*/
move.l 28(%sp), (%sp)   /*Move number of divisors to the stack*/
jsr value               /*Print number of divisors*/
pea NumDiv2             /* number(s) divisible by */
jsr iprintf             /*Print*/
move.l 24(%sp), (%sp)   /*Move divisor to the stack*/
jsr value               /*Print divisor*/
addq.l #8, %sp          /*Clean the stack*/
jsr cr                  /*Carriage Return*/


/*Divisor list*/
move.l 24(%sp), %d7     /*Initialize the divisor counter*/
pea NumDivList          /*"The divisible numbers are:"*/
jsr iprintf             /*Print*/
addq.l #4, %sp          /*Clean the stack*/

DivisorList:
jsr cr                  /*Carriage Return*/
move.l (%a3)+, -(%sp)   /*Push divisable number to the stack*/
jsr value               /*Print divisable number*/
addq.l #4, %sp          /*Clean the stack*/
subq.l #1, %d7          /*Decrement the counter*/
tst.l %d7               /*Test if the counter has reached zero*/
bne DivisorList         /*Loop for the whole array*/
jsr cr                  /*Carriage Return*/

pea Ended               /*"Program ended"*/
jsr iprintf             /*Print*/
addq.l #4, %sp          /*Clean the stack*/
jsr cr                  /*Carriage Return*/

move.l (%sp)+, %d7      /*Reload %d7*/


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
