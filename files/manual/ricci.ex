
(C8) G(L1,L2):=BLOCK([A,B],IF L2=[] THEN
 [A:L1[1],B:L1[2],
RETURN(E(L1,[])*(1+2*L*P([],[]))-
4*L*P(L1,[])
)],
A:L2[1],B:L2[2],
E([],L2)*(1-2*L*P([],[]))
+4*L*P([],L2)
)$

(C10) METRIC:G$

(C11) DEFCON(G)$

(C12) SHOW(G([I,J],[]));
E    (2 P L + 1) - 4 P	  L
 I J		      I J
(D12) 				   DONE

(C13) SHOW(G([],[I,J]));
 I J		      I J
E    (1 - 2 P L) + 4 P	  L
(D13) 				   DONE

(C14) DECLARE(E,CONSTANT)$

(C15) DEFCON(E)$

(C16) DEFCON(E,E,DELTA)$

(C17) RICCI:RIEMANN([I,J,K],[J])$

(C18) SHOW(%);
      J		  J	   !1	     J		 J	  !1
- CHR2	    - CHR2     CHR2    + CHR2	   + CHR2     CHR2
      I K,J	  !1 J	   I K	     I J,K	 !1 K	  I J
(D18) 				   DONE

(C19) RICCI:UNDIFF(RICCI)$

(C20) RICCI:EV(RICCI,CHR2,DIFF)$

(C23) RATWEIGHT(L,1)$

(C24) RATWTLVL:1$

(C25) TAKEGCD:FALSE$

(C27) RICCI:RATEXPAND(D20)$

(C28) CONTRACT(%)$

(C29) SHOW(%);
   !1		 !1 !2			       !1 !2
2 P	  L - 2 E      P	  L + P	      E	     E	  L
   K,!1 I	        I K,!1 !2      ,!1 !2	      I K

							     !1
						        + 2 P	    L
							     I,!1 K
