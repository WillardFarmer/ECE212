#include "predef.h"
#include <stdio.h>
#include <ctype.h>
#include <startnet.h>
#include <autoupdate.h>
#include <NetworkDebug.h>

 
extern "C" {
void UserMain(void * pd);
}

extern "C" {
	void AssemblyProgram(); /*Subroutine for student coding*/
	void Test();
	void Intialization(); /*Subroutine to initialize values in memory location */
	void Set();/*Subroutine to initialize memory location to zero */
	void cr(); /*Carriage return and line feed subroutine*/
	void value(int P1); /*Subroutine to print decimal value to monitor*/
	void putchr(int B); /*Subroutine to print decimal value to monitor*/
	int Character();
}

/*****************************************************
A Subroutine that prints a decimal number to the monitor
Input = decimal number on stack
Output = nothing

*****************************************************/ 
void value(int P1)
{
		iprintf( "\%d", P1);
}

void putchr(int B)
{			
			putchar(B);
			
}

/*****************************************************
A Subroutine that gets one input character from monitor
and stores it to data register D0
Input = decimal number on stack
Output = nothing
 
*****************************************************/ 
int Character()
{
		return getchar();
}

/****************************************************
Carriage return and line feed function
Input = nothing
Output = nothing
*****************************************************/
void cr()
{
		iprintf( "\r\n");
}


const char * AppName="lab1hextodec";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();

    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif

    iprintf("Application started\n");
    OSTimeDly(100); /*delay program for debugging purpose*/
   Set();/* initialize memory to zero*/
    while (1) {
    	
    	 Intialization(); /*initialize memory to the array values for processing */
    	AssemblyProgram(); /*the main program for students to code*/
    	Test();
        OSTimeDly(20);
    }
}
