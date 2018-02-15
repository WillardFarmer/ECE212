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
	void Intialization(); /*Subroutine to intialize values in memory */
	void Set(); /*Subroutine to intialize values to zero memory location */
}


const char * AppName="Lab2AddressingModes";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();

    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif

    iprintf("Application started\n");
    OSTimeDly(100); /*delay program for debugging purpose*/
    Intialization(); /* intialize values to memory*/
    Set(); /*Set contents in Array to be zero */
    Intialization(); /* intialize values to memory*/
    while (1) {   	
    	AssemblyProgram(); /*the main program for students to code*/
    	OSTimeDly(20); /*delay program*/
    }
}
