000100 IDENTIFICATION DIVISION.                                                     00010000
000200 PROGRAM-ID. PART0009.                                            00020041
000300 AUTHOR. NAME.                                                    00030000
000400 DATE-WRITTEN. TODAY.                                             00040000
000510**************************************************************    00041049
000520*   THIS PROGRAM WILL SHOW HOW *GNP* CALL WILL WORK          *    00042049
000530*  PROGRAM IS TESTED WITH 2 CASES                            *    00043049
000540*      CASE -1 >>>  GU CALL ON ROOT && GNP ON PARENT         *    00044049
000550*      CASE -2 >>>  GU CALL ON ROOT + PARENT && GNP ON CHILD *    00045049
000570*                                                            *    00046049
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
002100 01 DLI-ISRT    PIC    X(04) VALUE 'ISRT'.                        00090339
002200 01 DLI-REPL    PIC    X(04) VALUE 'REPL'.                        00090439
002300 01 DLI-DLET    PIC    X(04) VALUE 'DLET'.                        00090539
002400                                                                  00090639
002500 01 UNQUAL-SSA-01     PIC   X(09)  VALUE 'PARTSG01 '.             00090739
002600 01 UNQUAL-SSA-05     PIC   X(09)  VALUE 'PRICSG05 '.             00090839
002700 01 UNQUAL-SSA-07     PIC   X(09)  VALUE 'ADDLSG07 '.             00090939
002800 01 UNQUAL-SSA-10     PIC   X(09)  VALUE 'STCKSG10 '.             00091039
002900 01 UNQUAL-SSA-15     PIC   X(09)  VALUE 'ORDSEG15 '.             00091139
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
008700     PERFORM 100-CALL-GU-QSSA   THRU 100-EXIT.                    00302038
008800     GOBACK.                                                      00320000
008900                                                                  00330000
009000 100-CALL-GU-QSSA.                                                00630038
009100*    MOVE 'PN00A'  TO   FIELD-VALUE-01 OF PARTSG01-QUAL-SSA       00630152
009200*    PERFORM 110-GU-PART-GNP-PRICE THRU 110-EXIT.                 00631052
009300     MOVE 'PRA2'   TO   FIELD-VALUE-05 OF PRICSG05-QUAL-SSA.      00631152
009400     PERFORM 120-GU-PART-PRICE-GNP-CHARGE THRU 120-EXIT.          00632052
009500                                                                  00634035
009600 100-EXIT. EXIT.                                                  00635038
009700                                                                  00635136
009800 110-GU-PART-GNP-PRICE.                                           00636038
009900     INITIALIZE PARTSG01-IO                                       00640036
010000     CALL 'CBLTDLI'  USING DLI-GU,                                00650050
010100                           PCB-MASK-1,                            00660035
010200                           PARTSG01-IO,                           00670036
010300                           PARTSG01-QUAL-SSA.                     00680036
010400                                                                  00690035
010500     IF STATUS-CODE = '  '                                        00700035
010600       DISPLAY ' PART AS PARENT '  PARTSG01-IO                    00710048
010700       PERFORM 115-GNP-PRICE-PARA THRU 115-EXIT UNTIL             00711045
010800                                 STATUS-CODE = 'GE'               00712043
010900     ELSE                                                         00720035
011000       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00730035
011100       CALL WS-ABENDPGM                                           00740035
011200     END-IF.                                                      00750035
011300 110-EXIT. EXIT.                                                  00760038
011400                                                                  00761036
011500 115-GNP-PRICE-PARA.                                              00762045
011600     INITIALIZE PRICSG05-IO                                       00762138
011700     CALL 'CBLTDLI'  USING DLI-GNP,                               00762238
011800                           PCB-MASK-1,                            00762338
011900                           PRICSG05-IO,                           00762438
012000                           UNQUAL-SSA-05.                         00762638
012100                                                                  00762738
012200     IF STATUS-CODE = '  '                                        00762838
012300       DISPLAY ' PRICSG05 IO '  PRICSG05-IO                       00762938
012400     ELSE                                                         00763044
012500     IF STATUS-CODE = 'GE'                                        00763144
012600       DISPLAY 'END OF SEG DATA FOR THAT PARENT'                  00763244
012700     ELSE                                                         00763338
012800       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00763438
012900       CALL WS-ABENDPGM                                           00763538
013000     END-IF.                                                      00763638
013100 115-EXIT. EXIT.                                                  00764045
013200                                                                  00765045
013300 120-GU-PART-PRICE-GNP-CHARGE.                                    00770045
013400     INITIALIZE PRICSG05-IO                                       00780037
013500     CALL 'CBLTDLI'  USING DLI-GN,                                00790036
013600                           PCB-MASK-1,                            00800036
013700                           PRICSG05-IO,                           00810036
013800                           PARTSG01-QUAL-SSA,                     00820036
013900                           PRICSG05-QUAL-SSA.                     00821036
014000                                                                  00830036
014100     IF STATUS-CODE = '  '                                        00840036
014200       DISPLAY ' PRICE AS PARENT '  PRICSG05-IO                   00840147
014300       PERFORM 125-GNP-CHARGE-PARA THRU 125-EXIT UNTIL            00841045
014400                                 STATUS-CODE = 'GE'               00842045
014500     ELSE                                                         00851042
014600     IF STATUS-CODE = 'GE'                                        00852042
014700        CONTINUE                                                  00853042
014800     ELSE                                                         00860036
014900       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00870036
015000       CALL WS-ABENDPGM                                           00880036
015100     END-IF.                                                      00890036
015200 120-EXIT. EXIT.                                                  00900045
015300                                                                  00901036
015400 125-GNP-CHARGE-PARA.                                             00902045
015500     INITIALIZE ADDLSG07-IO                                       00903045
015600     CALL 'CBLTDLI'  USING DLI-GNP,                               00904045
015700                           PCB-MASK-1,                            00905045
015800                           ADDLSG07-IO,                           00906045
015900                           UNQUAL-SSA-07.                         00907045
016000                                                                  00908045
016100     IF STATUS-CODE = '  '                                        00909045
016200       DISPLAY ' ADDLSG07 IO '  ADDLSG07-IO                       00910045
016300     ELSE                                                         00920045
016400     IF STATUS-CODE = 'GE'                                        00930045
016500       DISPLAY 'END OF SEG DATA FOR THAT PARENT'                  00940045
016600     ELSE                                                         00950045
016700       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00960045
016800       CALL WS-ABENDPGM                                           00970045
016900     END-IF.                                                      00980045
017000 125-EXIT. EXIT.                                                  00990045
