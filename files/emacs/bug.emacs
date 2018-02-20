Date: 5 May 1983 02:06 EDT
From: David A. Moon <MOON5 @ MIT-MC>
To: BUG-EMACS @ MIT-MC

People who have their mail archived into a file on a directory that is 99%
full should take some care to clean up the directory from time to time.  There is
plenty of mail queued for the file MC:EMACS;BUG EMACS

Date: 5 May 1983 01:08 EDT
From: Pandora B. Berman <CENT @ MIT-ML>
Subject: <EMACS-DISTRIBUTION> on OZ
To: GUMBY @ MIT-OZ
cc: klotz @ MIT-OZ, cent @ MIT-OZ, bug-emacs @ MIT-OZ

    Date: 4 May 1983  23:53 EDT (Wed)
    From: David Vinayak Wallace <GUMBY@MIT-OZ>

    Is this a bug?

    @i dis ss:<emacs-distribution> 
     SS:<EMACS-DISTRIBUTION>
     5031 Pages assigned....

    @i dis src:<emacs-distribution> 
     SRC:<EMACS-DISTRIBUTION>
     7571 Pages assigned....

no. SS:<emacs-distribution> is exactly the contents of the <emacs> dir
on the emacs master tape, while SRC:<emacs-distribution> is probably
the version being worked on, and thus should probably be called <emacs-master>
instead (leigh, does this sound right?).

Date: 4 May 1983  23:53 EDT (Wed)
From: David Vinayak Wallace <GUMBY@MIT-OZ>
To:   klotz@MIT-OZ, cent@MIT-OZ, bug-emacs@MIT-OZ
Subject: <EMACS-DISTRIBUTION> on OZ


Is this a bug?

@i dis ss:<emacs-distribution> 
 SS:<EMACS-DISTRIBUTION>
 5031 Pages assigned
 999999 Working pages, 999999 Permanent pages allowed
 1077 Pages free on SS:, 74923 pages used.

@i dis src:<emacs-distribution> 
 SRC:<EMACS-DISTRIBUTION>
 7571 Pages assigned
 +INF Working pages, +INF Permanent pages allowed
 1066 Pages free on SRC:, 150934 pages used.


Return-Path: <@MIT-MULTICS.ARPA,@MIT-XMULTICS.ARPA:CS.WERNER@UTEXAS-20>
Received: from MIT-XMULTICS.ARPA by MIT-MULTICS.ARPA TCP; 04-May-1983 20:40:06-edt
Received: from UTEXAS-20 by MIT-XMULTICS.ARPA TCP; 04-May-1983 20:32:02-edt
Date:  4 May 1983 1820-CDT
From: Werner Uhrig  <cs.werner@UTEXAS-20>
Subject: EMACS question, local wizards have given up on.
To: bug-emacs@MIT-OZ
In-Reply-To: Your message of 4-May-83 1747-CDT

Can you give an opinion on the following question.

To your knowledge, is it possible (or has it been done) to do the following

a) Narrowing restriction to some columns, similar to the existing method
          of narrowing to a certain sequence of lines?  Would it be possible
          to narrow the effect of commands to noncontiguous columns or lines?

b) given I have a file with long lines (longer than screen-size) can/has it
          been done that display is controlled for a column-range?
          like columns 50 to 120, for example.  Or, alternatively, to display
          lines which are wrapped around, right-adjusted and not left?

One would think someone hacked some code already somewhere ....

Thanks in advance for your reply,

and, by the way, I found another small dangerous, but correct (according to
          the definition in the manual) behavior of EMACS.

Some month ago, I reported that renaming the file-name of a buffer, does not
turn on the "modified" flag, which means AUTO-SAVE does not save the file,
even though it can be assumed that that is neccessary.

Now I found a somewhat similar case, where it is possible, that a filename
no longer exists on disk, however, it still exists in an EMACS buffer.
It would be nice, if EMACS would bring that case to the user's attention.

I also ran into a bug that I could not reproduce, but which you may or may not
have heard about before.  A new generation of a file was created while editing
the previous one with EMACS.  I did a ^X^R ESCAPE (for using the default
file-name) and the new version was read in, but the version number in the
Mode-Line was not updated.  I report it, as I know that sometimes having
heard about the existance of a problem can help at some later point, even
though one cannot do anything about it, immediately.

And, by the way, I am on a DEC-20, running TOPS-20, Version 5. More info on
request.

P.S>: I won't mention the strange things that can happen when using EMACS as
the default editor for the  mail program MM, as I could imagine that to be
a problem which you do not find to be "normal maintenance".

---Werner  (cs.werner@utexas-20)
-------

Return-Path: <@MIT-MULTICS.ARPA,@MIT-XMULTICS.ARPA:CS.WERNER@UTEXAS-20>
Received: from MIT-XMULTICS.ARPA by MIT-MULTICS.ARPA TCP; 04-May-1983 20:40:06-edt
Received: from UTEXAS-20 by MIT-XMULTICS.ARPA TCP; 04-May-1983 20:32:02-edt
Date:  4 May 1983 1820-CDT
From: Werner Uhrig  <cs.werner@UTEXAS-20>
Subject: EMACS question, local wizards have given up on.
To: bug-emacs@MIT-OZ
In-Reply-To: Your message of 4-May-83 1747-CDT

Can you give an opinion on the following question.

To your knowledge, is it possible (or has it been done) to do the following

a) Narrowing restriction to some columns, similar to the existing method
          of narrowing to a certain sequence of lines?  Would it be possible
          to narrow the effect of commands to noncontiguous columns or lines?

b) given I have a file with long lines (longer than screen-size) can/has it
          been done that display is controlled for a column-range?
          like columns 50 to 120, for example.  Or, alternatively, to display
          lines which are wrapped around, right-adjusted and not left?

One would think someone hacked some code already somewhere ....

Thanks in advance for your reply,

and, by the way, I found another small dangerous, but correct (according to
          the definition in the manual) behavior of EMACS.

Some month ago, I reported that renaming the file-name of a buffer, does not
turn on the "modified" flag, which means AUTO-SAVE does not save the file,
even though it can be assumed that that is neccessary.

Now I found a somewhat similar case, where it is possible, that a filename
no longer exists on disk, however, it still exists in an EMACS buffer.
It would be nice, if EMACS would bring that case to the user's attention.

I also ran into a bug that I could not reproduce, but which you may or may not
have heard about before.  A new generation of a file was created while editing
the previous one with EMACS.  I did a ^X^R ESCAPE (for using the default
file-name) and the new version was read in, but the version number in the
Mode-Line was not updated.  I report it, as I know that sometimes having
heard about the existance of a problem can help at some later point, even
though one cannot do anything about it, immediately.

And, by the way, I am on a DEC-20, running TOPS-20, Version 5. More info on
request.

P.S>: I won't mention the strange things that can happen when using EMACS as
the default editor for the  mail program MM, as I could imagine that to be
a problem which you do not find to be "normal maintenance".

---Werner  (cs.werner@utexas-20)
-------

Return-Path: <@MIT-MULTICS.ARPA,@MIT-XMULTICS.ARPA:CS.WERNER@UTEXAS-20>
Received: from MIT-XMULTICS.ARPA by MIT-MULTICS.ARPA TCP; 04-May-1983 20:40:06-edt
Received: from UTEXAS-20 by MIT-XMULTICS.ARPA TCP; 04-May-1983 20:32:02-edt
Date:  4 May 1983 1820-CDT
From: Werner Uhrig  <cs.werner@UTEXAS-20>
Subject: EMACS question, local wizards have given up on.
To: bug-emacs@MIT-OZ
In-Reply-To: Your message of 4-May-83 1747-CDT

Can you give an opinion on the following question.

To your knowledge, is it possible (or has it been done) to do the following

a) Narrowing restriction to some columns, similar to the existing method
          of narrowing to a certain sequence of lines?  Would it be possible
          to narrow the effect of commands to noncontiguous columns or lines?

b) given I have a file with long lines (longer than screen-size) can/has it
          been done that display is controlled for a column-range?
          like columns 50 to 120, for example.  Or, alternatively, to display
          lines which are wrapped around, right-adjusted and not left?

One would think someone hacked some code already somewhere ....

Thanks in advance for your reply,

and, by the way, I found another small dangerous, but correct (according to
          the definition in the manual) behavior of EMACS.

Some month ago, I reported that renaming the file-name of a buffer, does not
turn on the "modified" flag, which means AUTO-SAVE does not save the file,
even though it can be assumed that that is neccessary.

Now I found a somewhat similar case, where it is possible, that a filename
no longer exists on disk, however, it still exists in an EMACS buffer.
It would be nice, if EMACS would bring that case to the user's attention.

I also ran into a bug that I could not reproduce, but which you may or may not
have heard about before.  A new generation of a file was created while editing
the previous one with EMACS.  I did a ^X^R ESCAPE (for using the default
file-name) and the new version was read in, but the version number in the
Mode-Line was not updated.  I report it, as I know that sometimes having
heard about the existance of a problem can help at some later point, even
though one cannot do anything about it, immediately.

And, by the way, I am on a DEC-20, running TOPS-20, Version 5. More info on
request.

P.S>: I won't mention the strange things that can happen when using EMACS as
the default editor for the  m

Date: Mon, 2 May 1983  20:30 EDT
From: Leigh L. Klotz <KLOTZ@MIT-OZ>
to:   bug-emacs@MIT-OZ
Subject: emacs bug
In-reply-to: Msg of 2 May 1983  13:28-EDT from Robert H. Myhill <ROBERT at MIT-XX>

I noticed the EMACS on XX doesn't do automagic meta digits from
a supdup h19.  esc-20 inserts two zeros.

Leigh.

Date: Monday, 2 May 1983  13:28-EDT
Sender: Robert H. Myhill <ROBERT@MIT-XX>
From: Robert H. Myhill <ROBERT@MIT-XX>
Orig-To:   fhsu
Subject:   emacs bug
ReSent-From: FHSU @ MIT-XX
ReSent-To: bug-emacs@oz
ReSent-Date:  2-May-83 13:53:13

When I do ctrl-space to set a mark, and then go to the end of the file
with <esc>  followed by '>',  if the end of the file is not on the same
screenful as the initial mark which was set with ctrl-space, then when
I do ctrl-w to kill the region, nothing happens.   If the end of the file
is on the same screenful as the initial mark, then it does kill the entire
region.  

--Robert

Return-Path: KROVETZ@NLM-MCS.ARPA
Received: from NLM-MCS.ARPA by SU-SCORE.ARPA with TCP; Mon 2 May 83 10:02:05-PDT
Date: Mon 2 May 83 12:49:29-EDT
From: Bob Krovetz <KROVETZ@NLM-MCS.ARPA>
Subject: Bug in MM Version 5.2(1531), Edit 857
To: Bug-MM@NLM-MCS.ARPA
ReSent-date: Mon 2 May 83 10:05:42-PDT
ReSent-from: Mark Crispin <MRC@SU-SCORE.ARPA>
ReSent-to: Bug-Emacs@SU-SCORE.ARPA

I set up an EMACS.VARS file which just contained a command to load the
VT100 library.  When I do a Control-X R to go into MM and then do a 
GET SAVED-MESSAGES.TXT, when I return to emacs the terminal is in
a state without the library!  The library is in effect before going
to MM and if I don't do a GET SAVED-MESSAGES.TXT, the library is
still in effect when I return.  This also doesn't happen if I do a
PUSH from emacs and then go into MM.  I don't know if this is a 
problem with emacs or with MM.     

-bob
-------

