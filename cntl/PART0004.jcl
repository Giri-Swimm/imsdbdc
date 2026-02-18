//IBMUSERX JOB FSS,FSS,MSGLEVEL=(1,1),                                  00010003
//            CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID,REGION=6M               00020000
//**********************************************************************00030000
//*********PARM=(DLI,PROGRAM NAME,PSBNAME,0,,,,,)***********************00040000
//**********************************************************************00050000
//STEP1    EXEC PGM=DFSRRC00,                                           00060000
//  PARM=(DLI,PARTISRT,PARTPSBA,7,0000,,0,,N,0,0,,,N,N,,N,)             00061021
//STEPLIB  DD DISP=SHR,DSN=IMS1010.SDFSRESL                             00070000
//         DD DISP=SHR,DSN=IBMUSER.XIMS.LOADLIB  ->LOAD MODULE          00080011
//IMS      DD DISP=SHR,DSN=IBMUSER.XIMS.PSBLIB     ->PSB LIB            00090003
//         DD DISP=SHR,DSN=IBMUSER.XIMS.DBDLIB  ->DBD LIB               00100003
//DFSRESLB DD DISP=SHR,DSN=IMS1010.SDFSRESL                             00110000
//DFSVSAMP DD DSN=IMS1010.PROCLIB(DFSVSMDB),DISP=SHR                    00120000
//SDFSRESL DD DSN=IMS1010.SDFSRESL,DISP=SHR                             00130000
//PARTDDIN DD DSN=IBMUSER.XIMS.LOAD.FILE,DISP=SHR                       00131023
//PARTDD01 DD DSN=IBMUSER.XIMS.KSDS.PARTDBD1,DISP=SHR  DATABASE         00140022
//PART1FLW DD DSN=IBMUSER.XIMS.ESDS.PARTDBD1,DISP=SHR                   00141022
//PROCLIB  DD DSN=IMS1010.PROCLIB,DISP=SHR                              00160000
//IEFRDER  DD DSN=IBMUSER.IMSLOG.IMSDB,DISP=(OLD,KEEP,KEEP),            00170018
//    SPACE=(CYL,(50,50),RLSE),UNIT=SYSDA                               00171020
//SYSOUT DD SYSOUT=*                                                    00180000
//SYSPRINT DD SYSOUT=*                                                  00190002
//                                                                      00290000
