000100 IDENTIFICATION DIVISION.                                                     00010000
000200 PROGRAM-ID. PART0005.                                            00020034
000300 AUTHOR. ANIL POLSANI.                                            00030000
000400 DATE-WRITTEN. TODAY.                                             00040000
000510**************************************************************    00041036
000520*   THIS PROGRAM WILL SHOW HOW GN CALL WILL WORK             *    00042036
000530*  PROGRAM IS TESTED WITH 2 CASES                            *    00043036
000531*       CASE -1 >>>  GN CALL WITH NO SSA                     *    00044036
000534*       CASE -2 >>>  GN CALL WITH QUALIFIED SSA              *    00047036
000535*                                                            *    00048036
000540**************************************************************    00049036
000550                                                                  00050000
000560 ENVIRONMENT DIVISION.                                            00060010
000570 INPUT-OUTPUT SECTION.                                            00061010
000580 FILE-CONTROL.                                                    00062010
000590                                                                  00063010
000600 DATA DIVISION.                                                   00070000
000700 WORKING-STORAGE SECTION.                                         00080000
000800 COPY PARTSG01.                                                   00081010
000900 COPY PRICSG05.                                                   00082010
001000 COPY ADDLSG07.                                                   00083010
001100 COPY STCKSG10.                                                   00084010
001200 COPY ORDSEG15.                                                   00085010
001300                                                                  00086010
001400 01 DLI-GN      PIC    X(04) VALUE 'GN  '.                        00090000
001500 01 DLI-GU      PIC    X(04) VALUE 'GU  '.                        00090110
001600 01 DLI-ISRT    PIC    X(04) VALUE 'ISRT'.                        00090210
001700 01 DLI-REPL    PIC    X(04) VALUE 'REPL'.                        00090310
001800 01 DLI-DLET    PIC    X(04) VALUE 'DLET'.                        00090410
001900                                                                  00090510
002000 01 UNQUAL-SSA-01     PIC   X(09)  VALUE 'PARTSG01 '.             00090610
002100 01 UNQUAL-SSA-05     PIC   X(09)  VALUE 'PRICSG05 '.             00090710
002200 01 UNQUAL-SSA-07     PIC   X(09)  VALUE 'ADDLSG07 '.             00090810
002300 01 UNQUAL-SSA-10     PIC   X(09)  VALUE 'STCKSG10 '.             00090910
002400 01 UNQUAL-SSA-15     PIC   X(09)  VALUE 'ORDSEG15 '.             00091010
002500                                                                  00092010
002600 01 PARTSG01-QUAL-SSA.                                            00093010
002700   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PARTSG01'.              00094010
002800   03 FILLER          PIC   X(01)  VALUE '('.                     00095010
002900   03 FIELD-NAME      PIC   X(08)  VALUE 'PARTNUMB'.              00096010
003000   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00097010
003100   03 FIELD-VALUE-01  PIC   X(05)  VALUE SPACE.                   00098010
003200   03 FILLER          PIC   X(01)  VALUE ')'.                     00099010
003300                                                                  00100010
003400 01 PRICSG05-QUAL-SSA.                                            00110010
003500   03 SEGMENT-NAME    PIC   X(08)  VALUE 'PRICSG05'.              00110110
003600   03 FILLER          PIC   X(01)  VALUE '('.                     00110210
003700   03 FIELD-NAME      PIC   X(08)  VALUE 'PRICCODE'.              00110310
003800   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00110410
003900   03 FIELD-VALUE-05  PIC   X(04)  VALUE SPACE.                   00110528
004000   03 FILLER          PIC   X(01)  VALUE ')'.                     00110610
004100                                                                  00110710
004200 01 ADDLSG07-QUAL-SSA.                                            00110810
004300   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ADDLSG07'.              00110910
004400   03 FILLER          PIC   X(01)  VALUE '('.                     00111010
004500   03 FIELD-NAME      PIC   X(08)  VALUE 'CHRGCODE'.              00111110
004600   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00111210
004700   03 FIELD-VALUE-07  PIC   X(04)  VALUE SPACE.                   00111328
004800   03 FILLER          PIC   X(01)  VALUE ')'.                     00111410
004900                                                                  00111510
005000 01 ADDLSG07-QUAL-SSA.                                            00111610
005100   03 SEGMENT-NAME    PIC   X(08)  VALUE 'ADDLSG07'.              00111710
005200   03 FILLER          PIC   X(01)  VALUE '('.                     00111810
005300   03 FIELD-NAME      PIC   X(08)  VALUE 'CHRGCODE'.              00111910
005400   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00112010
005500   03 FIELD-VALUE-07  PIC   X(04)  VALUE SPACE.                   00112128
005600   03 FILLER          PIC   X(01)  VALUE ')'.                     00112210
005700                                                                  00112310
005800 01 STCKSG10-QUAL-SSA.                                            00112410
005900   03 SEGMENT-NAME    PIC   X(08)  VALUE 'STCKSG10'.              00112510
006000   03 FILLER          PIC   X(01)  VALUE '('.                     00112610
006100   03 FIELD-NAME      PIC   X(08)  VALUE 'LOCTCODE'.              00112710
006200   03 OPER            PIC   X(02)  VALUE 'EQ'.                    00112810
006300   03 FIELD-VALUE-10  PIC   X(04)  VALUE SPACE.                   00112928
006400   03 FILLER          PIC   X(01)  VALUE ')'.                     00113010
006500                                                                  00113110
006600 01  IO-AREA          PIC   X(24)  VALUE SPACE.                   00114010
006700 01  WS-ABENDPGM      PIC   X(08)  VALUE 'ABENDPMG'.              00120010
006800 LINKAGE SECTION.                                                 00130000
006900 01 PCB-MASK-1.                                                   00140000
007000    03 DATABASE-NAME     PIC   X(08).                             00150000
007100    03 DATABASE-LEVEL    PIC   X(02).                             00160000
007200    03 STATUS-CODE       PIC   X(02).                             00170000
007300    03 PROCOPT           PIC   X(04).                             00180000
007400    03 FILLER            PIC  S9(05) COMP.                        00190000
007500    03 SEG-NAME          PIC   X(08).                             00200000
007600    03 KEY-LENGTH        PIC  S9(05) COMP.                        00210000
007700    03 SEGMENT-NUM       PIC  S9(05) COMP.                        00220000
007800    03 CONCAT-KEY        PIC   X(22).                             00230028
007900 PROCEDURE DIVISION USING PCB-MASK-1.                             00250000
008000 000-MAIN-PARA.                                                   00260000
008100     DISPLAY 'PARTGNP1 STARTED'.                                  00270010
008200                                                                  00280000
008300*    PERFORM 100-CALL-GN-NOSSA  THRU 100-EXIT UNTIL               00290037
008400*                        STATUS-CODE = 'GB'.                      00300037
008500     PERFORM 200-CALL-GN-UNQSSA THRU 200-EXIT UNTIL               00301037
008600                         STATUS-CODE = 'GB'.                      00302037
008700                                                                  00310000
008800     GOBACK.                                                      00320000
008900                                                                  00330000
009000 100-CALL-GN-NOSSA.                                               00340010
009100     INITIALIZE IO-AREA.                                          00350010
009200     CALL 'CBLTDLI'  USING DLI-GN,                                00360000
009300                           PCB-MASK-1,                            00370000
009400                           IO-AREA.                               00380022
009500                                                                  00390010
009600     IF STATUS-CODE = '  '  OR 'GA' OR 'GK'                       00391024
009700       IF SEG-NAME  = 'PARTSG01'                                  00392026
009800          DISPLAY ' '                                             00393026
009900       END-IF                                                     00394026
010000       DISPLAY SEG-NAME ' DATA IS     '  IO-AREA                  00400027
010100     ELSE                                                         00400213
010200     IF STATUS-CODE = 'GB'                                        00400324
010300       CONTINUE                                                   00400413
010400     ELSE                                                         00401009
010500       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00401109
010600       CALL WS-ABENDPGM                                           00402009
010700     END-IF                                                       00411014
010800     END-IF.                                                      00412014
010900 100-EXIT. EXIT.                                                  00420001
011000                                                                  00421029
011100 200-CALL-GN-UNQSSA.                                              00430029
011200     INITIALIZE PRICSG05-IO                                       00440030
011300     CALL 'CBLTDLI'  USING DLI-GN,                                00450029
011400                           PCB-MASK-1,                            00460029
011500                           PRICSG05-IO,                           00471030
011600                           UNQUAL-SSA-05.                         00472030
011700                                                                  00480029
011800     IF STATUS-CODE = '  '                                        00490029
011900       DISPLAY SEG-NAME ' PARTSG01 IO '  PRICSG05-IO              00530030
012000     ELSE                                                         00540029
012100     IF STATUS-CODE = 'GB'                                        00550029
012200       CONTINUE                                                   00560029
012300     ELSE                                                         00570029
012400       DISPLAY 'PCB MASK IS '  PCB-MASK-1                         00580029
012500       CALL WS-ABENDPGM                                           00590029
012600     END-IF                                                       00600029
012700     END-IF.                                                      00610029
012800 200-EXIT. EXIT.                                                  00620029
