/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global Test
.extern cr
.extern iprintf
.extern value
.extern value1
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

pea Welcome3 /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr

jsr Character
move.b %d0, %d2
jsr cr

move.l #0x2300000, %a2 /*get opcode */
move.l (%a2), %d3 /* get the number of entries */

pea Output1a /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value
addq.l #4,%sp 
jsr cr

move.l 4(%a2), %a5 /* get the memory address that you want print to screen */
move.l %a5, %d3 /* get the number of entries */

pea Output1b /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value1
addq.l #4,%sp 
jsr cr

move.l 8(%a2), %a5 /* get the memory address that you want print to screen */
move.l %a5, %d3 /* get the number of entries */

pea Output1c /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value1
addq.l #4,%sp 
jsr cr  

cmpi.l #0x31, %d2
beq test1
cmpi.l #0x32, %d2
beq test2 
cmpi.l #0x33, %d2
beq test3

pea Error /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr cr 

bra repeat

test1:

move.l 12(%a2), %a5 /* get the memory address that you want print to screen */
move.l %a5, %d3 /* get the number of entries */

pea Output1d /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value1
addq.l #4,%sp 
jsr cr 

move.l #3, %d2

/*move.l (%a2), %d2*/ /* get the number of entries */
move.l #0, %d6 /* loop counter value */

pea Output1e /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

redo:move.l (%a5),%d7 /*move the content into data register D7 */

move.l %d7, -(%a7) /*move the content onto the stack */
jsr value /* print value to screen */
addq.l #4,%sp  /*clean up stack */
 
add.l #4, %a5 /*increment address by 4 - longword */
add.l #1, %d6 /*increment counter by 1 */
cmp.l %d6, %d2 /*compare number of enteries D2 with counter D6*/
beq exit /* exit loop if equal */
bra redo /* redo loop */







test2:

move.l 16(%a2), %a5 /* get the memory address that you want print to screen */
move.l %a5, %d3 /* get the number of entries */

pea Output1d /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value1
addq.l #4,%sp 
jsr cr

move.l (%a2), %d2 /* get the number of entries */
move.l #0, %d6 /* loop counter value */

pea Output1e /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

redo1:move.l (%a5),%d7 /*move the content into data register D7 */

move.l %d7, -(%a7) /*move the content onto the stack */
jsr value /* print value to screen */
addq.l #4,%sp  /*clean up stack */
 
add.l #4, %a5 /*increment address by 4 - longword */
add.l #1, %d6 /*increment counter by 1 */
cmp.l %d6, %d2 /*compare number of enteries D2 with counter D6*/
beq exit /* exit loop if equal */
bra redo1 /* redo loop */

 

test3:

move.l 20(%a2), %a5 /* get the memory address that you want print to screen */
move.l %a5, %d3 /* get the number of entries */

pea Output1d /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

move.l %d3, -(%a7)
jsr value1
addq.l #4,%sp 
jsr cr

move.l (%a2), %d2 /* get the number of entries */
move.l #0, %d6 /* loop counter value */

pea Output1e /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */

redo2:move.l (%a5),%d7 /*move the content into data register D7 */

move.l %d7, -(%a7) /*move the content onto the stack */
jsr value /* print value to screen */
addq.l #4,%sp  /*clean up stack */
 
add.l #4, %a5 /*increment address by 4 - longword */
add.l #1, %d6 /*increment counter by 1 */
cmp.l %d6, %d2 /*compare number of enteries D2 with counter D6*/
beq exit /* exit loop if equal */
bra redo2 /* redo loop */

 
exit:
jsr cr /*carriage return and line feed */

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/

.data
Welcome:
.string "Welcome to lab2 test program, please select"
Welcome1:
.string "Press 1 to test part a"
Welcome2:
.string "Press 2 to test part b"
Welcome3:
.string "Press 3 to test part c"
Error:
.string "Inproper Selection, Please select again"
Output1:
.string "Opcode stored at 0x2300000:"
Output1a:
.string "Number of Entries = "
Output1b:
.string "Address of First Array = "
Output1c:
.string "Address of Second Array = "
Output1d:
.string "Address of Stored Sum Array = "
Output1e:
.string "Contents of Sum Array are: "
