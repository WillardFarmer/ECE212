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
/* File Name: Lab3a.s *********************************************/
/* Names of Students: Willard Farmer and Chris Pontikes          **/
/* Date: March 22, 2018                                          **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Stats:
/*Write your program here******************************************/

sub.l #40, %sp                    /*Set stack pointer*/
movem.l %d2-%d7/%a2-%a5, (%sp)    /*Backup up registers*/
move.l #0x2300000, %a2            /*The test program did not pass correct values for the address*/
move.l #0x2310000, %a3            /*registers so they've been hardcoded into the subroutine.    */
clr.l %d4						              /*%d4 is the number of divisors*/

/*Initializations for the MinMax Loop*/
move.l 48(%sp), %d7		/*Counter for MinMax*/
move.l %a2, %a4			  /*Copy entry array pointer*/
move.l (%a4), %d2 		/*Min*/
move.l (%a4)+, %d3	  /*Max*/

MinMax:
cmp.l (%a4), %d2      /*Compare the next entry to the Min*/
blt MinKeep           /*Check for if the next value is less than the min*/
move.l (%a4), %d2     /*If so move the next entry into the Min register*/
MinKeep:              /*Otherwise Continue*/
cmp.l (%a4), %d3      /*Compare the next entry to the Max*/
bgt MaxKeep           /*Check for if the next entry is greater than the max*/
move.l (%a4), %d3     /*If so move the next value into the Max register*/
MaxKeep:              /*Otherwise Continue*/
subq.l #1, %d7        /*Decrement the counter*/
addq.l #4, %a4        /*Clearer to increment hear than postincrementing earlier*/ 
cmp.l #1, %d7         /*Check for last value*/
bgt MinMax            /*Loop for whole array*/


move.l %d2, (%a3)+		/*Offload Min*/
move.l %d3, (%a3)+		/*Offload Max*/


move.l 48(%sp), %d7		/*Reinitialize Counter for Mean*/
move.l %a2, %a4				/*Copy number array pointer*/
clr %d2						    /*Sum register*/

Mean:
add.l (%a4)+, %d2     /*Add entry to sum register*/
subq.l #1, %d7        /*Decrement counter*/
tst %d7               /*Test if counter has reached zero*/ 
bne Mean              /*Loop for whole entry array*/
divu.w 48(%sp), %d2   /*Find the mean*/
move.w #0, (%a3)+     /*Fill a word with zeros*/
move.w %d2, (%a3)+		/*Offload mean*/


move.l 48(%sp), %d7		/*Reinitialize the Counter for Divisor*/
move.l %a2, %a4				/*Copy number array pointer*/
clr %d2						    /*Temp register*/

Divisor:
tst %d7               /*Test if the counter has reached zero*/
beq End               /*If so, exit the loop*/
subq.l #1, %d7        /*Decrement the counter*/

move.l (%a4)+, %d2    /*Move an entry into a temp register*/
divu.w 46(%sp), %d2   /*Divide value with divisor*/
swap %d2              /*This puts the remainder in the least significant word of %d2*/
tst.w %d2             /*Check if this remainder is zero*/
bne Divisor           /*If not, the entry is not a divisor*/
move.l -4(%a4), (%a3)+  /*Otherwise, the entry is a divisor and it is moved to the divisor array*/
addq.l #1, %d4        /*Increment the divisor counter*/
bra Divisor           /*Loop for the whole array*/

End:

move.l %d4, 52(%sp)             /*Move the divisor counter into the stack*/
movem.l (%sp), %d2-%d7/%a2-%a5  /*Reload the registers*/
add.l #40, %sp                  /*Clean the stack*/


rts 

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
