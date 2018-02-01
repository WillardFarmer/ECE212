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
	void Intialization(); /*Subroutine to intialize memory location to zero */
	void Set(); /*Subroutine to intialize values in memory location */
}

const char * AppName="lab1hextodecStudent";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();

    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif
    
     
    
    iprintf("Application started\n");
    Set(); /*intialize memory to the array values for processing */   
    OSTimeDly(100); /*delay program for debugging purpose*/
    while (1) {
    	Intialization(); /* intialize memory to zero*/
    	AssemblyProgram(); /*the main program for students to code*/
        OSTimeDly(20);
    }
}  
 