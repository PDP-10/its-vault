
(C3) SETUP();
DO YOU WANT
1 - TO CONSIDER A METRIC IN THE SPECIAL METRIC FILE?
2 - TO APPROXIMATE A METRIC WITH A POWER SERIES?
3 - TO ENTER A NEW METRIC?
TYPE 1 OR 2 OR 3  
3;

SPECIFY THE COORDINATES AS A LIST OF FOUR ELEMENTS  
[R,THETA,PHI,T];
DO YOU WANT
1 - TO SPECIFY  A DIAGONAL METRIC?
2 - TO CHANGE A COMPONENT IN A PREVIOUSLY DEFINED METRIC?
3 - TO SPECIFY A GENERAL (SYMMETRIC) METRIC?
TYPE 1 2  OR  3  
1;

ENTER DIAGONAL MATRIX
[1, 1]  
-EXP(M);
[2, 2]  
-R^2;
[3, 3]  
-R^2*SIN(THETA)^2;
[4, 4]  
EXP(N);

INDICATE THE KIND OF SIMPLIFICATION YOU WANT

1 - RATIONAL SIMPLIFICATION ONLY
2 - FACTORING AND RATIONAL SIMPLIFICATION
3 - EXPANSION 
TYPE 1 2 OR 3  
2;

WHICH OF THE FOLLOWING DO YOU WISH TO COMPUTE?

1 - CHRISTOFFEL SYMBOLS ONLY
2 - MIXED RICCI TENSOR
3 - COVARIANT RICCI TENSOR
4 - MIXED EINSTEIN TENSOR
5 - COVARIANT RIEMANN TENSOR
6 - CONTRAVARIANT RIEMANN TENSOR
7 - SCALAR CURVATURE
8 - WEYL CONFORMAL TENSOR
TYPE 1 2 3 4 5 6 7 OR 8  

5532 MSEC.
(MACSYMA-BREAK) 
_DEPENDENCIES(M(R),N(R));
[M(R), N(R)]
_DERIVABBREV:TRUE;
TRUE
_EXIT;
EXITED FROM THE BREAK


1;

DO YOU WISH TO DISPLAY CHRISTOFFEL SYMBOLS
1 -  OF THE FIRST KIND ONLY?
2 -  OF THE SECOND KIND ONLY? 
3 -  BOTH KINDS? 
4 -  NONE?
TYPE 1 2 3 OR 4  
2;
					  M
					   R
(E3) 			     MCS        = --
				1, 1, 1	  2

					   1
(E4) 			      MCS        = -
				 1, 2, 2   R

					   1
(E5) 			      MCS        = -
				 1, 3, 3   R

					  N
					   R
(E6) 			     MCS        = --
				1, 4, 4	  2

					   - M
(E7) 			  MCS	     = - %E    R
			     2, 2, 1

				      COS(THETA)
(E8) 			 MCS	    = ----------
			    2, 3, 3   SIN(THETA)

				     - M      2
(E9) 		    MCS	       = - %E    R SIN (THETA)
		       3, 3, 1

(E10) 		   MCS	      = - COS(THETA) SIN(THETA)
		      3, 3, 2

					 N - M
				       %E      N
						R
(E11) 			  MCS	     = ----------
			     4, 4, 1	   2

(D11) 				   DONE


(C13) RICCICOM(TRUE);
			 - M		    2
		       %E    ((2 N    + (N )  - M  N ) R - 4 M )
				  R R	  R	 R  R	      R
(E13) 	   RICCI     = -----------------------------------------
		1, 1			  4 R

			       - M		      M
			     %E	   ((M  - N ) R + 2 %E  - 2)
				      R	   R
(E14) 	       RICCI     = - -------------------------------
		    2, 2		     2
					  2 R

			       - M		      M
			     %E	   ((M  - N ) R + 2 %E  - 2)
				      R	   R
(E15) 	       RICCI     = - -------------------------------
		    3, 3		     2
					  2 R

			 - M		    2
		       %E    ((2 N    + (N )  - M  N ) R + 4 N )
				  R R	  R	 R  R	      R
(E16) 	   RICCI     = -----------------------------------------
		4, 4			  4 R

(D16) 				   DONE

(C17) LRICCICOM(TRUE);
					     2
			     M	  N	 (N )	 M  N
			      R	   R R	   R	  R  R
(E17) 		    LR	   = -- - ---- - ----- + -----
		      1, 1   R	   2	   4	   4

			   - M	        - M
			 %E    N  R   %E    M  R
				R	     R	     - M
(E18) 	      LR     = - ---------- + ---------- - %E    + 1
		2, 2	     2		  2

		   - M	       2	    - M	        2
		 %E    N  R SIN (THETA)	  %E    M  R SIN (THETA)
			R			 R
(E19) LR     = - ---------------------- + ----------------------
	3, 3		   2			    2

					- M    2	     2
				    - %E    SIN (THETA) + SIN (THETA)

		 N - M	      N - M	     N - M     2
	       %E      N    %E	    N	   %E	   (N )
			R	     R R	     R
(E20) LR     = ---------- + ------------ - -------------
	4, 4	   R		 2		 4

				   N - M		     N - M
				 %E      N  (N  - M )   M  %E	   N
					  R   R	   R	 R	    R
			       + -------------------- + -------------
					  2		      4

(D20) 				   DONE

(C21) EINSTEIN(TRUE);
				 - M	       M
			       %E    (N  R - %E  + 1)
				       R
(E21) 		     G	   = - ----------------------
		      1, 1		  2
					 R

		    - M		       2
		  %E    ((2 N    + (N )  - M  N ) R + 2 N  - 2 M )
			     R R     R	    R  R	 R      R
(E22)   G     = - ------------------------------------------------
	 2, 2			        4 R

		    - M		       2
		  %E    ((2 N    + (N )  - M  N ) R + 2 N  - 2 M )
			     R R     R	    R  R	 R      R
(E23)   G     = - ------------------------------------------------
	 3, 3			        4 R

				- M	      M
			      %E    (M  R + %E  - 1)
				      R
(E24) 		      G	    = ----------------------
		       4, 4		 2
					R

(D24) 				   DONE

(C25) SCURVATURE();
	- M		   2
      %E    ((2 N    + (N )  - M  N ) R + 4 N )
		 R R	 R      R  R	     R
(D25) -----------------------------------------
			 4 R

     - M	        2
   %E    ((2 N	  + (N )  - M  N ) R - 4 M )
	      R R     R	     R  R	  R
 + -----------------------------------------
		      4 R

					- M		       M
				      %E    ((M  - N ) R + 2 %E  - 2)
					       R    R
				    - -------------------------------
						     2
						    R

(C26) FACTOR(%);
(D26) 

      - M		 2	     2			       M
    %E	  ((2 N	   + (N )  - M  N ) R  + (4 N  - 4 M ) R - 4 %E  + 4)
	       R R     R      R	 R	     R	    R
    -----------------------------------------------------------------
				     2
				  2 R

(C27) RIEMANN(TRUE);
					   M  R
					    R
(E27) 			   R	       = - ----
			    1, 2, 1, 2	    2

					     2
				     M  R SIN (THETA)
				      R
(E28) 		     R	         = - ----------------
		      1, 3, 1, 3	    2

				N	   N	 2	  N
			  - 2 %E  N    - %E  (N )  + M  %E  N
				   R R	       R      R	     R
(E29) 	    R	        = ------------------------------------
	     1, 4, 1, 4			   4

				 M	  - M  2    2
(E30) 	      R		  = - (%E  - 1) %E    R  SIN (THETA)
	       2, 3, 2, 3

					 N - M
				       %E      N  R
						R
(E31) 		       R	   = - ------------
			2, 4, 2, 4	    2

				   N - M	 2
				 %E      N  R SIN (THETA)
					  R
(E32) 		 R	     = - ------------------------
		  3, 4, 3, 4		    2

(D32) 				   DONE

(C33) RAISERIEMANN(FALSE);

YOU HAVE RUN OUT OF LIST SPACE.
DO YOU WANT MORE?
TYPE ALL; NONE; A LEVEL-NO. OR THE NAME OF A SPACE.
ALL;
(D33) 				   DONE

(C34) FACTOR(RINVARIANT());
	- 2 M	        2	   2			   4
(D34) %E      ((4 (N   )  + (4 (N )  - 4 M  N ) N    + (N )
		    R R		 R	  R  R	 R R	 R

	    3	    2	  2   4		 2	   2   2        2 M
 - 2 M  (N )  + (M )  (N ) ) R  + (8 (N )  + 8 (M ) ) R  + 16 %E
      R	  R	  R     R	       R	 R

	M	    4
 - 32 %E  + 16)/(4 R )

(C35) WEYL(TRUE);
(E35) W		  = 
       1, 2, 1, 2

			  2	      2			        M
	    (2 N    + (N )  - M  N ) R  + (2 M  - 2 N ) R - 4 %E  + 4
		R R     R      R  R	      R	     R
	  - ---------------------------------------------------------
				       24

				     2		 2
(E36) W		  = - ((2 N    + (N )  - M  N ) R  + (2 M  - 2 N ) R
       1, 3, 1, 3	   R R	   R	  R  R		 R      R

						M	  2
					  - 4 %E  + 4) SIN (THETA)/24

			    N	       N     2	      N	     2
(E37) W		  = - ((2 %E  N	   + %E  (N )  - M  %E  N ) R
       1, 4, 1, 4	       R R	   R	  R	 R

			   N	   N		      M	   N	   2
		 + (2 M  %E  - 2 %E  N ) R + (4 - 4 %E ) %E )/(12 R )
		       R	      R

		      - M		 2	     4
(E38) W		  = %E	  ((2 N	   + (N )  - M  N ) R
       2, 3, 2, 3	       R R     R      R	 R

				   3	        M   2	  2
		  + (2 M  - 2 N ) R  + (4 - 4 %E ) R ) SIN (THETA)/12
			R      R

		      - M       N	   N	 2	  N	 2
(E39) W		  = %E	  ((2 %E  N    + %E  (N )  - M  %E  N ) R
       2, 4, 2, 4		   R R	       R      R	     R

				N       N		   M    N
		      + (2 M  %E  - 2 %E  N ) R + (4 - 4 %E ) %E )/24
			    R		   R

		      - M       N	   N	 2	  N	 2
(E40) W		  = %E	  ((2 %E  N    + %E  (N )  - M  %E  N ) R
       3, 4, 3, 4		   R R	       R      R	     R

		    N	    N		       M    N	  2
	  + (2 M  %E  - 2 %E  N ) R + (4 - 4 %E ) %E ) SIN (THETA)/24
		R	       R

(D40) 				   DONE

(C41) DEPENDENCIES(FIELD(R));
(D41) 			        [FIELD(R)]

(C42) DSCALAR(FIELD);
		   - M		  - M
	2 FIELD  %E	 FIELD  %E    N
	       R	      R	       R
(D42) - -------------- - ---------------
	      R		        2

							   FIELD  M
					   - M		        R  R
				       - %E    (FIELD    - ---------)
						     R R       2

(C43) FACTOR(%);
	    - M
	  %E    ((FIELD  N  - FIELD  M  + 2 FIELD   ) R + 4 FIELD )
		       R  R	   R  R		 R R		 R
(D43)   - ---------------------------------------------------------
				     2 R

