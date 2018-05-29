
_EXIT;
exited from the break 
-SIN(X)^2+3*COS(X)^2+X;
			       2	   2
(D1) 			  - SIN (X) + 3 COS (X) + X

(C2) D1;
			       2	   2
(D2) 			  - SIN (X) + 3 COS (X) + X

(C3) D1;
			       2	   2
(D3) 			  - SIN (X) + 3 COS (X) + X

(C4) %,SIN(X)^2=1-COS(X)^2;
				   2
(D4) 			      4 COS (X) + X - 1

(C5) RATSUBST(1-COS(X)^2,SIN(X)^2,SIN(X)^4);
			      4		  2
(D5) 			   COS (X) - 2 COS (X) + 1

(C6) TELLSIMP(SIN(X)^2,1-COS(X)^2);

MATCOM FASL DSK MACSYM being loaded 
loading done
(D6) 			     [**RULE1, SIMPEXPT]

(C7) (SIN(X)+1)^2;
					    2
(D7) 			        (SIN(X) + 1)

(C8) EXPAND(%);
					  2
(D8) 			    2 SIN(X) - COS (X) + 2

(C9) SIN(X)^2;
					2
(D9) 				 1 - COS (X)

(C10) CLOSEFILE(TRIGE,EX)$
