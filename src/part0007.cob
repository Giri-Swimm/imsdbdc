000100 IEDENTIFICATION DIVISION.                                                     00010000
000200 PROGRAM-ID. PART0007.                                            00020039
000300 AUTHOR. ANIL POLSANI.                                            00030000
000400 DATE-WRITTEN. TODAY.                                             00040000
000510***************************************************************   00051040
000520*   THIS PROGRAM WILL SHOW HOW 'GU' CALL WILL WORK            *   00052040
000530*  PROGRAM IS TESTED WITH 3 CASES                             *   00053040
000531*  CASE -1 >>>  GU CALL WITH NO SSA             PART SEGMENT  *   00054040
000532*  CASE -2 >>>  GU CALL WITH UN-QUALIFIED SSA   PRICE SEGMENT *   00055040
000533*  CASE -3 >>>  GU CALL WITH QUALIFIED SSA      CHARGE SEGMENT*   00056040
000534*     3A. FOR ROOT                  - LEVEL-1 SEGMENT         *   00057040
000535*     3B. FOR ROOT + PARENT         - LEVEL-2 SEGMENT         *   00057040
000536*     3C. FOR ROOT + PARENT + CHILD - LEVEL-3 SEGMENT         *   00057040
000537*                                                             *   00058040
000540***************************************************************   00059040
000550 ENVIRONMENT DIVISION.                                            00060010
000560 INPUT-OUTPUT SECTION.                                            00061010
000570 FILE-CONTROL.                                                    00062010
000580                                                                  00063010
000590 DATA DIVISION.                                                   00070000
000600 WORKING-STORAGE SECTION.                                         00080000
000700 COPY PARTSG01.                                                   00081010
000800 COPY PRICSG05.                                                   00082010
000900 COPY ADDLSG07.                                                   00083010
001000 COPY STCKSG10.                                                   00084010
001100 COPY ORDSEG15.                                                   00085010
001200                                                                  00086010
001300 01 DLI-GN      PIC    X(04) VALUE 'GN  '.                        00090000
001400 01 DLI-GU      PIC    X(04) VALUE 'GU  '.                        00090110
001500 01 DLI-ISRT    PIC    X(04) VALUE 'ISRT'.                        00090210
001600 01 DLI-REPL    PIC    X(04) VALUE 'REPL'.                        00090310
001700 01 DLI-DLET    PIC    X(04) VALUE 'DLET'.                        00090410
001800                                                                  00090510
001900 01 UNQUAL-SSA-01     PIC   X(09)  VALUE 'PARTSG01 '.             00090610
002000 01 UNQUAL-SSA-05     PIC   X(09)  VALUE 'PRICSG05 '.             00090710
002100 01 UNQUAL-SSA-07     PIC   X(09)  VALUE 'ADDLSG07 '.             00090810
002200 01 UNQUAL-SSA-10     PIC   X(09)  VALUE 'STCKSG10 '.             00090910
002300 01 UNQUAL-SSA-15     PIC   X(09)  VALUE 'ORDSEG15 '.             00091010
002400                                                                  00092010
002500 01 PARTSG01-QUAL-SSA.                                            00093010
002600   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PARTSG01'.              00094010
002700   03 FILLER          PIC   X(01)  VALUE '('.                     00095010
002800   03 FIELD-NAME      PIC   X(08)  VALUE 'PARTNUMB'.              00096010
002900   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00097010
003000   03 FIELD-VALUE-01  PIC   X(05)  VALUE SPACE.                   00098010
003100   03 FILLER          PIC   X(01)  VALUE ')'.                     00099010
003200                                                                  00100010
003300 01 PRICSG05-QUAL-SSA.                                            00110010
003400   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PRICSG05'.              00110110
003500   03 FILLER          PIC   X(01)  VALUE '('.                     00110210
003600   03 FIELD-NAME      PIC   X(08)  VALUE 'PRICCODE'.              00110310
003700   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00110410
003800   03 FIELD-VALUE-05  PIC   X(04)  VALUE SPACE.                   00110528
003900   03 FILLER          PIC   X(01)  VALUE ')'.                     00110610
004000                                                                  00110710
004100 01 ADDLSG07-QUAL-SSA.                                            00110810
004200   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ADDLSG07'.              00110910
004300   03 FILLER          PIC   X(01)  VALUE '('.                     00111010
004400   03 FIELD-NAME      PIC   X(08)  VALUE 'CHRGCODE'.              00111110
004500   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00111210
004600   03 FIELD-VALUE-07  PIC   X(04)  VALUE SPACE.                   00111328
004700   03 FILLER          PIC   X(01)  VALUE ')'.                     00111410
004800                                                                  00111510
004900 01 STCKSG10-QUAL-SSA.                                            00112410
005000   03 SEGMENT-NAME    PIC   X(08)  VALUE 'STCKSG10'.              00112510
005100   03 FILLER          PIC   X(01)  VALUE '('.                     00112610
005200   03 FIELD-NAME      PIC   X(08)  VALUE 'LOCTCODE'.              00112710
005300   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00112810
005400   03 FIELD-VALUE-10  PIC   X(04)  VALUE SPACE.                   00112928
005500   03 FILLER          PIC   X(01)  VALUE ')'.                     00113010
005600                                                                  00113110
005700 01 ORDSEG15-QUAL-SSA.                                            00113237
005800   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ORDSEG15'.              00113337
005900   03 FILLER          PIC   X(01)  VALUE '('.                     00113437
006000   03 FIELD-NAME      PIC   X(08)  VALUE 'ORDERNUM'.              00113537
006100   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00113637
006200   03 FIELD-VALUE-15  PIC   X(04)  VALUE SPACE.                   00113737
006300   03 FILLER          PIC   X(01)  VALUE ')'.                     00113837
006400                                                                  00113937
006500 01  IO-AREA          PIC   X(24)  VALUE SPACE.                   00114010
006600 01  WS-ABENDPGM      PIC   X(08)  VALUE 'ABENDPMG'.              00120010
006700 LINKAGE SECTION.                                                 00130000
006800 01 PCB-MASK-1.                                                   00140000
006900    03 DATABASE-NAME     PIC   X(08).                             00150000
007000    03 DATABASE-LEVEL    PIC   X(02).                             00160000
007100    03 STATUS-CODE       PIC   X(02).                             00170000
007200    03 PROCOPT           PIC   X(04).                             00180000
007300    03 FILLER            PIC  S9(05) COMP.                        00190000
007400    03 SEG-NAME          PIC   X(08).                             00200000
007500    03 KEY-LENGTH        PIC  S9(05) COMP.                        00210000
007600    03 SEGMENT-NUM       PIC  S9(05) COMP.                        00220000
007700    03 CONCAT-KEY        PIC   X(22).                             00230028
007800 PROCEDURE DIVISION USING PCB-MASK-1.                             00250000
007900 000-MAIN-PARA.                                                   00260000
008000     DISPLAY 'PARTGUP2 STARTED'.                                  00270032
008100                                                                  00280000
008200*    DISPLAY 'GU CALL WITH NO SSA '                               00281036
008300*    PERFORM 100-CALL-GU-NOSSA  THRU 100-EXIT.                    00290036
008400                                                                  00291036
008500*    DISPLAY 'GU CALL WITH UNQUALIFIED SSA '                      00300036
008600*    PERFORM 200-CALL-GU-UNQSSA THRU 200-EXIT.                    00301036
008700                                                                  00301136
008800     DISPLAY 'GU CALL WITH QUALIFIED SSA '                        00301236
008900     PERFORM 300-CALL-GU-QSSA   THRU 300-EXIT.                    00302035
009000                                                                  00310000
009100     GOBACK.                                                      00320000
009200                                                                  00330000
009300 100-CALL-GU-NOSSA.                                               00340032
009400     INITIALIZE PARTSG01-IO.                                      00350032
009500     CALL 'CBLTDLI'  USING DLI-GU,                                00360032
009600                           PCB-MASK-1,                            00370000
009700                           PARTSG01-IO.                           00380032
009800                                                                  00390010
009900     IF STATUS-CODE = '  '                                        00391032
010000       DISPLAY SEG-NAME ' ALWAYS ROOT SEG ONLY '  PARTSG01-IO     00400032
010100     ELSE                                                         00400213
010200       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00401109
010300       CALL WS-ABENDPGM                                           00402009
010400     END-IF.                                                      00411032
010500 100-EXIT. EXIT.                                                  00420001
010600                                                                  00421029
010700 200-CALL-GU-UNQSSA.                                              00430034
010800     INITIALIZE PRICSG05-IO                                       00440030
010900     CALL 'CBLTDLI'  USING DLI-GN,                                00450029
011000                           PCB-MASK-1,                            00460029
011100                           PRICSG05-IO,                           00471030
011200                           UNQUAL-SSA-05.                         00472030
011300                                                                  00480029
011400     IF STATUS-CODE = '  '                                        00490029
011500       DISPLAY SEG-NAME ' PRICSG05 IO '  PRICSG05-IO              00530035
011600     ELSE                                                         00540029
011700       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00580029
011800       CALL WS-ABENDPGM                                           00590029
011900     END-IF.                                                      00610029
012000 200-EXIT. EXIT.                                                  00620029
012100                                                                  00621035
012200 300-CALL-GU-QSSA.                                                00630036
012300     MOVE 'PN00A'  TO   FIELD-VALUE-01 OF PARTSG01-QUAL-SSA       00630136
012400     PERFORM 310-GET-ONLY-PARTSG THRU 310-EXIT                    00631035
012500     MOVE 'PRA2'   TO   FIELD-VALUE-05 OF PRICSG05-QUAL-SSA       00631137
012600     PERFORM 320-GET-ONLY-PRICSG THRU 320-EXIT                    00632035
012700     MOVE 'CRA2'   TO   FIELD-VALUE-07 OF ADDLSG07-QUAL-SSA       00632136
012800     PERFORM 330-GET-ONLY-CHARSG THRU 330-EXIT.                   00633036
012900                                                                  00634035
013000 300-EXIT. EXIT.                                                  00635035
013100                                                                  00635136
013200 310-GET-ONLY-PARTSG.                                             00636036
013300     INITIALIZE PARTSG01-IO                                       00640036
013400     CALL 'CBLTDLI'  USING DLI-GN,                                00650035
013500                           PCB-MASK-1,                            00660035
013600                           PARTSG01-IO,                           00670036
013700                           PARTSG01-QUAL-SSA.                     00680036
013800                                                                  00690035
013900     IF STATUS-CODE = '  '                                        00700035
014000       DISPLAY ' PARTSG01 IO '  PARTSG01-IO                       00710036
014100     ELSE                                                         00720035
014200       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00730035
014300       CALL WS-ABENDPGM                                           00740035
014400     END-IF.                                                      00750035
014500 310-EXIT. EXIT.                                                  00760036
014600                                                                  00761036
014700 320-GET-ONLY-PRICSG.                                             00770036
014800     INITIALIZE PRICSG05-IO                                       00780037
014900     CALL 'CBLTDLI'  USING DLI-GN,                                00790036
015000                           PCB-MASK-1,                            00800036
015100                           PRICSG05-IO,                           00810036
015200                           PARTSG01-QUAL-SSA,                     00820036
015300                           PRICSG05-QUAL-SSA.                     00821036
015400                                                                  00830036
015500     IF STATUS-CODE = '  '                                        00840036
015600       DISPLAY ' PRICSG05 IO '  PRICSG05-IO                       00850036
015700     ELSE                                                         00860036
015800       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00870036
015900       CALL WS-ABENDPGM                                           00880036
016000     END-IF.                                                      00890036
016100 320-EXIT. EXIT.                                                  00900036
016200                                                                  00901036
016300 330-GET-ONLY-CHARSG.                                             00910036
016400     INITIALIZE ADDLSG07-IO                                       00920036
016500     CALL 'CBLTDLI'  USING DLI-GN,                                00930036
016600                           PCB-MASK-1,                            00940036
016700                           ADDLSG07-IO,                           00950036
016800                           PARTSG01-QUAL-SSA,                     00960036
016900                           PRICSG05-QUAL-SSA,                     00970036
017000                           ADDLSG07-QUAL-SSA.                     00971036
017100                                                                  00980036
017200     IF STATUS-CODE = '  '                                        00990036
017300       DISPLAY ' ADDLSG07 IO '  ADDLSG07-IO                       01000036
017400     ELSE                                                         01010036
017500       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         01020036
017600       CALL WS-ABENDPGM                                           01030036
017700     END-IF.                                                      01040036
017800 330-EXIT. EXIT.                                                  01050036
