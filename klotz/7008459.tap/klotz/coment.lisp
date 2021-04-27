BABYL OPTIONS:
Version:5
Append:1

1, recent,,
Received: from SCRC-YUKON by MIT-OZ via Chaosnet; 24 Jan 84 13:49-EST
Received: from SCRC-ANNISQUAM by SCRC-YUKON with CHAOS; Tue 24-Jan-84 13:38:56-EST
Date: Tuesday, 24 January 1984, 13:48-EST
From: Doug Dodds <DODDS at SCRC-TENEX>
Subject: semi-colon parsing
To: SAZ at MIT-OZ
Cc: bug-zmacs at MIT-OZ, bug-emacs at MIT-OZ
In-reply-to: The message of 23 Jan 84 20:29-EST from SAZ at MIT-OZ
Message-ID: <840124134856.2.DODDS@SCRC.SCRC.Symbolics>

*** EOOH ***
Date: Tuesday, 24 January 1984, 13:48-EST
From: Doug Dodds <DODDS at SCRC-TENEX>
To:   SAZ at MIT-OZ
cc:   bug-zmacs at MIT-OZ, bug-emacs at MIT-OZ
Re:   semi-colon parsing

    Date: Mon 23 Jan 84 20:29:50-EST
    From: SAZ@MIT-OZ

    Does it strike anybody as annoying that control-E takes you to
    the end of a commented line (ie to the end of the comment) rather
    than just the end of the final s-expr on the line?  I know I sure
    do. 

Personally, I couldn't do without this functionality.  My Lispm-Init
loads the following nifty function, by JWalker:
    
    zwei:
    (defcom COM-END-OF-CODE-LINE
	    "Goes to the end of the last /"real/" character on the line.
    This provides a way to get positioned on a line so you can add to or modify
    the code, not the comment.  A numeric argument specifies how many lines to move.  
    I don't see how people live without this.  Maybe if you never comment your code
    you don't notice that this is missing.  " ()
      (let* ((the-line (bp-line (forward-line (point)	;find the line wanted
					      (if *numeric-arg-p* *numeric-arg* 0))))
	     (index (find-comment-start the-line t)))	;index for comment
	(cond ((null index)				;no comment on line
	       (move-to-bp (end-line (create-bp the-line 0))))	;so just go to end
	      (t
	       (move-to-bp (backward-over *blanks* (create-bp the-line index))))))
      dis-bps)

My init file does a login binding of this function to s-E, which isn't
quite kosher, but has mnemonic value.

    How about a control-E that takes you to the end of the final bit
    of CODE on the line, then, if another control-E is done, you can
    access the end of the comment text?

c-E is very strongly entrenched in all modes as meaning end-of-line.  I
am against changing the meaning of c-E for this purpose.  Better to let
c-E still always mean end-of-LINE, and some other key binding like s-E
mean end-of-CODE.
