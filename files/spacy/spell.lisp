BABYL OPTIONS:
Version:5
Append:1

1, recent,,
Received: from MIT-MC by MIT-OZ via Chaosnet; 9 Jan 85 12:48-EST
Date: 9 January 1985 12:44-EST
From: Roland Ouellette <ROLY @ MIT-MC>
Subject: spelling "fasload" and "synonym"
To: DCP @ SCRC-QUABBIN
cc: ALAN @ MIT-MC, BUG-LISPM @ MIT-OZ

*** EOOH ***
Received: from MIT-MC by MIT-OZ via Chaosnet; 9 Jan 85 12:48-EST
Date: 9 January 1985 12:44-EST
From: Roland Ouellette <ROLY @ MIT-MC>
Subject: spelling "fasload" and "synonym"
To: DCP @ SCRC-QUABBIN
cc: ALAN @ MIT-MC, BUG-LISPM @ MIT-OZ

    From: David C. Plummer <DCP at SCRC-QUABBIN>

        From: Alan Bawden <Alan at MIT-MC>

        [ Does the next release finally have editor commands for spelling
          correction in it?  (Like PDP10 Emacs has for years.) ]

    No.  I've managed to get it on the Release 7 goal list, though.

The following bit of (stolen) code gets me a network spelling checker.
I keep it in my init file.
Because it thrashes around in the net, it takes a while (longer the
first time?), on the order of half a minute when things are slow.
It does the trick though.

Roland G. Ouellette

zwei:
(progn
  'compile
  (defun lookup-word-on-host (word)
    (let ((services (neti:find-paths-to-service :spell)))
      (with-stack-list (args word)
	(loop for service in services
	       collect (condition-case (result)
			    (neti:invoke-service-access-path service args)
			  (sys:connection-error result)
			  (:no-error (return result)))
	       into failures
	       finally (barf "~&Could not find anyone to spell ~A:~{~A~}" word failures)))))
  
  (chaos:add-contact-name-for-protocol :spell)
  
  (neti:define-protocol :spell (:spell :byte-stream)
    (:invoke-with-stream-and-close (stream word)
     (send stream :string-out (string word))
     (send stream :finish)
     (prog1 (read stream) (send stream :close :abort))))
  
  (add-initialization "Spell property lists"
			 '(neti:find-paths-to-service :spell)
			 '(:now)
			 'neti:commonly-used-property-lists)
  
  (defun get-word (bp)
    (let* ((end-bp (if ( (word-syntax (bp-char bp)) word-alphabetic) bp (forward-word bp)))
	    (start-bp (forward-word end-bp -1)))
      (values start-bp end-bp)))
  
  (defun replace-word (new-word start-bp end-bp)
    (kill-interval start-bp end-bp t)
    (insert start-bp new-word))
  
  (defvar *spell-hash-table* (make-instance 'si:equal-hash-table))
  
  (defun lookup-word (word)
    (or (send *spell-hash-table* :get-hash word)
	(let ((new-words (condition-case (.error.)
				 (lookup-word-on-host word)
			       (sys:connection-error (barf "~A" .error.)))))
	  (when new-words (send *spell-hash-table* :put-hash word new-words))
	  new-words)))
  
  (defcom com-spell-word "Checks the spelling of a word, and offers to correct if necessary."
    ()
    (let ((old-smarts-value zwei:*kill-interval-smarts*))
      (setf zwei:*kill-interval-smarts* nil)
      (prog1 (multiple-value-bind (start-bp end-bp)
		  (get-word (point))
		(let* ((word (string-interval start-bp end-bp t))
			(old-word word)
			(initial-uppercase (char-uppercase-p (bp-char start-bp)))
			(second-char (bp-char (forward-char start-bp)))
			(second-uppercase (char-uppercase-p second-char))
			(second-lowercase (char-lowercase-p second-char))
			(good-word (lookup-word word)))
		  (cond ((eq good-word t)
			  (typein-line "~A is spelled correctly." (string-upcase word))
			  dis-none)
			 ((null good-word)
			  (barf "Can't figure out how to spell /"~A/"..." word))
			 (t (setq word
				  (if (cdr good-word)
				      (tv:menu-choose good-word)
				      (first good-word)))
			    (if (null word) (barf)
				(setq word
				      (if initial-uppercase
					  (if (or second-uppercase
						  (and (not second-lowercase)
							(send *major-mode* :all-uppercase)))
					      word
					      (setq word (string-downcase word))
					      (setf (aref word 0) (char-upcase (aref word 0)))
					      word)
					  (string-downcase word)))
				(typein-line "Replaced ~A ==> ~A." old-word word)
				(replace-word word start-bp end-bp)
				(multiple-value-bind (new-start-bp new-end-bp)
				    (get-word start-bp)
				  (kill-interval new-start-bp new-end-bp t)
				  (yank-command *kill-history*))
				dis-text)))))
	      (setf zwei:*kill-interval-smarts* old-smarts-value))))
  )								; END OF ZWEI:

zwei:(set-comtab-return-undo
		    *standard-comtab*
		    '(#\m-$               com-spell-word))
