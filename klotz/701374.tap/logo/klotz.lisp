(comment)
(progn (putprop 'step '(step fasl dsk liblsp) 'autoload)
      (setq tty-return '(lambda n (princ '|/îHere is LISP ->|)))
      (DEFPROP APROPOS (APROPO FASL DSK LIBLSP) AUTOLOAD)
      (SETQ GC-OVERFLOW  
	    '(LAMBDA (SPACE-TYPE)
		     (LET ((STREAM TYO))
			  (PRINC '|;Allocating | STREAM)
			  (PRINC SPACE-TYPE STREAM)
			  (PRINC '| space.| STREAM)
			  (TERPRI STREAM))
		     'T))
      
(defprop ploop
     (LAMBDA (M P) (IOTA ((F (MACROEXPANDED |`-expander/|| 1 (|`-expander/|| 
(CLI *) (|`,/|| . M) HACTRN) (LIST* (QUOTE (CLI *)) M (QUOTE (HACTRN)))) 
(QUOTE (OUT)))) (PRINC (QUOTE |ï|) F) (PRINC P F))) expr)
(defprop iota ((dsk liblsp) iota fasl) autoload)
      '*)
