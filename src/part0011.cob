000100 IDENTIFICATION DIVISION.                                                     00010000
000200 PROGRAM-ID. PART0011.                                            00020053
000300 AUTHOR. NAME.                                                    00030000
000400 DATE-WRITTEN. TODAY.                                             00040000
000510**************************************************************    00041049
000520*   THIS PROGRAM WILL SHOW HOW *REPL* CALL WILL WORK         *    00042053
000530*  PROGRAM IS TESTED WITH 3 CASES                            *    00043053
000540*PART  CASE -1 >>>  UPDATE ON ROOT SEGEMENT GU + GHU + REPL  *    00044060
000550*ORDER CASE -2 >>>  UPDATE ON ANY SEGEMENT ALL REC GHN + REPL*    00045060
000570*ADDLC CASE -3 >>>  UPDATE ON CHILD OF A PARENT GHNP + REPL  *    00046060
000580**************************************************************    00047049
000590                                                                  00050000
000600 ENVIRONMENT DIVISION.                                            00060010
000700 INPUT-OUTPUT SECTION.                                            00061010
000800 FILE-CONTROL.                                                    00062010
000900                                                                  00063010
001000 DATA DIVISION.                                                   00070000
001100 WORKING-STORAGE SECTION.                                         00080000
001200 COPY PARTSG01.                                                   00081010
001300 COPY PRICSG05.                                                   00082010
001400 COPY ADDLSG07.                                                   00083010
001500 COPY STCKSG10.                                                   00084010
001600 COPY ORDSEG15.                                                   00085010
001700                                                                  00086010
001800 01 DLI-GN      PIC    X(04) VALUE 'GN  '.                        00090000
001900 01 DLI-GU      PIC    X(04) VALUE 'GU  '.                        00090110
002000 01 DLI-GNP     PIC    X(04) VALUE 'GNP '.                        00090240
002001 01 DLI-GHN     PIC    X(04) VALUE 'GHN '.                        00090356
002002 01 DLI-GHU     PIC    X(04) VALUE 'GHU '.                        00090456
002003 01 DLI-GHNP    PIC    X(04) VALUE 'GHNP'.                        00090556
002100 01 DLI-ISRT    PIC    X(04) VALUE 'ISRT'.                        00090655
002200 01 DLI-REPL    PIC    X(04) VALUE 'REPL'.                        00090755
002300 01 DLI-DLET    PIC    X(04) VALUE 'DLET'.                        00090855
002310                                                                  00090960
002400 01 WS-PRICE-FOUND    PIC  X(01) VALUE SPACE.                     00091069
002410 01 WS-ROOT-FOUND     PIC  X(01) VALUE SPACE.                     00091168
002500 01 WS-END-OF-SEG     PIC  X(01) VALUE SPACE.                     00091268
002501                                                                  00091368
002502 01 UNQUAL-SSA-01     PIC   X(09)  VALUE 'PARTSG01 '.             00091468
002600 01 UNQUAL-SSA-05     PIC   X(09)  VALUE 'PRICSG05 '.             00091568
002700 01 UNQUAL-SSA-07     PIC   X(09)  VALUE 'ADDLSG07 '.             00091668
002800 01 UNQUAL-SSA-10     PIC   X(09)  VALUE 'STCKSG10 '.             00091768
002900 01 UNQUAL-SSA-15     PIC   X(09)  VALUE 'ORDSEG15 '.             00091868
003000                                                                  00092010
003100 01 PARTSG01-QUAL-SSA.                                            00093010
003200   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PARTSG01'.              00094010
003300   03 FILLER          PIC   X(01)  VALUE '('.                     00095010
003400   03 FIELD-NAME      PIC   X(08)  VALUE 'PARTNUMB'.              00096010
003500   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00097010
003600   03 FIELD-VALUE-01  PIC   X(05)  VALUE SPACE.                   00098010
003700   03 FILLER          PIC   X(01)  VALUE ')'.                     00099010
003800                                                                  00100010
003900 01 PRICSG05-QUAL-SSA.                                            00110010
004000   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PRICSG05'.              00110110
004100   03 FILLER          PIC   X(01)  VALUE '('.                     00110210
004200   03 FIELD-NAME      PIC   X(08)  VALUE 'PRICCODE'.              00110310
004300   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00110410
004400   03 FIELD-VALUE-05  PIC   X(04)  VALUE SPACE.                   00110528
004500   03 FILLER          PIC   X(01)  VALUE ')'.                     00110610
004600                                                                  00110710
004700 01 ADDLSG07-QUAL-SSA.                                            00110810
004800   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ADDLSG07'.              00110910
004900   03 FILLER          PIC   X(01)  VALUE '('.                     00111010
005000   03 FIELD-NAME      PIC   X(08)  VALUE 'CHRGCODE'.              00111110
005100   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00111210
005200   03 FIELD-VALUE-07  PIC   X(04)  VALUE SPACE.                   00111328
005300   03 FILLER          PIC   X(01)  VALUE ')'.                     00111410
005400                                                                  00111510
005500 01 STCKSG10-QUAL-SSA.                                            00112410
005600   03 SEGMENT-NAME    PIC   X(08)  VALUE 'STCKSG10'.              00112510
005700   03 FILLER          PIC   X(01)  VALUE '('.                     00112610
005800   03 FIELD-NAME      PIC   X(08)  VALUE 'LOCTCODE'.              00112710
005900   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00112810
006000   03 FIELD-VALUE-10  PIC   X(04)  VALUE SPACE.                   00112928
006100   03 FILLER          PIC   X(01)  VALUE ')'.                     00113010
006200                                                                  00113110
006300 01 ORDSEG15-QUAL-SSA.                                            00113237
006400   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ORDSEG15'.              00113337
006500   03 FILLER          PIC   X(01)  VALUE '('.                     00113437
006600   03 FIELD-NAME      PIC   X(08)  VALUE 'ORDERNUM'.              00113537
006700   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00113637
006800   03 FIELD-VALUE-15  PIC   X(04)  VALUE SPACE.                   00113737
006900   03 FILLER          PIC   X(01)  VALUE ')'.                     00113837
007000                                                                  00113937
007100 01  IO-AREA          PIC   X(24)  VALUE SPACE.                   00114010
007200 01  WS-ABENDPGM      PIC   X(08)  VALUE 'ABENDPMG'.              00120010
007300 LINKAGE SECTION.                                                 00130000
007400 01 PCB-MASK-1.                                                   00140000
007500    03 DATABASE-NAME     PIC   X(08).                             00150000
007600    03 DATABASE-LEVEL    PIC   X(02).                             00160000
007700    03 STATUS-CODE       PIC   X(02).                             00170000
007800    03 PROCOPT           PIC   X(04).                             00180000
007900    03 FILLER            PIC  S9(05) COMP.                        00190000
008000    03 SEG-NAME          PIC   X(08).                             00200000
008100    03 KEY-LENGTH        PIC  S9(05) COMP.                        00210000
008200    03 SEGMENT-NUM       PIC  S9(05) COMP.                        00220000
008300    03 CONCAT-KEY        PIC   X(22).                             00230028
008400 PROCEDURE DIVISION USING PCB-MASK-1.                             00250000
008500 000-MAIN-PARA.                                                   00260000
008600     DISPLAY 'PART0009 STARTED'.                                  00270047
008700     PERFORM 100-REPL-ROOT-PARA  THRU 100-EXIT.                   00302060
008701     PERFORM 200-REPL-SEGM-PARA  THRU 200-EXIT.                   00303068
008702*    PERFORM 300-REPL-CHILD-PARA THRU 300-EXIT.                   00304068
008800     GOBACK.                                                      00320000
008900                                                                  00330000
009000 100-REPL-ROOT-PARA.                                              00346060
009100     MOVE 'N'   TO  WS-ROOT-FOUND.                                00350053
009200     DISPLAY 'BEFORE UPDATE '                                     00351057
009300     PERFORM 110-GU-ROOT-PARA  THRU 110-EXIT                      00360053
009400     IF WS-ROOT-FOUND = 'Y'                                       00370053
009500         PERFORM 120-HOLD-REPL-PARA THRU 120-EXIT                 00380057
009600     END-IF.                                                      00410055
009700     DISPLAY 'AFTER UPDATE '                                      00420053
009800     PERFORM 110-GU-ROOT-PARA  THRU 110-EXIT.                     00430053
009900 100-EXIT. EXIT.                                                  00440053
010000                                                                  00450053
010100 110-GU-ROOT-PARA.                                                00460053
010200     INITIALIZE PARTSG01-IO.                                      00461055
010300     MOVE 'PN00B'  TO  FIELD-VALUE-01                             00470053
010400     CALL 'CBLTDLI'  USING DLI-GU,                                00480058
010500                           PCB-MASK-1,                            00490053
010600                           PARTSG01-IO,                           00500053
010700                           PARTSG01-QUAL-SSA.                     00510053
010800     IF STATUS-CODE = '  '                                        00520053
010900        MOVE  'Y'    TO  WS-ROOT-FOUND                            00530053
011000        DISPLAY 'PART ROOT DATA IS ' PARTSG01-IO                  00530153
011100     ELSE                                                         00531053
011200     IF STATUS-CODE = 'GE'                                        00532053
011300        MOVE 'N'     TO WS-ROOT-FOUND                             00550053
011400     ELSE                                                         00551053
011500        DISPLAY 'ERROR IN GU ROOT STATUS ' STATUS-CODE            00552058
011600        DISPLAY 'KEY IS  PART NUMBER ' FIELD-VALUE-01             00553053
011700        CALL WS-ABENDPGM                                          00554053
011800     END-IF                                                       00555053
011900     END-IF.                                                      00560053
012000                                                                  00570053
012100 110-EXIT. EXIT.                                                  00580053
012200                                                                  00590053
012300 120-HOLD-REPL-PARA.                                              00600053
012400     MOVE SPACE TO  PARTSG01-IO.                                  00610053
012500     CALL  'CBLTDLI'  USING DLI-GHU,                              00620056
012600                            PCB-MASK-1,                           00630053
012700                            PARTSG01-IO,                          00631053
012800                            PARTSG01-QUAL-SSA.                    00632053
012900     IF STATUS-CODE = '  '                                        00633053
013000         IF PART-ACTIVE  = 'N'                                    00633157
013100            MOVE  'Y'    TO PART-ACTIVE                           00633357
013200         ELSE                                                     00633457
013300            MOVE  'N'    TO PART-ACTIVE                           00633557
013400         END-IF                                                   00633757
013500        PERFORM 125-REPL-PARA   THRU 125-EXIT                     00635053
013600     ELSE                                                         00635253
013700     IF STATUS-CODE = 'GE'                                        00635353
013800        MOVE 'N'     TO WS-ROOT-FOUND                             00635453
013900     ELSE                                                         00635553
014000        DISPLAY 'ERROR IN GHU ROOT ' STATUS-CODE                  00635659
014100        DISPLAY 'KEY IS  PART NUMBER ' FIELD-VALUE-01             00635753
014200        CALL WS-ABENDPGM                                          00635853
014300     END-IF                                                       00635953
014400     END-IF.                                                      00636053
014500 120-EXIT. EXIT.                                                  00636253
014600                                                                  00636353
014700 125-REPL-PARA.                                                   00636453
014800     CALL 'CBLTDLI'   USING DLI-REPL,                             00636553
014900                            PCB-MASK-1,                           00636653
015000                            PARTSG01-IO.                          00636753
015001     IF STATUS-CODE = '  '                                        00636859
015002        DISPLAY 'UPDATE SUCCESSFUL'                               00636953
015003     ELSE                                                         00637053
015004        DISPLAY 'ERROR IN ROOT UPDATE ' STATUS-CODE               00637153
015005        CALL WS-ABENDPGM                                          00637256
015006     END-IF.                                                      00637353
015007 125-EXIT. EXIT.                                                  00637453
015008*****************************************************
015009 200-REPL-SEGM-PARA.                                              00338360
015010     DISPLAY 'BEFORE UPDATE '                                     00338460
015011     MOVE 'N'   TO WS-END-OF-SEG.                                 00338560
015012     PERFORM 210-GN-SEG-PARA  THRU 210-EXIT                       00338662
015013           UNTIL  WS-END-OF-SEG = 'Y'.                            00338760
015014                                                                  00338860
015015     MOVE 'N'   TO WS-END-OF-SEG.                                 00338965
015016     PERFORM 220-HOLD-REPL-SEG-PARA THRU 220-EXIT                 00339066
015017           UNTIL  WS-END-OF-SEG = 'Y'.                            00339160
015018                                                                  00339260
015019     DISPLAY 'AFTER  UPDATE '                                     00339360
015020     MOVE 'N'   TO WS-END-OF-SEG.                                 00339460
015021     PERFORM 210-GN-SEG-PARA  THRU 210-EXIT                       00339560
015022           UNTIL  WS-END-OF-SEG = 'Y'.                            00339660
015023                                                                  00339760
015024 200-EXIT. EXIT.                                                  00339860
015025                                                                  00339960
015026 210-GN-SEG-PARA.                                                 00340064
015027     INITIALIZE ORDSEG15-IO.                                      00340160
015028     CALL 'CBLTDLI'  USING  DLI-GN,                               00340260
015029                            PCB-MASK-1,                           00340360
015030                            ORDSEG15-IO,                          00340461
015031                            UNQUAL-SSA-15.                        00340560
015032     IF STATUS-CODE = ' '                                         00340660
015033        DISPLAY ' ORDER DATA IS ' ORDSEG15-IO                     00340760
015034     ELSE                                                         00340860
015035     IF STATUS-CODE = 'GE' OR 'GB'                                00340960
015036        DISPLAY 'END OF RECORD ' STATUS-CODE                      00341060
015037        MOVE 'Y'   TO WS-END-OF-SEG                               00341160
015038     ELSE                                                         00341260
015039        DISPLAY 'ERROR IN 200-GN PARA'                            00341360
015040        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00341460
015041        CALL WS-ABENDPGM                                          00341560
015042     END-IF.                                                      00341660
015043 210-EXIT. EXIT.                                                  00341760
015044                                                                  00341860
015045 220-HOLD-REPL-SEG-PARA.                                          00341963
015046     INITIALIZE ORDSEG15-IO                                       00342064
015047     CALL 'CBLTDLI'  USING DLI-GHN,                               00342160
015048                           PCB-MASK-1,                            00342260
015049                           ORDSEG15-IO,                           00342361
015050                           UNQUAL-SSA-15.                         00342460
015051     IF STATUS-CODE = SPACE                                       00342560
015052        IF ORDER-QTY > 16                                         00342667
015053           SUBTRACT 5 FROM ORDER-QTY                              00342760
015054        ELSE                                                      00342860
015055           ADD  5 TO ORDER-QTY                                    00342960
015056        END-IF                                                    00343060
015057        PERFORM 225-REPL-PARA THRU 225-EXIT                       00343160
015058     ELSE                                                         00343260
015059     IF STATUS-CODE = 'GE' OR 'GB'                                00343360
015060        DISPLAY 'END OF GHU '  STATUS-CODE                        00343460
015061        MOVE 'Y'   TO WS-END-OF-SEG                               00343560
015062     ELSE                                                         00343660
015063        DISPLAY 'ERROR IN 220-GHN PARA'                           00343760
015064        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00343860
015065        CALL WS-ABENDPGM                                          00343960
015066     END-IF                                                       00344060
015067     END-IF.                                                      00344160
015068 220-EXIT. EXIT.                                                  00344260
015069 225-REPL-PARA.                                                   00344363
015070     CALL 'CBLTDLI'  USING DLI-REPL,                              00344460
015071                           PCB-MASK-1,                            00344560
015072                           ORDSEG15-IO.                           00344661
015073     IF STATUS-CODE = SPACE                                       00344760
015074        DISPLAY 'ORDER UPDATED '                                  00344860
015075     ELSE                                                         00344960
015076        DISPLAY 'ERROR IN 225-REPL PARA'                          00345060
015077        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00345160
015078        CALL WS-ABENDPGM                                          00345260
015079     END-IF.                                                      00345460
015080 225-EXIT. EXIT.                                                  00345560
015090                                                                  00345660
015100*****************************************************
015143 300-REPL-CHILD-PARA.                                             00330168
015144     MOVE 'N'   TO  WS-PRICE-FOUND.                               00330268
015145     PERFORM 310-GU-PRICE-PARA THRU 310-EXIT                      00330368
015146                                                                  00330468
015147     IF WS-PRICE-FOUND  = 'Y'                                     00330569
015148        PERFORM  320-HOLD-REPL-CHARGE-PARA THRU 320-EXIT          00330668
015149     END-IF.                                                      00330768
015150                                                                  00330868
015160 300-EXIT. EXIT.                                                  00330968
015170                                                                  00331068
015180 310-GU-PRICE-PARA.                                               00331168
015190     INITIALIZE PRICSG05-IO.                                      00331268
015200     MOVE 'PN00A'  TO   FIELD-VALUE-01                            00331369
015300     MOVE 'PRA2'   TO   FIELD-VALUE-05.                           00331471
015400     CALL 'CBLTDLI'  USING DLI-GU,                                00331568
015500                           PCB-MASK-1,                            00331669
015600                           PRICSG05-IO,                           00331768
015700                           PARTSG01-QUAL-SSA,                     00331868
015800                           PRICSG05-QUAL-SSA.                     00331971
015900     IF STATUS-CODE = SPACE                                       00332068
016000        DISPLAY 'PRICE CODE FOUND ' PRICSG05-IO                   00332168
016100        MOVE 'Y'   TO  WS-PRICE-FOUND                             00332268
016200     ELSE                                                         00332368
016300     IF STATUS-CODE = 'GE'                                        00332468
016400        DISPLAY 'RECORD NOT FND' STATUS-CODE                      00332568
016500     ELSE                                                         00332668
016600        DISPLAY 'ERROR IN 310-GU PARA'                            00332768
016700        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00332868
016800        CALL WS-ABENDPGM                                          00332968
016900     END-IF                                                       00333068
017000     END-IF.                                                      00333168
017100                                                                  00333268
017200 310-EXIT. EXIT.                                                  00333368
017300                                                                  00333468
017400 320-HOLD-REPL-CHARGE-PARA.                                       00333568
017500     PERFORM 321-GHNP-CHARGE-PARA  THRU 321-EXIT                  00333768
017600               UNTIL WS-END-OF-SEG = 'Y'.                         00333868
017700                                                                  00333968
017800 320-EXIT. EXIT.                                                  00334068
017900                                                                  00334168
018000 321-GHNP-CHARGE-PARA.                                            00334268
018100     INITIALIZE ADDLSG07-IO.                                      00334368
018200     CALL 'CBLTDLI'   USING DLI-GHNP,                             00334568
018300                            PCB-MASK-1,                           00334668
018400                            ADDLSG07-IO,                          00334768
018500                            UNQUAL-SSA-07.                        00334968
018600     IF STATUS-CODE = ' '                                         00335068
018700        DISPLAY 'BEFORE REPL ADDL CHARGE IS ' ADDLSG07-IO         00335168
018800        IF SUR-CHARGE-AMT > 20                                    00335268
018900           SUBTRACT 5 FROM SUR-CHARGE-AMT                         00335368
019000        ELSE                                                      00335468
019100           ADD  5 TO SUR-CHARGE-AMT                               00335568
019200        END-IF                                                    00335668
019300        PERFORM 321-100-REPL-PARA THRU 321-100-EXIT               00335768
019400     ELSE                                                         00335868
019500     IF STATUS-CODE = 'GE' OR 'GB'                                00335968
019600        DISPLAY 'END OF RECORD ' STATUS-CODE                      00336068
019700        MOVE 'Y'   TO WS-END-OF-SEG                               00336168
019800     ELSE                                                         00336268
019900        DISPLAY 'ERROR IN 200-GN PARA'                            00336368
020000        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00336468
020100        CALL WS-ABENDPGM                                          00336568
020200     END-IF.                                                      00336668
020300 321-EXIT. EXIT.                                                  00336768
020400                                                                  00336868
020500 321-100-REPL-PARA.                                               00336968
020600     CALL 'CBLTDLI'  USING DLI-REPL,                              00337068
020700                           PCB-MASK-1,                            00337168
020800                           ADDLSG07-IO.                           00337269
020900     IF STATUS-CODE = SPACE                                       00337368
021000        DISPLAY 'ADDL CHAGE UPDATED '                             00337468
021100        DISPLAY 'ADDL CHANGE IS ' ADDLSG07-IO                     00337568
021200     ELSE                                                         00337668
021300        DISPLAY 'ERROR IN 321-100-REPL PARA'                      00337768
021400        DISPLAY 'STATUS CODE IS  ' STATUS-CODE                    00337868
021500        CALL WS-ABENDPGM                                          00337968
021600     END-IF.                                                      00338068
021700 321-100-EXIT. EXIT.                                              00338168
021800                                                                  00338268
