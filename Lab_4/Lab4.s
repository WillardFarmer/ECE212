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
clr.l %d2
clr.l %d3
clr.l %d4
clr.l %d5
clr.l %d6
clr.l %d7

again:
subq.l #4,%sp 
jsr WelcomePrompt /*Students write this subroutine */
move.l (%a7)+, %d3

move.l %d3,-(%a7) 
jsr convert /*Students write this subroutine */
move.l (%a7)+, %d4 
					
move.l %d4,-(%a7) 
jsr LedSub /*Students write this subroutine */


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7


rts
/*----------------------------------------------------------------*/


