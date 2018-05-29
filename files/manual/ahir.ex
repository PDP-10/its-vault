
(C52) 
(D[T]^N)(A,B)=SUBST(T,T',(DIFF[T] - DIFF[T'])^N(A(T)*B(T'));
"'" is not an infix operator
( D [ T ] ^ N ) ( A , B ) = SUBST ( T , T ' **$** , ( DIFF [ T ] - DIFF [ 
T ' ] ) ^ N ( A ( T ) * B ( T ' ) )   
Please rephrase or edit

(C52) 
(D[T]^N)(A,B)=SUBST(T,S,(DIFF[T] - DIFF[_T'])^N(A(T)*B(T'))

(D[T]^N)(A,B)=SUBST(T,S,(DIFF[T] - DIFF[S])^N(A(T)*B(S_))

(D[T]^N)(A,B)=SUBST(T,S,(DIFF[T] - DIFF[S])^N(A(T)*B(S));
Unbalanced matchfix operator
( D [ T ] ^ N ) ( A , B ) = SUBST ( T , S , ( DIFF [ T ] - DIFF [ S ] ) ^ 
N ( A ( T ) * B ( S ) ) **$**   
Please rephrase or edit

(C52) 
(D[T]^N)(A,B)=SUBST(T,S,(DIFF[T] - DIFF[S])^N(A(T)*B(S)));
				  N
(D52) 			        (D )(A, B) = 0
				  T

(C53) 
(D[T]^N)(A,B)=AT((DIFF[T] - DIFF[S])^N(A(T)*B(S)),[T=S]);

AT FASL DSK MAXOUT being loaded 
loading done
				  N
(D53) 			        (D )(A, B) = 0
				  T

(C54) 
(D[T]^N)(A,B)=EV((DIFF[T] - DIFF[S])^N(A(T)*B(S)),NOEVAL,T=S);
				  N
(D54) 			        (D )(A, B) = 0
				  T

(C55) 
(D[T]^N)(A,B)=(DIFF[T] - DIFF[S])^N(A(T)*B(S)));
Too many )
( D [ T ] ^ N ) ( A , B ) = ( DIFF [ T ] - DIFF [ S ] ) ^ N ( A ( T ) * B 
( S ) ) ) **$**   
Please rephrase or edit

(C55) 
(D[T]^N)(A,B)=(DIFF[T] - DIFF[S])^N(A(T)*B(S));
		     N			       N(B(S) A(T))
(D55) 		   (D )(A, B) = (DIFF  - DIFF )
		     T		     T	     S

(C56) 
(D[T]^N)(A,B)=((DIFF[T] - DIFF[S])^N)(A(T)*B(S));
		    N			       N
(D56) 		  (D )(A, B) = ((DIFF  - DIFF ) )(B(S) A(T))
		    T		     T	     S

(C57) 
(C57) CLOSEFILE(AHIR,EX);
