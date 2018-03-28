/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global WelcomePrompt
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
WelcomePrompt:
/*Write your program here******************************************/

sub.l #40, %sp                    /*Set stack pointer*/
movem.l %d2-%d7/%a2-%a5, (%sp)    /*Backup up registers*/
clr.l %d2 			                  /*%d2 will be used as a temp storage*/

jsr cr            /*carriage return*/
jsr cr            /*carriage return*/
pea Welcome       /*"Welcome to Wing's statistics program"*/
jsr iprintf       /*Print*/
addq.l #4,%sp     /*clean stack*/


/*******************/
/**Entry Input**/

jsr cr            /*carriage return*/
pea Entries       /*"Please enter the number(3min-15max) of entries followed by 'enter'"*/
jsr iprintf       /*Print*/
addq.l #4, %sp    /*clean stack*/

jsr cr            /*carriage return*/
jsr getstring     /*"Please enter the divisor(2min-5max) followed by 'enter'"*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/

/*Entry checks*/
EntryCheck:			
cmp.l #3, %d2     /*Check for min value*/
blt InvalidESma   /*Print 'Too Small' Error Message*/
cmp.l #15, %d2    /*Check for max value*/
bgt InvalidEBig   /*Print 'Too Large' Error Message*/
bra ContinueEnt   /*Continue since input is in range [3,15]*/

/*Too large Error message*/
InvalidEBig:
pea InvalidBigS   /*"Invalid entry. Please enter a number less than "*/
jsr iprintf			  /*No need to clean, will be overwritten in next step*/
move.l %d2, (%sp) /*Move input into the stack to be displayed*/
jsr value         /*Print Input*/
addq.l #4, %sp 		/*Clean Stack*/

jsr cr            /*carriage return*/
jsr getstring     /*Input new value*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/
bra EntryCheck    /*Return to entry checker*/

/*Too small Error message*/
InvalidESma:
pea InvalidSmaS   /*"Invalid entry. Please enter a number more than "*/
jsr iprintf			  /*No need to pop, will be overwritten in next step*/
move.l %d2, (%sp) /*Move input into the stack to be displayed*/
jsr value         /*Print Input*/
addq.l #4, %sp 		/*Clean Stack*/

jsr cr            /*carriage return*/
jsr getstring     /*Input new value*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/
bra EntryCheck    /*Return to entry checker*/

ContinueEnt:
move.l %d2, 48(%sp)   /*Store number of entries in the stack*/

/*********************/


jsr cr            /*carriage return*/				
pea Divisor       /*"Please enter the divisor(2min-5max) followed by 'enter'"*/
jsr iprintf       /*Print*/
addq.l #4, %sp 		/*Clean Stack*/

jsr cr            /*carriage return*/				
jsr getstring     /*Input value*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/				


/*********************/
/***Divisor Checker***/

DivisorCheck:
cmp.l #2, %d2     /*Check for min value*/
blt InvalidDSma   /*Print 'Too Small' Error Message*/
cmp.l #5, %d2     /*Check for min value*/
bgt InvalidDBig   /*Print 'Too Large' Error Message*/
bra ContinueDiv   /*Continue since input is in range [2,5]*/


InvalidDSma:
pea InvalidSmaS   /*Invalid entry. Please enter a number more than */
jsr iprintf			  /*No need to pop, will be overwritten in next step*/
move.l %d2, (%sp) /*Move input to stack*/
jsr value         /*Print input*/
addq.l #4, %sp 		/*Clean Stack*/

jsr cr            /*carriage return*/				
jsr getstring     /*Input value*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/				
bra DivisorCheck


InvalidDBig:
pea InvalidBigS   /*Invalid entry. Please enter a number less than */
jsr iprintf			  /*No need to pop, will be overwritten in next step*/
move.l %d2, (%sp) /*Move input to stack*/
jsr value         /*Print input*/
addq.l #4, %sp 		/*Clean Stack*/

jsr cr            /*carriage return*/				
jsr getstring     /*Input value*/
move.l %d0, %d2   /*Store input in %d2*/
jsr cr            /*carriage return*/				
bra DivisorCheck


ContinueDiv:
move.l %d2, 44(%sp)   /*Store divisor in the stack*/

/*********************/


move.l 48(%sp), %d7		  /*%d7 is a counter for the number of entries*/
move.l #0x2300000, %a2  /*%a2 points to the memory location for entries*/


/********************/
/***Input Entries****/

ValueLoop:
jsr cr            /*carriage return*/
pea EnterNum      /*"Please enter a number(Positive Only): "*/
jsr iprintf       /*Print*/
addq.l #4, %sp 		/*Clean Stack*/

jsr getstring     /*Input Entry*/
move.l %d0, %d2   /*Store Entry in %d2*/
tst.l %d2         /*Compare %d2 with 0*/
bge Continue      /*Check for if entry is positive*/
jsr cr            /*carriage return*/
pea InvalidLT0    /*"The number must be positive"*/
jsr iprintf       /*Print*/
addq.l #4, %sp 		/*Clean Stack*/
bra ValueLoop     /*Loop without decrementing the counter*/

Continue:
move.l %d2, (%a2)+  /*Move entry into its memory location*/ 
subq.l #1, %d7    /*decrement counter*/
cmp.l #1, %d7     /*Checks for last value*/
jgt ValueLoop     /*Loops until the last entry value must be inputted*/


LastValue:
jsr cr            /*carriage return*/
pea FinalNum      /*"Please enter the last number(Positive Only): "*/
jsr iprintf       /*Print*/
addq.l #4, %sp 		/*Clean Stack*/

jsr getstring     /*Input last entry*/
move.l %d0, %d2   /*Store Entry in %d2*/
tst.l %d2         /*Compare %d2 with 0*/
bge ContinueLast  /*Check for if entry is positive*/
jsr cr            /*carriage return*/
pea InvalidLT0    /*"The number must be positive"*/
jsr iprintf       /*Print*/
addq.l #4, %sp 		/*Clean Stack*/
bra LastValue:    /*Loop until positive value is inputted*/ 

ContinueLast:

move.l %d2, (%a2)+  /*Move last entry into its memory location*/ 



movem.l (%sp), %d2-%d7/%a2-%a5  /*Reload registers from stack*/
add.l #40, %sp 		              /*Clean Stack*/

rts

/*End of Subroutine **************************************************/ 
.data

Welcome:
.string "Welcome to Wing's statistics program"
Entries:
.string "Please enter the number(3min-15max) of entries followed by 'enter'"
InvalidBigS:
.string "Invalid entry. Please enter a number less than "
InvalidSmaS:
.string "Invalid entry. Please enter a number more than "
Divisor:
.string "Please enter the divisor(2min-5max) followed by 'enter'"
EnterNum:
.string "Please enter a number(Positive Only): "
InvalidLT0:
.string "The number must be positive"
FinalNum:
.string "Please enter the last number(Positive Only): "
/*All Strings placed here **************************************************/

/*End of Strings **************************************************/

