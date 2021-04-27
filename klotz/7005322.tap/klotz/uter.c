IBM Terminal Simulator
----------------------

These programs implement a terminal simulator for the IBM Personal
Computer, which works well at least with UNIX systems.  The program is
invoked by typing "TERM".  The main part of the program is written in
BASIC, with a small assembly language program used to translate BS
into GS.

FEATURES:
   Upload and download, and bi-directional block (8-bit data) transfers.
   Uses a termcap, to work with "vi", "rogue", etc.
   Easily modified to include YOUR requirements, too.
   It is somewhat friendly.
   Seems to work pretty damn good.

This program uses ^A to allow access to its features.  For instance,
type ^A^C to exit the terminal simulator. When ^A is typed, a single
line "menu" of choices will be displayed.

A description of the sources follows:
1. TERMBASC.BAT shows how to compile, assemble and link the IBM
   programs together.
2. TERM.BAS is the main part of the code.
3. COMXLAT.ASM is the little assembly language "auxiliary" routine.
4. IBMLD is a shell script useful for up/downloading code.
5. BLK.C is the UNIX side source for doing block transfers.
6. TERMCAP is required for correct operation of "vi", and other
   UNIX-side programs.

Other info: to do a regular (non-block mode) download,
   type "ibmld unixfilename", but do NOT hit <CR>. TERM will send
   the carriage return when it's ready.  When the download is done,
   hit ^C to abort ibmld -- you can tell by watching your disk access
   light.  Sorry, UNIX does not tell me when it's done!
The block size can be changed by typing ^Az. The block size defaults
   to 128.
If you want to get a copy of this stuff on floppy disk, send a disk to

   Charles Perkins
   Tektronix M.S. 50-383
   PO Box 500
   Beaverton, Oregon  97077
   (hplabs!hao!menlo70!sytek!zehntel!teklabs!charliep@Berkeley)

I will be happy to reasonably support this software.  I intended that
most people would be able to make their own modifications wherever
they might be needed.  I know it's modular, because it has modulated
quite a bit since I started writing it!


Now, for the sources:

-----------------------------------------------------------------------
"TERMBASC.BAT"
-----------------------------------------------------------------------

MASM COMXLAT;
BASCOM TERM/O/V/X/C:1024;
LINKB TERM+COMXLAT+IBMCOM,,,BASCOM.LIB;
TERM

-----------------------------------------------------------------------
"TERM.BAS"
-----------------------------------------------------------------------

10 REM	^A from the keyboard is the escape character.
30 REM Setup
40	WIDTH 80	:SCREEN 0,0,0,0 :KEY OFF
50	KEY(11) ON	:KEY(12) ON	:KEY(13) ON	:KEY(14) ON
60	CLOSE           :DEFINT A-Z     :FALSE=0	:TRUE=NOT FALSE
70	NUL$=CHR$(0)	:SOH$=CHR$(1)	:STX$=CHR$(2)	:ETX$=CHR$(3)
80	EOT$=CHR$(4)	:ACK$=CHR$(6)	:BS$=CHR$(8)	:LF$=CHR$(10)
90	CR$=CHR$(13)	:XON$=CHR$(17)	:XOFF$=CHR$(19)	:NAK$=CHR$(21)
100	ETB$=CHR$(23)	:ESC$=CHR$(27)	:CUB$=CHR$(29)	:GS$=CHR$(29)
110	ESCSEEN=FALSE	:ESCCASE=1
120	BLSIZE = 128
130     HALF=128	:RECSIZE = 128	:ERRCNT = 0	:ERRLIMIT = 5
140	DIM ESCCHARS$(3) :ESCCHARS$(1)=ESC$ :ESCCHARS$(2)=CR$ :ESCCHARS$(3)="HA"
150	ON ERROR GOTO 1860
160	ON KEY(11) GOSUB 2450
170	ON KEY(12) GOSUB 2480
180	ON KEY(13) GOSUB 2510
190	ON KEY(14) GOSUB 2540
200	INPUT "Baud rate (default: 2400)";A$
210	IF A$="" THEN A$="2400"
220	A$ = "COM1:"+A$+",N,8,1,CS,DS"
230	OPEN A$ AS #1
240	LOCATE ,,1
250	PAUSE=FALSE
260 LOGGING = FALSE
270 REM	Start of main program
280	IF EOF(1) THEN 350
290	     INBUFLEN = LOC(1)
300	     IF INBUFLEN >= HALF THEN PRINT#1,USING"&";XOFF$;	:PAUSE=TRUE
310	     A$=INPUT$(INBUFLEN,#1)
330	     CALL COMXLAT(A$,ESCFLAG)
340	     IF (ESCFLAG OR ESCSEEN) THEN GOSUB 2170 ELSE PRINT USING"&";A$;
350	B$=INKEY$
360	IF B$=SOH$ THEN GOSUB 410 ELSE IF B$<>"" THEN PRINT #1,B$;
370	IF PAUSE THEN	PAUSE=FALSE	:PRINT #1,XON$;
380	LOCATE ,,1,12,13
390	GOTO 280
400 REM Command level processing (Host machine doesn't see these keystrokes)
410     PRINT
420	PRINT "s(end),r(ecv),d(ir),l(ist file),E(rase),S(end blocks),R(ecv blocks),^C(quit)"
430	PRINT "==> CMD: ";
440	B$=INKEY$
450     IF B$="" THEN 440
460	IF B$ = ETX$ THEN END
470	PRINT USING"&";B$
480	IF (B$ = "s") THEN GOSUB 590	:RETURN
490     IF (B$ = "r") THEN GOSUB 920	:RETURN
500	IF (B$ = "S") THEN GOSUB 1110	:RETURN
510	IF (B$ = "R") THEN GOSUB 1340	:RETURN
520	IF (B$ = "z") THEN INPUT "What is the new block size";BLSIZE :RETURN
530	IF (B$ = "D") OR (B$ = "d") THEN FILES		:RETURN
540	IF (B$ = "l") THEN GOSUB 1650	:RETURN
550	IF (B$ = "E") THEN GOSUB 1820	:RETURN
580	RETURN
590 REM upload routine, with ^S/^Q (XON$/XOFF$) flow control.
600	INPUT "Name of file to upload data from";FN$
610	IF FN$="" THEN RETURN
620	OPEN FN$ FOR INPUT AS #3
630	IF EOF(3) THEN GOTO 900
640	FOR I=1 TO (((LOF(3)-1)/RECSIZE)+1)
650		IF EOF(1) THEN GOTO 710
660			INBUFLEN = LOC(1)
670			A$=INPUT$(INBUFLEN,1)
680			CALL COMXLAT(A$,ESCFLAG)
690			GOSUB 2100
700			PRINT USING"&";A$;
710		A$ = INPUT$(RECSIZE,3)
720		CALL COMXLAT(A$,ESCFLAG)
730		INBUFLEN = RECSIZE
740		ESCCASE=2
750		GOSUB 2170
760		ESCCASE=1
770		IF EOF(1) THEN GOTO 880
780			A$ = INPUT$(1,1)
790			IF A$ <> XOFF$ THEN PRINT USING "&";A$; :GOTO 880
800			WHILE A$ <> XON$
810			IF EOF(1) THEN 870
820				A$=INPUT$(1,1)
830				CALL COMXLAT(A$,ESCFLAG)
840				INBUFLEN = 1
850				GOSUB 2100
860				PRINT USING"&";A$;
870			WEND
880	NEXT I
890	PRINT#1,USING"&";CR$+EOT$;
900	CLOSE #3
910	RETURN
920 REM download routine, with ^S/^Q (XON$/XOFF$) flow control
930 REM         NOTE: download will terminate when user types ^C (=ETX$)
940     INPUT "Name of file to download data into";FN$
950	IF FN$="" THEN RETURN
960     OPEN FN$ FOR OUTPUT AS #3
970	PRINT#1,USING"&";CR$;
980     DONE = FALSE
990     WHILE NOT DONE
1000             B$ = INKEY$
1010             IF B$=ETX$ THEN DONE=TRUE :GOTO 1030
1020		IF B$<>"" THEN PRINT#1,USING"&";B$;
1030             IF EOF(1) THEN GOTO 1080
1040             IF LOC(1) > HALF THEN PRINT#1,USING"&";XOFF$ : PAUSE = TRUE
1050             B$ = INPUT$(LOC(1),1)
1060             PRINT#3,USING"&";B$;
1070             IF PAUSE THEN PRINT#1,USING"&";XON$;
1080     WEND
1090     CLOSE #3
1100     RETURN
1110  REM  Block Transfer transmission from file FN$
1120	INPUT "Name of file to transmit block data from";FN$
1130	IF FN$="" THEN RETURN
1140	OPEN FN$ FOR INPUT AS #3
1150	WHILE NOT EOF(3)
1160		PRINT#1,USING"&";STX$;
1170		X = BLSIZE
1180		CKSUM = 0
1190		CKSUM2 = 0
1200		WHILE (NOT EOF(3)) AND (X > 0)
1210			X = X-1
1220			A$ = INPUT$(1,3)
1230			GOSUB 2050
1240			PRINT#1,USING"&";A$;
1250		WEND
1260		PRINT#1,STRING$(X,NUL$)+ETB$;
1270		PRINT#1,USING"&";CHR$(CKSUM)+CHR$(CKSUM2);
1280		GOSUB 2000
1290		IF A$<>ACK$ THEN PRINT "Bad block transmission reported."
1300	WEND
1310	PRINT#1,USING"&";ETX$;
1320	CLOSE #3
1330	RETURN
1340 REM  Block Transfer reception into file FN$
1350	INPUT "Name of file to load blocks of data into";FN$
1360	IF FN$="" THEN RETURN
1370	OPEN FN$ FOR OUTPUT AS #3
1380 REM	Provide CR for line oriented UNIX command interpreter.
1390	PRINT#1,USING"&";CR$;
1400 REM	UNIX echoes the next two characters for the CR$ just sent.
1410	GOSUB 2000
1420	GOSUB 2000
1430 REM	Now the real block transfer protocol starts.
1440	GOSUB 2000
1450	IF A$ = ETX$ THEN CLOSE #3 :RETURN
1460	IF A$ = STX$ GOTO 1480
1470	PRINT "Bad Block header received: "+A$ :GOTO 1440
1480	CKSUM  = 0
1490	CKSUM2 = 0
1500	FOR I=1 TO BLSIZE
1510		GOSUB 2000
1520		PRINT#3,USING"&";A$;
1530		GOSUB 2050
1540	NEXT I
1550	GOSUB 2000
1560	IF A$<>ETB$ THEN PRINT "Bad block trailer received: "+A$
1570	GOSUB 2000
1580	CKSUM3 = ASC(A$)
1590	GOSUB 2000
1600	CKSUM4 = ASC(A$)
1610	IF CKSUM=CKSUM3 AND CKSUM2=CKSUM4 THEN PRINT#1,USING"&";ACK$;:GOTO 1440
1620	PRINT#1,USING"&";NAK$;
1630	PRINT "Checksum error: bad block transmitted."
1640	GOTO 1440
1650 REM	List a local file
1660	INPUT "Name of file to list";FN$
1670	IF FN$="" THEN RETURN
1680	OPEN FN$ FOR INPUT AS #3
1690	FOR I=1 TO (((LOF(3)-1)/RECSIZE)+1)
1700		INBUFLEN = RECSIZE
1710		A$ = INPUT$(RECSIZE,3)
1720		CALL COMXLAT(A$,ESCFLAG)
1730		ESCCASE = 3
1740		GOSUB 2170
1750		ESCCASE = 1
1760		A$ = INKEY$
1770		IF A$ = ETX$ THEN RETURN
1780		IF A$ <> "" THEN PRINT#1,USING"&";A$;
1790	NEXT I
1800	CLOSE #3
1810	RETURN
1820 REM	Erase a local file
1830	INPUT "Name of file to erase";FN$
1840	IF FN$<>"" THEN KILL FN$
1850	RETURN
1860 REM error routine
1870	ERRCNT = ERRCNT + 1
1880	IF ERRCNT <= ERRLIMIT THEN GOTO 1970
1890	PRINT "error",ERR,"occured in line",ERL
1900	INPUT "Want to stop (type N if no)";B$
1910	CH$ = LEFT$(B$,1)
1920	IF (CH$="N") OR (CH$="n") GOTO 1950
1940	CLOSE #3 :GOTO 270
1950	ERRCNT = 0
1960	RESUME
1970	IF ERR<>57 THEN PRINT "error",ERR,"occured in line",ERL
1980	RESUME
1990 '
2000 REM	Subroutine to get the next character from the host.
2010	IF EOF(1) GOTO 2000
2020	A$ = INPUT$(1,1)
2030	RETURN
2040 '
2050 REM	Increment the checksum variables
2060	CKSUM = CKSUM + ASC(A$)
2070	IF CKSUM>255 THEN CKSUM2=CKSUM2+1 : CKSUM=CKSUM-256
2080	RETURN
2090 '
2100 REM	Adjust string length after calls to COMXLAT.
2110	IF ESCFLAG THEN INBUFLEN=INBUFLEN-ESCFLAG+1
2120 REM	ESCFLAG is #Rubout's+1 (If #Rubout's>0 or ESCCHAR found in A$)
2130 REM	ESCFLAG=0 ==> #Rubout's=0  and  NO ESCCHAR found in A$.
2140	A$=LEFT$(A$,INBUFLEN)
2150	RETURN
2160 '
2170 REM	Unusual character processing for "ibmpc" termcap entry.
2180	GOSUB 2100
2190	IF INBUFLEN=0 THEN RETURN
2200	ESCCHAR$ = ESCCHARS$(ESCCASE)
2210	FOR J=1 TO INBUFLEN
2220		B$=MID$(A$,J,1)
2230		IF (ESCSEEN) GOTO 2310
2240		   IF (B$=ESCCHAR$) THEN ESCSEEN=TRUE		:GOTO 2420
2250		   IF ESCCASE=2 THEN PRINT#1,USING"&";B$; 	:GOTO 2410
2260		   IF (B$<>LF$) GOTO 2290
2270		     IF CSRLIN<24 THEN LOCATE CSRLIN+1,POS(0),1	:GOTO 2410
2280		     PRINT CR$+SPACE$(POS(0)-1);		:GOTO 2410
2290		   IF (B$=CR$) THEN LOCATE CSRLIN,1,1		:GOTO 2410
2300		   PRINT USING"&";B$;				:GOTO 2410
2310 REM Escape char seen -- Processing for various escape sequences follow
2320		IF ESCCASE<>1 GOTO 2390
2330		   IF (B$="H") THEN LOCATE CSRLIN-1,POS(O),1	:GOTO 2410
2340		   IF (B$="P") THEN LOCATE CSRLIN+1,POS(O),1,1	:GOTO 2410
2350		   IF (B$="G") THEN LOCATE 1,1,1		:GOTO 2410
2360		   IF (B$="M") THEN LOCATE CSRLIN,POS(O)+1,1	:GOTO 2410
2370		   IF (B$="K") THEN LOCATE CSRLIN,POS(O)-1,1	:GOTO 2410
2380		   PRINT USING"&";B$;
2390		IF ESCCASE<>2 GOTO 2410 'No escape processing for ESCCASE=3
2400		   PRINT#1,USING"&";B$;
2410		ESCSEEN = FALSE
2420	NEXT J
2430	RETURN
2440 REM KEY(11)
2450		PRINT#1,USING"&";ESC$+"H";
2460		RETURN
2470 REM KEY(12)
2480		PRINT#1,USING"&";ESC$+"K";
2490		RETURN
2500 REM KEY(13)
2510		PRINT#1,USING"&";ESC$+"M";
2520		RETURN
2530 REM KEY(14)
2540		PRINT#1,USING"&";ESC$+"P";
2550		RETURN
2560 REM
2570 REM Terminal simulator for the IBM Personal Computer, to be used with
2580 REM Unix or Cyber NOS operating systems.
2590 REM			Written by Charles Perkins, October 1982.
2600 REM




-----------------------------------------------------------------------
"COMXLAT.ASM"
-----------------------------------------------------------------------

	NAME	COMXLAT
;
; This program works with TERM.BAS.  CR & LF are flagged; Rubout is eliminated,
; and BS is changed to a GS (ASCII 1DH).
;

BS	EQU	08H
LF	EQU	0AH
CR	EQU	0DH
ESC	EQU	1BH
GS	EQU	1DH
SPACE	EQU	20H
RUBOUT	EQU	7FH

CSEG	SEGMENT	PUBLIC	'CODE'
	ASSUME CS:CSEG
	PUBLIC	COMXLAT
COMXLAT	PROC	FAR
	PUSH	BP
	MOV	BP,SP
	XOR	BH,BH		;Initialize value for "Found ESC, CR, or LF".
	XOR	AH,AH		;Initialize value for "# of Rubouts".
	MOV	SI,[BP]+8
	MOV	CX,[SI]		;Length of the string parameter.
	MOV	SI,[SI]+2	;Pointer to the string.
	DEC	SI
	INC	CX		;Prepare for the loop.
XLATLP:	INC	SI
	DEC	CX
	JLE	XLATND
	MOV	AL,[SI]		;Get next string character.
	AND	AL,07FH
	MOV	[SI],AL
	CMP	AL,LF
	JNZ	TRYCR
	MOV	BH,1
	JMP	XLATLP
TRYCR:	CMP	AL,CR
	JNZ	TRYBS
	MOV	BH,1
	JMP	XLATLP
TRYBS:	CMP	AL,BS
	JNZ	TRYRB
	MOV	BYTE PTR[SI],GS
	JMP	XLATLP
TRYRB:	CMP	AL,RUBOUT
	JNZ	TRYESC
	CALL	STRFOLD
	JMP	XLATLP
TRYESC:	CMP	AL,ESC
	JNZ	XLATLP
	MOV	BH,1
	JMP	XLATLP
XLATND:	MOV	SI,[BP]+6
	OR	BH,AH		;"Found ESC, CR, or LF" or "# of Rubouts<>0".
	JZ	RETCNT
	INC	AH
RETCNT:	MOV	AL,AH
	MOV	AH,0
	MOV	[SI],AX
	POP	BP
	RET	4
COMXLAT	ENDP

STRFOLD	PROC	NEAR
	PUSH	SI
	PUSH	CX
FOLDLP:	OR	CX,CX
	JZ	FOLDND
	MOV	AL,[SI]+1
	AND	AL,07FH
	MOV	[SI],AL
	DEC	CX
	INC	SI
	JMP	FOLDLP
FOLDND:	INC	AH		;Found a Rubout.
	POP	CX
	DEC	CX
	POP	SI
	RET
STRFOLD	ENDP

CSEG	ENDS
	END


-----------------------------------------------------------------------
"IBMLD"
-----------------------------------------------------------------------

stty -echo
case $# in
	1) cat > $1;;
	2) case $1 in
		-d) cat $2;;
		*) stty raw
		   blk $*
		   stty -raw;;
	   esac;;
	*) stty raw
	   blk $*
	   stty -raw ;;
esac
stty echo


-----------------------------------------------------------------------
"BLK.C"    (to do block transfers to UNIX)
-----------------------------------------------------------------------

#include <stdio.h>

#define NUL '\000'
#define STX '\002'
#define ETX '\003'
#define ACK '\006'
#define NAK '\021'
#define ETB '\027'

int upload, dnload, blksize, cksum, cksum2;
char ch;
FILE *fopen(), *fp, *errlog;

#define TRUE   1
#define FALSE  0

main(argc, argv)
int argc;
char *argv[];
{
	errlog = fopen ("errlog","w");

	upload = TRUE;
	dnload = FALSE;
	blksize = 128;
	while ((argc>0) && argv[1][0] == '-') switch (argv++[1][1]) {
		case 'b': argc -= 2;
			  sscanf (argv++[1],"%d",&blksize);
			  break;
		case 'u':	argc--;
				upload = TRUE;
				dnload = FALSE;
				break;
		case 'd':	argc--;
				upload = FALSE;
				dnload = TRUE;
				break;
		default: argc--;
			fprintf(errlog,
		   "Bad argument in command line: %c", argv[0][1]);
		}

	if (upload) {
		fp = fopen (argv[1], "w");
		upblocks();  }
	else if (dnload) {
		fp = fopen (argv[1], "r");
		dnblocks(); }
	fclose (fp);
	fclose (errlog);
}

upblocks()
{
	register int i;

	while ((ch=getchar())!=ETX)
	if (ch!=STX) fprintf (errlog,"Bad header character: %c\n",ch);
	else {
		for (cksum=i=0; i++ < blksize; cksum += ch)
			putc (ch=getchar(), fp);
		if ((ch=getchar()) != ETB) fprintf (errlog,
			"Bad block trailer character -- %c\n",ch);
		cksum2 = getchar();
		cksum2 += 256*getchar();
		if (cksum != cksum2) {
			fprintf(errlog,
			"Checksums unequal: %x != %x\n",cksum,cksum2);
			putchar (NAK); }
		else {
/*			fprintf (errlog,
			"Checksums agree: cksum=%x\n",cksum);*/
			putchar (ACK);
		}
	     }
}

dnblocks()
{
	char *buffer;
	register int i;
	int nitems;

	buffer = (char *) malloc(blksize+2);
	while ((nitems = fread (buffer, 1, blksize, fp))==blksize)
		send (buffer);
	for (i=nitems; i<blksize; *(buffer+i++) = NUL);
	send (buffer);
	putchar (ETX);
}

send (buffer)
char *buffer;
{
	register int i;
	putchar (STX);
	for (cksum=i=0; i<blksize; putchar (buffer[i++]))
		cksum += (int) buffer[i];
	putchar (ETB);
	putchar (cksum & 0xff);
	putchar (cksum >> 8);
	if (getchar() != ACK) fprintf (errlog,
		"A bad block transmission was reported\n");
}

-----------------------------------------------------------------------
"TERMCAP"
-----------------------------------------------------------------------

ibmpc: bs:li#24:co#80:cl=^L:up=\EH:nd=\EM:do=\EP:ho=\EG:\
	:kl=\EK:kr=\EM:ku=\EH:kd=\EP


Following is a description of the block mode protocol followed when
a block transfer to or from UNIX is happening:

Each block begins with a STX character.
Then, "BLSIZE" characters will be transmitted in "stty raw" mode
      (BLSIZE defaults to 128 characters).
Each block ends with an ETB character.
Two checksum bytes follow the ETB character, low byte first.
If the block is acknowledged by sending an ACK character all is OK.
     Otherwise, an error is posted to a file called "errlog" on UNIX,
          or printed on the IBM PC screen.
An ETX character is transmitted in placeof the STX character after
    the last block transmission.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       