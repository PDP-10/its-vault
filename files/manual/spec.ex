
(C2) BATCH([YANNIS,NDMN,DSK,YANNIS],ON);

(C3) /* THIS IS A SAMPLE OF ANSWERS FROM THE UNDER CONSTRUCTION PROGRAM, WHICH
DEALS WITH "BATEMAN 'S MANUSCRIPT PROJECT". */

DYNAMALLOC:TRUE;
(D3) 				     TRUE

(C4) LOADFILE(SCHATCHEN,?>,DSK,MACSYM);

SCHATCHEN > DSK MACSYM being loaded 
loading done
(D4) 				     DONE

(C5) LOADFILE(SIN,?>);

SIN > DSK MACSYM being loaded 
loading done
(D5) 				     DONE

(C6) LOADFILE(ATST,?>,DSK,YANNIS);

ATST 6 DSK YANNIS being loaded 
loading done
(D6) 				     DONE

(C7) LOADFILE(HYPTST,?>);

HYPTST 13 DSK YANNIS being loaded 
loading done
(D7) 				     DONE

(C8) LOADFILE(HYPSPL,?>);

HYPSPL 4 DSK YANNIS being loaded 
loading done
(D8) 				     DONE

(C9) LOADFILE(CNFLRD,?>);

CNFLRD 38 DSK YANNIS being loaded 
loading done
(D9) 				     DONE

(C10) LOADFILE(YBAT,?>);

YBAT 9 DSK YANNIS being loaded 
loading done
(D10) 				     DONE

(C11) ASSUME(P > 0);
(D11) 				   [P > 0]

(C12) SHOWTIME:TRUE$
time= 1 msec.

(C13) /* LAPLACE TRANSFORMS */

/* SOME ELEMENTARY FUNCTIONS. */

T^(1/2)*%E^(-A*T/4)*%E^(-P*T);
time= 26 msec.
					      A T
				      - P T - ---
					       4
(D13) 			    SQRT(T) %E

(C14) DEFINTE(%,T);

RPART FASL DSK MACSYM being loaded 
loading done
	  A
Is  - P - -  positive, negative, or zero?
	  4

Z;
time= 793 msec.
(D14) 		        OTHER-DEFINT-TO-FOLLOW-NEGTEST

(C15) T^(3/4)*%E^(-T^2/2/B)*%E^(-P*T);
time= 25 msec.
					2
				       T
				     - --- - P T
			       3/4     2 B
(D15) 			      T	   %E

(C16) DEFINTE(%,T);

GAMMA FASL DSK MAXOUT being loaded 
loading done
time= 1097 msec.
						    2
						 B P
		       8 SQRT(%PI) M	        (----)
	      3	  7/8		    - 5/8, - 1/4  2
(D16) 3 GAMMA(-) B    (-------------------------------
	      4		   5/8	     3	 1/4
			3 2    GAMMA(-) B    SQRT(P)
				     8

								  2	   2
				     3/8		       B P      B P
				    2    SQRT(%PI) M	      (----)    ----
						    - 5/8, 1/4  2	 4
				  - --------------------------------) %E    /4
					       7   1/4
					 GAMMA(-) B    SQRT(P)
					       8

(C17) T^(-1/2)*%E^(-2*A^(1/2)*T^(1/2))*%E^(-P*T);
time= 25 msec.
			   - P T - 2 SQRT(A) SQRT(T)
			 %E
(D17) 			 ---------------------------
				   SQRT(T)

(C18) DEFINTE(%,T);
time= 363 msec.
									 A
				  A				        ---
		 A		 ---			     SQRT(A)    2 P
		---		 2 P   SQRT(2) SQRT(%PI) ERF(-------) %E
		2 P  SQRT(%PI) %E			     SQRT(P)
      SQRT(2) %E    (--------------- - ------------------------------------)
			 SQRT(2)		        2
(D18) ----------------------------------------------------------------------
				     SQRT(P)

(C19) T^(1/2)*%E^(-P*T-A/T);
time= 17 msec.
				      - P T - A/T
(D19) 			    SQRT(T) %E

(C20) DEFINTE(%,T);
time= 357 msec.
			     1/4  1/4	        3	        COS(A P)
		  4 SQRT(2) A    P    (- (1 - -----) SIN(A P) - --------)
					       2  2		  A P
	   3/4				      A  P
(D20) %PI A    (- -------------------------------------------------------
					   3 %PI

					   SQRT(2) COS(A P)	  3 %PI	  3/4
					 - ----------------)/(SIN(-----) P   )
						  5/4  5/4	    2
					   2 %PI A    P

(C21) SIN(A*T)*COSH(B*T^2)*%E^(-P*T);

HYPER FASL DSK MAXOUT being loaded 
loading done
time= 20 msec.
			   - P T		  2
(D21) 			 %E      SIN(A T) COSH(B T )

(C22) DEFINTE(%,T);
time= 3302 msec.
						 2
		      2		       (P + %I A)
	    (P + %I A)		     - -----------
	  - -----------			   8 B
		8 B	 SQRT(%PI) %E
(D22) - %E	        (-------------------------
				  SQRT(2)

			   2
		 (P + %I A)
	       - -----------
		     8 B	 %I (P + %I A)
   SQRT(%PI) %E		     ERF(-------------)
				   2 SQRT(B)
 - --------------------------------------------)/(4 SQRT(2) SQRT(B))
		     SQRT(2)

					   2
				 (P + %I A)
		  2		 -----------
	(P + %I A)		     8 B	   P + %I A
	-----------  SQRT(%PI) %E	     ERF(- ---------)
	    8 B					   2 SQRT(B)
 + %I %E	    (----------------------------------------
				     SQRT(2)

			 2
	       (P + %I A)
	       -----------
		   8 B
   SQRT(%PI) %E
 + -----------------------)/(4 SQRT(2) SQRT(B))
	   SQRT(2)

					    2
		 2		  (P - %I A)
       (P - %I A)	        - -----------
     - -----------		      8 B
	   8 B	    SQRT(%PI) %E
 + %E		   (-------------------------
			     SQRT(2)

			   2
		 (P - %I A)
	       - -----------
		     8 B	 %I (P - %I A)
   SQRT(%PI) %E		     ERF(-------------)
				   2 SQRT(B)
 - --------------------------------------------)/(4 SQRT(2) SQRT(B))
		     SQRT(2)

					   2
				 (P - %I A)
		  2		 -----------
	(P - %I A)		     8 B	   P - %I A
	-----------  SQRT(%PI) %E	     ERF(- ---------)
	    8 B					   2 SQRT(B)
 - %I %E	    (----------------------------------------
				     SQRT(2)

			 2
	       (P - %I A)
	       -----------
		   8 B
   SQRT(%PI) %E
 + -----------------------)/(4 SQRT(2) SQRT(B))
	   SQRT(2)

(C23) /* SOME "CONFLUENTS". NOTICE THAT "M[K,M](Z)" IS A WHITTAKER FUNCTION. *
/

%E^(A*T)*T^2*ERF(T^(1/2))*%E^(-P*T);
time= 18 msec.
				       2   A T - P T
(D23) 			 ERF(SQRT(T)) T  %E

(C24) DEFINTE(%,T);
Is  A - P  positive, negative, or zero?

Z;
time= 79 msec.
(D24) 		        OTHER-DEFINT-TO-FOLLOW-NEGTEST

(C25) T^(1/2)*GAMMAINCOMPLETE(1/2,A*T)*%E^(-P*T);
time= 12 msec.
				   1		     - P T
(D25) 		   GAMMAINCOMPLETE(-, A T) SQRT(T) %E
				   2

(C26) DEFINTE(%,T);
time= 1721 msec.
		       %PI			     2
(D26) 	   --------------------------- - -------------------------
		    3/2	       A   3/2	        3/2	   A   3/2
	   2 (P + A)    (1 - -----)	 (P + A)    (1 - -----)
			     P + A			 P + A

(C27) T^(3/2)*GAMMAGREEK(3/4,A*T)*%E^(-P*T);
time= 12 msec.
				  3	   3/2	 - P T
(D27) 		       GAMMAGREEK(-, A T) T    %E
				  4

(C28) DEFINTE(%,T);
time= 1042 msec.
					  1
				 15 GAMMA(-)
					  4
(D28) 		       -------------------------------
			   %I SQRT(2)   SQRT(2) 3  5/2
		       16 (---------- + -------)  P
			       2	   2

(C29) T*M[1/2,3/4](A*T)*%E^(-P*T);
time= 12 msec.
					      - P T
(D29) 			   M	    (A T) T %E
			    1/2, 3/4

(C30) DEFINTE(%,T);
time= 414 msec.
		    1			  2 A	 5/4    A       3/4
	   15 GAMMA(-) P	    (1 - -----) A    (----- - 1)
		    4   - 7/4, - 3/2	     A		  A
					 P + -	      P + -
					     2		  2
(D30) 	   --------------------------------------------------------
			      A 13/4	    A   3/2    A       3/4
	    16 SQRT(%PI) (P + -)     (1 - -----)    (----- + 1)
			      2		      A		 A
					  P + -	     P + -
					      2		 2

(C31) T^(3/2)*M[1/2,1](T)*%E^(-P*T);
time= 12 msec.
				       3/2   - P T
(D31) 			   M	  (T) T	   %E
			    1/2, 1

(C32) DEFINTE(%,T);
time= 253 msec.
			    1		     1
		     6 (--------- + --------------------)
			      1		 1	   1   2
			1 - -----   (P + -) (1 - -----)
				1	 2	     1
			    P + -		 P + -
				2		     2
(D32) 		     ------------------------------------
					1 4
				   (P + -)
					2

(C33) /* SOME BESSEL FUNCTS (BF'S). */

/* J[V](Z), 1ST KIND OF BF'S. */

/* Y[V](Z), 2ND KIND OF BF'S.*/

/* H[V,1](Z), 1ST KIND OF THE 3RD KIND OF BF'S (1ST HANKEL). */

/* H[V,2](Z), 2ND KIND OF THE 3RD KIND OF BF'S (2ND HANKEL).*/

T^(-1/2)*J[0](2*A^(1/2)*T^(1/2))*%E^(-P*T);
time= 17 msec.
						- P T
			J (2 SQRT(A) SQRT(T)) %E
			 0
(D33) 		        -----------------------------
				   SQRT(T)

(C34) DEFINTE(%,T);
Is  A  zero or nonzero?

N;
time= 1057 msec.
						     A
						  - ---
				       2 A	    2 P
		       SQRT(%PI) I (----------) %E
				  0 SQRT(14) P
(D34) 		       --------------------------------
				   SQRT(P)

(C35) T^(1/2)*J[1](2*A^(1/2)*T^(1/2))*%E^(-P*T);
time= 15 msec.
						    - P T
(D35) 		    J (2 SQRT(A) SQRT(T)) SQRT(T) %E
		     1

(C36) DEFINTE(%,T);
time= 220 msec.
					 - A/P
			       SQRT(A) %E
(D36) 			       ---------------
				      2
				     P

(C37) T^2*J[1](A*T)*%E^(-P*T);
time= 11 msec.
				       2   - P T
(D37) 			      J (A T) T  %E
			       1

(C38) DEFINTE(%,T);
time= 179 msec.
				     3 A
(D38) 			        --------------
				  2
				 A      5/2  4
				(-- + 1)    P
				  2
				 P

(C39) T^(3/2)*Y[1](A*T)*%E^(-T);
time= 9 msec.
				       3/2   - T
(D39) 			      Y (A T) T	   %E
			       1

(C40) DEFINTE(%,T);
time= 1103 msec.
					  %I	 1	  3/4
		15 %I SQRT(2) P	       (- --) (------ - 1)
			       - 2, 1/2	  A     2
					       A  + 1
(D40) 	        ---------------------------------------------
				2     2	   2	 2     1/4
		  8 SQRT(%PI) (A  + 1)  ((A  + 1)  - 1)

(C41) T^3*Y[3/4](T^(1/2))*%E^(-P*T);
time= 13 msec.
					  3   - P T
(D41) 			   Y   (SQRT(T)) T  %E
			    3/4

(C42) DEFINTE(%,T);
time= 1796 msec.
							1    %I %PI
						     - --- - ------
			   5		       1       8 P     8
	1365 SQRT(2) GAMMA(-) M		   (- ---) %E
			   8   - 7/2, - 3/8   4 P
(D42) - -----------------------------------------------------------
				       1   7/2
			     256 GAMMA(-) P
				       4

								 1    7 %I %PI
							      - --- - --------
				      3		        1       8 P	 8
			   5643 GAMMA(-) M	    (- ---) %E
				      8	  - 7/2, 3/8   4 P
			 - ---------------------------------------------------
						      3	  7/2
					    512 GAMMA(-) P
						      4

(C43) T^(4/3)*Y[3/4](T^(1/2))*%E^(-P*T);
time= 13 msec.
					 4/3   - P T
(D43) 			  Y   (SQRT(T)) T    %E
			   3/4

(C44) DEFINTE(%,T);
time= 1806 msec.
							1    %I %PI
						     - --- - ------
			 23		       1       8 P     8
	23 SQRT(2) GAMMA(--) M		   (- ---) %E
			 24   - 11/6, - 3/8   4 P
(D44) - -----------------------------------------------------------
				      1	  11/6
			     12 GAMMA(-) P
				      4

								 1    7 %I %PI
							      - --- - --------
				    17		        1       8 P	 8
			  697 GAMMA(--) M	    (- ---) %E
				    24	 - 11/6, 3/8   4 P
		        - ----------------------------------------------------
						     3	 11/6
					   216 GAMMA(-) P
						     4

(C45) T^(3/2)*Y[1/2](A*T)*%E^(-P*T);
time= 13 msec.
				       3/2   - P T
(D45) 			    Y   (A T) T	   %E
			     1/2

(C46) DEFINTE(%,T);
time= 480 msec.
						2
				   1	       A
			SQRT(2) (------ - ------------)
				  2	    2
				 A	   A	  2  2
				 -- + 1	  (-- + 1)  P
				  2	    2
				 P	   P
(D46) 		      - -------------------------------
						2
			     SQRT(%PI) SQRT(A) P

(C47) T^(3/2)*H[1/2,1](T)*%E^(-P*T);
time= 12 msec.
				       3/2   - P T
(D47) 			   H	  (T) T	   %E
			    1/2, 1

(C48) DEFINTE(%,T);
time= 1497 msec.
						     1		 1
				       %I SQRT(2) (------ - ------------)
						   1	     1	    2  2
						   -- + 1   (-- + 1)  P
						    2	      2
		    4				   P	     P
(D48) ------------------------------ - ----------------------------------
			 1      2  3			     2
      SQRT(2) SQRT(%PI) (-- + 1)  P		  SQRT(%PI) P
			  2
			 P

(C49) T^(1/2)*H[3/4,2](T)*%E^(-P*T);
time= 12 msec.
					       - P T
(D49) 			  H	 (T) SQRT(T) %E
			   3/4, 2

(C50) DEFINTE(%,T);
time= 2219 msec.
		 1		       1	 1      3/8  9/4
      5 %I GAMMA(-) P		 (------------) (-- - 1)    P
		 4   - 3/2, - 3/4      1	  4
				  SQRT(-- + 1)	 P
					2
				       P
(D50) ----------------------------------------------------------
			 %I SQRT(2)   SQRT(2)	    2 3
	     18 SQRT(2) (---------- + -------) GAMMA (-)
			     2		 2	      4

	   1			 1	   1	  3/8  9/4
   5 GAMMA(-) P		   (------------) (-- - 1)    P
	   4   - 3/2, - 3/4	 1	    4
			    SQRT(-- + 1)   P
				  2
				 P
 + -------------------------------------------------------
		     %I SQRT(2)	  SQRT(2)       2 3
	 18 SQRT(2) (---------- + -------) GAMMA (-)
			 2	     2		  4

	      3			  1	    3/4
   4 %I GAMMA(-) P	    (------------) P
	      4	  - 3/2, 3/4	  1
			     SQRT(-- + 1)
				   2
				  P
 + ---------------------------------------------
    %I SQRT(2)	 SQRT(2) 3      2 1   1	     3/8
   (---------- + -------)  GAMMA (-) (-- - 1)
	2	    2		  4    4
				      P

(C51) T*H[2/3,1](T^(1/2))*%E^(-P*T);
time= 12 msec.
					       - P T
(D51) 			  H	 (SQRT(T)) T %E
			   2/3, 1

(C52) DEFINTE(%,T);
time= 2330 msec.
					      1
					   - ---
		   1		     1	     8 P
	4 %I GAMMA(-) M		 (- ---) %E
		   3   - 3/2, 1/3   4 P
(D52) - ----------------------------------------
		   SQRT(3)   %I 5       2   3/2
	3 SQRT(3) (------- + --)  GAMMA(-) P
		      2	     2	        3

				      1
				   - ---
	   1		     1	     8 P
   4 GAMMA(-) M		 (- ---) %E
	   3   - 3/2, 1/3   4 P
 + -------------------------------------
	 SQRT(3)   %I 5	      2	  3/2
      3 (------- + --)  GAMMA(-) P
	    2	   2	      3

					   1
					- ---
	      2			  1	  8 P
   8 %I GAMMA(-) M	      (- ---) %E
	      3	  - 3/2, - 1/3	 4 P
 - ------------------------------------------
		SQRT(3)	  %I	    1   3/2
     3 SQRT(3) (------- + --) GAMMA(-) P
		   2	  2	    3

(C53) /* I[V](Z), K[V](Z), MODIFIED BF'S. */

T^(-1/2)*I[1](2*A^(1/2)*T^(1/2))*%E^(-P*T);
time= 17 msec.
						- P T
			I (2 SQRT(A) SQRT(T)) %E
			 1
(D53) 		        -----------------------------
				   SQRT(T)

(C54) DEFINTE(%,T);
time= 1317 msec.
				   2
				  A	 2
			  14 SIN(-----) P		    A
				     2		   2	   ---
				 14 P		  A	   2 P
	       2 SQRT(7) (---------------- - COS(-----)) %E
				  2		     2
				 A		 14 P
(D54) 	       -----------------------------------------------
			      SQRT(%PI) SQRT(A)

(C55) T^(1/2)*I[1](T)*%E^(-P*T);
time= 11 msec.
					    - P T
(D55) 			    I (T) SQRT(T) %E
			     1

(C56) DEFINTE(%,T);
time= 295 msec.
					1	      1	       5/2
	   3 SQRT(%PI) P	  (------------) SQRT(-- - 1) P
			- 3/2, - 1	    1	       4
				   SQRT(1 - --)	      P
					     2
					    P
(D56) 	   -------------------------------------------------------
				     16

(C57) T^2*K[3/4](T^(1/2))*%E^(-P*T);
time= 13 msec.
					  2   - P T
(D57) 			   K   (SQRT(T)) T  %E
			    3/4

(C58) DEFINTE(%,T);
time= 1926 msec.
						    1
						   ---
			   5		     1	   8 P
      65 %PI SQRT(2) GAMMA(-) M		   (---) %E
			   8   - 5/2, - 3/8 4 P
(D58) ------------------------------------------------
			       1   5/2
		      64 GAMMA(-) P
			       4

									    1
									   ---
						     3		     1	   8 P
			       209 %PI SQRT(2) GAMMA(-) M	   (---) %E
						     8	 - 5/2, 3/8 4 P
			     - -----------------------------------------------
							3   5/2
					      128 GAMMA(-) P
							4

(C59) T^(5/2)*K[1/2](T)*%E^(-P*T);
time= 12 msec.
				      5/2   - P T
(D59) 			     K	 (T) T	  %E
			      1/2

(C60) DEFINTE(%,T);
time= 1868 msec.
						  2	        1
      3 (%I - 1) (%I + 1) SQRT(2) SQRT(%PI) (------------ + ---------)
						  1  3  2	 1  2
					     (1 - --)  P    (1 - --)
						   2		  2
						  P		 P
(D60) ----------------------------------------------------------------
				       4
				    2 P

							  2	        1
		(%I - 1) (%I + 1) SQRT(2) SQRT(%PI) (------------ + ---------)
							  1  3  2	 1  2
						     (1 - --)  P    (1 - --)
							   2		  2
							  P		 P
	      - --------------------------------------------------------------
						3
					     2 P

(C61) T^3*J[0](T^(1/2))^2*%E^(-P*T);
time= 13 msec.
			     2		 3   - P T
(D61) 			    J (SQRT(T)) T  %E
			     0

(C62) DEFINTE(%,T);
time= 1253 msec.
				1			     1
			     - ---			  - ---
			1      2 P		     1	    2 P
	 9 %I M	     (- -) %E	     5 M	  (- -) %E
	       - 1, 1   P	        - 3/2, 3/2   P
(D62) 6 (------------------------- - --------------------------
		 8 SQRT(P)		        16 P

									1
								     - ---
					   1		        1      2 P
					- ---   3 M	     (- -) %E
			      2		  2 P	   - 1/2, 1/2   P	     4
		     + I (----------) %E      + --------------------------)/P
			0 SQRT(14) P			    2

(C63) J[1](T)^2*%E^(-P*T+R);
time= 12 msec.
				2      R - P T
(D63) 			       J (T) %E
				1

(C64) DEFINTE(%,T);
time= 269 msec.
					   4	    2
					  (-- + 2) P
					    2
					   P		 R
		    %PI SQRT(2) Q      (- -----------) %E
				 1/2, 0	       4
(D64) 		    --------------------------------------
				      4	 3/2  3
			      16 (1 - --)    P
				       2
				      P

(C65) T^(1/2)*J[1/2](T^(1/2))^2*%E^(-P*T);
time= 15 msec.
			 2		        - P T
(D65) 		        J   (SQRT(T)) SQRT(T) %E
			 1/2

(C66) DEFINTE(%,T);
time= 1178 msec.
				     %I	      - 1/P
			    %I ERF(-------) %E
				   SQRT(P)
(D66) 			  - -----------------------
					   3/2
				SQRT(%PI) P

(C67) T^(5/2)*Y[1/2](T^(1/2))^2*%E^(-P*T);
time= 15 msec.
			   2		 5/2   - P T
(D67) 			  Y   (SQRT(T)) T    %E
			   1/2

(C68) DEFINTE(%,T);
time= 1962 msec.
				    %I	    5/2	  - 1/P
	       3 %I SQRT(%PI) ERF(-------) P    %E
				  SQRT(P)
(D68) - 12 ((- ----------------------------------------
				  8

		      %I      3/2   - 1/P
   %I SQRT(%PI) ERF(-------) P	  %E
		    SQRT(P)
 - --------------------------------------
		     2

		      %I	       - 1/P
   %I SQRT(%PI) ERF(-------) SQRT(P) %E		  2
		    SQRT(P)		       3 P    P	  2
 - ----------------------------------------- - ---- - -)/P
		       2		        4     2

			 %I	 3/2   - 1/P
      %I SQRT(%PI) ERF(-------) P    %E
		       SQRT(P)
 + 2 (--------------------------------------
			4

		      %I	       - 1/P
   %I SQRT(%PI) ERF(-------) SQRT(P) %E
		    SQRT(P)		       P
 + ----------------------------------------- + -)/P
		       2		       2

		      %I	       - 1/P
   %I SQRT(%PI) ERF(-------) SQRT(P) %E
		    SQRT(P)			    4
 - -----------------------------------------)/(%PI P )
		       2

(C69) I[0](2*A^(1/2)*T^(1/2))^2*%E^(-P*T);
time= 15 msec.
			 2		        - P T
(D69) 		        I (2 SQRT(A) SQRT(T)) %E
			 0

(C70) DEFINTE(%,T);
Is  A  zero or nonzero?

N;
time= 350 msec.
					      2 A
					      ---
			       4 SQRT(2) A     P
			    I (-----------) %E
			     0  SQRT(7) P
(D70) 			    ---------------------
				      P

(C71) T^(3/4)*J[1/2](T)*J[1/4](T)*%E^(-P*T);
time= 15 msec.
					  3/4   - P T
(D71) 			 J   (T) J   (T) T    %E
			  1/4	  1/2

(C72) DEFINTE(%,T);
time= 1271 msec.
				       1	 16     1/4
		  3 P		 (------------) (-- - 1)    P
		     - 5/4, - 1/2      4	  4
				  SQRT(-- + 1)	 P
					2
				       P
(D72) 	     - -------------------------------------------------
		  3/4  %I SQRT(2)   SQRT(2) 3		      1
	       4 2    (---------- + -------)  SQRT(%PI) GAMMA(-)
			   2	       2		      4

(C73) J[1/2](T^(1/2))*Y[1/2](T^(1/2))*%E^(-P*T);
time= 15 msec.
						   - P T
(D73) 		     J	 (SQRT(T)) Y   (SQRT(T)) %E
		      1/2	    1/2

(C74) DEFINTE(%,T);
time= 499 msec.
								1
							     - ---
				     1	   2	     1	       2 P
	      2 %I SQRT(7) (14 SIN(-----) P  - COS(-----)) %E
				       2	       2
				   14 P		   14 P
(D74) 	    - ----------------------------------------------------
				  %PI SQRT(P)

(C75) T*I[0](A*T/2)*I[1](A*T/2)*%E^(-P*T);
time= 16 msec.
			     A T     A T      - P T
(D75) 			  I (---) I (---) T %E
			   0  2	   1  2

(C76) DEFINTE(%,T);
time= 387 msec.
					2	   2
				     2 A	  A
		     P	        (1 - ----) A SQRT(-- - 1)
		      - 1/2, - 1       2	   2
				      P		  P
(D76) 		     ------------------------------------
				  2	   2
				 A	  A	   3
			  2 (1 - --) SQRT(-- + 1) P
				  2	   2
				 P	  P

(C77) I[1/2](T^(1/2))*K[1/2](T^(1/2))*%E^(-P*T);
time= 15 msec.
						   - P T
(D77) 		     I	 (SQRT(T)) K   (SQRT(T)) %E
		      1/2	    1/2

(C78) DEFINTE(%,T);
time= 3820 msec.
							     1
							    ---
				    1	  2	    1	    2 P
      %I (%I + 1) SQRT(7) (14 SIN(-----) P  - COS(-----)) %E
				      2		      2
				  14 P		  14 P
(D78) ---------------------------------------------------------
			      2 SQRT(P)

						       1
						      ---
			      1	    2	      1	      2 P
   (%I + 1) SQRT(7) (14 SIN(-----) P  - COS(-----)) %E
				2	        2
			    14 P	    14 P
 - ------------------------------------------------------
			 2 SQRT(P)

							  1
							 ---
				 1     2	 1	 2 P
   %I (%I - 1) SQRT(7) (14 SIN(-----) P  - COS(-----)) %E
				   2		   2
			       14 P	       14 P
 + ---------------------------------------------------------
			   2 SQRT(P)

						       1
						      ---
			      1	    2	      1	      2 P
   (%I - 1) SQRT(7) (14 SIN(-----) P  - COS(-----)) %E
				2	        2
			    14 P	    14 P
 + ------------------------------------------------------
			 2 SQRT(P)

(C79) /* RELATED TO BF'S FUNCTIONS. */

/* STRUVE FUNCTIONS. */

T^(-1/2)*LSTRUVE[-1/2](T^(1/2))*%E^(-P*T);
time= 16 msec.
						- P T
			LSTRUVE	    (SQRT(T)) %E
			       - 1/2
(D79) 		        -----------------------------
				   SQRT(T)

(C80) DEFINTE(%,T);
time= 1401 msec.
(D80) 

									    1
									   ---
				1/8	  1	   3	        1	   8 P
   (%I - 1) (%I + 1) SQRT(2) 224    GAMMA(-) GAMMA(-) I	  (------------) %E
					  4	   4   1/4 2 SQRT(14) P
 - ---------------------------------------------------------------------------
			       8 SQRT(%PI) SQRT(P)

(C81) T^(3/2)*HSTRUVE[1](T^(1/2))*%E^(-P*T);
time= 13 msec.
					   3/2	 - P T
(D81) 		        HSTRUVE (SQRT(T)) T    %E
			       1

(C82) DEFINTE(%,T);
time= 2564 msec.
		1					       1
	     - ---					    - ---
	       4 P			     %I	      7/2     4 P
(D82) 5 (3 %E	   ((120 %I SQRT(%PI) ERF(---------) P	  %E
					  2 SQRT(P)

					    1
					 - ---
			  %I	   5/2	   4 P
 + 36 %I SQRT(%PI) ERF(---------) P    %E
		       2 SQRT(P)

					   1
					- ---
			 %I	  3/2	  4 P
 + 6 %I SQRT(%PI) ERF(---------) P    %E
		      2 SQRT(P)

					    1				  1
					 - ---				 ---
		       %I		   4 P	      3	      2		 4 P
 + %I SQRT(%PI) ERF(---------) SQRT(P) %E      + 120 P  + 16 P  + 2 P) %E
		    2 SQRT(P)

					       1
					    - ---
			     %I	      5/2     4 P
 + (- 12 %I SQRT(%PI) ERF(---------) P	  %E
			  2 SQRT(P)

					   1
					- ---
			 %I	  3/2	  4 P
 - 4 %I SQRT(%PI) ERF(---------) P    %E
		      2 SQRT(P)

					    1			 1
					 - ---		        ---
		       %I		   4 P	     2	        4 P	  2
 - %I SQRT(%PI) ERF(---------) SQRT(P) %E      - 12 P  - 2 P) %E   )/(16 P )
		    2 SQRT(P)

	  1						  1
       - ---					       - ---
	 4 P			        %I	 5/2	 4 P
 + 3 %E	     ((- 12 %I SQRT(%PI) ERF(---------) P    %E
				     2 SQRT(P)

					   1
					- ---
			 %I	  3/2	  4 P
 - 4 %I SQRT(%PI) ERF(---------) P    %E
		      2 SQRT(P)

					    1			 1
					 - ---		        ---
		       %I		   4 P	     2	        4 P
 - %I SQRT(%PI) ERF(---------) SQRT(P) %E      - 12 P  - 2 P) %E
		    2 SQRT(P)

					    1
					 - ---
			  %I	   3/2	   4 P
 + (2 %I SQRT(%PI) ERF(---------) P    %E
		       2 SQRT(P)

					    1		 1
					 - ---	        ---
		       %I		   4 P	        4 P
 + %I SQRT(%PI) ERF(---------) SQRT(P) %E      + 2 P) %E   )/(2 P)
		    2 SQRT(P)

	  1	     1
       - ---	    ---
	 4 P	    4 P			        %I	 3/2	       7/2
 + 3 %E	     (2 P %E    + 2 %I SQRT(%PI) ERF(---------) P   ))/(3 %PI P	  )
					     2 SQRT(P)

(C83) T^(-1/2)*LSTRUVE[-1/2](A*T)*%E^(-P*T);
time= 15 msec.
					      - P T
			  LSTRUVE     (A T) %E
				 - 1/2
(D83) 			  -------------------------
				   SQRT(T)

(C84) DEFINTE(%,T);
time= 1374 msec.
						     %I A
		    %I (%I - 1) (%I + 1) SQRT(2) ERF(----)
						      P
(D84) 		    --------------------------------------
				  4 SQRT(A)

(C85) T*HSTRUVE[1](T)*%E^(-P*T);
time= 10 msec.
					    - P T
(D85) 			    HSTRUVE (T) T %E
				   1

(C86) DEFINTE(%,T);
time= 230 msec.
				     16 %I
(D86) 			  - -----------------------
				 3/2  1	     3/2  3
			    3 %PI    (-- + 1)    P
				       2
				      P

(C87) /* LOMMEL FUNCTIONS. */

T^(9/8)*S[1/2,1/4](T^(1/2))*%E^(-P*T);
time= 14 msec.
					   9/8	 - P T
(D87) 		       S        (SQRT(T)) T    %E
			1/2, 1/4

(C88) DEFINTE(%,T);
time= 532 msec.
							1    5 %I %PI
						     - --- - --------
		     1/4	    5	  1    5/8     4 P      8
		  5 2    GAMMAGREEK(-, - ---) P	   %E
	      7			    8	 4 P
(D88) 3 GAMMA(-) (---------------------------------------------------
	      8				   4

		  5 %I %PI
		- --------
	  1/4	     8		      13     1	  13/8
      65 2    %E	   GAMMAGREEK(--, - ---) P
				      8	    4 P
 - 2 (------------------------------------------------
			     4

	       5 %I %PI
	     - --------
       1/4	  8		   5	 1    5/8       1
   65 2	   %E	        GAMMAGREEK(-, - ---) P	     - ---
				   8    4 P	       4 P	       23/8
 + ----------------------------------------------) %E	  /(13 P))/(4 P	   )
			 16

(C89) T^(1/4)*S[1/2,-1/2](T^(1/2))*%E^(-P*T);
time= 16 msec.
					    1/4	  - P T
(D89) 		      S		 (SQRT(T)) T    %E
		       1/2, - 1/2

(C90) DEFINTE(%,T);
time= 301 msec.
						       1
						    - ---
					  %I	      4 P
		      %I SQRT(%PI) ERF(---------) %E
				       2 SQRT(P)
(D90) 		    - -----------------------------------
				       3/2
				    2 P

(C91) T^(1/8)*SLOMMEL[1/2,1/4](T^(1/2))*%E^(-P*T);
time= 14 msec.
					      1/8   - P T
(D91) 		    SLOMMEL	   (SQRT(T)) T	  %E
			   1/2, 1/4

(C92) DEFINTE(%,T);
time= 3243 msec.
				      1					   1
				     ---			        - ---
	      5	       7      %PI    4 P	 5	  7	 %PI	  4 P
	GAMMA(-) GAMMA(-) COS(---) %E	   GAMMA(-) GAMMA(-) SIN(---) %E
	      8	       8       8		 8	  8	  8
(D92) - -------------------------------- + ----------------------------------
		    3/4	 5/4			        3/4  5/4
		   2    P			       2    P

								 1    5 %I %PI
							      - --- - --------
			  1/4		 5     1	 7      4 P	 8
			 2    GAMMAGREEK(-, - ---) GAMMA(-) %E
					 8    4 P	 8
		       + -----------------------------------------------------
						   5/4
						2 P

(C93) T^(1/4)*SLOMMEL[1/2,-1/2](T^(1/2))*%E^(-P*T);
time= 16 msec.
					       1/4   - P T
(D93) 		   SLOMMEL	    (SQRT(T)) T	   %E
			  1/2, - 1/2

(C94) DEFINTE(%,T);
time= 804 msec.
						       1
						    - ---
					  %I	      4 P
		      %I SQRT(%PI) ERF(---------) %E
				       2 SQRT(P)
(D94) 		    - -----------------------------------
				       3/2
				    2 P

time= 70663 msec.
(D95) 				  BATCH DONE

(C96) CLOSEFILE(SPEC,EX)$
