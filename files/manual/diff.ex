
(C1) DIFF(EXP(F(X)),X,2);
			  F(X)		   F(X)	     2
(D1) 		        %E     F(X)    + %E     F(X)
				   X X		    X

(C2) (DERIVABBREV:FALSE,KILL(LABELS))$

(C1) DIFF(EXP(F(X)),X,2);
			     2
		      F(X)  d		  F(X)  d       2
(D1) 		    %E	   (--- F(X)) + %E     (-- F(X))
			      2		        dX
			    dX

(C2) CLOSEFILE(DIFF,EX)$
