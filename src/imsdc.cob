       IDENTIFICATION DIVISION.
       PROGRAM-ID. MSGSAMP1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * IMS DL/I Function Codes
       01  DLI-FUNCTIONS.
           05  DLI-GU      PIC X(4) VALUE 'GU  '.
           05  DLI-GN      PIC X(4) VALUE 'GN  '.
           05  DLI-ISRT    PIC X(4) VALUE 'ISRT'.
      * Segment I/O Area
       01  STUDENT-SEGMENT.
           05  STD-ID      PIC X(5).
           05  STD-NAME    PIC X(20).
           05  STD-GRADE   PIC X(2).
      * MFS Screen Layout (Example)
       01  SCREEN-I-O-AREA.
           05  SCREEN-ID   PIC X(4).
           05  SCREEN-NAME PIC X(20).
           05  SCREEN-MSG  PIC X(40).
       LINKAGE SECTION.
      * I/O PCB - Handles terminal input/output
       01  I-O-PCB.
           05  IO-PCB-NAME      PIC X(8).
           05  FILLER           PIC X(2).
           05  IO-PCB-STATUS    PIC X(2).
           05  FILLER           PIC X(16).
      * DB PCB - Handles database access
       01  DB-PCB.
           05  DB-PCB-NAME      PIC X(8).
           05  DB-PCB-LEVEL     PIC X(2).
           05  DB-PCB-STATUS    PIC X(2).
           05  DB-PCB-PROC-OPT  PIC X(4).
           05  FILLER           PIC X(12).

       PROCEDURE DIVISION USING I-O-PCB, DB-PCB.
       
       A000-MAIN-PROCESSING.
      * 1. Get input from Terminal (MFS screen)
           CALL 'CBLTDLI' USING DLI-GU, I-O-PCB, SCREEN-I-O-AREA.
           
           IF IO-PCB-STATUS NOT = SPACES
              GOBACK
           END-IF.
           
      * 2. Perform DB call (e.g., Get Unique Student)
           MOVE SCREEN-ID TO STD-ID.
           CALL 'CBLTDLI' USING DLI-GU, DB-PCB, STUDENT-SEGMENT.
           
      * 3. Process and Send response back to Terminal
           IF DB-PCB-STATUS = SPACES
              MOVE STD-NAME TO SCREEN-NAME
              MOVE 'RECORD FOUND' TO SCREEN-MSG
           ELSE
              MOVE 'RECORD NOT FOUND' TO SCREEN-MSG
           END-IF.
           
           CALL 'CBLTDLI' USING DLI-ISRT, I-O-PCB, SCREEN-I-O-AREA.
           
           GOBACK.
