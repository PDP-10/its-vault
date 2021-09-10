
GBP:	IDIVI C,6	;TURN USER DIRECTORY CHARACTER ADDR IN C
	IMULI D,-60000	;INTO A BYTE POINTER
	HRLI C,440600(D)
	ADDI C,UDESC
	JRST (TT)

NXTMDR:	HRRZ B,CU	;SELECT NEXT UNIT AND READ ITS MASTER DIRECTORY
	LSH B,1
	TRNE B,UX
	MOVEI B,U0
	HRRM B,CU
	TRNE B,@MU
	JRST 1(TT)	;SKIP IF NO MORE
	TDNE B,UNITS
	JRST NXTMDR	;UNIT NOT ON LINE
RDMDR:	MOVEI TRACK,MDIRTK	;READ MASTER DIRECTORY OF CURRENT UNIT
	MOVEI UNIT,MDIR
	JRST RD

NXTBLK:	MOVE TRACK,LTRACK	;GET NEXT BLOCK
NXTB6:	SOSLE BLKCNT	;HAVE WE RUN OUT OF "TAKE N"?
	AOJA TRACK,WRDB1	;NO--TAKE NEXT TRACK
	ILDB T,DIRPT	;YES--GET NEXT DESC BYTE
	TRZE T,40
	JRST NXTB1	;IT'S A LOAD ADDR
	CAIE T,37
	JUMPN T,NXTB2	;IT'S BETWEEN 1 AND 36 INCLUSIVE
	JRST EOF
NXTB1:	MOVE TRACK,T	;LOAD ADDR
	MOVEI T,0
	CAIE CMD,'D
	CAIN CMD,'K
	DPB T,DIRPT	;IF KILLING FILE, ZERO THIS BYTE (OTHERS ZEROED AT KILL)
	LSH TRACK,6
	ILDB T,DIRPT
	ADD TRACK,T	;GET COMPLETE TRACK NUMBER
	JRST NXTB3
NXTB2:	MOVEM T,BLKCNT
	CAIG T,14
	AOJA TRACK,WRDB1	;TAKE N STARTING WITH NEXT ONE
	ADDI TRACK,-13(T)	;SKIP N-13 AND TAKE 1
NXTB3:	CLEARM BLKCNT
WRDB1:	MOVEM TRACK,LTRACK
	JRST (TT)

WRDM:RDM:ANDCMI UNIT,17	;FLUSH EXTRANEOUS UNIT SELECT BITS
MU:	IORI UNIT,U0	;MASTER UNIT SELECT BIT STORED HERE
	JRST WRD3

WRD:RD:	ANDCMI UNIT,17	;FLUSH EXTRANEOUS UNIT SELECT BITS
CU:	IORI UNIT,U0	;CURRENT UNIT SELECT BIT STORE HERE
WRD3:	MOVNI DIFF,11	;INITIALIZE ERROR COUNTER
	MOVEM DIFF,ERRCT	;10. LOSSES PERMITTED
WRD1:	LDB T,[10200,,UNIT]	;TURN UNIT SELECT BIT INTO UNIT NUMBER
IFE NDSK-4,[TRNE UNIT,U3
	MOVEI T,3
]	SKIPL POS(T)
	JRST WRD4	;CURRENT POSITION KNOWN
WRD5:	CLEARM POS(T)	;CURRENT POSITION UNKNOWN--RESET UNIT
	DATAO DSK,UNIT
	CONO DSK,CONTROL\RET0\BUSY\DONE
	MOVEI DIFF,6000.
	SOJG DIFF,.
	CONO DSK,0
	MOVEI DIFF,200000.
	SOJG DIFF,.
WRD4:	HRRZ DIFF,TRACK
C12:	IDIVI DIFF,12	;SEE CRLF
	SUBM DIFF,POS(T)	;SET UP DIFFERENCE CONO
	EXCH DIFF,POS(T)	;AND STORE NEW POSITION
	SKIPL DIFF
	TROA HEAD,FORW_<-6>	;TURN ON FORWARD BIT IF GOING FORWARD
	MOVNS DIFF
	XORI DIFF,377
	LSHC DIFF,6
	DATAO DSK,UNIT	;GET THINGS GOING
	CONO DSK,CONTROL\RESETHD
	CONO DSK,SETCYL
	CONO DSK,SETHD(HEAD)
	CONO DSK,SETDIFF(DIFF)
	CONO DSK,CONTROL\SEEK
	CONO DSK,CONTROL\BUSY
	CONSO DSK,DONE
	JRST .-1
	CONSZ DSK,PARERR\CKSERR
	JRST WRD2	;HARDWARE PARITY/CKS ERROR
	LDB DIFF,[1300,,63]
	CAIN DIFF,(TRACK)
	JRST (TT)	;NO ERRORS--RETURN
	HRRZM TRACK,BADTRK
	AOSG ERRCT	;POSITIONER ERROR--CHECK ERROR COUNT
WRD2:	HRRZM TRACK,BADTRK
	AOSG ERRCT	;HARDWARE ERROR--CHECK COUNTER
	JRST WRD1	;TRY AGAIN
	TRNE WRITE,WRBIT	;GIVE UP--DISTINGUISH BETWEEN
	JSR ECWR,ERROR	;WRITE ERRORS AND
	JSR ECRD,ERROR	;READ ERRORS
ð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒð0`Áƒ