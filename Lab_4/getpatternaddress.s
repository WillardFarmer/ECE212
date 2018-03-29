/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global convert1
.extern cr
.extern iprintf
.extern getchr
.extern TurnOnLed
.extern TurnOffLed
.extern Row
.extern Column
.extern Delay

convert1:
lea      -40(%a7),%a7 
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: convert1.s **************************************/
/* Names : Wing Hoy **/
/* Date: April 1, 2009                                     **/
/* General Description:                                          **/
/* This subroutine takes the Ascii character from keyboard
and returns the address of where the character pattern is stored.
Input = ascii data on the stack
Output = address of pattern of character on the stack                                                              **/
/******************************************************************/

/* Do Not Modify any of this *************************************/
clr.l %d2
clr.l %d3
clr.l %d4
clr.l %d5
clr.l %d6
clr.l %d7

move.l 44(%a7), %d2		
cmpi.l #0x30,%d2
beq Num0
cmpi.l #0x31,%d2
beq Num1
cmpi.l #0x32,%d2
beq Num2
cmpi.l #0x33,%d2
beq Num3
cmpi.l #0x34,%d2
beq Num4
cmpi.l #0x35,%d2
beq Num5
cmpi.l #0x36,%d2
beq Num6
cmpi.l #0x37,%d2
beq Num7
cmpi.l #0x38,%d2
beq Num8
cmpi.l #0x39,%d2
beq Num9
cmpi.l #0x41,%d2
beq LetA
cmpi.l #0x42,%d2
beq LetB
cmpi.l #0x43,%d2
beq LetC
cmpi.l #0x44,%d2
beq LetD
cmpi.l #0x45,%d2
beq LetE
cmpi.l #0x46,%d2
beq LetF
cmpi.l #0x47,%d2
beq LetG
cmpi.l #0x48,%d2
beq LetH
cmpi.l #0x49,%d2
beq LetI
cmpi.l #0x4A,%d2
beq LetJ
cmpi.l #0x4B,%d2
beq LetK
cmpi.l #0x4C,%d2
beq LetL
cmpi.l #0x4D,%d2
beq LetM
cmpi.l #0x4E,%d2
beq LetN
cmpi.l #0x4F,%d2
beq LetO
cmpi.l #0x50,%d2
beq LetP
cmpi.l #0x51,%d2
beq LetQ
cmpi.l #0x52,%d2
beq LetR
cmpi.l #0x53,%d2
beq LetS
cmpi.l #0x54,%d2
beq LetT
cmpi.l #0x55,%d2
beq LetU
cmpi.l #0x56,%d2
beq LetV
cmpi.l #0x57,%d2
beq LetW
cmpi.l #0x58,%d2
beq LetX
cmpi.l #0x59,%d2
beq LetY
cmpi.l #0x5A,%d2
beq LetZ

next:
bra done

/*address of patterns. The once the character is determined
then the address can be passed onto the stack*/
Num0:
lea Number_0,%a2
move.l %a2, 44(%a7)
bra done

Num1:
lea Number_1,%a2
move.l %a2, 44(%a7)
bra done

Num2:
lea Number_2,%a2
move.l %a2, 44(%a7)
bra done

Num3:
lea Number_3,%a2
move.l %a2, 44(%a7)
bra done

Num4:
lea Number_4,%a2
move.l %a2, 44(%a7)
bra done

Num5:
lea Number_5,%a2
move.l %a2, 44(%a7)
bra done

Num6:
lea Number_6,%a2
move.l %a2, 44(%a7)
bra done

Num7:
lea Number_7,%a2
move.l %a2,44(%a7)
bra done

Num8:
lea Number_8,%a2
move.l %a2, 44(%a7)
bra done

Num9:
lea Number_9,%a2
move.l %a2, 44(%a7)
bra done

LetA:
lea Letter_A,%a2
move.l %a2, 44(%a7)
bra done

LetB:
lea Letter_B,%a2
move.l %a2, 44(%a7)
bra done

LetC:
lea Letter_C,%a2
move.l %a2, 44(%a7)
bra done

LetD:
lea Letter_D,%a2
move.l %a2, 44(%a7)
bra done

LetE:
lea Letter_E,%a2
move.l %a2, 44(%a7)
bra done

LetF:
lea Letter_F,%a2
move.l %a2, 44(%a7)
bra done

LetG:
lea Letter_G,%a2
move.l %a2,44(%a7)
bra done

LetH:
lea Letter_H,%a2
move.l %a2, 44(%a7)
bra done

LetI:
lea Letter_I,%a2
move.l %a2, 44(%a7)
bra done

LetJ:
lea Letter_J,%a2
move.l %a2, 44(%a7)
bra done

LetK:
lea Letter_K,%a2
move.l %a2, 44(%a7)
bra done

LetL:
lea Letter_L,%a2
move.l %a2, 44(%a7)
bra done

LetM:
lea Letter_M,%a2
move.l %a2, 44(%a7)
bra done

LetN:
lea Letter_N,%a2
move.l %a2, 44(%a7)
bra done

LetO:
lea Letter_O,%a2
move.l %a2,44(%a7)
bra done

LetP:
lea Letter_P,%a2
move.l %a2, 44(%a7)
bra done

LetQ:
lea Letter_Q,%a2
move.l %a2, 44(%a7)
bra done

LetR:
lea Letter_R,%a2
move.l %a2, 44(%a7)
bra done

LetS:
lea Letter_S,%a2
move.l %a2, 44(%a7)

LetT:
lea Letter_T,%a2
move.l %a2, 44(%a7)
bra done

LetU:
lea Letter_U,%a2
move.l %a2, 44(%a7)
bra done

LetV:
lea Letter_V,%a2
move.l %a2, 44(%a7)
bra done

LetW:
lea Letter_W,%a2
move.l %a2, 44(%a7)
bra done

LetX:
lea Letter_X,%a2
move.l %a2, 44(%a7)
bra done

LetY:
lea Letter_Y,%a2
move.l %a2, 44(%a7)
bra done

LetZ:
lea Letter_Z,%a2
move.l %a2, 44(%a7)
bra done

done:
/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/


