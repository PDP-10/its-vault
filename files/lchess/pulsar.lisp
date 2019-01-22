;-*- Lisp-*-;

(comment)
(progn (sstatus feature noldmsg)
       (eval (read)))
(progn (close (prog1 infile (inpush  -1)))


(load "liblsp;iota >")

(setq ibase 10.
      base 10.
      *nopoint t
      info-micro-ai-segs
      (list '|(@file [dsk:cstacy;zpulse ifmxx0])|   
	    '|(@file [dsk:cstacy;zpulse ifmxx1])|
	    '|(@file [dsk:cstacy;zpulse ifmxx2])|
	    '|(@file [dsk:cstacy;zpulse ifmxx3])|
	    '|(@file [dsk:cstacy;zpulse ifmxx4])|
	    '|(@file [dsk:cstacy;zpulse ifmxx5])|
	    '|(@file [dsk:cstacy;zpulse ifmxx6])|
    	    '|(@file [dsk:cstacy;zpulse ifmxx7])| ))

(defun pulsar-top-level NIL
  (cursorpos 'C)
  (princ "PULSAR V2.5" T) (terpri T)
  (princ (list "Using AI for" (length info-micro-ai-segs) "segments.") T)
  (valret "")
  (publish-info-micro 'ai)
  (quit))

(defun quit NIL
    (syscall (+ (lsh 0 18.) 0) 'logout))

(defun publish-info-micro (site)
  (iota ((record "dsk:.mail.;ifmcro record" '(ascii out)))
    (write-log-header record)
    (cond ((equal site 'ai)
	   (transmit-digest info-micro-ai-segs
			    "dsk:cstacy;next ifmdst"
			    record))
	  ((equal site 'ml)
	   (transmit-digest info-micro-ml-segs
			    "dsk:cstacy;next ifmdst"
			    record)))
    (transmit-alert record)
    (renamef record "MAIL >")))

(defun write-log-header (record)
  (princ '|FROM-PROGRAM:PULSAR| record) (terpri record)
  (princ '|FROM-XUNAME:CSTACY|  record) (terpri record)
  (princ '|FROM-UNAME:PULSAR|   record) (terpri record)
  (princ '|AUTHOR:PULSAR|       record) (terpri record)
  (princ '|HEADER-FORCE:ITS|    record) (terpri record)
  (princ '|SUBJECT: INFO-MICRO Digest Transmission| record)
  (terpri record)
  (princ '|RCPT:(CSTACY AI)| record) (terpri record)
  (princ '|TEXT;-1| record) (terpri record))

(defun transmit-digest (segment-FNs digest-FN record)
  (transmit-segment '(cstacy ai) digest-FN record)
  (if (continuep)
      (do ((queue segment-FNs (cdr queue)))
	  ((null queue))
	(transmit-segment (car queue) digest-FN record))
      (abort-digest-xmission)))

(defun continuep NIL
  (cursorpos 'C)
  (princ "OK to Proceed?" T)
  (cond ((equal (tyi T) 32.)
	 (valret "10")
	 T)))
	     
(defun abort-digest-xmission NIL
  (cursorpos 'C)
  (princ "Digest Transmission ABORTED by user" T)
  (valret '|:KILL/
|))
      
(defun transmit-segment (segment digest-FN record)
  (iota ((digest digest-FN '(ascii in))
	 (message "dsk:.mail.;mail >" '(ascii out)))
    (princ '|FROM-PROGRAM:PULSAR| message) (terpri message)
    (princ '|FROM-XUNAME:CSTACY|  message) (terpri message)
    (princ '|FROM-UNAME:CSTACY|   message) (terpri message)
    (princ '|AUTHOR:CSTACY|       message) (terpri message)
    (princ '|HEADER-FORCE:NET|    message) (terpri message)
    (princ '|RCPT:| message) (princ segment message) (terpri message)
    (do ((char (tyi digest -1) (tyi digest -1))
	 (count 0              (add1 count)))
	((minusp char) (princ segment record)
		       (tyo 32. record)
		       (princ count record)
		       (princ '| chars in message | record)
		       (terpri record))
      (if (not (equal char 3))
	  (tyo char message)))
    (terpri message)
    (wait-for-unbusy-comsat)))

(defun wait-for-unbusy-comsat ()
  (do ()
      ((and (not (probef '((dsk |.mail.|) mailin >)))
	    (not (probef '((dsk |.mail.|) mail   >)))))
    (sleep 180.)))

(defun transmit-alert (record)
  (iota ((alert "dsk:cstacy;next ifmalt" '(ascii in))
	 (message "dsk:.mail.;mail >" '(ascii out)))
    (princ '|FROM-PROGRAM:PULSAR| message) (terpri message)
    (princ '|FROM-XUNAME:CSTACY|  message) (terpri message)
    (princ '|FROM-UNAME:CSTACY|   message) (terpri message)
    (princ '|AUTHOR:CSTACY|       message) (terpri message)
    (princ '|HEADER-FORCE:NET|    message) (terpri message)
    (princ '|RCPT-LIST-NAME:INFO-MICRO|    message)    (terpri message)
    (princ '|SUBJECT:INFO-MICRO Digest Alert| message) (terpri message)
    (princ '|RCPT:(@file  [dsk:cstacy;ifmcro disalt])| message)
    (terpri message)
    (princ '|TEXT;-1| message) (terpri message)
    (do ((char (tyi alert -1) (tyi alert -1))
	 (count 0 (add1 count)))
	((minusp char) (princ '|Digest Alert Queued| record)
		       (terpri record))
      (if (not (equal char 3))
	  (tyo char message)))
    (terpri message)))

(sstatus toplevel
	 (pulsar-top-level))  )  ;; end of file PROGN
