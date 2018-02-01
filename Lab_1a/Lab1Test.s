/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global Test
.extern cr
.extern iprintf
.extern value
.extern putchr
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


pea Welcome2 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

jsr Character
move.b %d0, %d2
jsr cr 

cmpi.l #0x31, %d2
beq test1
cmpi.l #0x32, %d2
beq test2

pea Error /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

bra repeat

test1:
move.l #0x2300000, %a2 /*address of values to convert*/
move.l #0x2310000, %a3 /*adresss of converted values to be stored*/

pea Output1 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

testagain:
move.l (%a2), %d3 /*address of values to convert*/
move.l (%a3), %d4 /*address of values to convert*/

cmpi.l #0x0D, %d3
beq exit

pea Output1a /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr putchr
addq.l #4,%sp 

pea Output1b /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d4, -(%a7)
jsr value
addq.l #4,%sp 
jsr cr

add.l #4, %a2 /*increment address by one long word 4 bytes*/
add.l #4, %a3 /*increment address by one long word 4 bytes*/
bra testagain

test2:

move.l #0x2300000, %a2 /*address of values to convert*/
move.l #0x2320000, %a3 /*adresss of converted values to be stored*/

pea Output1 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

testagain1:
move.l (%a2), %d3 /*address of values to convert*/
move.l (%a3), %d4 /*address of values to convert*/

cmpi.l #0x0D, %d3
beq exit

pea Output1a /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr putchr
addq.l #4,%sp 

pea Output1c /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d4, -(%a7)
jsr putchr
addq.l #4,%sp 
jsr cr

add.l #4, %a2 /*increment address by one long word 4 bytes*/
add.l #4, %a3 /*increment address by one long word 4 bytes*/
bra testagain1

exit:

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/

.data
Welcome:
.string "Welcome to lab1 test program, please select"
Welcome1:
.string "Press 1 to test part a"
Welcome2:
.string "Press 2 to test part b"
Error:
.string "Inproper Selection, Please select again"
Output1:
.string "The conversion is starting at 0x2300000:"
Output1a:
.string "Ascii Character = "
Output1b:
.string " Decimal value = "
Output1c:
.string " Upper or lower case equivalent = "



Hi:
.string "Just Testing"

