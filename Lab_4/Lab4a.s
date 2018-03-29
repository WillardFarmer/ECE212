/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global WelcomePrompt
.extern cr
.extern iprintf
.extern getchr
.extern TurnOnLed
.extern TurnOffLed
.extern Row
.extern Column
.extern Delay
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab4a.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
WelcomePrompt:
/*Write your program here******************************************/

sub.l #40, %sp
movem.l %d2-%d7/%a2-%a5, (%sp)

jsr cr
jsr cr
pea Welcome
jsr iprintf
addq.l #4, %sp
jsr cr

Input:
jsr cr
pea Prompt
jsr iprintf
addq.l #4, %sp

jsr getchr
move.l %d0, %d2

cmp.l #0x30, %d2
blt Invalid
cmp.l #0x39, %d2
ble Valid
cmp.l #0x41, %d2
blt Invalid
cmp.l #0x5A, %d2
ble Valid
bra Invalid

Invalid:
jsr cr
pea Invalidstr
jsr iprintf
addq.l #4, %sp
bra Input

Valid:



move.l %d2, 44(%sp)
movem.l (%sp), %d2-%d7/%a2-%a5
add.l #40, %sp


rts 
/*End of Subroutine **************************************************/ 
.data
Welcome:
.string "Welcome to the cool kids' LED Display"
Prompt:
.string "Please enter an UPPER case letter or a number: "
Invalidstr:
.string "Not a valid entry. Please enter either an UPPER case letter of a number."


/*All Strings placed here **************************************************/


/*End of Strings **************************************************/
/******************************************************/
