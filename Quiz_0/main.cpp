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
	void TestAsmCall(); /*Subroutine for student coding*/
	void carriagereturn();
	void Intialization(); /*Subroutine to initialize values in memory */
	void Set(); /*Subroutine to initialize values to zero memory location */
}

void carriagereturn()
{
		iprintf( "\r\n");
}

 

const char * AppName="Lab0Quiz";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();

    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif

    iprintf("Application started\n");
    OSTimeDly(100); /*delay program for debugging purpose*/
    Intialization(); /* initialize values to memory*/
    Set(); /*Set contents in Array to be zero */
    Intialization(); /* initialize values to memory*/
    while (1) {   	
    	TestAsmCall(); /*the main program for students to code*/
    	OSTimeDly(20); /*delay program*/
    }
}

