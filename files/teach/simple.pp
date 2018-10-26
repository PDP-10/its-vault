;;; -*- Mode:LISP; -*-
;;;

;;;; A minimal Lisp pretty printer

;;; Helping functions 

 ;; PP$POS   tells the current column that we are at on a given line
 ;; PP$LINEL tells the length of the line we are PP'ing to
 ;; PP$SIZE tells the amount of space left on the line from current point
 ;; PP$FLATSIZE tells the printwidth of an object -- flatsize offers a good
 ;;   first order approximation

(DEFUN PP$POS   () (CHARPOS TYO))
(DEFUN PP$LINEL () (LINEL TYO))

(DEFUN PP$SIZE () (- (PP$LINEL) (PP$POS)))

(DEFUN PP$FLATSIZE (X) (FLATSIZE X))

 ;; PP$INDENT-TO will indent to column X on the subsequent line

(DEFUN PP$INDENT-TO (X) (TERPRI) (DO ((I 0. (1+ I))) ((= I X)) (TYO 32.)))

 ;; Allow for later changes that make these options more hairy.
 ;; ... but for now just make them use PRIN1 --

    (DEFUN PP$ATOM (X) (PRIN1 X)) ; For printing ATOMs
    (DEFUN PP$LIST (X) (PRIN1 X)) ; For printing (linearly) lists

;;; Driver Function

 ;; PP will get a fresh line and pretty print a form there

(DEFUN PP (X) (TERPRI) (PP1 X) (TERPRI) '*)

 ;; PP1 will pretty print a form starting at the current screen position 

(DEFUN PP1 (X)
       (COND ((ATOM X) (PP$ATOM X))
	     ((> (PP$FLATSIZE X) (PP$SIZE))
	      (PRINC '|(|)
	      (LET ((P (PP$POS)))
		   (PP1 (CAR X))
		   (COND ((NOT (ATOM (CAR X))) (PP$INDENT-TO (1- P)))))
	      (DO ((L (CDR X) (CDR L)) (FLAG () T) (P (PP$POS)))
		  ((ATOM L)
		   (COND ((NOT (NULL L)) (PRINC '| . |) (PP1 L)))
		   (PRINC '|)|))
		  (PRINC '| |)
		  (AND FLAG (PP$INDENT-TO (1+ P)))
		  (PP1 (CAR L))))
	     (T
	      (PP$LIST X))))


