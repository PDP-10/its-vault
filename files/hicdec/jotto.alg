BEGIN
INTEGER ARRAY WORDS[1:100,1:5],IMPOS[0:26],DEF[1:5],TEMP[1:5],CORRECT
  [1:100],LETS[1:100];
STRING ARRAY IWORDS[1:100];
INTEGER COUNT,NDEFLETS,MAXWORD;

PROCEDURE DOWORD(WWORD); INTEGER WWORD; VALUE WWORD;
BEGIN
  INTEGER LOOP,LOOP1,FLAG;
  FLAG:=0;
  FOR LOOP:= 1 UNTIL 5 DO
  FOR LOOP1:=1 UNTIL 26 DO
  IF (WORDS[WWORD,LOOP]=LOOP1) AND (IMPOS[LOOP1]=1) THEN BEGIN
    LETS[WWORD]:=LETS[WWORD]-1;
    WORDS[WWORD,LOOP]:=0;
  END;
  FOR LOOP:=1 UNTIL NDEFLETS DO TEMP[LOOP]:=1;
  FOR LOOP:=1 UNTIL 5 DO
  FOR LOOP1:=1 UNTIL NDEFLETS DO
  IF (TEMP[LOOP1]=1) AND (DEF[LOOP1]=WORDS[WWORD,LOOP]) THEN BEGIN
    LETS[WWORD]:=LETS[WWORD]-1;
    WORDS[WWORD,LOOP]:=0;
    CORRECT[WWORD]:=CORRECT[WWORD]-1;
    TEMP[LOOP1]:=0;
  END;
  IF (CORRECT[WWORD]=0) AND (LETS[WWORD]>0) THEN BEGIN
    FOR LOOP:=1 UNTIL 5 DO IMPOS[WORDS[WWORD,LOOP]]:=1;
    FLAG:=1;
  END
  ELSE
  IF (CORRECT[WWORD]=LETS[WWORD]) AND (CORRECT[WWORD]>0) THEN BEGIN
    FOR LOOP:=1 UNTIL 5 DO
    IF WORDS[WWORD,LOOP]#0 THEN
    DEF[(NDEFLETS:=NDEFLETS+1)]:=WORDS[WWORD,LOOP];
    FLAG:=1;
  END;
  IF FLAG=1 THEN
  FOR LOOP:=1 UNTIL MAXWORD DO DOWORD(LOOP);
END;

FOR COUNT:=0 UNTIL 26 DO IMPOS[COUNT]:=0;
FOR COUNT:=1 UNTIL 5 DO DEF[COUNT]:=0;
MAXWORD:=0;
NEXTWORD:
WRITE("[C]WORD: [B]"); READ(IWORDS[(MAXWORD:=MAXWORD+1)]);
FOR COUNT:=1 UNTIL 5 DO WORDS[MAXWORD,COUNT]:=IWORDS[MAXWORD].[COUNT]
  -$/A/+1;
WRITE("CORRECT: [B]"); READ(CORRECT[MAXWORD]);
LETS[MAXWORD]:=5; DOWORD(MAXWORD);
WRITE("IMPOSSIBLE LETTERS: "); FOR COUNT:=1 UNTIL 26 DO
IF IMPOS[COUNT]#0 THEN OUTSYMBOL(COUNT+$/A/-1);
WRITE("[C]DEFINITE LETTERS: "); FOR COUNT:=1 UNTIL NDEFLETS DO
OUTSYMBOL(DEF[COUNT]+$/A/-1);
GOTO NEXTWORD;
END
  