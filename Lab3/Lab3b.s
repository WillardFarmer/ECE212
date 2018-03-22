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
clr.l %d4						/*Number of divisors*/



move.l 48(%sp), %d7			/*Counter MinMax*/
move.l %a2, %a4				/*Copy number array pointer*/
move.l (%a4), %d2 			/*Min*/
move.l (%a4), %d3			/*Max*/

MinMax:
cmp.l 4(%a4), %d2
blt Min
move.l 4(%a4), %d2
Min:
cmp.l 4(%a4), %d3
bgt Max
move.l 4(%a4), %d3
Max:
subq.l #1, %d7
addq.l #4, %a4
cmp.l #1, %d7
bgt MinMax


move.l %d2, (%a3)+			/*Offload Min*/
move.l %d3, (%a3)+			/*Offload Max*/


move.l 48(%sp), %d7			/*Counter Mean*/
move.l %a2, %a4				/*Copy number array pointer*/
clr %d2						/*Sum register*/

Mean:
add.l (%a4)+, %d2
subq.l #1, %d7
tst %d7
bne Mean
divu.l 48(%sp), %d2
move.w #0, (%a3)+
move.w %d2, (%a3)+			/*offload mean*/


move.l 48(%sp), %d7			/*Counter Divisor*/
move.l %a2, %a4				/*Copy number array pointer*/
clr %d2						/*Temp register*/

Divisor:
tst %d7
beq End
subq.l #1, %d7

move.l (%a4)+, %d2
divu.w 46(%sp), %d2
swap %d2
tst.w %d2
bne Divisor
move.l -4(%a4), (%a3)+
addq.l #1, %d4
bra Divisor

End:

move.l %d4, 52(%sp)
movem.l (%sp), %d2-%d7/%a2-%a5
add.l #40, %sp


rts 

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
