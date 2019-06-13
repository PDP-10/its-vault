;;; -*-  Mode: LISP; Package:user; Base: 8; Lowercase:T -*-

;;At boot time, the FEP builds the table, sys:machine-id-proms
;;which has an entry for each existing board, but NOT for empty slots.
;;You can see whats in this by doing si:show-configuration. Meta-.'ing
;;this function is instructive.

;See AI:LMXBUS;LXB ECO or ML:SLXB;LXB ECO for assignment log, board notes, and bug notes.

(defun show-id ()
  (dotimes (n 10.)
    (format t "~%")
    (dotimes (i 34.) (format t " ~3o" (aref sys:machine-id-proms (+ 6 (* n 36.) i)))))
  (format t "~%")
  (dotimes (i 30.) (format t " ~3o" (aref sys:machine-id-proms (+ 6 (* 10. 36.) i)))))
; 0    1  2  3  4  5  6  7 10 11 12    13        14         15      16 17
;           low ---> hi low ---> hi                                 lo hi
; 252 125 0 PN PN PN PN SN SN SN SN REV(manuf) REV(fcnl) REV(minor) UD UD
;  0   0  0  0  0  0  0  0  0  0  0  0            0       CHECKSUM  20 377

;This function seems compatible with Symbolics id proms.
(defun load-id-prom-array (array pn sn rev-manuf rev-fcnl eco-level date &aux ud checksum)
  (fillarray array '(0))
  (aset 252 array 0)				;check bits
  (aset 125 array 1)				;more check bits
  (aset 0 array 2)				;id type - always seem to be 0
  (aset (ldb (byte 10 0) pn) array 3)		;part number low
  (aset (ldb (byte 10 10) pn) array 4)
  (aset (ldb (byte 10 20) pn) array 5)
  (aset (ldb (byte 10 30) pn) array 6)		;part number high
  (aset (ldb (byte 10 0) sn) array 7)   	;serial number low
  (aset (ldb (byte 10 10) sn) array 10)
  (aset (ldb (byte 10 20) sn) array 11)
  (aset (ldb (byte 10 30) sn) array 12) 	;serial number high
  (aset rev-manuf array 13)			;major rev level - as manufactured
  (aset rev-fcnl array 14)			;major rev level - as board functions
  (aset eco-level array 15)			;minor rev level - always seem to be 0
						;compute "universal date" - i.e. days
						;since 1/1/82
  (setq ud (// (- (time:parse-universal-time date)
		  (time:parse-universal-time "12-31-81"))
	       (* 60. 60. 24.)))
  (aset (ldb (byte 10 0) ud) array 16)		;universal date low
  (aset (ldb (byte 10 10) ud) array 17) 	;universal date high
  (setq checksum (compute-array-checksum array))
  (aset (ldb (byte 10 0) checksum) array 34)	;checksum
  (aset 20 array 35)				;# checksummed prom locations
  (aset 0 array 36)				;check bits
  (aset 377 array 37))				;more check bits

;;SOME UTILITY FUNCTIONS FOR GENERATING CHECKSUMS
(defun compute-array-checksum (array)
  (loop for idx below (array-dimension-n 1 array)
	as rotation = (ldb (byte 3 0) idx)
	as byte = (aref array idx)
	as rotated-byte = (dpb byte (byte (- 8 rotation)
					  rotation)
			       (ldb (byte rotation
					  (- 8 rotation))
				    byte))
	sum rotated-byte into temp
	finally (return (ldb (byte 8 0) temp))))

(defun compute-prom-checksum (prom)
  (loop for idx below (si:id-prom-field prom :n-checksummed-locs)
	as rotation = (ldb (byte 3 0) idx)
	as byte = (si:id-prom-byte prom idx)
	as rotated-byte = (dpb byte (byte (- 8 rotation)
					  rotation)
			       (ldb (byte rotation
					  (- 8 rotation))
				    byte))
	sum rotated-byte into checksum
	finally (return (ldb (byte 8 0) checksum))))

(defun get-prom-checksum (prom)
  (si:id-prom-field prom :checksum))


;messages from SCRC:

;29-Aug-84 17:51:08-EDT,3932;000000000001
;Mail-From: PHILIP created at 29-Aug-84 17:51:06
;Date: Wed 29 Aug 84 17:51:06-EDT
;From: PHILIP@MIT-OZ
;Subject: [Joseph R Goldstone <joseph at SCRC-QUABBIN>: ID PROM board part numbers 
;and customer designed boards]
;To: ngl@MIT-OZ

;Received: from SCRC-STONY-BROOK by MIT-OZ via Chaosnet; 29 Aug 84 14:40-EDT
;Received: from SCRC-HARLEM by SCRC-STONY-BROOK via CHAOS with CHAOS-MAIL id 81608;
; Wed 29-Aug-84 11:54:56-EDT
;Date: Wednesday, 29 August 1984, 11:54-EDT
;From: Joseph R Goldstone <joseph at SCRC-QUABBIN>
;Subject: ID PROM board part numbers and customer designed boards
;To: Chas J. Horvath <CHAS at SCRC-TENEX>
;cc: Philip at MIT-OZ
;In-Reply-To: <840829104148.4.CHAS@JESSUP.SCRC.Symbolics>
;Message-ID: <840829115435.0.JOSEPH@HARLEM.SCRC.Symbolics>

;    Date: Wednesday, 29 August 1984, 10:41-EDT
;    From: Chas J. Horvath <CHAS at SCRC-TENEX>

;    Symbolics plans to start supporting customer design of Lbus compatible
;    boards. The first customer to design their own Lbus compatible board is
;    Thinking Machines Corporation. 
;Not so, there's an LBus-compatible board now in use by the vision research
;group at MIT.  Remember when we composed that huge message on how ID proms
;should work, how they should set up the vision memory and/or device registers,
;and so on?  I could probably dig up the message if you want.
;				   Thinking Machines is designing a board
;    that interfaces the 3600 with a "connection machine" of their own
;    design. They expect to have prototypes of their Lbus compatible
;    interface board within a month or two.

;    All Lbus compatible boards contain an ID PROM. This ID PROM specifies a
;    board part number which identifies what type of board is plugged into
;    each Lbus slot. For boards that the FEP knows about this information is
;    sometimes used by the FEP for initializations. For boards the FEP does
;    not know about the board part number is just made available to lisp in
;    an array.
;What will the FEP's "show configuration" display look like for these boards?
;Maybe there should be a lisp function that does much the same thing, but also
;is able to look at some database of local part numbers.  If we wanted to be
;really cool we could distribute part number registries with each release, but
;that's probably too insecure for some customers.

;    All sorts of problems can occur if a customer happens to pick a board
;    type number for a externally designed board that happens to coincide
;    with a number we use for one of our boards. It is important that we set
;    aside a block of numbers for use by customers that we will be assured to
;    never use ourselves.

;    To this end I have talked with Bruce Elsea at Chatsworth. We have agreed
;    to set aside board numbers 1. thru 500. for customer designed boards.
;    Bruce has made a note of it at SCH and I have placed a comment to that
;    affect in "P:>lmach>id>board-types.lisp",
;    "Q:>lmach>id>board-types.lisp", and "G:>lmach>id>board-types.lisp".
;    Currently all Symbolics designed/manufactured board type numbers are of
;    the form 170XXX (decimal).
;Who looks at Pointer these days?  Or do I misunderstand "P:"?

;    I am giving Thinking Machines board type number 1. and recording this
;    fact in the >board-types.lisp files. 
;Well, OK, we should ask the vision group what they did for a board type number.
;					 I think it would not be a bad idea
;    to start a policy of assigning a different number for each customer
;    designed board. This is to avoid future problems that will occur when we
;    are as large as IBM and have thousands of customers designing Lbus
;    compatible boards. The Lbus specification will instruct customers to
;    obtain board numbers from Symbolics.
;If we ever get as large as IBM (ha!) then 500 numbers will last a week.

;    I would appreciated any comments or suggestions that anyone has.
;-------

; 3/25/86 Requested (joseph@scrs, chas@scrc) 8 ID PROM part numbers:
; 0 - "MIT XBUS Adaptor"
; 1-7 "MIT Vision Machine Card #n"
