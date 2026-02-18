       IDENTIFICATION DIVISION.                                                     00010000
       PROGRAM-ID. PART0001.                                            00020011
       AUTHOR. NAME.                                                    00030000
       DATE-WRITTEN. TODAY.                                             00040000
                                                                        00050000
       ENVIRONMENT DIVISION.                                            00060000
       INPUT-OUTPUT SECTION.                                            00070000
       FILE-CONTROL.                                                    00080000
           SELECT LOAD-INFILE  ASSIGN TO PARTDDIN                       00090008
           ORGANIZATION IS SEQUENTIAL                                   00100000
           ACCESS  MODE IS SEQUENTIAL                                   00110000
           FILE STATUS  IS WS-IN-STATUS.                                00120000
                                                                        00130000
       DATA DIVISION.                                                   00140000
       FILE SECTION.                                                    00150000
       FD LOAD-INFILE                                                   00160000
           LABEL RECORD ARE STANDARD.                                   00170000
       01 INPUT-RECORD-AREA.                                            00180005
          03 SEGM-NAME       PIC  X(08).                                00190005
          03 FILLER          PIC  X(01).                                00190109
          03 SEGMENT-IO-AREA PIC  X(42).                                00191009
       WORKING-STORAGE SECTION.                                         00200000
       01  WS-IN-STATUS    PIC   X(02)  VALUE SPACE.                    00210000
       01 WS-END-OF-FILE   PIC   X(01)  VALUE SPACE.                    00230000
                                                                        00231000
       COPY PARTSG01.                                                   00231100
       COPY PRICSG05.                                                   00231200
       COPY ADDLSG07.                                                   00232000
       COPY ORDSEG15.                                                   00233000
       COPY STCKSG10.                                                   00236000
       01 DLI-ISRT          PIC   X(04)  VALUE 'ISRT'.                  00240000
       01 UNQUAL-SSA-01     PIC   X(09)  VALUE 'PARTSG01 '.             00250000
       01 UNQUAL-SSA-05     PIC   X(09)  VALUE 'PRICSG05 '.             00260000
       01 UNQUAL-SSA-07     PIC   X(09)  VALUE 'ADDLSG07 '.             00270000
       01 UNQUAL-SSA-10     PIC   X(09)  VALUE 'STCKSG10 '.             00280000
       01 UNQUAL-SSA-15     PIC   X(09)  VALUE 'ORDSEG15 '.             00290000
                                                                        00300000
       01 PARTSG01-QUAL-SSA.                                            00301000
         03 SEGMENT-NAME    PIC   X(08)  VALUE 'PARTSG01'.              00310000
         03 FILLER          PIC   X(01)  VALUE '('.                     00320000
         03 FIELD-NAME      PIC   X(08)  VALUE 'PARTNUMB'.              00330000
         03 OPER            PIC   X(02)  VALUE 'EQ'.                    00340000
         03 FIELD-VALUE-01  PIC   X(05)  VALUE SPACE.                   00350003
         03 FILLER          PIC   X(01)  VALUE ')'.                     00360000
                                                                        00370000
       01 PRICSG05-QUAL-SSA.                                            00380000
         03 SEGMENT-NAME    PIC   X(08)  VALUE 'PRICSG05'.              00390000
         03 FILLER          PIC   X(01)  VALUE '('.                     00400000
         03 FIELD-NAME      PIC   X(08)  VALUE 'PRICCODE'.              00410001
         03 OPER            PIC   X(02)  VALUE 'EQ'.                    00420000
         03 FIELD-VALUE-05  PIC   X(04)  VALUE SPACE.                   00430010
         03 FILLER          PIC   X(01)  VALUE ')'.                     00440000
                                                                        00450000
       01 WS-ABENDPGM       PIC   X(08)  VALUE 'ABENDPGM'.              00451002
       LINKAGE SECTION.                                                 00460000
       01 PARTPCB-MASK.                                                 00470000
          03 DATABASE-NAME    PIC   X(08).                              00480000
          03 DATABASE-LEVEL   PIC   X(02).                              00490000
          03 STATUS-CODE      PIC   X(02).                              00500000
          03 PROCOPT          PIC   X(04).                              00510000
          03 FILLER           PIC  S9(05) COMP.                         00520000
          03 SEGEMENT-NAME    PIC   X(08).                              00530000
          03 KEY-LENGTH       PIC  S9(05) COMP.                         00540000
          03 SEGMENT-NUMBER   PIC  S9(05) COMP.                         00550000
          03 CONCATED-KEY     PIC   X(22).                              00560009
       PROCEDURE DIVISION USING PARTPCB-MASK.                           00580000
       000-MAIN-PARA.                                                   00590000
           DISPLAY 'PARTPGM1 STARTED'.                                  00600007
                                                                        00610000
           PERFORM 100-INITIAL-PARA THRU 100-EXIT.                      00620000
           PERFORM 200-GET-INPUT-PARA THRU 200-EXIT.                    00630001
           PERFORM 300-PROCESS-PARA THRU 300-EXIT                       00640000
                              UNTIL WS-END-OF-FILE = 'Y'.               00650000
                                                                        00660000
           CLOSE LOAD-INFILE.                                           00670000
           GOBACK.                                                      00680012
                                                                        00690000
       100-INITIAL-PARA.                                                00700000
           MOVE 'N'    TO  WS-END-OF-FILE.                              00710000
                                                                        00720000
           OPEN  INPUT LOAD-INFILE.                                     00730000
           IF WS-IN-STATUS NOT = '00'                                   00740000
               DISPLAY 'ERROR IN 100-PARA'                              00750000
               DISPLAY 'FILE OPEN ERROR  STATUS CODE ' WS-IN-STATUS     00760000
               CALL WS-ABENDPGM                                         00770000
           END-IF.                                                      00780000
       100-EXIT. EXIT.                                                  00790000
                                                                        00800000
       200-GET-INPUT-PARA.                                              00810000
           READ LOAD-INFILE                                             00820000
              AT END                                                    00830000
                 MOVE 'Y'  TO WS-END-OF-FILE                            00840000
                 GO TO 200-EXIT.                                        00850000
                                                                        00860000
       200-EXIT. EXIT.                                                  00870000
                                                                        00880000
       300-PROCESS-PARA.                                                00890000
           EVALUATE TRUE                                                00891005
           WHEN SEGM-NAME = 'PARTSG01'                                  00892005
              PERFORM 310-ISRT-PARTSG01-PARA  THRU 310-EXIT             00900005
           WHEN SEGM-NAME = 'PRICSG05'                                  00910005
              PERFORM 320-ISRT-PRICSG05-PARA  THRU 320-EXIT             00920005
           WHEN SEGM-NAME = 'ADDLSG07'                                  00921005
              PERFORM 330-ISRT-ADDLSG07-PARA  THRU 330-EXIT             00930005
           WHEN SEGM-NAME = 'STCKSG10'                                  00930205
              PERFORM 340-ISRT-STCKSG10-PARA  THRU 340-EXIT             00931005
           WHEN SEGM-NAME = 'ORDSEG15'                                  00933005
              PERFORM 350-ISRT-ORDSEG15-PARA  THRU 350-EXIT             00940005
           WHEN OTHER                                                   00940105
              CONTINUE                                                  00940205
           END-EVALUATE.                                                00940305
           PERFORM 200-GET-INPUT-PARA   THRU 200-EXIT.                  00941000
       300-EXIT. EXIT.                                                  00950000
                                                                        00960000
       310-ISRT-PARTSG01-PARA.                                          00970000
           MOVE SEGMENT-IO-AREA    TO  PARTSG01-IO.                     00980005
           CALL 'CBLTDLI'  USING DLI-ISRT,                              00990000
                                 PARTPCB-MASK,                          01000000
                                 PARTSG01-IO,                           01010000
                                 UNQUAL-SSA-01,                         01020000
           IF STATUS-CODE = '  '                                        01030000
              DISPLAY 'ROOT SEGEMENT INSERT SUCCESFUL ' PART-NUM        01040000
              MOVE PART-NUM  TO  FIELD-VALUE-01                         01041003
           ELSE                                                         01050000
              DISPLAY 'ERROR IN ROOT SEG ' STATUS-CODE                  01060000
              CALL WS-ABENDPGM                                          01070000
           END-IF.                                                      01080000
                                                                        01090000
       310-EXIT. EXIT.                                                  01100000
                                                                        01101000
                                                                        01241000
       320-ISRT-PRICSG05-PARA.                                          01242000
           MOVE SEGMENT-IO-AREA    TO  PRICSG05-IO.                     01243005
           CALL 'CBLTDLI'  USING DLI-ISRT,                              01244000
                                 PARTPCB-MASK,                          01245000
                                 PRICSG05-IO,                           01246000
                                 PARTSG01-QUAL-SSA,                     01247000
                                 UNQUAL-SSA-05.                         01248000
           IF STATUS-CODE = '  '                                        01249000
              DISPLAY 'PRICE SEGEMENT INSERT SUCCESFUL '                01249109
              MOVE  PRICE-CODE   TO  FIELD-VALUE-05                     01249203
           ELSE                                                         01249300
              DISPLAY 'ERROR IN PRICE SEG ' STATUS-CODE                 01249400
              CALL WS-ABENDPGM                                          01249500
           END-IF.                                                      01249600
                                                                        01249700
       320-EXIT. EXIT.                                                  01249800
                                                                        01249900
       330-ISRT-ADDLSG07-PARA.                                          01250000
           MOVE SEGMENT-IO-AREA    TO  ADDLSG07-IO.                     01260005
           CALL 'CBLTDLI'  USING DLI-ISRT,                              01270000
                                 PARTPCB-MASK,                          01280000
                                 ADDLSG07-IO,                           01290000
                                 PARTSG01-QUAL-SSA,                     01300000
                                 PRICSG05-QUAL-SSA,                     01301000
                                 UNQUAL-SSA-07.                         01310000
           IF STATUS-CODE = '  '                                        01320000
              DISPLAY 'CHARGE SEGEMENT INSERT SUCCESFUL '               01330009
           ELSE                                                         01340000
              DISPLAY 'ERROR IN CHARGE SEG ' STATUS-CODE                01350006
              CALL WS-ABENDPGM                                          01360000
           END-IF.                                                      01370000
                                                                        01380000
       330-EXIT. EXIT.                                                  01390000
                                                                        01550000
       340-ISRT-STCKSG10-PARA.                                          01560000
           MOVE SEGMENT-IO-AREA    TO  STCKSG10-IO.                     01570005
           CALL 'CBLTDLI'  USING DLI-ISRT,                              01580000
                                 PARTPCB-MASK,                          01590000
                                 STCKSG10-IO,                           01600000
                                 PARTSG01-QUAL-SSA,                     01610000
                                 UNQUAL-SSA-10.                         01620000
           IF STATUS-CODE = '  '                                        01630000
              DISPLAY 'STOCK SEGEMENT INSERT SUCCESFUL '                01640009
           ELSE                                                         01650000
              DISPLAY 'ERROR IN STOCK SEG ' STATUS-CODE                 01660006
              CALL WS-ABENDPGM                                          01670000
           END-IF.                                                      01680000
                                                                        01690000
       340-EXIT. EXIT.                                                  01700000
                                                                        01701000
       350-ISRT-ORDSEG15-PARA.                                          01702000
           MOVE SEGMENT-IO-AREA    TO  ORDSEG15-IO.                     01703005
           CALL 'CBLTDLI'  USING DLI-ISRT,                              01704000
                                 PARTPCB-MASK,                          01705000
                                 ORDSEG15-IO,                           01706000
                                 PARTSG01-QUAL-SSA,                     01707000
                                 UNQUAL-SSA-15.                         01708000
           IF STATUS-CODE = '  '                                        01709000
              DISPLAY 'ORDER SEGEMENT INSERT SUCCESFUL '                01709109
           ELSE                                                         01709200
              DISPLAY 'ERROR IN ORDER SEG ' STATUS-CODE                 01709306
              CALL WS-ABENDPGM                                          01709400
           END-IF.                                                      01709500
                                                                        01709600
       350-EXIT. EXIT.                                                  01709700
                                                                        01710000
