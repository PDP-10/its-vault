; Translated code for  DSK:MANUAL;FOO 1
; Written on Thurs, 16 March 1978  17:06, from MACSYMA 268

(DECLARE (FASLOAD TRNMAC FASL DSK MRG) (FASLOAD OPERS MACFAS DSK 
MACRAK) (*LEXPR MCALL ADD MUL $PART) (*FEXPR $SUBSTPART RETLIST 
MLOCAL) (*EXPR MEVAL MEVAL1 POWER SIMPLIFY DIV MUNLOCAL MSET MBIND 
MUNBIND ADD2LNC MUL2 MULT3IP MULN ADD ADDN) (SETQ NFUNVARS T) 
(SPECIAL $FUNCTIONS $VALUES))
(DEFPROP $FOO T TRANSLATED)
(ADD2LNC (QUOTE $FOO) $PROPS)
(ARGS (QUOTE $FOO) (QUOTE (NIL . 1.)))
(DEFUN $FOO ($X) (DECLARE (SPECIAL $X)) $X)
