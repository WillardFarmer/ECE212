/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global Test
.extern cr
.extern iprintf
.extern value
.extern Character

Test:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

repeat:pea Welcome /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 


pea Welcome1 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 


jsr Character
move.b %d0, %d2
jsr cr

move.l #0x2300000, %a2 /*get opcode */


cmpi.l #0x31, %d2
beq test1


pea Error /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

bra repeat

test1:

move.l 16(%a2), %a5 /* get the memory address that you want print to screen */
move.l (%a5), %d3 /* get the number of entries */

pea Output1 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value
addq.l #4,%sp 
jsr cr 


  

jsr cr /*carriage return and line feed */

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/

.data
Welcome:
.string "Welcome to lab2 Part 2 `area under the curve' test program"
Welcome1:
.string "Press 1 to test your program"
Error:
.string "Inproper Selection, Please select again"
Output1:
.string "The total area underneath the curve is = "

