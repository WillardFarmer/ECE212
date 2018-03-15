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
	void Intialization(); /*Subroutine to initialize values in memory location */
	void Set(); /*Subroutine to initialize memory location to zero */
	void Test();/*Subroutine to display values in memory location on monitor*/
	void cr(); /*Subroutine for carriage return and line feed*/
	void value(int P1); /*Subroutine to print decimal value to monitor*/
	void value1(int P1);
	int Character();
}

/*****************************************************
A Subroutine that prints a decimal number to the monitor
Input = decimal number on stack
Output = nothing

*****************************************************/ 
void value(int P1)
{
		iprintf( "\%d ", P1);
}

void value1(int P1)
{
		iprintf( "0x\%X ", P1);
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


/*****************************************************
A Subroutine that generates a carriage return and line feed
Input = nothing
Output = nothing

*****************************************************/ 
void cr()
{
		iprintf( "\r\n");
}


const char * AppName="Lab2ATest";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();

    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif

    iprintf("Application started\n");
    OSTimeDly(100); /*delay program for debugging purpose*/
    Intialization(); /*initialize memory to the array values for processing */
    Set();/* initialize memory to zero*/
    Intialization(); /*initialize memory to the array values for processing */
    while (1) {
    	AssemblyProgram(); /*the main program for students to code*/
    	Test();  /*display memory contents to monitor for verification*/
        OSTimeDly(100); /*delay program*/
    }
}
