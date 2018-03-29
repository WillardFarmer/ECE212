/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global AssemblyProgram

AssemblyProgram:

lea      -40(%a7),%a7 
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/
/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab4.s *********************************************/
/* Wing Hoy ******************************************************/
/* Date: April 1, 2009 *******                                     **/
/* General Description:                                          **/
/* This file is not to be modified by the students. **************/
/* The three subroutines written by the students are called by this*/
/* File **********************************************************/
/******************************************************************/

/* Do Not Modify any of this *************************************/



pea StackValue /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */

move.l %sp, %d3
move.l %d3, -(%sp)
jsr value1
move.l (%sp)+,%d3


clr.l %d2
clr.l %d3
clr.l %d4
clr.l %d5
clr.l %d6
clr.l %d7

repeat:
pea Prompt /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

pea Sub1 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

pea Sub2 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

pea Sub3 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

pea Sub4 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

jsr getstring /*call get keyboard stroke subroutine*/
move.l %d0, %d2 /*keystroke data is stored returned in
				data register D0 which is then passed
		 		to D2*/
jsr getchr		 		
jsr cr /*call carriage return subroutine*/

cmpi.l #1,%d2
beq ChkSub1
cmpi.l #2,%d2
beq ChkSub2
cmpi.l #3,%d2
beq ChkSub3
cmpi.l #4,%d2
beq ChkSub4

pea Invalid /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/
bra repeat

ChkSub1:
move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6

move.l #0x23022222, %a2
move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5
move.l %a7, %a6

pea Subroutine1 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

subq.l #4,%sp /*making space for the return value*/
jsr WelcomePrompt

Memory1:
cmpi.l  #22222222, %d2
bne RegisterModify1
cmpi.l  #33333333, %d3
bne RegisterModify1
cmpi.l  #44444444, %d4
bne RegisterModify1
cmpi.l  #55555555, %d5
bne RegisterModify1
cmpi.l  #66666666, %d6
bne RegisterModify1

bra next1

RegisterModify1:
pea RegisterError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/


next1:
move.l (%a7), %d3
addq.l #4,%sp 

cmp.l  %a7, %a6
beq nexta

pea StackError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

nexta:
pea KeyboardEntry /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */

move.l %d3, %a7@-
jsr putchr
addq.l #4,%sp
jsr cr

jsr cr



bra repeat

ChkSub2:
move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6

move.l #0x23022222, %a2
move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5
move.l %a7, %a6

pea Subroutine2/*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

pea Subroutine2a /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

jsr getchr /*call get keyboard stroke subroutine*/
move.l %d0, %d2 /*keystroke data is stored returned in
				data register D0 which is then passed
		 		to D2*/
jsr cr /*call carriage return subroutine*/

move.l %d2,-(%a7)
move.l #22222222, %d2 
jsr convert 

Memory2:
cmpi.l  #22222222, %d2
bne RegisterModify2
cmpi.l  #33333333, %d3
bne RegisterModify2
cmpi.l  #44444444, %d4
bne RegisterModify2
cmpi.l  #55555555, %d5
bne RegisterModify2
cmpi.l  #66666666, %d6
bne RegisterModify2

bra next2

RegisterModify2:
pea RegisterError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

next2:

move.l (%a7), %d2
addq.l #4,%sp 

cmp.l  %a7, %a6
beq nextb

pea StackError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

nextb:
pea PatternAddress /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */

move.l %d2, -(%a7)
jsr value1
addq.l #4,%sp

cmpi.l #0,%d2
beq nextba

pea PatternData /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

move.l #8,%d3
move.l %d2,%a2
clr.l %d2
loop2:
move.b (%a2), %d2
move.l %d2, -(%a7)
jsr value
addq.l #4,%sp

add.l #1, %a2
sub.l #1,%d3
cmpi.l #0,%d3
beq nextba
bra loop2


nextba:
jsr cr 




	
bra repeat
ChkSub3:


move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6

move.l #0x23022222, %a2
move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5
move.l %a7, %a6

pea Subroutine3/*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

pea DisplayingData/*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr

pea Letter_A
jsr LedSub 
addq.l #4,%sp /* clean up stack */

cmpi.l  #22222222, %d2
bne RegisterModify3
cmpi.l  #33333333, %d3
bne RegisterModify3
cmpi.l  #44444444, %d4
bne RegisterModify3
cmpi.l  #55555555, %d5
bne RegisterModify3
cmpi.l  #66666666, %d6
bne RegisterModify3

bra next3

RegisterModify3:
pea RegisterError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

next3:
cmp.l  %a7, %a6
beq next3a

pea StackError /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */
jsr cr /*call carriage return subroutine*/

bra repeat

next3a:




jsr cr	 


bra repeat 
ChkSub4:


jsr cr 
jsr cr	 



subq.l #4,%sp 
jsr WelcomePrompt 
move.l (%a7)+, %d3

move.l %d3,-(%a7) 
jsr convert 
move.l (%a7)+, %d4 
					
move.l %d4,-(%a7) 
jsr LedSub 

pea StackValue1 /*push address of welcome string onto the stack */
jsr iprintf /*call print string subroutine */
addq.l #4,%sp /* clean up stack */

move.l %sp, %d3
move.l %d3, -(%sp)
jsr value1
move.l (%sp)+,%d3
/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7


rts
/*----------------------------------------------------------------*/
.data
Prompt:
.string "Testing Subroutines. Choose from the menu below"
Sub1:
.string "1 - Test First subroutine"
Sub2:
.string "2 - Test Second subroutine"
Sub3:
.string "3 - Test Third subroutine"
Sub4:
.string "4 - Test All subroutine"
TestAll:
.string "Test All subroutines and run program"
Invalid:
.string "Invalid Entry, Please enter correct entry"
StackError:
.string "Stack not properly restored"
KeyboardEntry:
.string "The keyboard stroke is "
RegisterError:
.string "Register not properly restored"
Subroutine1:
.string "Testing 1st subroutine."
Subroutine2:
.string "Testing 2nd subroutine."
Subroutine2a:
.string "Enter a Number or uppercase letter"
Subroutine3:
.string "Testing 3nd subroutine."
Subroutine4:
.string "Testing All subroutine."
PatternAddress:
.string "Address of Character Pattern is stored at =  "
PatternData:
.string "The Pattern Data is as follows: "
DisplayingData:
.string "Displaying the letter on LED ARRAY "
StackValue:
.string "The stack at beginning is set at SP = "
StackValue1:
.string "The stack at end is set at SP = "

