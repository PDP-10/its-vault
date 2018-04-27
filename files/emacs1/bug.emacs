Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  1 Jun 89 12:34:25 EDT
Received: from lcs.mit.edu (CHAOS 15044) by MC.LCS.MIT.EDU  1 Jun 89 12:16:58 EDT
Received: from SRI-NIC.ARPA by mintaka.lcs.mit.edu id aa01540;
          1 Jun 89 10:45 EDT
Date: Thu, 1 Jun 89 07:44:56 PDT
From: "Michael J. Konopik" <ZZZ@sri-nic.arpa>
Subject: Re: destructive mode line
To: WANCHO@wsmr-simtel20.army.mil
cc: bug-emacs@sri-nic.arpa
In-Reply-To: <WANCHO.12498594266.BABYL@WSMR-SIMTEL20.ARMY.MIL>
Message-ID: <12498662728.30.ZZZ@SRI-NIC.ARPA>

Your "uneducated guess" sounds right on the mark.  Considering that our
emacs isn't likely to punt its use of smart TEXTI and my terminal isn't
likely to magically lose its insert mode, I guess I'll just have to endure
the pain of using a lesser tty...  A regularly-updating modeline seems
necessary to me - our machine's load fluctuates pretty wildly, and it's
easier to deal with the associated response problems when I can see where
the load is on a regular basis.
Thanks for the responses.
					-Mike
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  1 Jun 89 12:25:25 EDT
Received: from lcs.mit.edu (CHAOS 15044) by MC.LCS.MIT.EDU  1 Jun 89 12:14:54 EDT
Received: from SRI-NIC.ARPA by mintaka.lcs.mit.edu id aa00800;
          1 Jun 89 10:23 EDT
Received: from MATHOM.CISCO.COM by SRI-NIC.ARPA with TCP; Wed, 31 May 89 14:13:20 PDT
Date: Wed 31 May 89 14:12:15-PDT
From: William Westfield <BILLW@mathom.cisco.com>
Subject: Re: destructive mode line
To: ZZZ@sri-nic.arpa
cc: bug-emacs@sri-nic.arpa
In-Reply-To: <12498201367.43.ZZZ@SRI-NIC.ARPA>
Message-ID: <12498471095.40.BILLW@MATHOM.CISCO.COM>

	1) One or more characters that were being typed at the critical time
	   are not echoed to the screen.  Redisplaying the line in question,
	   though, reveals that they *do* make it into the buffer.  This part
	   happens consistently.

I vaguely remember this being a bug in the TEXTI version of emacs that
I developed for TOPS-20.  I am pretty sure I fixed it - perhaps the NIC
has an old version.  Check out your TECO.MID vs the one on SCORE (hurry!).
There was some really disgusting looking code dealing with making sure
that characters that got typed durring interupts were properly displayed.

Bill Westfield
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  1 Jun 89 12:19:45 EDT
Received: from lcs.mit.edu (CHAOS 15044) by MC.LCS.MIT.EDU  1 Jun 89 12:14:18 EDT
Received: from SRI-NIC.ARPA by mintaka.lcs.mit.edu id aa00749;
          1 Jun 89 10:21 EDT
Received: from WSMR-SIMTEL20.ARMY.MIL by SRI-NIC.ARPA with TCP; Thu, 1 Jun 89 01:28:43 PDT
Date: Thu, 1 Jun 1989  02:28 MDT
Message-ID: <WANCHO.12498594266.BABYL@WSMR-SIMTEL20.ARMY.MIL>
From: "Frank J. Wancho" <WANCHO@wsmr-simtel20.army.mil>
To:   "Michael J. Konopik" <ZZZ@sri-nic.arpa>
Cc:   bug-emacs@sri-nic.arpa, WANCHO@wsmr-simtel20.army.mil
Subject: destructive mode line

Mike,

Let me quess: First of all, the problem only occurs on terminals which
have the Insert Character feature.  Second, you are probably running a
clock on your modeline, and third, you are running a version of EMACS
which uses the smart TEXTI% jsys.  What happens to me is that cursor
motion commands end up transparently being inserted into the buffer
and aren't seen until the line or scrren is refreshed.  This is
particularly annoying when I find a ^V has been inserted while I'm
scanning the buffer.

I have only uneducated guess as to what is happening.

--Frank


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 31 May 89 13:24:38 EDT
Received: from lcs.mit.edu (CHAOS 15044) by MC.LCS.MIT.EDU 31 May 89 13:20:50 EDT
Received: from SRI-NIC.ARPA by mintaka.lcs.mit.edu id aa10164;
          31 May 89 13:17 EDT
Date: Tue, 30 May 89 13:30:36 PDT
From: "Michael J. Konopik" <ZZZ@sri-nic.arpa>
Subject: destructive mode line
To: bug-emacs@sri-nic.arpa
Message-ID: <12498201367.43.ZZZ@SRI-NIC.ARPA>

Apologies up front if this turns out to be a tty controller problem instead
of an EMACS one...
I'm running EMACS on 20x with a (Zenith) Z29 tty.  If I'm unfortunate enough
to be typing at the same time that the mode line is getting updated, two bad
things happen:
	1) One or more characters that were being typed at the critical time
	   are not echoed to the screen.  Redisplaying the line in question,
	   though, reveals that they *do* make it into the buffer.  This part
	   happens consistently.
	2) Occasionally a ^Q gets inserted into the input stream.  This is
	   obviously (?) something trying to perform XON/XOFF control and
	   not succeeding.

Problem 1 happens in both Zenith and Ansi modes.  I haven't seen 2 happen
in Ansi mode yet (though it MAY) - so it could be related to the problem
I've had in Zenith mode where scrolling the buffer can generate XOFF's.
I really don't know enough about EMACS to speculate on the source of
either problem.
Anybody recognize either of these symptoms?  Anything I can do to fix 'em?
(solutions that don't involve switching tty types or editors preferred!)

Thanks.
		-Mike
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 31 May 89 10:40:47 EDT
Received: from lcs.mit.edu (CHAOS 15044) by MC.LCS.MIT.EDU 31 May 89 10:36:54 EDT
Received: from SRI-NIC.ARPA by mintaka.lcs.mit.edu id ab08236;
          31 May 89 10:32 EDT
Date: Tue, 30 May 89 13:32:52 PDT
From: "Michael J. Konopik" <ZZZ@sri-nic.arpa>
Subject: one more piece of info...
To: bug-emacs@sri-nic.arpa
Message-ID: <12498201780.43.ZZZ@SRI-NIC.ARPA>

Regarding my recent modeline-update message, I should point out that I've
seen the no-echo problem not only on a 9600 baud hardwired tty - but also
on a 2400 baud dialup...
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 May 89 13:01:58 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  9 May 89 12:53:04 EDT
Received: from bigboote.LCS.MIT.EDU by SRI-NIC.ARPA with TCP; Tue, 9 May 89 09:31:31 PDT
Received: by bigboote.LCS.MIT.EDU 
	id AA02739; Tue, 9 May 89 12:30:51 EDT
Date: Tue, 9 May 89 12:30:51 EDT
Message-Id: <8905091630.AA02739@bigboote.LCS.MIT.EDU>
From: Rob Austein <sra@lcs.mit.edu>
Sender: sra@bigboote.LCS.MIT.EDU
To: ZZZ@sri-nic.arpa
Cc: bug-emacs@sri-nic.arpa
In-Reply-To: "Michael J. Konopik"'s message of Tue, 9 May 89 01:35:44 PDT <12492566205.19.ZZZ@SRI-NIC.ARPA>
Subject: ^X^W and GTJFN defaults

   Date: Tue, 9 May 89 01:35:44 PDT
   From: "Michael J. Konopik" <ZZZ@sri-nic.arpa>

   When I use ^X^S to save a file, emacs knows what filename to which the
   buffer is written.  How come, then, ^X^W can't have the GTJFN defaults
   initialized?  This all-or-nothing behavior makes it difficult to write
   the file to a new extension when the filename is too long to all fit on
   the mode line (f'rinstance, writing THIS-IS-A-LONG-FILE.TXT out to
   THIS-IS-A-LONG-FILE.NEW).
   It's been awhile since I used emacs on Twenex, but I coulda sworn that
   this worked at MIT as recently as 1987...

It does work that way at MIT (well, when we had any 20s to run it on).
But at some point in EMACS's travels from MIT to the rest of the world
somebody decided to make the filename defaulting work like all other
Twenex programs rather than like all other ITS programs.  I remember
noticing the behavior you report while using EMACS at Stanford and not
beig too happy with it.

Or maybe it's just that Stanford and SRI are using an emacs that's
based on the 1983 "last official release" and this behavior was added
at MIT since then.  (We didn't have EMACS where I was in 1983, so I
don't know.)

--Rob


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 May 89 04:55:07 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  9 May 89 04:47:33 EDT
Received: from MATHOM.CISCO.COM by SRI-NIC.ARPA with TCP; Tue, 9 May 89 01:44:21 PDT
Date: Tue 9 May 89 01:45:55-PDT
From: William Westfield <BILLW@MATHOM.CISCO.COM>
Subject: Re: ^X^W and GTJFN defaults
To: ZZZ@SRI-NIC.ARPA
cc: bug-emacs@SRI-NIC.ARPA
In-Reply-To: <12492566205.19.ZZZ@SRI-NIC.ARPA>
Message-ID: <12492568061.8.BILLW@MATHOM.CISCO.COM>

Which parts of the output filename are defaulted (or can be defaulted)
when you do ^X^W is controlled by some variable whose content can vary
from site to site.  For example, I have the following function which I
bind to ^X^W, which causes deafulting on write, but not on read (which
I find annoying...)  See info:tecord.info for more on ET MODE$

!* -*-TECO-*- *!

!BillWs Write File:! ! write a file with defaults!
31F[:ET MODE			    !* save old GTJFN bits, and use defaults!
@M(M.M Write_File)		    !* call ordinary write file routine!
F]:ET MODE			    !* restore old BITS!
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 May 89 04:44:42 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  9 May 89 04:37:20 EDT
Date: Tue, 9 May 89 01:35:44 PDT
From: Michael J. Konopik <ZZZ@SRI-NIC.ARPA>
Subject: ^X^W and GTJFN defaults
To: bug-emacs@SRI-NIC.ARPA
Message-ID: <12492566205.19.ZZZ@SRI-NIC.ARPA>

When I use ^X^S to save a file, emacs knows what filename to which the
buffer is written.  How come, then, ^X^W can't have the GTJFN defaults
initialized?  This all-or-nothing behavior makes it difficult to write
the file to a new extension when the filename is too long to all fit on
the mode line (f'rinstance, writing THIS-IS-A-LONG-FILE.TXT out to
THIS-IS-A-LONG-FILE.NEW).
It's been awhile since I used emacs on Twenex, but I coulda sworn that
this worked at MIT as recently as 1987...
Thanks.
				-Mike
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 26 Apr 89 20:58:34 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 26 Apr 89 20:53:32 EDT
Date: Wed, 26 Apr 89 20:55:03 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
To: FILE-R@AI.AI.MIT.EDU, ALAN@AI.AI.MIT.EDU, SRA@AI.AI.MIT.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU
Message-ID: <586101.890426.KLOTZ@AI.AI.MIT.EDU>

AI:EMACS1;TAGS >, which is the *NOT* a tags file but
is instead the source to the tags library, was GFR'd
to backup;mctape gfr15.  The file creation date was 12/11/79.  
I hope that's thereal file date, not the dump date.

Anyway, I copied the tags source from ML, but in doing so
I spazzed and lost the version number.  I am setting the dont-reap bit
on the tags files on AI and ML.



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 26 Jan 89 18:11:52 EST
Received: from LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU 26 Jan 89 16:28:58 EST
Received: from ernie.Berkeley.EDU by XX.LCS.MIT.EDU with TCP/SMTP; Wed 25 Jan 89 23:13:13-EST
Received: by ernie.Berkeley.EDU (5.61/1.29)
	id AA01376; Wed, 25 Jan 89 20:10:31 -0800
Date: Wed, 25 Jan 89 20:10:31 -0800
From: greer@ernie.Berkeley.EDU (Douglas Greer)
Message-Id: <8901260410.AA01376@ernie.Berkeley.EDU>
To: info-emacs@MC.LCS.MIT.EDU


I am great emacs fan and would like to get a version running on
my PC-AT clone.  I have a good C compiler and would like to the
C source that will compile for the AT.  I have access to ftp/arpanet
through my accounts at berkeley or would be willing to send some money
for a copy on IBM 5 1/4 floppies.
Thanks,
-doug
(greer@ernie.berkeley.edu)


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 11 Jan 89 06:36:21 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 11 Jan 89 02:51:21 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by AI.AI.MIT.EDU 11 Jan 89 02:55:22 EST
Date: Wed, 11 Jan 1989  02:35 EST
Message-ID: <SRA.12461622278.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   Bug-EMACS@AI.AI.MIT.EDU
Subject: Would you believe a new feature in ITS EMACS?

Now that I have the head of this dinky unix box on my desk instead of
my trusty VT100 hardwired to a PDP-10, I seem to have accidently
rewired my brain so that the <Tab> key means <Complete> (I also have
to suppress the tendency to type lisp forms in my *Scratch* buffer,
but that's another story).

So, I taught & Read Command Name$ that <Tab> is a synonym for
<Altmode>.  Source is in AI: EMACS1; CRL 208.  Read not if ye be faint
of heart....

The stuff in AI: EMACS1; doesn't appear to be a complete set of
sources: some of the files have unlikely version numbers, and EINIT is
unable to generate a new [PURE] > from what's there.  Perhaps we
should do something about this before XX evaporates.  Anybody there
who can explain what the current state of the AI sources is believed
to be?

--Rob



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  1 Aug 88 20:10:19 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  1 Aug 88 20:03:01 EDT
Date: Mon, 1 Aug 88 17:02:53 PDT
From: Ian Macky <Ian@SRI-NIC.ARPA>
Subject: two-window divides wrong when changing screen size
To: bug-emacs@SRI-NIC.ARPA
Message-ID: <12419072524.18.IAN@SRI-NIC.ARPA>

if you start out emacs with a 24 line screen, then move to a sun which
has 48, the dividing line for two-window mode will still be 12 (or whatever
down), not in the middle of the new, larger screen.
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  5 Jul 88 14:10:46 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  5 Jul 88 11:31:52 EDT
Received: from XX.LCS.MIT.EDU by SRI-NIC.ARPA with TCP; Tue, 5 Jul 88 08:29:04 PDT
Date: Tue 5 Jul 88 11:05:03-EDT
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
Subject: Re: DSI	Damned screw infinitely?
To: Ian@SRI-NIC.ARPA
cc: bug-emacs@SRI-NIC.ARPA
In-Reply-To: <12411418329.48.IAN@SRI-NIC.ARPA>
Message-ID: <12411896728.35.SRA@XX.LCS.MIT.EDU>

    Date: Sun, 3 Jul 88 12:17:08 PDT
    From: Ian Macky <Ian@SRI-NIC.ARPA>

    Can anyone illuminate this EMACS error?  My x->EMACS interface
    (which worked previously) started dying of this, plus an ?Internal
    error at 1664

It's in TECO.MID's UUO handler (UUOH:).  Are you stuffing machine code
into buffers and executing them via M(FS Real Address$/5)?  And if so,
are you remembering to close the gap (1F?) first?
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  3 Jul 88 15:28:03 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU  3 Jul 88 15:21:38 EDT
Date: Sun, 3 Jul 88 12:17:08 PDT
From: Ian Macky <Ian@SRI-NIC.ARPA>
Subject: DSI	Damned screw infinitely?
To: bug-emacs@SRI-NIC.ARPA
Message-ID: <12411418329.48.IAN@SRI-NIC.ARPA>

Can anyone illuminate this EMACS error?  My x->EMACS interface (which worked
previously) started dying of this, plus an ?Internal error at 1664

--ian
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 27 Feb 88 10:44:51 EST
Received: from SIMTEL20.ARPA (TCP 3200000112) by MC.LCS.MIT.EDU 27 Feb 88 10:10:07 EST
Date: Sat, 27 Feb 1988  08:09 MST
Message-ID: <WANCHO.12378080919.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   Ian Macky <Ian@SRI-NIC.ARPA>
Cc:   ACTION@SRI-NIC.ARPA, SYS-STAFF@SRI-NIC.ARPA, WANCHO@SIMTEL20.ARPA,
      BUG-EMACS@MC.LCS.MIT.EDU
Subject: EMACS wrongly quoting commands.
In-reply-to: Msg of 26 Feb 1988  14:40-MST from Ian Macky <Ian at SRI-NIC.ARPA>

Ian,

I have observed the same behavior on a heavily loaded system and only
AFTER we moved to BillW's EMACS 165 with the corresponding TEXTI JSYS
mods.  My best guess is that there is a timing problem between the
setting of the appropriate break masks and input.  That is probably
understating the problem...

--Frank


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 27 Feb 88 04:26:34 EST
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU 27 Feb 88 04:07:34 EST
Mail-From: IAN created at 26-Feb-88 13:40:03
Date: Fri, 26 Feb 88 13:40:03 PST
From: Ian Macky <Ian@SRI-NIC.ARPA>
Subject: EMACS wrongly quoting commands.
To: ACTION@SRI-NIC.ARPA
cc: SYS-STAFF@SRI-NIC.ARPA
Message-ID: <12377889915.50.IAN@SRI-NIC.ARPA>
ReSent-Date: Sat, 27 Feb 88 01:01:56 PST
ReSent-From: NIC Operations <ACTION@SRI-NIC.ARPA>
ReSent-Sender: SAPPHO@SRI-NIC.ARPA
ReSent-To: bug-emacs@SRI-NIC.ARPA
ReSent-Message-ID: <12378014047.20.SAPPHO@SRI-NIC.ARPA>

I am REALLY sick of EMACS eating the commands i give it and inserting
them into the buffer instead.  Know what I mean?  You'll be editing
along, and then notice that the last n command characters you typed
didn't move the cursor, and the current line is acting funny.  A
redisplay shows that all the character you just typed (like ^U^B^B^?)
were inserted in the buffer instead of being executed as commands.

This happens a LOT, as in a dozen times a day, and does not seem to
have anything to do with the type of terminal being used.

As EMACS is such an important utility, I think it's important that it
work right.  And not piss off the staff...      like it's doing.

--ian
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 30 Dec 87 00:55:20 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 30 Dec 87 00:53:20 EST
Date: Wed, 30 Dec 87 00:51:36 EST
From: John Bunch <HACKIT@AI.AI.MIT.EDU>
To: BUG-EMACS@AI.AI.MIT.EDU
Message-ID: <304888.871230.HACKIT@AI.AI.MIT.EDU>

I AM HAVING A LOT OF PROBLEMS USING EMACS....IT DOESNT SEEM TO GO INTO SWITCH
SCREEN MODE FOR ME...  ANY HELP WOULD BE APPRECIATED.
THANK YOU.
							JOHN BUNCH



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 29 Dec 87 13:44:47 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU 29 Dec 87 13:43:21 EST
Mail-From: PSZ created at 29-Dec-87 13:36:02
Date: Tue, 29 Dec 1987  13:36 EST
Message-ID: <PSZ.12362389917.BABYL@XX.LCS.MIT.EDU>
From: PSZ@XX.LCS.MIT.EDU
To:   sra@XX.LCS.MIT.EDU
Subject: Emacs' escape character generation for VT100 in ansi mode
ReSent-Date: Tue 29 Dec 87 13:41:23-EST
ReSent-From: Rob Austein <SRA@XX.LCS.MIT.EDU>
ReSent-To: psz@XX.LCS.MIT.EDU, bug-emacs@XX.LCS.MIT.EDU
ReSent-Message-ID: <12362390895.24.SRA@XX.LCS.MIT.EDU>

Rob, I have been using a terminal emulator on my Mac called Red Ryder,
which implements emulation of the vt100 in ansi mode.  Nevertheless,
when I do term vt100 ansi on XX and then run Emacs, I get somewhat
garbled output at times.  I note that at both startup and exit, Emacs
sends the escape sequence ESC < to the terminal.  According to my
not-very-complete documentation, this command is part of the VT52
mode command set of the VT100, in fact telling it to go into ansi
mode.  Alas, a strict implementation of the ansi command set does not
need or have this command, so the ESC is ignored, the < is printed,
and the terminal and Emacs no longer agree about where the cursor is.
I am suggesting to the makers of the terminal emulator that they add
this escape sequence (and ignore it), but it seems that the problem is
really in the way Emacs uses a non-kosher sequence.  Can/should this
be fixed?  Thanks.  --Pete


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  2 Nov 87 13:27:25 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU  2 Nov 87 13:18:41 EST
Return-Path: <RASPUZZI@TOPS20.DEC.COM>
Received: from TOPS20.DEC.COM by XX.LCS.MIT.EDU with TCP/SMTP; Mon 2 Nov 87 13:10:16-EST
Date: Mon 2 Nov 87 13:12:29-EST
From: Rocket J. Squirrel <RASPUZZI@TOPS20.DEC.COM>
Subject: EMACS
To: sra@XX.LCS.MIT.EDU
Message-ID: <12347443424.279.RASPUZZI@TOPS20.DEC.COM>
ReSent-Date: Mon 2 Nov 87 13:12:37-EST
ReSent-From: Rob Austein <SRA@XX.LCS.MIT.EDU>
ReSent-To: bug-emacs@XX.LCS.MIT.EDU
ReSent-Message-ID: <12347443450.28.SRA@XX.LCS.MIT.EDU>


Hello,

My name is Mike Raspuzzi. I work for the TOPS-20 monitor group
at Digital Equipment Corp. I have a couple of EMACS questions. Your
name appears on the sources and I thought you would be the person
to contact.

I noticed that EMACS does some hand waving to obtain the directory
for finding the personal EMACS.INIT file of the user. Can you change
this so that it uses the GETJI% JSYS to slam the login directory
into HSNAME? We have done so for our EMACS but other people may
want this feature.

This question is a little more along a major enhancement type question.
Is it possible to have EMACS use the SMAP% JSYS to map its buffers
into extended space? This would allow for more than 4 or 5 buffers of
good sized files. Is this improvement asking a lot?

Thanks,
Mike Raspuzzi
LSBU Software Engineering
TOPS-20 monitor group
Raspuzzi@TOPS20.DEC.COM
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 28 Sep 87 13:21:46 EDT
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU 28 Sep 87 12:36:33 EDT
Date: Mon, 28 Sep 1987  12:33 EDT
Message-ID: <SRA.12338250384.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Cc:   BUG-EMACS@MC.LCS.MIT.EDU, BUG-BABYL@MC.LCS.MIT.EDU, JBA@OZ.AI.MIT.EDU,
      PGS@AI.AI.MIT.EDU
Subject: Babyl on OZ and XX are now synchronized
In-reply-to: Msg of 27 Sep 1987  20:30-EDT from "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>

    Date: Sunday, 27 September 1987  20:30-EDT
    From: "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>

    Hookay.  I've finished synching OZ's Babyl to XX's.  My wart on ECC's
    original kluge has been transformed into something more palatable.

    What isn't done:
    o  The EMACS 165/EMACS 169 issue.

I installed OZ:<EMACS>EMACS.INIT.50 on XX, seems to work.

    o  I haven't even looked at the ITSen to see what their state is.

Should be ok.  You probably want to be very paranoid about installing
new stuff there, but I believe that things are in something
aproximating a consistant state.

    o  JBA, I haven't acted on the hack you mentioned to me.  It won't
       happen today (I'm waiting to see if I blew it somehow), but
       probably later in the week.

    What happened:

    I have installed the most recent versions of BABYL and BABYLM from XX.
    There were some problems, but things appear to be working okay now.

    First, the stuff in XX:PS:<EMACS>BABYL.OZ-INIT-KLUDGE doesn't quite
    work.  I'm reasonably sure it's a quoting issue:  the ^]'s in the
    string cause ?QNS errors (evaluation of q7 is probably happening too
    early) if I try to set the variable that way, and using ^A in place
    doesn't cause errors, but the ^A'd items don't seem to match any
    strings.  I haven't taken the time to figure this out; since the whole
    thing is OZ-specific anyway, I've just substituted MIT-OZ (what would
    have been in q7, the idea of the ^]7's) in place.  That variable is
    now in OZ's SITE.INIT.

Obviously a brain bubble on my part, I just moved the kludge code into
a new file and forgot about it.  Using a literal MIT-OZ instead of ^]7
sounds ok.

    Second, it appears that the process of dumping a Babyl *never* reads
    SITE.INIT, nor does the dumped Babyl read SITE.INIT when it comes up.
    Hence, the variable setting in SITE.INIT will not take effect for
    dumped Babyl's.  (Use @SET TRAP FILE if you don't believe me...  I
    found it rather odd, too, since TECO.INIT *is* read, and it sets
    *Initializations* to have the right pathname for SITE.INIT.
    *Initializations* should get run on entry to ^R mode, and then
    EMACS.INIT reads SITE.INIT, but this isn't happening for the
    dumping-Babyl case because it never reads EMACS.INIT.  I haven't
    pursued this any further than that.)

    What I did to fix that was to embed the variable in the
    DUMP-BABYL.INIT file as well.  This doesn't seem to me to be a great
    idea, since I don't know if that file is sent in a distribution, and
    furthermore it means that both locations have to be updated (there are
    comments in each location that points at the other).  I'm not sure if
    instead maybe DUMP-BABYL.INIT should read the contents of SITE.INIT or
    EMACS.INIT.  That seems to be the best way to solve the problem, but
    there might be a screw that I don't know about.  If nobody can think
    of one, I'll try that solution instead in a week or so.

The comments in DUMP-BABYL.INIT are wrong, EMACS.INIT isn't run by
TECO.INIT, what happens is that *Initialization* is set up to run
EMACS.INIT the first time ^R is entered.  But standalone BABYL has its
own *Initialization* routine, which is set up in DUMP-BABYL.INIT and
overwrites the normal *Initialization*.  DUMP-BABYL.INIT never enters
^R.  Thus EMACS.INIT (and SITE.INIT) are never run.  This last is
probably a bug.

The easiest thing would be to run EMACS.INIT explicitly from
DUMP-BABYL.INIT.  If that causes problems, move the OZ specific stuff
to DUMP-BABYL.SITE-INIT and make everything else run that file.


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 27 Sep 87 20:43:28 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 27 Sep 87 20:31:44 EDT
Received: from OZ.AI.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 27 SEP 87  20:39:03 EDT
Date: 27 Sep 1987  20:30 EDT (Sun)
Message-ID: <FONER.12338075031.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: Babyl on OZ and XX are now synchronized
To:   Rob Austein <SRA@XX.LCS.MIT.EDU>
Cc:   BUG-EMACS@AI.AI.MIT.EDU, Foner%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>,
      JBA%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

Hookay.  I've finished synching OZ's Babyl to XX's.  My wart on ECC's
original kluge has been transformed into something more palatable.

What isn't done:
o  The EMACS 165/EMACS 169 issue.
o  I haven't even looked at the ITSen to see what their state is.
o  JBA, I haven't acted on the hack you mentioned to me.  It won't
   happen today (I'm waiting to see if I blew it somehow), but
   probably later in the week.

What happened:

I have installed the most recent versions of BABYL and BABYLM from XX.
There were some problems, but things appear to be working okay now.

First, the stuff in XX:PS:<EMACS>BABYL.OZ-INIT-KLUDGE doesn't quite
work.  I'm reasonably sure it's a quoting issue:  the ^]'s in the
string cause ?QNS errors (evaluation of q7 is probably happening too
early) if I try to set the variable that way, and using ^A in place
doesn't cause errors, but the ^A'd items don't seem to match any
strings.  I haven't taken the time to figure this out; since the whole
thing is OZ-specific anyway, I've just substituted MIT-OZ (what would
have been in q7, the idea of the ^]7's) in place.  That variable is
now in OZ's SITE.INIT.

Second, it appears that the process of dumping a Babyl *never* reads
SITE.INIT, nor does the dumped Babyl read SITE.INIT when it comes up.
Hence, the variable setting in SITE.INIT will not take effect for
dumped Babyl's.  (Use @SET TRAP FILE if you don't believe me...  I
found it rather odd, too, since TECO.INIT *is* read, and it sets
*Initializations* to have the right pathname for SITE.INIT.
*Initializations* should get run on entry to ^R mode, and then
EMACS.INIT reads SITE.INIT, but this isn't happening for the
dumping-Babyl case because it never reads EMACS.INIT.  I haven't
pursued this any further than that.)

What I did to fix that was to embed the variable in the
DUMP-BABYL.INIT file as well.  This doesn't seem to me to be a great
idea, since I don't know if that file is sent in a distribution, and
furthermore it means that both locations have to be updated (there are
comments in each location that points at the other).  I'm not sure if
instead maybe DUMP-BABYL.INIT should read the contents of SITE.INIT or
EMACS.INIT.  That seems to be the best way to solve the problem, but
there might be a screw that I don't know about.  If nobody can think
of one, I'll try that solution instead in a week or so.

						<LNF>



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 24 Sep 87 05:18:44 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 24 Sep 87 04:47:37 EDT
Received: from OZ.AI.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 23 SEP 87  23:21:01 EDT
Date: 23 Sep 1987  23:13 EDT (Wed)
Message-ID: <FONER.12337056188.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: EMACS, BABYL, and all that
To:   Rob Austein <SRA@XX.LCS.MIT.EDU>
Cc:   BUG-EMACS@AI.AI.MIT.EDU, Foner%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>
In-reply-to: Msg of 23 Sep 1987  17:44-EDT from Rob Austein <SRA at XX.LCS.MIT.EDU>

I've been meaning to edit in the OZ/Babyl stuff for the last few days.
I'll probably get to it Friday or on the weekend at some point.  I'm
not going to do anything about the altmode/JCL stuff, though...  I
leave that to somebody else once we find out what's going on with it.

						<LNF>



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 24 Sep 87 01:42:22 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 23 Sep 87 23:55:23 EDT
Date: Wed, 23 Sep 87 22:26:03 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
To: BUG-EMACS@AI.AI.MIT.EDU, PGS@AI.AI.MIT.EDU,
    sra@XX.LCS.MIT.EDU
Message-ID: <259287.870923.KLOTZ@AI.AI.MIT.EDU>

GZ and I made those changes to EMACS before you started maintaining
XX's version.



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 23 Sep 87 21:39:14 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 23 Sep 87 20:14:27 EDT
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by AI.AI.MIT.EDU 23 Sep 87 17:51:39 EDT
Date: Wed, 23 Sep 1987  17:44 EDT
Message-ID: <SRA.12336996239.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>
Cc:   BUG-EMACS@AI.AI.MIT.EDU
In-reply-to: Msg of 23 Sep 1987  17:10-EDT from "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>

    Date: Wednesday, 23 September 1987  17:10-EDT
    From: "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>
    To:   BUG-EMACS@AI.AI.MIT.EDU, bug-system@XX.LCS.MIT.EDU

    OZ seems to be running EMACS 165, where XX is running a version 169.
    However, the version running on XX doesn't seem to be able to read JCL; from
    the outside, it looks like it may never have gotten the changes that GZ made
    to implement JCL-reading.  When I say JCL-reading, I mean that the sucker
    should be able to see altmodes in the JCL and run it as TECO code, so that
    one can do, for example,

    emacs $m(m.mRead Mail)

    which works on OZ, but blows out on XX.

    I guess it looks from here like there's been some sort of version-splitting,
    if XX has a later version number that doesn't include earlier fixes.  Can
    someone make everything all better?

The changes are to OZ's EMACS.INIT file, which is probably why nobody
ever noticed.  If anybody announced the new EMACS.INIT to BUG-EMACS, I
missed it.

The scheme seems to be that if the first character is a dollar sign,
the JCL is scanned for ^V quoted altmodes.  This seems a little risky,
given that dollar is a perfectly legal twenex filename character.  A
safer scheme would be to start JCL lines with "# " (<pound><space>) or
something else that is obviously not a filename.  Does anybody have
any idea who is using this hack?  Would anybody be horribly upset if I
rewrote it?

BTW, OZ's SITE.INIT needs to have some stuff added to it before OZ can
run the current merged (XX+OZ+ITS) version of BABYL.  See
XX:<EMACS>BABYL.OZ-INIT-KLUDGE for details.



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 23 Sep 87 21:33:58 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 23 Sep 87 20:14:11 EDT
Date: Wed, 23 Sep 87 17:10:21 EDT
From: "Patrick G. Sobalvarro" <PGS@AI.AI.MIT.EDU>
To: BUG-EMACS@AI.AI.MIT.EDU, bug-system@XX.LCS.MIT.EDU
Message-ID: <259149.870923.PGS@AI.AI.MIT.EDU>

OZ seems to be running EMACS 165, where XX is running a version 169.
However, the version running on XX doesn't seem to be able to read JCL; from
the outside, it looks like it may never have gotten the changes that GZ made
to implement JCL-reading.  When I say JCL-reading, I mean that the sucker
should be able to see altmodes in the JCL and run it as TECO code, so that
one can do, for example,

emacs $m(m.mRead Mail)

which works on OZ, but blows out on XX.

I guess it looks from here like there's been some sort of version-splitting,
if XX has a later version number that doesn't include earlier fixes.  Can
someone make everything all better?



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  7 Sep 87 14:16:46 EDT
Received: from SIMTEL20.ARPA (TCP 3200000112) by MC.LCS.MIT.EDU  7 Sep 87 14:10:35 EDT
Date: Mon, 7 Sep 1987  12:06 MDT
Message-ID: <WANCHO.12332762346.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   BUG-EMACS@MC.LCS.MIT.EDU
cc:   WANCHO@SIMTEL20.ARPA
Subject: Simple deblank function needed

I need a TECO function which will remove multiple blank lines inside a
text region.  If the text consists of paragraphs with undented initial
lines, such as this message, it should insert n blanks at the
beginning of that initial line and reformat the paragraph before
continuing.

Sounds simple enough, right?  Well, it would have been easy if only
double-CRLFs occur in the text.  But, some writers go for multiple
blank lines which would require multiple passes using simple
search-and-replace.

I am hoping that someone already has such a function or one close
enough that I can fix to make it work as described above.  If you know
of one, please sent it to me or send a pointer.

Thanks,
Frank


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 26 May 87 02:44:32 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 26 May 87 02:37:18 EDT
Date: Tue, 26 May 87 02:37:34 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Subject: reading in TECORD causes FS ^R RPAREN to get set to 0
To: BUG-EMACS@AI.AI.MIT.EDU, KLH@AI.AI.MIT.EDU
cc: BUG-TECO@AI.AI.MIT.EDU
Message-ID: <205171.870526.KLOTZ@AI.AI.MIT.EDU>

There is a known TECO bug where under certain conditions a PDP-10 word
of a buffer gets set to 0.  I remember some arbitrary change to one
of the language mode libraries once that exercised this bug; I don't
know that anyone found or fixed it.

I'm mentiioning this to point out that your bug could be something
bizzarre.



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 25 May 87 22:02:17 EDT
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU 25 May 87 21:58:28 EDT
Date: Mon 25 May 87 18:56:23-PDT
From: Ken Harrenstien <KLH@SRI-NIC.ARPA>
Subject: FS ^R PAREN clobberage
To: bug-emacs@SRI-NIC.ARPA
cc: klh@SRI-NIC.ARPA
Message-ID: <12305322691.14.KLH@SRI-NIC.ARPA>

When I try to read in the file <INFO>TECORD.INFO, apparently my
FS ^R PAREN variable becomes permanently clobbered to 0.  This doesn't seem
to be a side effect of going into Text Mode, as I can go into that mode
by hand (or read in .TXT files) without problems.  The only thing I can
think of is that the "Local variables" at the end of the TECORD file
are somehow screwing up, but it isn't obvious to me how they are managing
to do so, or how they should be changed to avoid this lossage.

At the moment the only way I know how to "fix" this and get back the
feature of having close-parens point out the open-parens is to kill my
EMACS and start another one.  I know there must be a better way but
I no longer have the time to grovel through TECORD trying to make sense
of everything.  (The EMACS Describe function didn't help me at all; it
wasn't until I actually looked at TECO.MID that I could understand why
")" sometimes had special actions and sometimes didn't).  Not the
recommended method for finding information.
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  6 Apr 87 22:55:05 EDT
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU  6 Apr 87 22:11:27 EDT
Date: Mon,  6 Apr 87 22:09:31 EDT
From: "Pandora B. Berman" <CENT@AI.AI.MIT.EDU>
Subject: TOPS-20
To: sshurr%wellesley.edu@RELAY.CS.NET
cc: BUG-emacs@MC.LCS.MIT.EDU
Message-ID: <180182.870406.CENT@AI.AI.MIT.EDU>

    Date: Mon, 6 Apr 87 14:59:55 est
    From: Scott Shurr <sshurr%wellesley.edu@RELAY.CS.NET>
    To: bug-emacs@mc.lcs.mit.edu
    Subject: TOPS-20
    I'm seeking information about EMACS editors for TOPS-20 systems.  The
    one we have now identifies itself as "EMACS Editor, version 162", and
    was supposedly written by Richard Stallman.  He suggested that I
    contact this group.  I'm trying to find out if there is a newer
    version, and, if so, how I can obtain one.  Any information on any
    emacs editors for TOPS-20 would also be appreciated.  Please respond
    directly to my address as I do not receive this list.  Thanks very
    much.
    Scott Shurr - Academic Computing   | internet: sshurr@wellesley.edu
    Science Center, Wellesley College  | phone: 617-235-0320 X3262
    Wellesley, MA 02181                |

unfortunately, version 162 is the most recent distribution version. a
little work has been done on EMACS in the past several years, so that the
version now used at MIT is a few numbers higher. but this must be
considered an experimental version, as the changes have been installed
piecemeal, the documentation has not been updated, and a new distribution
tape has not been made. the only way you can get this is to FTP it off
XX.LCS.MIT.EDU. RMS used to work pretty much full time on maintaining
EMACS; since he went on to other projects, no one else has been able to put
in anything like that effort, as even the other interested EMACS hackers
have to spend most of their time on the jobs they are being paid for..


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  6 Apr 87 18:49:09 EDT
Received: from RELAY.CS.NET (TCP 1201000005) by MC.LCS.MIT.EDU  6 Apr 87 18:45:52 EDT
Received: from relay2.cs.net by RELAY.CS.NET id aa17600; 6 Apr 87 18:27 EDT
Received: from wellesley.edu by RELAY.CS.NET id ab08581; 6 Apr 87 18:23 AST
Received: by bambam (4.12/)
	id AA04580; Mon, 6 Apr 87 14:59:55 est
Date: Mon, 6 Apr 87 14:59:55 est
From: Scott Shurr <sshurr%wellesley.edu@RELAY.CS.NET>
To: bug-emacs@mc.lcs.mit.edu
Subject: TOPS-20
Cc: sshurr@wellesley.edu

Hi,
I'm seeking information about EMACS editors for TOPS-20 systems.  The one we
have now identifies itself as "EMACS Editor, version 162", and was
supposedly written by Richard Stallman.  He suggested that I contact this
group.  I'm trying to find out if there is a newer version, and, if so,
how I can obtain one.  Any information on any emacs editors for TOPS-20
would also be appreciated.  Please respond directly to my address as I do
not receive this list.  Thanks very much.

Scott Shurr - Academic Computing   | internet: sshurr@wellesley.edu
Science Center, Wellesley College  | phone: 617-235-0320 X3262
Wellesley, MA 02181                |



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  3 Apr 87 00:38:02 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU  2 Apr 87 23:51:43 EST
Date: Thu,  2 Apr 87 23:53:19 EST
From: "Pandora B. Berman" <CENT@AI.AI.MIT.EDU>
Subject: Emacs ver 163
To: CC.DESAI@R20.UTEXAS.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU
Message-ID: <178433.870402.CENT@AI.AI.MIT.EDU>

    Date: Tuesday, 31 March 1987  09:39-EST
    Sender: Nandu Desai <CC.DESAI@R20.UTEXAS.EDU>
    From: Nandu Desai <CC.DESAI@R20.UTEXAS.EDU>
    To: sra@XX.LCS.MIT.EDU
    Subject:   Emacs ver 163
    ReSent-From: SRA@XX.LCS.MIT.EDU
    ReSent-To: Bug-EMACS@XX.LCS.MIT.EDU
    ReSent-Date: Tue 31 Mar 1987 21:59-EST
    Dear Sir,
    	I am presently attempting to install version 163 of emacs here
    at the Research 20 at U-Texas at Austin.  I tried to ftp the files in
    the emacs: directory at mit-xx.  After changing the config.mid file to
    include terminals used here at UT, I tried to reassemble emacs.  But it
    didn't work.
    	My question is this.  Is it possible to install a new version
    of emacs by using the emacs: directory at mit-xx alone OR is it
    necessary to get the emacs tape?  If the latter is true how do I go
    about obtaining such a tape?
   	I realize that I might be directing my inquiries to the wrong
    person.  Maybe you could guide me to the correct authorities.
	We are currently running ver 162.

probably the only way you can get v.163 is by FTP from XX -- the most
recent distribution version is 162. no one here is working full time on
emacs, and those hackers who have been paying some attention to it have had
to spend most of their time on other projects, so we have not been able to
put together a new distribution tape, updated documentation, etc., for
about 5 years..


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 31 Mar 87 22:35:04 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU 31 Mar 87 22:05:55 EST
Date: Tuesday, 31 March 1987  09:39-EST
Message-ID: <SRA.12290916301.BABYL@XX.LCS.MIT.EDU>
Sender: Nandu Desai <CC.DESAI@R20.UTEXAS.EDU>
From: Nandu Desai <CC.DESAI@R20.UTEXAS.EDU>
To: sra@XX.LCS.MIT.EDU
Subject:   Emacs ver 163
ReSent-From: SRA@XX.LCS.MIT.EDU
ReSent-To: Bug-EMACS@XX.LCS.MIT.EDU
ReSent-Date: Tue 31 Mar 1987 21:59-EST

Dear Sir,
	I am presently attempting to install version 163 of emacs here at the
Research 20 at U-Texas at Austin.  I tried to ftp the files in the  emacs: 
directory at mit-xx.  After changing the config.mid file to include terminals
used here at UT, I tried to reassemble emacs.  But it didn't work.

	My question is this.  Is it possible to install a new version of emacs
by using the emacs: directory at mit-xx alone  OR is it necessary to get the
emacs tape?  If the latter is true how do I go about obtaining such a tape?

	I realize that I might be directing my inquiries to the wrong person.
Maybe you could guide me to the correct authorities.

	We are currently running ver 162.

	Thank you.

	Nandu


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 30 Mar 87 17:49:39 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 30 Mar 87 17:25:40 EST
Date: Mon, 30 Mar 87 17:06:16 EST
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Subject:  C-Y M-Y C-K
To: BUG-EMACS@AI.AI.MIT.EDU
cc: hal@SRI-NIC.ARPA
Message-ID: <176164.870330.KLOTZ@AI.AI.MIT.EDU>

Hal Huntley complains that there is a bug causing recently killed
things disappear from the kill ring.

    Date: Mon 30 Mar 87 10:03:01-PST
    From: Hal Huntley <HAL@SRI-NIC.ARPA>
    Subject: kill bug
    To: bug-emacs@SRI-NIC.ARPA
    cc: hal@SRI-NIC.ARPA
    Message-ID: <12290556452.29.HAL@SRI-NIC.ARPA>

    I did the following sequence:

    Move to a line and get two words from the end of the line...
    Kill to end of line (C-K). 		; kill 1
    Add some text.
    Go to next line (C-N).
    Back up two words (M-B twice).
    Kill to end of line (C-K).  		; kill 2
    Do C-Y, M-Y to get back the line I killed just above.
    Next line.
    Back 2 words.
    Kill to end of line.  			; kill 3
    C-Y, M-Y.

    Voila! The previous kill (kill 2) to end of line is NOT there to yank
    back!!!!  Not only that, but repeated M-Y's shows me that the second
    kill is NOT IN THE KILL RING AT ALL!

    I just reproduced this and got the same results even if I did not add
    text after the first kill. Is it our NIC implementation only?  I would
    imagine so..

    This needs to be fixed!

    I have reproduced this now several times.  I will be happy to
    show anyone what I've done... (but knowing my luck when I show the
    Doctor, the symptoms will go away.....)

    Hal

I'm not saying that this behavior is particularly useful , but it is
consistent with the vector model of the kill ring.  Interested parties can
use M-X View Q-Register..K to see the kill ring and check on my
explanation.

Here's how the kill vector works:
   When you do C-Y, the text in kill buffer position 0 gets inserted into
   the buffer.

   When you do M-Y, that text gets deleted; the copy of the
   text that was in slot 0 gets moved to slot 8, and everything else
   moves down one, resulting in the previously-killed text moving from
   slot 1 to slot 0; then EMACS inserts the new slot 0 text.

   When you do C-K, the deleted text goes from the buffer to slot zero,
   and bumps everything else up by one slot.  The thing which was in slot
   8 is lost.

In Huntley's example, the thing in slot 8 which gets lost is the very
thing which was in slot 0 just before the M-Y.  Thus, C-Y M-Y C-K causes
the thing you C-Y'd to disappear forever.

GNU Emacs avoids this problem by keeping the kill ring in a list.  If the
list length is less than the maximum kill ring length, then moving the
item to the end of the list doesn't make it a candidate for expunging on
the next kill.

TECO Emacs could emulate this behavior by skipping all Q-vector elements
containing 0 in the rotate operation, and treating the vector as if it
ended at the last non-zero element.

Leigh.



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 30 Mar 87 15:58:42 EST
Received: from SRI-NIC.ARPA (TCP 1200000063) by MC.LCS.MIT.EDU 30 Mar 87 14:44:36 EST
Date: Mon 30 Mar 87 10:03:01-PST
From: Hal Huntley <HAL@SRI-NIC.ARPA>
Subject: kill bug
To: bug-emacs@SRI-NIC.ARPA
cc: hal@SRI-NIC.ARPA
Message-ID: <12290556452.29.HAL@SRI-NIC.ARPA>


I did the following sequence:

Move to a line and get two words from the end of the line...
Kill to end of line (C-K). 		; kill 1
Add some text.
Go to next line (C-N).
Back up two words (M-B twice).
Kill to end of line (C-K).  		; kill 2
Do C-Y, M-Y to get back the line I killed just above.
Next line.
Back 2 words.
Kill to end of line.  			; kill 3
C-Y, M-Y.

Voila! The previous kill (kill 2) to end of line is NOT there to yank back!!!!
Not only that, but repeated M-Y's shows me that the second kill
is NOT IN THE KILL RING AT ALL!

I just reproduced this and got the same results even if I did not add text
after the first kill. Is it our NIC implementation only?  I would imagine so..

This needs to be fixed!

I have reproduced this now several times.  I will be happy to
show anyone what I've done... (but knowing my luck when I show the
Doctor, the symptoms will go away.....)

Hal
-------


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU 11 Feb 87 03:04:49 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU 11 Feb 87 03:02:37 EST
Date: Wed, 11 Feb 87 03:01:23 EST
From: "Pandora B. Berman" <CENT@AI.AI.MIT.EDU>
Subject: you thought there were seven?
To: JAR@AI.AI.MIT.EDU
cc: BUG-INFO@AI.AI.MIT.EDU
Message-ID: <152360.870211.CENT@AI.AI.MIT.EDU>

    Date: Mon,  9 Feb 87 17:09:28 EST
    From: Jonathan A Rees <JAR@AI.AI.MIT.EDU>
    Subject:  I thought there were seven, not two.
    To: BUG-info@MC.LCS.MIT.EDU

    File: INFO,  Node: Installing,  Up: Top,  Previous: Checking

    How to Install a New INFO Directory on All Machines:

      There are two ITS machines (MC, ML; AI and DM are gone) ...

seven? there are five in the local area. unfortunately we have no good way
to count PM, SI, or the possibly mythical australian one as part of the
local community; for file-size updates with them we have to rely on tape or
FTP by hand. fixed in the source and installed..


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 Feb 87 17:14:24 EST
Received: from AI.AI.MIT.EDU (CHAOS 3130) by MC.LCS.MIT.EDU  9 Feb 87 17:10:44 EST
Date: Mon,  9 Feb 87 17:09:28 EST
From: Jonathan A Rees <JAR@AI.AI.MIT.EDU>
Subject:  I thought there were seven, not two.
To: BUG-info@MC.LCS.MIT.EDU
Message-ID: <151543.870209.JAR@AI.AI.MIT.EDU>


File: INFO,  Node: Installing,  Up: Top,  Previous: Checking

How to Install a New INFO Directory on All Machines:

  There are two ITS machines (MC, ML; AI and DM are gone) ...



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 Feb 87 13:05:11 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU  9 Feb 87 09:53:23 EST
Date: 9 Feb 1987  09:51 EST (Mon)
Message-ID: <FHSU.12277676488.BABYL@XX.LCS.MIT.EDU>
From: Sam Hsu <fhsu@XX.LCS.MIT.EDU>
Subject: VT100 never could keep up...
To:   "Robert L. Chase" <rlc%uvacs.cs.virginia.edu@RELAY.CS.NET>
Cc:   bug-emacs@MC.LCS.MIT.EDU
In-reply-to: Msg of 8 Feb 1987  11:09-EST from Robert L. Chase <rlc%uvacs.cs.virginia.edu at RELAY.CS.NET>

One thing you can do is to load the VT100 library from your EMACS.VARS
(or EMACS.INIT).  Then call "VT100 Page Mode" to setup your Emacs' ^S/^Q
like the C132 mode does.  Here are examples of what you might put in
those init files:


EMACS.VARS
	*: m(m.mLoad Library$)VT100$
	*: m(m.mVT100 Page Mode$)


EMACS.INIT
	m(m.mLoad Library$)VT100$
	m(m.mVT100 Page Mode$)


The last switch is to turn on COMND% processing.

Sam


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  9 Feb 87 01:01:32 EST
Received: from RELAY.CS.NET (TCP 1201000005) by MC.LCS.MIT.EDU  9 Feb 87 00:53:36 EST
Received: from [128.89.1.80] by RELAY.CS.NET id ae02348; 9 Feb 87 0:46 EST
Received: from virginia by csnet-relay.csnet id aa04755; 8 Feb 87 23:04 EST
Received: by uvacs.cs.virginia.edu (4.12/5.1.UVA)
	id AA03572; Sun, 8 Feb 87 11:09:43 est
Date: Sun, 8 Feb 87 11:09:43 est
From: "Robert L. Chase" <rlc%uvacs.cs.virginia.edu@RELAY.CS.NET>
Posted-Date: Sun, 8 Feb 87 11:09:43 est
To: bug-emacs@MC.LCS.MIT.EDU

I was referred to you by one of your colleagues. I've got big problems
with CTRL-S and CTRL-Q with VT100s on TOPS-20 with EMACS. Things are OK
at 1200 baud, but above that, problems - several users are at 9600.
In my EMACS.CTL, inside the TECO stuff where switches are set, I have
EMCSDV==1
INFODV==1
COMNDF==1

I'm not sure what the last one does as I got my CTL file from Philip Morris

Is there anything that can be set to turn off the CTRL-S and CTRL-Q
commands and remap their functions ala the C132 mode?

When Emacs comes up it is showing Incremental search command, so
my init file(in which I try to remap CTRL-S and CTRL-Q) doesn't
take effect before the CTRL-S gets through. I'd appreciate
any help/advice you can give.
 Thanks very much.

----

Robert L. Chase                    INTERNET:  rlc@uvacs.cs.virginia.edu
Director of Academic Computing
Computer Center
Sweet Briar College                UUCP:      ...!mcnc!uvacs!rlc
PO BOX AK                                     ...!cbosgd!uvacs!rlc
Sweet Briar, VA 24595    
  (804) 381-6232



Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  1 Feb 87 18:44:05 EST
Received: from RELAY.CS.NET (TCP 1201000005) by MC.LCS.MIT.EDU  1 Feb 87 18:42:58 EST
Received: from virginia by csnet-relay.csnet id ae10352; 30 Jan 87 23:07 EST
Received: by uvacs.cs.virginia.edu (4.12/5.1.UVA)
	id AA19332; Fri, 30 Jan 87 22:06:23 est
Date: Fri, 30 Jan 87 22:06:23 est
From: "Robert L. Chase" <rlc%uvacs.cs.virginia.edu@RELAY.CS.NET>
Posted-Date: Fri, 30 Jan 87 22:06:23 est
To: bug-emacs@MC.LCS.MIT.EDU




Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  5 Jan 87 11:55:23 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU  5 Jan 87 11:25:35 EST
Date: Mon, 5 Jan 1987  11:27 EST
Message-ID: <SRA.12268519036.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   PSZ@XX.LCS.MIT.EDU
Cc:   Bug-EMACS@XX.LCS.MIT.EDU, Sollins@XX.LCS.MIT.EDU
Subject: Directory access problems on XX
In-reply-to: Msg of 2 Jan 1987  17:46-EST from PSZ@XX.LCS.MIT.EDU

    Date: Friday, 2 January 1987  17:46-EST
    From: PSZ@XX.LCS.MIT.EDU

    Rob, that's a good theory, but alas there is no file
    xx:<psz.mail>*.output.*, so of course deleting it and expunging have
    no effect.  Indeed, I am still having this same emacs problem, being
    unable to write anything to that directory.  Both the directory
    protection and default file protections are all 7's, and there are no
    deleted files in the directory to give "sticky" protection bits, so
    I'm still puzzled at what is happening.

[PHOTO:  Recording initiated  Mon 5-Jan-87 11:25AM]

 MIT TOPS-20 Command Processor 5(312155)-2
XX>enable
XX!cd psz.mail
XX!v *.output

   XX:<PSZ.MAIL>
 ^V[TECO^V].OUTPUT.13;P774000   1 8(7)       31-Dec-86 15:39:42 PSZ       
      .14;P774000           1 8(7)       31-Dec-86 15:44:00 PSZ       
      .15;P774000           1 7(7)        2-Jan-87 17:40:04 PSZ       
      .16;P774000           1 7(7)        2-Jan-87 17:42:15 PSZ       

 Total of 4 pages in 4 files
XX!pop

[PHOTO:  Recording terminated  Mon 5-Jan-87 11:26AM]


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  2 Jan 87 17:51:56 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU  2 Jan 87 17:44:01 EST
Date: Fri, 2 Jan 1987  17:46 EST
Message-ID: <PSZ.12267801572.BABYL@XX.LCS.MIT.EDU>
From: PSZ@XX.LCS.MIT.EDU
To:   Rob Austein <SRA@XX.LCS.MIT.EDU>
Cc:   Bug-EMACS@XX.LCS.MIT.EDU, Sollins@XX.LCS.MIT.EDU, PSZ@XX.LCS.MIT.EDU
Subject: Directory access problems on XX
In-reply-to: Msg of 2 Jan 1987  00:44-EST from Rob Austein <SRA>

Rob, that's a good theory, but alas there is no file
xx:<psz.mail>*.output.*, so of course deleting it and expunging have
no effect.  Indeed, I am still having this same emacs problem, being
unable to write anything to that directory.  Both the directory
protection and default file protections are all 7's, and there are no
deleted files in the directory to give "sticky" protection bits, so
I'm still puzzled at what is happening.


Received: from MC.LCS.MIT.EDU (CHAOS 3131) by AI.AI.MIT.EDU  2 Jan 87 00:46:50 EST
Received: from XX.LCS.MIT.EDU (CHAOS 2420) by MC.LCS.MIT.EDU  2 Jan 87 00:41:20 EST
Date: Fri, 2 Jan 1987  00:44 EST
Message-ID: <SRA.12267615406.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   Peter Szolovits <psz@ZERMATT.LCS.MIT.EDU>
Cc:   Sollins@XX.LCS.MIT.EDU, sra@XX.LCS.MIT.EDU, Bug-EMACS@XX.LCS.MIT.EDU
Subject: Directory access problems on XX
In-reply-to: Msg of 31 Dec 1986  15:55-EST from Peter Szolovits <psz@ZERMATT.LCS.MIT.EDU>

Delete and expunge XX:<PSZ.MAIL>[TECO].OUTPUT.*.  Note the file
protection on that file before you delete it.

You hit an obscure and long-standing EMACS bug.  The short explanation
is that EMACS -always- writes to dev:<dir>[TECO].OUTPUT then renames
that file to be the real filename, because EMACS thinks it's still
running on ITS where this is the Right Thing.

Clearly you built the directory, used EMACS, it bombed, so you changed
the directory protections to something more useful (like gave yourself
group access).  But the first dead EMACS left a [TECO].OUTPUT file
with the bad protection, so the protection perpetuated itself (no,
EMACS can't fix this for you, think about it).

I doubt this will ever get fixed, since it only shows up when
directory parameters are set wrong and it is a real bear to try and do
"right".

--Rob


Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 26 NOV 86  12:37:30 EST
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 26 NOV 86  12:34:12 EST
Date: Wed, 26 Nov 86 12:34:28 EST
From: Patrick A O'Donnell <PAO@AI.AI.MIT.EDU>
Subject:  Auto save mode
To: BUG-EMACS@AI.AI.MIT.EDU
cc: PAO@AI.AI.MIT.EDU
Message-ID: <123715.861126.PAO@AI.AI.MIT.EDU>

[Oops.  Sorry about the mail fragment.]

Auto saving fails when the number of auto saves (qAuto Save Count)
reaches qAuto Save Max.  It appears that the auto save file is
written, but then it is deleted instead of the file qAuto Save Max
versions back.  (BTW, I am not saving under the visited file names.)

From what I can see, it appears that writing into FS D VERSION is
not doing the right thing.

This is all in NE on AI.
		- Pat

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 26 NOV 86  12:32:37 EST
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 26 NOV 86  12:28:34 EST
Date: Wed, 26 Nov 86 12:28:57 EST
From: Patrick A O'Donnell <PAO@AI.AI.MIT.EDU>
Subject:  Auto save mode
To: BUG-EMACS@AI.AI.MIT.EDU
cc: PAO@AI.AI.MIT.EDU
Message-ID: <123712.861126.PAO@AI.AI.MIT.EDU>

Auto saving fails once the number of auto saves has reached
QAuto Save Max.  The file is written out, but then immediately
deleted (instead of the file with version number

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 16 NOV 86  11:15:02 EST
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 16 NOV 86  11:10:10 EST
Date: 16 Nov 1986  11:07 EST (Sun)
Message-ID: <RICH.12255408047.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Info Emacs

Something seems to be wrong with the Emacs info file.  Try
M-X Info$Emacs, and the M Screen, for example, and you get
the "Node not found" message.  If you enter recursive edit mode
and widen the buffer, and search for "Node: Screen", it is in fact
there.  I don't seem to have this problem with other info files,
so I don't think it is something which I have done to my Emacs
environment.  Anyways, can someone else see if they have this sypmtom?

				Thanks, Chuck.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 11 NOV 86  19:18:56 EST
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 11 NOV 86  19:09:11 EST
Received: from SIMTEL20.ARPA by XX.LCS.MIT.EDU with TCP; Tue 11 Nov 86 19:06:32-EST
Date: Tue 11 Nov 86 17:06:30-MST
From: Mark Crispin <MRC@SIMTEL20.ARPA>
Subject: [Ashok Subramanian <ashok@Sushi.Stanford.EDU>: MM bug]
To: BUG-EMACS@XX.LCS.MIT.EDU
Address: 1802 Hackett Ave.; Mountain View, CA  94043-4431
Telephone: +1 (415) 968-1052
Message-ID: <12254184606.9.MRC@SIMTEL20.ARPA>

This is an EMACS bug.  It doesn't check why the fork terminated.  MM
does not handle quota exceeded interrupts for damn good reasons.
                ---------------

   1) 10-Nov Ashok Subramanian    MM bug
   2) 10-Nov Ashok Subramanian    TOPS-20/MM bug

Message 1 -- ************************
Return-Path: <@Score.Stanford.EDU:ASHOK@Sushi.Stanford.EDU>
Received: from Score.Stanford.EDU by SIMTEL20.ARPA with TCP; Mon 10 Nov 86 11:47:20-MST
Received: from Sushi.Stanford.EDU by SU-SCORE.ARPA with TCP; Mon 10 Nov 86 10:45:54-PST
Date: Mon 10 Nov 86 10:45:23-PST
From: Ashok Subramanian <ashok@Sushi.Stanford.EDU>
Subject: MM bug
To: bug-mm@Sushi.Stanford.EDU
Message-ID: <12253864005.14.ASHOK@Sushi.Stanford.EDU>


Assume you're in EMACS, and type a ctrl-X R to invoke the mailer. Then 
you type 

R 121, 123, 126

to read three messages. After you read the first message, you type

MOV file.foo

to move the first message to a file.

One would expect that MM would return with an R> prompt. What it does, however,
is to return to EMACS, just as if an extra Q had been typed to it.

--ashok
-------

Message 2 -- ************************
Return-Path: <@Score.Stanford.EDU:ASHOK@Sushi.Stanford.EDU>
Received: from Score.Stanford.EDU by SIMTEL20.ARPA with TCP; Mon 10 Nov 86 12:14:45-MST
Received: from Sushi.Stanford.EDU by SU-SCORE.ARPA with TCP; Mon 10 Nov 86 11:13:05-PST
Date: Mon 10 Nov 86 11:12:33-PST
From: Ashok Subramanian <ashok@Sushi.Stanford.EDU>
Subject: TOPS-20/MM bug
To: bug-mm@Sushi.Stanford.EDU
Message-ID: <12253868950.14.ASHOK@Sushi.Stanford.EDU>


IF you attempt to move a message to a file, and there is no space
available in your directory, well, what happens is that a new file is 
created, with 0 pages, and everything looks like the move was completed
successfully. No complaint from MM, none from TOPS-20.  And then you do
an EXPunge on the mail file, and the message is gone forever.

ashok
-------
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 NOV 86  23:06:56 EST
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 NOV 86  23:02:03 EST
Date: Wed 5 Nov 86 22:58-EST
From: "Aaron F. Bobick" <AFB%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: Re: Losing Fill
To: bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU


I lose the fill mode when I go read another TeX file (^X^F),
which sets up a buffer which is of course not auto-filled an its
creation.  Then when I return to the original buffer, the fill has
disappeared.

afb 

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 NOV 86  22:41:19 EST
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 NOV 86  22:35:42 EST
Date: Wed 5 Nov 86 22:32-EST
From: "Aaron F. Bobick" <AFB%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: Losing a minor mode
To: bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

Maybe a bug, maybe my VARS file:

In my vars file (oz:<afb>emacs.vars) there is a TeX mode hook
defined as follows ( I stole most of it):


TeX Mode Hook:"1,(M.M^R Dictionary Lookup Word)M.Q...$w
!*               1M.LAuto Fill Modew  !
!*              :I*\M.LParagraph Delimiterw !
		0mm& Alter ..D\Aw  !* no expand after \  (do it in tex) !
               5*` :f..D_(w !* Flash single quotes like parens!
               5*' :f..D_)`" !* Flash single quotes like parens!
 !* Keep the previous line last in the Tex Mode Hook!
 !* (because of the right single quote)!

Here's the problem.  Since the Auto-Fill is commented out, it
doesn't start up automatically, which is fine.  Often in TeX one
doesn't want filling of equations and the like.  But when writing
plain text, I set auto fill mode on, but leave the mode as TeX
mode to check dollar signs etc.  However, if I leave the buffer,
(to some other buffer), or exit emacs and then return to the TeX
buffer, SOMETIMES I have lost the auto-fill mode.  I haven't done
a systematic check of when I lose auto-fill and when not.

Any suggestions?

Thanx -- afb


Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 NOV 86  12:27:48 EST
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 NOV 86  12:22:12 EST
Received: from USC-ECLC.ARPA (TCP 1200200171) by AI.AI.MIT.EDU  5 Nov 86 12:24:20 EST
Date: Wed 5 Nov 86 09:20:53-PST
From: cherylXgilmore <XGilmore@USC-ECLC.ARPA>
Subject: ooops.
To: emaCS@USC-ECLC.ARPA

Message-ID: <12252537902.39.XGILMORE@USC-ECLC.ARPA>



I apologize for the last msg (subject: I). It's first thing in the 
morning...I think I'll go get some coffee.
oops.
xg<esc>
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 NOV 86  12:22:02 EST
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 NOV 86  12:16:33 EST
Received: from USC-ECLC.ARPA (TCP 1200200171) by AI.AI.MIT.EDU  5 Nov 86 12:18:39 EST
Date: Wed 5 Nov 86 09:15:11-PST
From: cherylXgilmore <XGilmore@USC-ECLC.ARPA>
Subject: I
To: EMACS@USC-ECLC.ARPA

Message-ID: <12252536864.30.XGILMORE@USC-ECLC.ARPA>



   Hi.  I went to PCC security..they had my keys  (* whew *). I also
filled out some form to contest the ticked that I got. Things are 
getting better bit by bit, but this has not been my favorite 12 hour
period...I'm plumb tuckered.

                                      Tanks for helping me out,
                                      i lov you.
                                             xg<esc>
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 23 OCT 86  02:05:49 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 23 OCT 86  02:00:26 EDT
Date: Thu, 23 Oct 86 01:56:05 EDT
From: Ray Hirschfeld <RAY@AI.AI.MIT.EDU>
Subject:  emacs lossage
To: ALAN@AI.AI.MIT.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU, BUG-ITS@AI.AI.MIT.EDU
In-reply-to: Msg of Wed 22 Oct 86 19:07:28 EDT from Alan Bawden <ALAN at AI.AI.MIT.EDU>
Message-ID: <[AI.AI.MIT.EDU].109744.861023.RAY>

    Date: Wed, 22 Oct 86 19:07:28 EDT
    From: Alan Bawden <ALAN at AI.AI.MIT.EDU>
    To:   RAY at AI.AI.MIT.EDU
    cc:   BUG-EMACS at AI.AI.MIT.EDU, BUG-ITS at AI.AI.MIT.EDU
    Re:   emacs lossage
        ...
    Well, a quick peek at your directory reveals:

    AI   RAY   
    FREE BLOCKS #0=285 #1=2674 
      ...
      0   TS     E       59 +161 ! 10/21/86 11:27:25 (10/22/86) 
      ...

    A look at this file reveals that it is an SBLK file, so it is unlikely that
    this is an EMACS that you dumped out for yourself intentionally.
    (Especially since it appears to be a vanilla EMACS with no libraries
    loaded.)  Perhaps you should delete this file.

Thanks, Alan!  I never thought to look there.  Removing the bogus
emacs fixed the problem.  I wonder where the hell it came from.

				Ray

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 22 OCT 86  19:12:34 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 22 OCT 86  19:09:21 EDT
Date: Wed, 22 Oct 86 19:07:28 EDT
From: Alan Bawden <ALAN@AI.AI.MIT.EDU>
Subject:  emacs lossage
To: RAY@AI.AI.MIT.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU, BUG-ITS@AI.AI.MIT.EDU
In-reply-to: Msg of Wed 22 Oct 86 18:44:59 EDT from Ray Hirschfeld <RAY at AI.AI.MIT.EDU>
Message-ID: <[AI.AI.MIT.EDU].109549.861022.ALAN>

    Date: Wed, 22 Oct 86 18:44:59 EDT
    From: Ray Hirschfeld <RAY at AI>
    Emacs on AI has been dying on me repeatedly over the last few days.
    It always chokes in the same place, with a message like:

    .VAL 0; 6767>>MOVEM 6,1377  6/   177  1377/   176

    A quick peek reveals that this immediately follows a .call corblk,
    which I guess is failing.

    Proceeding the job makes it work until the next try.

Well, a quick peek at your directory reveals:

AI   RAY   
FREE BLOCKS #0=285 #1=2674 
  ...
  0   TS     E       59 +161 ! 10/21/86 11:27:25 (10/22/86) 
  ...

A look at this file reveals that it is an SBLK file, so it is unlikely that
this is an EMACS that you dumped out for yourself intentionally.
(Especially since it appears to be a vanilla EMACS with no libraries
loaded.)  Perhaps you should delete this file.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 22 OCT 86  18:51:40 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 22 OCT 86  18:47:20 EDT
Date: Wed, 22 Oct 86 18:44:59 EDT
From: Ray Hirschfeld <RAY@AI.AI.MIT.EDU>
Subject:  emacs lossage
To: BUG-EMACS@AI.AI.MIT.EDU, BUG-ITS@AI.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].109535.861022.RAY>

Emacs on AI has been dying on me repeatedly over the last few days.
It always chokes in the same place, with a message like:

.VAL 0; 6767>>MOVEM 6,1377  6/   177  1377/   176

A quick peek reveals that this immediately follows a .call corblk,
which I guess is failing.

Proceeding the job makes it work until the next try.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 9 OCT 86  16:57:31 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 9 OCT 86  16:53:51 EDT
Date: 9 Oct 1986  16:52 EDT (Thu)
Message-ID: <RICH.12245498539.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: INFO

If you try M-X Info$Emacs, it blows up on "TOP - No such node".
Info seems to work otherwise.
			-CR

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 7 OCT 86  15:55:29 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 7 OCT 86  15:50:41 EDT
Date: 7 Oct 1986  15:33 EDT (Tue)
Message-ID: <RICH.12244959936.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: New BIBTEX mode added to Twenex
CC:   RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

I have added a new BIBTEX mode to Twenex and recompiled the
library (version 114).  Since I have never dumped a new Emacs
before, I thought it might be safer to ask someone who knows what they are
doing to do this for me, if it is not too much trouble.
				Thanks, Chuck.


Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 28 SEP 86  01:16:58 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 28 SEP 86  01:13:12 EDT
Date: Sun, 28 Sep 1986  01:13 EDT
Message-ID: <GZT.TDF.12242443923.BABYL@MIT-OZ>
Sender: GZT.TDF%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: "David D. Story" <FTD%MIT-OZ @ MC.LCS.MIT.EDU>
To:   bug-info%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Fix in Scribe Info Files for Emacs Info Node
Phase-Of-The-Moon: LQ+2D.9H.56M.0S.


Tag Table:
	--Blurb--
^_

Needs to be deleted (or at least  fixed properly if needed)
in the MC Scribe File for Emacs Info.

Causes Info to jump to the end of the Info Emacs Node and
hangs.
 

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 24 SEP 86  15:29:50 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 24 SEP 86  15:25:13 EDT
Date: Wed, 24 Sep 1986  15:26 EDT
Message-ID: <TMB.12241550631.BABYL@MIT-OZ>
From: TMB%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

Scheme mode on Tops-20/EMACS doesn't seem to know about the proper
indentation for let* (i.e. the indentation analogous to let).

						Thomas.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 23 SEP 86  15:57:25 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 24 SEP 86  15:54:25 EDT
Date: Tue 23 Sep 86 15:46:27-EDT
From: "Michael R. Crystal" <CRYSTAL%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: C-M-\
To: bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Message-ID: <12241292210.39.CRYSTAL@OZ.AI.MIT.EDU>


I was in lisp mode and created a list with thirty elements.  Each
element was of the form (string (# # # #)).  Hence the list was only
three levels deep, and each level was not overly full.  I wrapped a
(setq x ...) around my list and then marked the whole expression.
Then I typed C-M-\.

An error resulted, something about a stack overflow, and I was tossed
into TECO.

-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 16 SEP 86  15:45:18 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 16 SEP 86  13:25:20 EDT
Date: Tue, 16 Sep 1986  13:08 EDT
Message-ID: <ELIZABETH.12239428515.BABYL@MIT-OZ>
From: ELIZABETH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: reverse searches

I can't get reverse searches to go, even though forward searches are
fine...

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 15 SEP 86  13:07:05 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 15 SEP 86  13:00:05 EDT
Received: from XX.LCS.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 15 Sep 86 12:58-EDT
Date: Mon, 15 Sep 1986  12:34 EDT
Message-ID: <SRA.12239160202.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   "David D. Story" <FTD%MIT-OZ@MC.LCS.MIT.EDU>
Cc:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: To Whomever has been munging EMACS !
In-reply-to: Msg of 14 Sep 1986  23:30-EDT from "David D. Story" <FTD%MIT-OZ @ MC.LCS.MIT.EDU>

David, please don't be more of a twit than is necessary.

The OZ:<EMACS> directory was trashed by a hardware malfunction.
Various kind and well-meaning people have been restoring it, fixing
breakage as it is discovered.  If you know of something else that
needs fixing, either report it, fix it, or shut up.

--Rob

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 15 SEP 86  10:02:10 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 15 SEP 86  09:53:47 EDT
Date: Sun, 14 Sep 1986  23:30 EDT
Message-ID: <GZT.TDF.12239017383.BABYL@MIT-OZ>
Sender: GZT.TDF%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: "David D. Story" <FTD%MIT-OZ @ MC.LCS.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: To Whomever has been munging EMACS !
Phase-Of-The-Moon: FQ+4D.2H.37M.55S.



	The INFO interface and associated nodes for EMACS
	has been totally munged.

	ZEMACS has been munged...Looks for the wrong compressed
	version of the TWENEX library.

	Since it looks as though you are still adding documentation
	or new bu...I mean Features, Please fix this yourself.

	If you cannot I will do it for you at the cost of $50 bucks
	an hour. This would be rather expensive since I don't remember
	all the internals...you couldn't possilby pay...so you have
	TAPE RETRIEVAL DUTY FOR THE FALL SEMESTER.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 12 SEP 86  14:01:19 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 12 SEP 86  13:58:15 EDT
Date: 12 Sep 1986  13:55 EDT (Fri)
Message-ID: <FONER.12238388352.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Subject: How to dump a Babyl
To:   "Leigh L. Klotz" <KLOTZ%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Cc:   bug-babyl%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      Foner%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
In-reply-to: Msg of 12 Sep 1986  13:42-EDT from Leigh L. Klotz <KLOTZ>

To redump a Babyl:

Connect to <EMACS>.  Read BABYL-DUMP.TXT (or somesuch) which also
refers you to DUMP-BABYL.TXT.  Still connected to <EMACS>, and making
damned sure your SYS: logical is set up right and that no inits are
visible, start up TECO and type @er dump-babyl.init$ @y m(hfx*)$$ at
it.  Assuming you haven't redefined EMACS: to point somewhere random,
it should dump out a new Babyl to <EMACS>BABYL.EXE.

Have fun.

						<LNF>

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 12 SEP 86  13:50:39 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 12 SEP 86  13:45:55 EDT
Date: Fri 12 Sep 86 13:42-EDT
From: "Leigh L. Klotz" <KLOTZ%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
To: bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
    bug-babyl%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

The emacs that <emacs>babyl.exe.774 was dumped out was lost when
the emacs directory was trashed.

I don't know how to dump a babyl.exe, and I don't see any files
for doing it either.  Could someone tell me how?  It would be nice
to have a batch job to dump it, like INFO and TEACH-EMACS.


Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 12 SEP 86  03:24:25 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 12 SEP 86  03:20:51 EDT
Received: from AI.AI.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 12 Sep 86 03:17-EDT
Date: Fri, 12 Sep 86 03:21:14 EDT
From: "Pandora B. Berman" <CENT@AI.AI.MIT.EDU>
Subject: <EMACS> directory truncated?
To: bug-system@OZ.AI.MIT.EDU, bug-emacs@OZ.AI.MIT.EDU
cc: JINX@AI.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].93293.860912.CENT>

    Date: Wed, 10 Sep 1986  14:35 EDT
    From: Rob Austein <SRA@XX.LCS.MIT.EDU>
    To:   Bill Rozas <JINX%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
    Cc:   bug-system%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
    Subject: <EMACS> directory truncated?
	Date: Wednesday, 10 September 1986  11:46-EDT
	From: Bill Rozas <JINX%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
	To:   bug-system%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
	Re:   <EMACS> directory truncated?
	What has happened to the rest of the <EMACS> directory?  The last
	file is MM..., and everything afterwards has disappeared.  Has it
	migrated elsewhere, or has it been lost?
    Bit rot on OZ:.  Page 30 of the directory file is totally random.
    Futher examination shows that the index block for the directory file
    has its BAT bit turned on (ie, is known to be possibly corrupt).  It
    seems that GTJFN% is still able to find specific files via the symbol
    table, but it can't do a wildcard directory past the bogus page (which
    is why EMACS can still load the TWENEX library but doing @DIR fails).
    Somebody will have to take OZ down, flush and rebuild the EMACS
    directory, and run CHECKD to salvage the lost pages.  Trying to patch
    the current directory file back together is hopeless.
done. kudos to leigh klotz who built a new emacs when the old one didn't
work after reloading (mismatched version numbers, he said).

    Evidence for the postmortem is in OZ:<SRA>EMACS.*, for the curious.

    PS: DIRPNT and DIRTST should -not- be allowed to go offline.  I had to
    port the XX copies.
i have no idea where these are. please set them perpetual if you want them
alive that badly.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 16 JUL 86  12:46:27 EDT
Received: from LOTS-C.STANFORD.EDU by MC.LCS.MIT.EDU 16 Jul 86 12:43:10 EDT
Date: Wed 16 Jul 86 09:34:05-PDT
From: Bruno Chanal <b.bruno@LOTS-C.STANFORD.EDU>
Subject: Sources for the emacs manual.
To: bug-emacs@MC.LCS.MIT.EDU
Message-ID: <12223169256.209.B.BRUNO@LOTS-C.STANFORD.EDU>


Hi,

  I am looking for the latest sources for the TWENEX emacs manual.  More 
precisely, I would need some "Scribe" sources, preferably in a publicly
accessible directory (i.e., accessible with anonymous FTP).

Thanks,

Bruno
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 1 JUL 86  00:06:13 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 30 JUN 86  23:51:26 EDT
Date: 30 Jun 1986  14:56 EDT (Mon)
Message-ID: <RICH.12219000932.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   bug-oz%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
cc:   Bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Random logging out


I have been suffering intermittently from the following behavior (not
often enough to be a real problem -- but I thought I would probe to
see if anyone else had heard of it):

Once in a while, when I proceed my Emacs job from the Exec, instead of ending
up in Emacs, I get logged out.  Nothing else gets printed out except
the usual time stamp, etc. line that gets typed on normal logout.

??

			-Chuck 

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 30 JUN 86  09:42:22 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 30 JUN 86  09:38:02 EDT
Date: 30 Jun 1986  09:38 EDT (Mon)
Message-ID: <RICH.12218942945.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   Robert Lenoil <LENOIL%DEEP-THOUGHT.MIT.EDU@XX.LCS.MIT.EDU>
CC:   Bug-Emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
In-reply-to: Msg of 29 Jun 1986  23:08-EDT from Robert Lenoil <LENOIL at DEEP-THOUGHT.MIT.EDU>

    Date: Sunday, 29 June 1986  23:08-EDT
    From: Robert Lenoil <LENOIL at DEEP-THOUGHT.MIT.EDU>
    To:   RICH at AI.AI.MIT.EDU

        	(1) Why does Emacs give a "Wrong Byte Size" error when
                    I try to use a remote filename like CHA:AI.IFILE_Rich;REQ
                    as an argument to Find File?

    My guess is that EMACS wants to open the file in ASCII (7 bit) mode, but
    that the chaos connection can only be opened in 32 bit mode.

Thanks.  Sounds plausible, but is it easily fixable?
		-CR

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 13 JUN 86  12:12:14 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 13 JUN 86  12:09:02 EDT
Date: Fri, 13 Jun 86 12:08:36 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Subject: Compare Windows
To: BUG-EMACS@AI.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].56312.860613.KLOTZ>

I put in a warning message about trying to compare a buffer with itself
and installed the new AUX library on OZ, XX, AI, and MX.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 11 JUN 86  16:22:08 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 11 JUN 86  16:16:00 EDT
Received: from XX.LCS.MIT.EDU by AI.AI.MIT.EDU 11 Jun 86 16:15:14 EDT
Date: Wed, 11 Jun 1986  16:17 EDT
Message-ID: <MEYER.12214034905.BABYL@XX.LCS.MIT.EDU>
From: MEYER@XX.LCS.MIT.EDU
To:   "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Cc:   BUG-EMACS@AI.AI.MIT.EDU
Subject: Compare Windows
In-reply-to: Msg of 11 Jun 1986  15:10-EDT from Leigh L. Klotz <KLOTZ at AI.AI.MIT.EDU>

Yes, I finally did copy the buffer to separate files and
compare them.  This is a rare enough event that I won't even request compare
buffers be implemented -- but if not, I think "COMPARE WINDOWS" is a
misnomer, and it should be named "COMPARE WINDOW-FILES" or something.
Thanks, A.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 11 JUN 86  15:36:30 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 11 JUN 86  15:26:50 EDT
Date: Wed, 11 Jun 86 15:10:59 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Subject: Compare Windows
To: meyer@XX.LCS.MIT.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].55208.860611.KLOTZ>

Well, if my memory serves me correctly comparing a buffer with itself is
not implemented.  Just offhand I'd say it might not be easily fixable,
but I'll look into making it give an error in that case.  You can always
copy the buffer if you need to.

I'll gladly defer to anybody who wants to really make it work.

Leigh.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 11 JUN 86  14:08:41 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU 11 Jun 86 13:52:32 EDT
Date: Wed, 11 Jun 1986  10:28 EDT
Message-ID: <MEYER.12213971302.BABYL@XX.LCS.MIT.EDU>
From: MEYER@XX.LCS.MIT.EDU
To:   bug-emacs@XX.LCS.MIT.EDU
Subject: compare windows

I tried comparing two different parts of the same buffer in two windows and
kept getting a MATCH reported when there obviously wasn't one.  Can you
advise?

Thanks, A.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 10 JUN 86  18:31:49 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 10 JUN 86  18:29:46 EDT
Date: Tue, 10 Jun 1986  17:59 EDT
Message-ID: <KAP.12213791236.BABYL@MIT-OZ>
From: KAP%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject:   Right Margin and Auto Wrapping of lines


In certain library modules of (I hate to admit it) FORTRAN source
the statements are exactly 80 characters long. Emacs (I think un-
necessarily) auto wraps lines of length 80 characters. This is 
annoying since I get half as much text on the screen and all of it 
should fit. The lines look like this:


c THIS  IS A FORTRAN LINE                MODUL000!
1
C THIS IS ANOTHER                        MODUL000!
2
...


instead of:


c THIS  IS A FORTRAN LINE                MODUL0001
C THIS IS ANOTHER                        MODUL0002


Can I shut this off? Shouldn't EMACS be fixed so that it automatically 
wraps one character later?

Thanks, 

Ken

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 JUN 86  19:25:30 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU  5 Jun 86 19:20:02 EDT
Date: Thu 5 Jun 86 19:23:09-EDT
From: Paul G. Weiss <PGW@XX.LCS.MIT.EDU>
Subject: Bug using EMACS with MM
To: bug-mm@XX.LCS.MIT.EDU
cc: bug-emacs@XX.LCS.MIT.EDU
Message-ID: <12212495821.46.PGW@XX.LCS.MIT.EDU>

When I use EMACS to edit a message under MM, the terminal handling
portion of MM is subsequently confused.

I set up my terminal as follows:

ter heath
ter pag
ter its
ter no scroll
ter ver

After running EMACS, the terminal scrolls instead of wrapping, and
I need to reset MM and run it again to cause the terminal to wrap.
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 JUN 86  18:01:31 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 JUN 86  17:58:14 EDT
Date: Thu, 5 Jun 1986  17:20 EDT
Message-ID: <KAP.12212473521.BABYL@MIT-OZ>
From: KAP%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Right Margin and Auto Wrapping of lines
cc:   kap%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU


In certain library modules of (I hate to admit it) FORTRAN source
the statements are exactly 80 characters long. Emacs (I think un-
necessarily) auto wraps lines of length 80 characters. This is 
annoying since I get half as much text on the screen and all of it 
should fit. The lines look like this:


c THIS  IS A FORTRAN LINE                MODUL000!
1
C THIS IS ANOTHER                        MODUL000!
2
...


instead of:


c THIS  IS A FORTRAN LINE                MODUL0001
C THIS IS ANOTHER                        MODUL0002


Can I shut this off? Shouldn't EMACS be fixed so that it automatically 
wraps one character later?

Thanks, 

Ken

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 10 MAY 86  15:35:31 EDT
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 10 MAY 86  15:34:30 EDT
Date: Sat, 10 May 86 15:35:05 EDT
From: "Leigh L. Klotz" <KLOTZ@AI.AI.MIT.EDU>
Subject:  SPELL and WEBSTER, again
To: BUG-EMACS@AI.AI.MIT.EDU
cc: PGS@AI.AI.MIT.EDU, jks@OZ.AI.MIT.EDU, rich@OZ.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].37131.860510.KLOTZ>

C-M-$ on Twenex now uses the WEBSTER program instead of parsing the
database by itself.

The M-$ command on AI and OZ now uses an F algorithm for determining the
extent of the word.  Previously it used FW, but without preparing a ..D
syntax table.  This omission led to problems with apostrophe and hyphen in
some modes.  The Twenex spell program can understand apostrophe but not
hyphen, but the ITS version works with both.

WEBSTER has been changed to use the same algorithm in order
to be independent of the major mode and character syntax table.
The WEBSTER program on both Twenex and ITS works fine with apostrophe
and hyphen, so there's no problem there.

WEBSTER is currently a loadable library on AI (with no key assignments)
and autloaded on OZ via the SITE.INIT file.  I will make it be autoloaded
on AI as soon as I remember how; there's no SITE INIT file there.


Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 9 MAY 86  14:16:24 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU  9 May 86 14:13:40 EDT
Received: from CS.COLUMBIA.EDU by XX.LCS.MIT.EDU with TCP; Fri 9 May 86 14:12:50-EDT
Date: 9 May 1986  14:07 EDT (Fri)
Message-ID: <EPPSTEIN.12205360479.BABYL@CS.COLUMBIA.EDU>
From: David Eppstein <Eppstein@CS.COLUMBIA.EDU>
To:   William "Chops" Westfield <BILLW@SU-SCORE.ARPA>
Cc:   bug-emacs@XX.LCS.MIT.EDU
Subject: adding crlf to end of file...
In-reply-to: Msg of 8 May 1986  18:13-EDT from William "Chops" Westfield <BILLW at SU-SCORE.ARPA>

It was a Stanford local hack in EMACS:SITE.INIT, put there by JQ.
I don't know of any such feature in the standard releases
(although GNU emacs seems to have it).

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 8 MAY 86  18:19:48 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU  8 May 86 18:15:28 EDT
Received: from SU-SCORE.ARPA by XX.LCS.MIT.EDU with TCP; Thu 8 May 86 18:14:43-EDT
Date: Thu 8 May 86 15:13:28-PDT
From: William "Chops" Westfield <BILLW@SU-SCORE.ARPA>
Subject: adding crlf to end of file...
To: bug-emacs@XX.LCS.MIT.EDU
Message-ID: <12205143102.34.BILLW@SU-SCORE.ARPA>

there used to be a version of Write file or some such that would
append a CRLF to the end of a file, if it wasn't there already,
But I can't find it now.   Does anybody remember what it was
called?

BillW
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 8 MAY 86  17:46:00 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU  8 May 86 17:43:08 EDT
Received: from SU-SCORE.ARPA by XX.LCS.MIT.EDU with TCP; Thu 8 May 86 17:42:23-EDT
Date: 8 May 1986 14:31-PDT
Sender: BILLW@SU-SCORE.ARPA
Subject: Re:   EMACS
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: EWR@XX.LCS.MIT.EDU
Cc: bug-emacs@XX.LCS.MIT.EDU
Message-ID: <[SU-SCORE.ARPA] 8-May-86 14:31:07.BILLW>
In-Reply-To: <SRA.12205120607.BABYL@XX.LCS.MIT.EDU>

You can have EMACS init files change FS O SPEED$, regardless
of the actual line speed.  Thus the site init could check
the terminal number and type, and set what the real speed
is.  this same technique can be used to deal with terminals
that are just "faster" or "slower" versions of some popular
terminal also.

BillW

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 8 MAY 86  16:20:14 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU  8 May 86 16:15:04 EDT
Date: Thursday, 8 May 1986  16:04-EDT
Message-ID: <SRA.12205120607.BABYL@XX.LCS.MIT.EDU>
Sender: Betsy Ramsey <EWR@XX.LCS.MIT.EDU>
From: Betsy Ramsey <EWR@XX.LCS.MIT.EDU>
To: SRA@XX.LCS.MIT.EDU
cc: EWR@XX.LCS.MIT.EDU
Subject:   EMACS
Company: American Mathematical Society
ReSent-From: SRA@XX.LCS.MIT.EDU
ReSent-To: bug-emacs@xx.lcs.mit.edu
ReSent-Date: Thu 8 May 1986 16:09-EDT

	I have an EMACS problem that you may be able to help me
	with.

	We have Teleray-1061 terminals, and EMACS uses its delete
	line capability to make screen refreshes neater.  Apparently
	EMACS also knows that the delete line function is slow,
	because it handles the Teleray differently at slow line
	speeds than it does at higher speeds.

	We're about to put our modems on a DEC terminal server.  LAT
	jobs go in on virtual terminals, so the DEC-20 doesn't know
	what the user's actual line speed is, and it reports it as
	indeterminate.  EMACS assumes that this means the user is
	on a high-speed lines, with the result that Teleray screen
	refreshes are *very* slow when it's using delete line.

	I can get my users around this problem by having them set
	their terminal type to VT52, but it's a shame to give up the
	nice Teleray features just because of this problem.

	Is there a way to order EMACS to handle the Teleray as if
	it were on a slow speed line?

	(It looks to me like TECPUR is doing an MTOPR to determine
	the line speed, and is making various decisions based on
	what it finds.  Is there a way to interfere with this
	decision-making process at EMACS level?)

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 8 MAY 86  05:55:34 EDT
Date: Thu,  8 May 86 05:52:57 EDT
From: David Vinayak Wallace <GUMBY@MC.LCS.MIT.EDU>
Subject:  ILLEGAL SYSTEM CALL NAME
To: BUG-EMACS@MC.LCS.MIT.EDU
cc: BUG-MLDEV@MC.LCS.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].906936.860508.GUMBY>

From emacs (NE or E) when I try to set the REAP flag using the MLDEV I
get the above error.  DDT does it jest fine.

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 5 MAY 86  10:16:25 EDT
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 5 MAY 86  10:12:39 EDT
Date: 5 May 1986  10:11 EDT (Mon)
Message-ID: <RICH.12204268999.BABYL@MIT-OZ>
Sender: RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
From: Charles Rich <RICH@AI.AI.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Help

Can someone give me clue as to where the variable $Directory Lister$
is initialized and/or set.  I am trying to track down a problem with Zemacs
since the big crash that involves this variable getting a meaningless
value.
			Many thanks, Chuck. 

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 28 APR 86  21:41:55 EDT
Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU 28 Apr 86 21:40:18 EDT
Date: Mon 28 Apr 86 21:38:45-EDT
From: Michael Davon <DAVON@XX.LCS.MIT.EDU>
Subject: Indent Region
To: bug-emacs@XX.LCS.MIT.EDU
cc: davon@XX.LCS.MIT.EDU
Message-ID: <12202559034.13.DAVON@XX.LCS.MIT.EDU>


If I try to run ^R Indent Region when in Scribe mode, I lose big.
I get some error about the pushdown stack being full, and emacs
crashes.  This is rather a drag when in the middle of editing a file, 
as I'm sure you can imagine.

Michael
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 9 APR 86  05:17:25 EST
Received: from SUMEX-AIM.ARPA by MC.LCS.MIT.EDU  9 Apr 86 05:15:23 EST
Received: from PANDA by SUMEX-AIM.ARPA with Cafard; Wed 9 Apr 86 02:14:12-PST
Date: Wed 9 Apr 86 01:33:33-PST
From: Mark Crispin <MRC%PANDA@SUMEX-AIM.ARPA>
Subject: VTxxx madness
To: Bug-EMACS@MC.LCS.MIT.EDU
Postal-Address: 1802 Hackett Ave.; Mountain View, CA  94043-4431
Phone: +1 (415) 968-1052
Message-ID: <12197402589.6.MRC@PANDA>

Folks -

     In modern versions of TOPS-20 there are now the following forms
of VT100 terminal types defined by DEC:
 . VT100	basic VT100
 . VT102	VT100 with advanced video (24 lines in 132 column mode,
		can mix character highlight modes) and printer port
		(includes insert/delete mode)
 . VT125	VT100 with graphics engine, can't disable Auto XON/XOFF
 . VT131	VT102 plus buffer and hardware flow control, I think you
		can disable Auto XON/XOFF on this one
 . VT132	reputed to be functionally the same as a VT131.
 . VT200	DEC's latest generation

     The problem is, EMACS only defines types for VT100 and VT132.  There
doesn't seem to be any way to have multiple terminal type codes for the
same EMACS type.  I think it would work to have VT102 = VT131 = VT132 =
VT200 = ANSI.  Would this be hard to put into the next version of EMACS?

     It would also be nice if there was a single assembly switch which
disabled all padding and also disabled EMACS' trapping of XON/XOFF.
-------

Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 2 APR 86  14:40:40 EST
Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 2 APR 86  14:39:22 EST
Received: from MC.LCS.MIT.EDU by AI.AI.MIT.EDU via Chaosnet; 2 APR 86  14:38:43 EST
Date: Wed,  2 Apr 86 14:39:11 EST
From: "Leigh L. Klotz" <KLOTZ@MC.LCS.MIT.EDU>
Subject:  Emacs and TECO sources
To: ALAN@AI.AI.MIT.EDU
cc: BUG-EMACS@AI.AI.MIT.EDU, BUG-TECO@AI.AI.MIT.EDU
In-reply-to: Msg of Sun 30 Mar 86 02:43:35 EST from Alan Bawden <ALAN at AI.AI.MIT.EDU>
Message-ID: <[MC.LCS.MIT.EDU].870618.860402.KLOTZ>

    Date: Sun, 30 Mar 86 02:43:35 EST
    From: Alan Bawden <ALAN at AI.AI.MIT.EDU>
    To:   BUG-EMACS at AI.AI.MIT.EDU, BUG-TECO at AI.AI.MIT.EDU
    Re:   Emacs and TECO sources

    I just moved the directories .TECO., EMACS, and EMACS1 from MC to AI.  I
    don't know what status these directories have as the "official" homes of
    any source files, but whatever status they have should now be transfered to
    to AI.  

    ...

To the best of my knowledge the EMACS1; directory is the only home of
the ITS-specific libraries.  DIRED is the only obvious one.


Received: from AI.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 30 MAR 86  02:44:48 EST
Date: Sun, 30 Mar 86 02:43:35 EST
From: Alan Bawden <ALAN@AI.AI.MIT.EDU>
Subject:  Emacs and TECO sources
To: BUG-EMACS@AI.AI.MIT.EDU, BUG-TECO@AI.AI.MIT.EDU
Message-ID: <[AI.AI.MIT.EDU].22474.860330.ALAN>

I just moved the directories .TECO., EMACS, and EMACS1 from MC to AI.  I
don't know what status these directories have as the "official" homes of
any source files, but whatever status they have should now be transfered to
to AI.  

Reproduced below is the system message I posted to explain the MC to AI
migration procedure:

The source files for everything vital to an ITS, which have been living on
MC, are being moved to AI one directory at a time.  Copies are being left
on MC for completeness.  When a directory has been copied to AI, the file
 MOVED TO AI is added to the MC version of the directory.

Once a directory is copied to AI in this fashion, AI becomes its home.
After that, modifications done to the version on MC may be lost.

If you want to change anything related to ITS or important programs (e.g.
MacLisp, MIDAS) during this transition, look for the file
 MOVED TO AI on the MC version of the directory -first-.  If that file does
not exist, that directory still lives on MC and changes should be made
there; if the file does exist, make your changes on AI.

Received: from CS.COLUMBIA.EDU by MC.LCS.MIT.EDU 23 Mar 86 16:46:37 EST
Date: 23 Mar 1986  16:08 EST (Sun)
Message-ID: <EPPSTEIN.12193072693.BABYL@CS.COLUMBIA.EDU>
From: David Eppstein <Eppstein@CS.COLUMBIA.EDU>
To:   bug-emacs@MC.LCS.MIT.EDU, remarks@CS.COLUMBIA.EDU
Subject: Buggy Tab to Tab Stop in EMACS 165

This is with EMACS 165 here at CS.COLUMBIA.EDU.

^R Tab to Tab Stop (the default tab for text mode) has problems when
there is text above the top of the screen.  I can duplicate the
problem by making a file of a half dozen lines, scrolling it one line
with M-1 C-V, going to the end of the file, and typing several tabs.
& Xindent gets called with out of order arguments, producing an AOR.

I couldn't get it to happen when single stepping (a likely story).
My theory is that the FM that goes to the current column in the
scratch buffer is being led astray, but it could be the following
FS SHPOS$ (the first one is right, not surprising since its in the
buffer that it expects to be in).  Anyway, I made a function that
worked by doing 0F[WINDOW$ and then chaining to the old definition,
so that seems like the right fix.
					David

Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 22 MAR 86  17:15:42 EST
Date: Sat, 22 Mar 1986  17:15 EST
Message-ID: <ZVONA.12192822665.BABYL@MIT-OZ>
From: David Chapman <ZVONA%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
To:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU

Has a new emacs or babyl been installed on OZ recently?  I've been
getting some weird bugs in Babyl with no provocation that I've never
seen before.

Date: Wed, 12 Mar 86 23:30:23 EST
From: Ray Hirschfeld <RAY@MC.LCS.MIT.EDU>
Subject:  broken emacs on MC
To: BUG-EMACS@MC.LCS.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].848878.860312.RAY>

Emacs, when started, would complain that the file mc:emacs;[pure] 162
could not be found and then immediately give a QNS error.  I copied
the file with the same name on AI to MC, and this seemed to fix the
problem.

				Ray

Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 6 MAR 86  22:03:10 EST
Received: from DEEP-THOUGHT.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 6 Mar 86 21:55-EST
Received: from MC.LCS.MIT.EDU by DEEP-THOUGHT.MIT.EDU via Chaosnet; 6 Mar 86 21:56-EST
Date: Thu,  6 Mar 86 21:56:32 EST
From: "Leigh L. Klotz" <KLOTZ@MC.LCS.MIT.EDU>
Subject:  heath terminals
To: Mellis@DEEP-THOUGHT.MIT.EDU
cc: bug-emacs@DEEP-THOUGHT.MIT.EDU
In-reply-to: Msg of Thu 6 Mar 1986  04:21 EST from Adam G. Mellis <Mellis at DEEP-THOUGHT.MIT.EDU>
Message-ID: <[MC.LCS.MIT.EDU].841558.860306.KLOTZ>

    Date: Thu, 6 Mar 1986  04:21 EST
    From: Adam G. Mellis <Mellis at DEEP-THOUGHT.MIT.EDU>
    Sender: T.MELLIS at DEEP-THOUGHT.MIT.EDU
    To:   bug-emacs at DEEP-THOUGHT.MIT.EDU
    Re:   heath terminals

    I'm dialing up eecs, and I set my terminal type to heath, as I'm
    using kermit and an IBM pc.  When in emacs, if I delete more than
    one line, emacs takes a very long time (e.g. 30s) to respond.

    I can supdup to oz, and use emacs there without any problems.

    Any idea what the problem is?  Is there anything that I should do
    to give you more information?

    Thanks,

    Adam
Do
  esc esc 1200 fs ospeed esc esc
Your emacs thinks you are at 9600 baud and need padding, for some reason.


Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 6 MAR 86  04:26:19 EST
Received: from DEEP-THOUGHT.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 6 Mar 86 04:25-EST
Date: Thu, 6 Mar 1986  04:21 EST
Message-ID: <T.MELLIS.12188487477.BABYL@MIT-EECS>
Sender: T.MELLIS@DEEP-THOUGHT.MIT.EDU
From: "Adam G. Mellis" <Mellis@DEEP-THOUGHT.MIT.EDU>
Subject: heath terminals
To:   bug-emacs@DEEP-THOUGHT.MIT.EDU

I'm dialing up eecs, and I set my terminal type to heath, as I'm
using kermit and an IBM pc.  When in emacs, if I delete more than
one line, emacs takes a very long time (e.g. 30s) to respond.

I can supdup to oz, and use emacs there without any problems.

Any idea what the problem is?  Is there anything that I should do
to give you more information?

Thanks,

Adam

Received: from SIMTEL20.ARPA by MC.LCS.MIT.EDU  1 Mar 86 13:44:14 EST
Date: Sat, 1 Mar 1986  11:43 MST
Message-ID: <WANCHO.12187279128.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   BUG-TECO@MC.LCS.MIT.EDU
cc:   BUG-EMACS@MC.LCS.MIT.EDU, BUG-BABYL@MC.LCS.MIT.EDU
Subject: VT100 TECTRM bug

PROBLEM:

In BABYL and ZBABYL on a VT100 or similar terminal, a "Q" or ^X^Z
leaves the cursor at the top of an uncleared screen instead of the
bottom, as intended.


DIAGNOSIS:

In some versions of TECTRM.MID, somebody got over zealous and "fixed"
VT1INI ("FORCE ANSII [sic] MODE") to include an ORIGIN reset sequence,
"$[?6l".  This has the side effect of overriding any previous curpos
sequence and put the cursor at the top of the screen.

CURE:

A "quick fix" is to remove the ORIGIN reset sequence, which is
patchable in TECPUR.EXE.  The "correct" (untested) fix would be to
envelope the ORIGIN mode reset with a Save Cursor and Restore Cursor
sequence, resulting in: $<$7$[?6l$8 .

--Frank

Date: Mon, 24 Feb 86 20:30:45 EST
From: "Leigh L. Klotz" <KLOTZ@MC.LCS.MIT.EDU>
Subject:  WEBSTER for its
To: BUG-EMACS@MC.LCS.MIT.EDU
cc: PGS@MC.LCS.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].829407.860224.KLOTZ>

Try KLOTZ;WEBSTER which installs ^R Dictionary Lookup Word on C-M-$.
It works on ITS.  I will merge it with the Twenex code soon.  This
routine uses a new algorithm for getting the word that is independent
of the current syntax table yet doesn't create a syntax table when
loaded.  If it makes people happy I will use the same method in 
M-$ to eliminate the apostrophe screw.


Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 13 FEB 86  10:40:44 EST
Received: from MC.LCS.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 13 Feb 86 07:44-EST
Date: Thu, 13 Feb 86 07:44:26 EST
From: Communications Satellite <COMSAT@MC.LCS.MIT.EDU>
Subject: Msg of Tuesday, 24 December 1985 03:59-EST
To: EMACS-HACKERS@OZ.AI.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].817063.860213>

FAILED: info-apple-request at DM.LCS.MIT.EDU
This message was manually killed by Comsat maintainers.
 Failed message follows:
-------
Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 24 DEC 85  03:59:42 EST
Date: Tue 24 Dec 85 03:55-EST
From: Emacs Hackers <EMACS-HACKERS@OZ.AI.MIT.EDU>
Subject: List
To: info-apple-request@DM.LCS.MIT.EDU


Please add INFO-APPLE-BBOARD@mit-oz%mit-mc.arpa

to the list

thanks


Date: Wed, 12 Feb 86 01:28:48 EST
From: David Vinayak Wallace <GUMBY@MC.LCS.MIT.EDU>
Subject:  The mark
To: KFL@MC.LCS.MIT.EDU
cc: BUG-EMACS@MC.LCS.MIT.EDU
In-reply-to: Msg of Wed 12 Feb 86 00:57:34 EST from Keith F. Lynch <KFL at MC.LCS.MIT.EDU>
Message-ID: <[MC.LCS.MIT.EDU].815863.860212.GUMBY>

    Date: Wed, 12 Feb 86 00:57:34 EST
    From: Keith F. Lynch <KFL at MC.LCS.MIT.EDU>

    When I do an incremental search, the mark is set at the beginning
    of the search.  Is there some way to get it to stay where I last
    set the mark with ^@ ?

This only happens if you move a long way.  You can set the threshold
EMACS uses to decide whether to set it by setting the variable auto
push point variable.  c-U c-Space might also be what you want.

All this is available via self-documentation.

Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU 12 Feb 86 01:01:42 EST
Date: Wed, 12 Feb 1986  01:03 EST
Message-ID: <SRA.12182684196.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   "Keith F. Lynch" <KFL@MC.LCS.MIT.EDU>
Cc:   BUG-EMACS@MC.LCS.MIT.EDU
Subject: The mark
In-reply-to: Msg of 12 Feb 1986  00:57-EST from "Keith F. Lynch" <KFL@MC.LCS.MIT.EDU>

Everything you ever wanted to know about this sort of thing (and a lot
of things you didnt') are in the EMACS manual, available within EMACS by
doing M-X Info$EMACS.  There's probably some variable you can set to
customize this behaviour.

Date: Wed, 12 Feb 86 00:57:34 EST
From: "Keith F. Lynch" <KFL@MC.LCS.MIT.EDU>
Subject: The mark
To: BUG-EMACS@MC.LCS.MIT.EDU
cc: KFL@MC.LCS.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].815830.860212.KFL>

  When I do an incremental search, the mark is set at the beginning of
the search.  Is there some way to get it to stay where I last set the
mark with ^@ ?
								...Keith

Date: Sat, 18 Jan 86 21:05:27 EST
From: Alan Bawden <ALAN@MC.LCS.MIT.EDU>
Subject:  Auto Save Max broken.  Long filenames again?
To: BUG-EMACS@MC.LCS.MIT.EDU
Message-ID: <[MC.LCS.MIT.EDU].788408.860118.ALAN>

In NE on MC (EMACS Version 162, TECO 1211), if I turn on Auto Save mode, it
looks to me like the variable Auto Save Max is being used to control the
highest -version number- of the auto saved files, rather than the -number-
of auto save files kept.  For example, I set Auto Save Max to 2 Emacs
then writes out _SAV69 1 and _SAV69 2 and from then on in it apparently
writes out _SAV69 3 and then immediately deletes it!  I presume this is
another artifact of long filenames.

Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 14 JAN 86  16:07:56 EST
Received: from XX.LCS.MIT.EDU by OZ.AI.MIT.EDU via Chaosnet; 14 Jan 86 16:05-EST
Date: Tue, 14 Jan 1986  15:54 EST
Message-ID: <SRA.12175244248.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   Charles Rich <RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
Cc:   bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      bug-teco%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Enabling
In-reply-to: Msg of 14 Jan 1986  15:42-EST from Charles Rich <RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>

You have to do it as a either a VALRET to the EXEC (try
:I*^PT^PC$fsechodisp$ w @^KEnable^JContinue^J$ w ^\) or stuff some
PDP10 assembler code into a buffer and execute it (see the Display
Load Average routine in BBNLIB for an example of this sort of thing).
Doing it directly with RPCAP% and EPCAP% is more general, but
valreting is much easier....

Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 14 JAN 86  15:43:48 EST
Date: 14 Jan 1986  15:42 EST (Tue)
Message-ID: <RICH.12175242110.BABYL@MIT-OZ>
From: Charles Rich <RICH%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU>
To:   bug-teco%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU,
      bug-emacs%OZ.AI.MIT.EDU@XX.LCS.MIT.EDU
Subject: Enabling

Is there any way to Enable (in the Tops-20) sense from inside
Teco/Emacs?  I searched for ENABLE in TECORD, but could not
find anything suitable.
		Thanks, CR

Received: from OZ.AI.MIT.EDU by MC.LCS.MIT.EDU via Chaosnet; 30 DEC 85  11:36:06 EST
Date: Mon 30 Dec 85 11:22-EST
From: Randall Davis <DAVIS@OZ.AI.MIT.EDU>
Subject: ESP
To: bug-emacs@OZ.AI.MIT.EDU


No, not that kind.  Error in Spell Program, Maybe Directory Full?
Only it isn't and there's plent of file space.  I get the message
"filename not specified", fall into Spell, and when I quit out, out, emacs
produces the error msg noted above.
[All this happens in response to meta-$.]

Received: from RED.RUTGERS.EDU by MC.LCS.MIT.EDU 20 Dec 85 18:22:31 EST
Date: 20 Dec 85 18:19:49 EST
From: Dave <Steiner@RED.RUTGERS.EDU>
Subject: emacs-hackers account on mit-xx
To: bug-emacs@MIT-MC.ARPA
Uucp: ...{seismo, allegra, ihnp4!packard}!topaz!steiner
Work: Hill-28, PO Box 879, Rutgers U., Piscataway, NJ  08854, (201) 932-2492
Home: 1253 Dogwood Dr., Bridgewater, NJ  08807, (201) 658-4408
Message-ID: <12168717165.30.STEINER@RED.RUTGERS.EDU>


Hi,
	The emacs-hackers account password on mit-xx seems to have
changed.  Could you please tell me the new one.

thanks,
ds
Rutgers Systems Staff
-------

Received: from XX.LCS.MIT.EDU by MC.LCS.MIT.EDU 20 Dec 85 19:53:54 EST
Date: Fri, 20 Dec 1985  19:50 EST
Message-ID: <SRA.12168733656.BABYL@XX.LCS.MIT.EDU>
From: Rob Austein <SRA@XX.LCS.MIT.EDU>
To:   Dave <Steiner@RED.RUTGERS.EDU>
Cc:   bug-emacs@MC.LCS.MIT.EDU
Subject: emacs-hackers account on mit-xx
In-reply-to: Msg of 20 Dec 1985  18:19-EST from Dave <Steiner@RED.RUTGERS.EDU>

It got turned off because some net randoms were using it to hack
around MIT.  Not being the one who turned it off, I'd rather not be
the one to turn it back on.

Date: Tue, 17 Dec 85 00:18:35 EST
From: "Lawrence A. DeLuca, Jr." <HENRIK@MIT-MC.ARPA>
Subject:  soft links
To: BUG-EMACS@MIT-MC.ARPA
cc: bug-gnu-emacs@MIT-PREP.ARPA
Message-ID: <[MIT-MC.ARPA].757369.851217.HENRIK>


there are system calls available to read the values of symbolic links,
and this should be done.

the problem with reading inode numbers is that they are only unique to
a filesystem.

					larry...

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 12 DEC 85  21:36:00 EST
Received: from MIT-MC.ARPA by MIT-OZ via Chaosnet; 12 Dec 85 21:31-EST
Received: from DREA-XX.ARPA by MIT-MC.ARPA 12 Dec 85 21:34:39 EST
Date: Thu 12 Dec 85 22:30:37-AST
From: Peter Gergely <GERGELY@DREA-XX.ARPA>
Subject: Dired Sort Bug
To: bug-emacs%mit-oz@MIT-MC.ARPA
Postal-address: 9 Grove St., P.O. Box 1012, Dartmouth, NS  B2Y 3Z7, Canada
Phone-Number: (902) 426-3100 x 215 [8:30am to 4:15pm Atlantic time]
Message-ID: <12166654746.12.GERGELY@DREA-XX.ARPA>

I was doing a dired sort on size on our bulletin boards and noticed that
the sort came out incorrectly.  The problem turned out to be some of the
author names like TCP-IP-REQUEST and any author names with a dash.  The
solution is quite simple.

Change the following in & DIRED Sort:
	q0-F"e @ft Filename :i1  :i2  1;'
	:i1 -2s-$ -@:f_ $@l  :i2 fs fdconv$
to:
	q0-F"e @ft Filename :i1  :i2  1;'
	:i1 -2s$ -2s-$ -@:f_ $@l  :i2 fs fdconv$

By the way, I added Sort on Author if anyone is interested.  The changes
follow after the equal signs.

	- Peter

========================================================================
;COMPARISON OF DREA:<EMACS>DIRED.EMACS.46 AND DREA:<EMACS>DIRED.EMACS.48
;OPTIONS ARE    /3

**** FILE DREA:<EMACS>DIRED.EMACS.46, 1-2 (18)
!* <GERGELY.NEMACS>DIRED.EMACS.12, 26-Sep-83 15:19:49, Edit by GERGELY!
**** FILE DREA:<EMACS>DIRED.EMACS.48, 1-2 (18)
!* <EMACS>DIRED.EMACS.48, 12-Dec-85 22:09:26, Edit by GERGELY!
***************

**** FILE DREA:<EMACS>DIRED.EMACS.46, 17-7 (16235)
	q0-C"e @ft Chronological_ 1;'
	q0-F"e @ft Filename :i1  :i2  1;'
	:i1 -2s-$ -@:f_ $@l  :i2 fs fdconv$
**** FILE DREA:<EMACS>DIRED.EMACS.48, 17-7 (16226)
	q0-A"e @ft Author 1;'
	q0-C"e @ft Chronological_ 1;'
	q0-F"e @ft Filename :i1  :i2  1;'
	:i1 -2s$ -2s-$ -@:f_ $@l  :i2 fs fdconv$
***************

**** FILE DREA:<EMACS>DIRED.EMACS.46, 17-13 (16428)
	:i1 1 -fw@l :i2 \ 
	q0-S"e @ft Size 1;'
	q0-?"e @ft (C_Chronologically,_F_Filename,_S_Size,_R_Read_date,_W_Write_date)
**** FILE DREA:<EMACS>DIRED.EMACS.48, 17-14 (16452)
	:i1 1 -fwl :i2 \ 
	q0-S"e @ft Size 1;'
	q0-?"e @ft (A_Author,_C_Chronological,_F_File,_S_Size,_R_Read_date,_W_Write_date)
***************

**** FILE DREA:<EMACS>DIRED.EMACS.46, 17-29 (16928)
    Q0-F"E			    !* Special sort for filenames!
**** FILE DREA:<EMACS>DIRED.EMACS.48, 17-31 (16957)
    Q0-A"E
	1F[^PCase
	"L:' :@L -S__$:@L1@L
	'
    Q0-F"E			    !* Special sort for filenames!
	1F[^PCase
***************

-------

Received: from SIMTEL20.ARPA by MIT-MC.ARPA 12 Dec 85 13:54:51 EST
Date: Thu, 12 Dec 1985  11:08 MST
Message-ID: <WANCHO.12166563329.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   BUG-EMACS@MIT-MC
cc:   WANCHO@SIMTEL20.ARPA
Subject: Flush Duplicate Lines

Every so often I've wished for a Flush Duplicate Lines function, and
was surprised to find that none existed as such.  I needed one last
night and found the following in LONG-FILENAMES.EMACS, which I
manually entered in a minibuffer, and it worked just fine!

Would some EMACS maintainer please consider fixing up this function
and entering it into the basic set?

(Note that this function depends on the lines being sorted and does
the sort, and that the following is the graphic, not actual code)

bj
^P$l$$ bj
< .-z; x1
 <
   :s
^]^S1$;-k 0:l>
 l>

Primitive, but functional.

--Frank

Received: from WISCVM.ARPA by MIT-MC.ARPA  6 Dec 85 04:04:38 EST
Received: from (MAILER)UDCVM.BITNET by WISCVM.ARPA on 12/05/85 at
  10:26:38 CST
Return-path: MHICKEY%UDCVM.BITNET@WISCVM.ARPA
Received: by UDCVM (Mailer X1.21) id 3309; Thu, 05 Dec 85 11:26:28 EST
Date:         Thu, 5 Dec 85 11:25 EST
From:           Mike Hickey  <MHICKEY%UDCVM.BITNET@WISCVM.ARPA>
Subject:      RESCAN library
To:  <BUG-EMACS@MIT-MC.ARPA>

Greetings!  I'm trying to locate the RESCAN library to work with the
P-EXEC.  If it's around do you think you could punt it through mail?
thanks in advance....
/Mike

Received: from MIT-AI.ARPA by MIT-MC.ARPA via Chaosnet; 6 DEC 85  02:42:27 EST
Date: Fri,  6 Dec 85 02:41:06 EST
From: "Pandora B. Berman" <CENT%MIT-AI.ARPA@MIT-MC.ARPA>
Subject: test
To: info-emacs@MIT-MC.ARPA
Message-ID: <[MIT-AI.ARPA].8029.851206.CENT>

this is a test to check for obsolete addresses. if you get this, just 
delete it.

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 4 DEC 85  01:26:24 EST
Received: from MIT-DEEP-THOUGHT by MIT-OZ via Chaosnet; 4 Dec 85 01:24-EST
Date: Wed,  4 Dec 85 01:24:06 EST
From: Randwulf Haskins <RH@MIT-MC.ARPA>
Subject:  aaa support
To: GUMBY@MIT-MC.ARPA
cc: bug-emacs@MIT-DEEP-THOUGHT, DCA@MIT-DEEP-THOUGHT,
    JBS@MIT-DEEP-THOUGHT, SHEP@MIT-DEEP-THOUGHT
In-reply-to: Msg of Tue  3 Dec 85 19:06:01 EST from David Vinayak Wallace <GUMBY at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].740880.851204.RH>

Yeah, what is the emacs bug that is being "reported" here?
As far as what Gumby said, that's not the case.  VTS says
AAA's have TC$FID, which is a hack for TC%LID and TC%CID.
One problem might be that VTS assumes that an AAA is 48. by 80.,
and lots of things will be silly if this isn't the case.
(This can be fixed with the AAA program.)  The only time VTS
gets in the way of Emacs, however, is when SUPDUPing.  Otherwise,
all Emacs asks VTS about is the type and size, and Emacs has
its own idea of the terminal's capabilities, padding requirements, 
and fish consumption.

Random

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 3 DEC 85  19:12:41 EST
Received: from MIT-DEEP-THOUGHT by MIT-OZ via Chaosnet; 3 Dec 85 19:05-EST
Date: Tue,  3 Dec 85 19:06:01 EST
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  aaa support
To: JBS@MIT-DEEP-THOUGHT
cc: bug-emacs@MIT-DEEP-THOUGHT, DCA@MIT-DEEP-THOUGHT,
    SHEP@MIT-DEEP-THOUGHT
Message-ID: <[MIT-MC.ARPA].740385.851203.GUMBY>

Thank you for your long message.  I am unable to figure out what bug
your are complaining about.

PDP-10 EMACS does use inert-char when it knows that the terminal
supports it.  If your problem is AAA-specific, more likely the problem
is that VTS doesn't understand that AAA can do it and/or doesn't set
TC%CID?

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 3 DEC 85  16:26:41 EST
Received: from MIT-DEEP-THOUGHT by MIT-OZ via Chaosnet; 3 Dec 85 16:24-EST
Date: Tue 3 Dec 85 16:23:27-EST
From: Jeff Siegal <JBS@MIT-EECS>
Subject: Re: aaa support
To: SHEP@MIT-EECS
cc: DCA@MIT-EECS, bug-emacs@MIT-EECS, JBS@MIT-EECS
In-Reply-To: <12164180464.26.SHEP@MIT-EECS>
Message-ID: <12164239534.30.JBS@MIT-EECS>

Mail-From: SHEP created at  3-Dec-85 10:58:58
Date: Tue 3 Dec 85 10:58:58-EST
From: Timothy J. Shepard <SHEP@MIT-EECS>
Subject: Re: aaa support
To: DCA@MIT-EECS
cc: bug-emacs@MIT-EECS
In-Reply-To: <12164175016.18.DCA@MIT-EECS>
Message-ID: <12164180464.26.SHEP@MIT-EECS>

We don't really do EMACS maintenance here.  See if the problem exists
on OZ and send mail to BUG-EMACS on Oz.

You can change the terminal length from the EXEC.  (Use the "term
length" command.)

I'm not sure that I've ever seen EMACS (or any other editor) use the
insert-character feature on any terminal.  It would probably be
non-trivial to implement also.  Think of what would have to be done if
the line was wider than the terminal width and a character was
insereted.

Does gnuemacs use insert character?  (Just curious.)
-------
Just for your interest, GNUemacs, as well as whatever "emacs" brings
up on eddie, uses the insert-character, and also the delete-character
sequences.  They stop using it when the end of the line approaches the
right margin of the screen.

Jeff
-------

Received: from SU-CSLI.ARPA by MIT-MC.ARPA  3 Dec 85 02:19:51 EST
Date: 2 Dec 1985  23:16 PST (Mon)
Message-ID: <FREDERIC.12164085370.BABYL@SU-CSLI.ARPA>
From: Frederic Vander Elst <FREDERIC@SU-CSLI.ARPA>
To:   info-emacs@mc
Subject: Bibtex libary


Would anyone know where the BIBTEX emacs libary source would be ?
We would like to look at it and make a local modification.

thanks,

				-freddie.

Received: from MIT-AI.ARPA by MIT-MC.ARPA via Chaosnet; 25 NOV 85  05:29:56 EST
Date: Mon, 25 Nov 85 05:27:46 EST
From: "Patrick G. Sobalvarro" <PGS%MIT-AI.ARPA@MIT-MC.ARPA>
Subject: feature request
To: BUG-EMACS%MIT-AI.ARPA@MIT-MC.ARPA
Message-ID: <[MIT-AI.ARPA].7353.851125.PGS>

Can we have C-M-$ in ITS Emacs?  I imagine that this hasn't been done yet
because of a concern that a net connection would have to be maintained,
but actually, the job could just be ephemeral.  Consider that if one needs
to look up a word, one needs to look it up, and it will take at least as
much time to leave Emacs and start up a Webster as to create a job, start
it, and kill it for each word.

Date: Mon,  4 Nov 85 04:20:57 EST
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  Invoking BABYL via c-X R
To: DEVON@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Sat  2 Nov 85 21:03:42 EST from Devon S. McCullough <DEVON at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].703940.851104.GUMBY>

    Date: Sat,  2 Nov 85 21:03:42 EST
    From: Devon S. McCullough <DEVON>

    When Babyl is invoked by c-X R (because I set the variable Mail
    Reader Library) it does not show up in m-X List Loaded Libraries
    so Apropos doesn't know about it.

Apropos and List Loaded Libraries work fine for me in the same situation.

Date: Sat,  2 Nov 85 21:03:42 EST
From: "Devon S. McCullough" <DEVON@MIT-MC.ARPA>
To: BUG-EMACS@MIT-MC.ARPA
cc: DEVON@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].702827.851102.DEVON>

When Babyl is invoked by c-X R (because I set the variable Mail Reader Library)
it does not show up in m-X List Loaded Libraries so Apropos doesn't know about it.

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 30 OCT 85  10:33:16 EST
Received: from MIT-AI.ARPA by MIT-OZ via Chaosnet; 30 Oct 85 10:33-EST
Date: Wed, 30 Oct 85 10:34:31 EST
From: Daniel Brotsky <DCB%MIT-AI.ARPA@MIT-MC.ARPA>
Subject:  NE is confused on AI
To: ALAN@MIT-AI.ARPA, GZ@MIT-AI.ARPA
cc: DCB@MIT-AI.ARPA, bug-emacs@MIT-OZ
Message-ID: <[MIT-AI.ARPA].5967.851030.DCB>

A little while ago I switched to NE on AI so I could use the
JOBDEV device.  I then reported to bug-emacs that Auto Save had
suddenly refused to write auto-save files under the visited
filenames.

Well, I've done a bit more research and I find that, on AI, EMACS
has FS DD FAST non-zero for DSK: and AI: (as it should be) but NE
has FS DD FAST zero for these devices.  That's why my auto-saves
were using Auto Save Filenames instead of the visited file.  Can
NE on AI be fixed?

	dan

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 21 OCT 85  16:16:39 EDT
Date: Mon, 21 Oct 1985  16:19 EDT
Message-ID: <NSING.12152955658.BABYL@MIT-OZ>
From: NSING%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: m-x compile command


I did a M-x Compile command on a Scheme program. emacs put me in 
scheme but did not load my code. When I quit scheme it returned to
emacs.

nsing

Received: from MIT-XX.ARPA by MIT-MC.ARPA 20 Oct 85 07:36:01 EDT
Date: Sun, 20 Oct 1985  05:08 EDT
Message-ID: <MEYER.12152571373.BABYL@MIT-XX.ARPA>
From: MEYER@MIT-XX.ARPA
To:   bug-emacs@MIT-XX.ARPA
Subject: [MEYER: Text[Biblio] Abbrev]

Date: Friday, 11 October 1985  12:23-EDT
From: MEYER
To:   bug-emacs
cc:   ray, mbr
Re:   Text[Biblio] Abbrev

I got WEDGED as follows:

In EMACS, I  my file MBIB.BIB.  This (by some default) puts me in
Text[Biblio] Save Abbrev mode (not what I want, since Scribe[Biblio] etc. mode
would be preferable, but acceptable so far).  Next  to another file FOO.MSS
and change automatically to Scribe[Biblio] Save Abbrev mode (not what I want,
since Scribe Save Abbrev WITHOUT Biblio would be preferable, but still
acceptable).  Finally, try to quit with autosaving by doing  and discover
that Abbrev mode wants to write the BIBLIO ABBREV file to which I don't have
(or want) write access, AND I CAN'T QUIT EMACS except by ^C'ing out and
resetting.

In wedged state, meta-X'ing out of [Biblio] Abbrev mode DOES NOT HELP!

Seems to me [Biblio] has a design bug.  Can you fix it or advise me how to
avoid it?  Actually, it would be workable for me simply to change the default
so I never automatically entered [Biblio] mode -- only could meta-X in.  But it
would be better if the defaults were set more in harmony with the second file
name.

Thanks, A.

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 18 OCT 85  03:39:55 EDT
Received: from MIT-MC.ARPA by MIT-OZ via Chaosnet; 18 Oct 85 03:44-EDT
Date: Fri, 18 Oct 85 03:39:39 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  key bindings
To: DJB@MIT-OZ
cc: Emacs-Hackers@MIT-OZ
In-reply-to: Msg of Thu 17 Oct 85 20:40:01-EDT from Dave Braunegg <DJB at OZ>
Message-ID: <[MIT-MC.ARPA].683898.851018.GUMBY>

maybe you want c-X P?

Date: Fri, 18 Oct 85 00:08:29 EDT
From: Alan Bawden <ALAN@MIT-MC.ARPA>
Subject:  Filename hacking bug in NE Dired
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].683758.851018.ALAN>

In NE on MC I find that Dired no longer can deal with files that contain
funny characters in their names.  For example, if I position myself on a
line containing a file named "FOO :EJ" and type "3" I get a file-not-found
error for "FOO EJ".

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 17 OCT 85  20:35:37 EDT
Date: Thu 17 Oct 85 20:40:01-EDT
From: "Dave Braunegg" <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: key bindings
To: Emacs-Hackers%MIT-OZ@MIT-MC.ARPA
Message-ID: <12151954548.58.DJB@MIT-OZ>

I'd like to do something that sounds easy to me, except that I haven't
been able to figure out how to do it.

I'd like to bind a key to have the effect of doing the following:

^X ] m-0 ^L

I.e., ^R Next Page followed by a ^R New Window with an argument of
zero.  The effect of this would be to go to the next page boundary and
put it at the top of the screen.

It seems to me that I should be able to do it in an EMACS.VARS file by
binding some name to those functions and then binding the name to a
key instead of saving a keyboard macro in a separate file.

Should I give up or is there a way to do it?

                                        Thanks,
                                        Dave
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; time unknown
Received: from MIT-HERMES.ARPA by MIT-OZ via Chaosnet; 16 Oct 85 09:17-EDT
Received: by MIT-HERMES.ARPA (4.12/4.8) 
	id AA01193; Wed, 16 Oct 85 09:18:01 edt
Date: Wed, 16 Oct 85 09:18:01 edt
From: (Hand Hacker) <sundar@mit-hermes>
To: bug-emacs@oz
Subject: dumped emacs wierdness

Forget my previous message. Things seem to be back to normal in
my next dumped version. 
-Sundar

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 15 OCT 85  23:38:11 EDT
Date: Tue 15 Oct 85 23:35-EDT
From: Sundar Narasimhan <SUNDAR%MIT-OZ@MIT-MC.ARPA>
Subject: dumped emacs bug ?
To: bug-emacs%MIT-OZ@MIT-MC.ARPA

I dumped my emacs again, after reading someone's message to do so. But
funny things seem to happen with this dumped version (in oz:<sundar>emacs.exe)
(It was dumped in a manner identical to my previous dumps).
First, when it starts up it seems to have flow control turned on 
(I've noticed this when I am supdupped in) - control-s and control-q garbage
the screen occasionally.
Secondly, finding files seems to get a Q-register not string or buffer, or
Attempt to macro a meaningless number. 
Thirdly, suspending and resuming emacs causes it to go into a wierd state
displaying "& Ledit Execute Jcl - Ambiguous function name" error message.
Could someone explain to me what's happened to emacs or is my emacs.vars file
got funniness that I am not able to see?
Thanks.
-Sundar.

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 15 OCT 85  20:19:45 EDT
Date: Tue 15 Oct 85 20:17:44-EDT
From: "Dave Braunegg" <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: auto save interval
To: Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Message-ID: <12151426205.40.DJB@MIT-OZ>

When I do a

M-X Set Variable$auto save interval$50

I get no auto saves at all, but when I do a

M-5 M-0 M-X Set Variable$auto save interval

it works as I expected.


Is this the expected behavior?  Is the first "50" a string argument
and therefore not interpreted correctly by EMACS while the second one
is numeric and interpreted correctly?  They both look the same if I do
a View Variable.

Thanks,
Dave

P.S. Yes, I used escapes, but I put dollar signs in this message to
     make sure that the mailer wouldn't barf.
-------

Received: from MIT-XX.ARPA by MIT-MC.ARPA 13 Oct 85 16:43:46 EDT
Date: Sun, 13 Oct 1985  16:43 EDT
Message-ID: <SRA.12150862863.BABYL@MIT-XX.ARPA>
From: Rob Austein <SRA@MIT-XX.ARPA>
To:   Mark Crispin <Crispin@SUMEX-AIM.ARPA>
Cc:   bug-emacs@MIT-XX.ARPA, bug-mm@MIT-XX.ARPA, SRA@MIT-XX.ARPA,
      WSNOW@MIT-XX.ARPA
Subject: Control-V in my MMail emacs
In-reply-to: Msg of 13 Oct 1985  14:35-EDT from Mark Crispin <Crispin@SUMEX-AIM.ARPA>

We're using a version of MMAIL that was current when this MM was
current (mid July).  I'm updating the whole mailsystem this weekend
anyway and will install a new one when I do that.  But I've had
problems with MMAIL before, similar to the ones Wyn is having.  MMAIL
seems to make some broad assumptions about the state of your EMACS and
it is pretty easy to break it (or maybe I should say I have a talent
for breaking it, since most of the hairy things in Wyn's init file are
my fault).  Among other things MMAIL smashes windows and buffers
around with abandon, so you have a good chance of losing if you use
buffer initialization hooks or things like that.  Sad but true.

--Rob

Received: from MIT-XX.ARPA by MIT-MC.ARPA 13 Oct 85 14:38:48 EDT
Received: from SUMEX-AIM.ARPA by MIT-XX.ARPA with TCP; Sun 13 Oct 85 14:37:14-EDT
Date: Sun 13 Oct 85 11:35:52-PDT
From: Mark Crispin <Crispin@SUMEX-AIM.ARPA>
Subject: Re: Control-V in my MMail emacs
To: SRA@MIT-XX.ARPA
cc: WSNOW@MIT-XX.ARPA, bug-emacs@MIT-XX.ARPA, bug-mm@MIT-XX.ARPA
In-Reply-To: <SRA.12150837879.BABYL@MIT-XX.ARPA>
Postal-Address: 725 Mariposa Ave. #103; Mountain View, CA 94041-1869
Phone: +1 (415) 968-1052
Message-ID: <12150839682.40.CRISPIN@SUMEX-AIM.ARPA>

I haven't had any problems with it.  Are you using the current version
of MMail?  I use MMail daily with no problems.
-------

Received: from MIT-XX.ARPA by MIT-MC.ARPA 13 Oct 85 14:26:10 EDT
Date: Sun, 13 Oct 1985  14:25 EDT
Message-ID: <SRA.12150837879.BABYL@MIT-XX.ARPA>
From: Rob Austein <SRA@MIT-XX.ARPA>
To:   Wyn Snow <WSNOW@MIT-XX.ARPA>
Cc:   bug-emacs@MIT-XX.ARPA, bug-mm@MIT-XX.ARPA, sra@MIT-XX.ARPA
Subject: Control-V in my MMail emacs

EMACS MMAIL mode doesn't work.  Completely random changes to your
EMACS environment will break it into little pieces.  You probably
should give up and either use plain MM or use BABYL.  Either that or
play around with your EMACS.INIT or EMACS.VARS file to see what is
causing this.

Received: from MIT-XX.ARPA by MIT-MC.ARPA 13 Oct 85 14:21:47 EDT
Date: Sun 13 Oct 85 14:20:16-EDT
From: Wyn Snow <WSNOW@MIT-XX.ARPA>
Subject: Control-V in my MMail emacs
To: bug-emacs@MIT-XX.ARPA, bug-mm@MIT-XX.ARPA
cc: wsnow@MIT-XX.ARPA

Hello, hello, is anybody there?  I actually have two problems with ^V in my
MMail emacs.

1.  In regular ("send mode") MMail emacs, ^V gives me the next screen, but
"chops off" two lines.  I.e., if my current screen has all xxx's, and the
next screen has all yyy's, when I say ^V it gives me the THIRD line of
yyy's at the top of the screen, not the last two xxx's and then the yyy's.

2.  In reply MMail emacs, ^V doesn't do anything at all.  I get the same
BEEP one gets with ^G and no action at all.
-------

Received: from MIT-XX.ARPA by MIT-MC.ARPA 11 Oct 85 12:25:14 EDT
Date: Fri, 11 Oct 1985  12:23 EDT
Message-ID: <MEYER.12150291339.BABYL@MIT-XX.ARPA>
From: MEYER@MIT-XX.ARPA
To:   bug-emacs@MIT-XX.ARPA
cc:   ray@MIT-XX.ARPA, mbr@MIT-XX.ARPA
Subject: Text[Biblio] Abbrev

I got WEDGED as follows:

In EMACS, I  my file MBIB.BIB.  This (by some default) puts me in
Text[Biblio] Save Abbrev mode (not what I want, since Scribe[Biblio] etc. mode
would be preferable, but acceptable so far).  Next  to another file FOO.MSS
and change automatically to Scribe[Biblio] Save Abbrev mode (not what I want,
since Scribe Save Abbrev WITHOUT Biblio would be preferable, but still
acceptable).  Finally, try to quit with autosaving by doing  and discover
that Abbrev mode wants to write the BIBLIO ABBREV file to which I don't have
(or want) write access, AND I CAN'T QUIT EMACS except by ^C'ing out and
resetting.

In wedged state, meta-X'ing out of [Biblio] Abbrev mode DOES NOT HELP!

Seems to me [Biblio] has a design bug.  Can you fix it or advise me how to
avoid it?  Actually, it would be workable for me simply to change the default
so I never automatically entered [Biblio] mode -- only could meta-X in.  But it
would be better if the defaults were set more in harmony with the second file
name.

Thanks, A.

Received: from MIT-AI.ARPA by MIT-MC.ARPA via Chaosnet; 10 OCT 85  16:35:44 EDT
Date: Thu, 10 Oct 85 16:35:01 EDT
From: Daniel Brotsky <DCB%MIT-AI.ARPA@MIT-MC.ARPA>
Subject:  change in auto save behavior?
To: BUG-EMACS@MIT-AI.ARPA
cc: DCB@MIT-AI.ARPA
Message-ID: <[MIT-AI.ARPA].5034.851010.DCB>

Since I switched from EMACS to NEMACS on AI, I have noticed a
change in Auto Save behavior.  Here are some relevant lines from
my EVARS file:

Auto Save Default:1
Auto Save Visited File:1
Auto Save All Buffers:1

It used to be the case that, when an autosave happened in the
course of editing or when I exited EMACS with ^X^C, the file I
was visiting would be autosaved under its own names (if the
second name was >).  I thought this was what Auto Save Visited
File was for.  But now, the file gets saved as _SAV00 > (actually
the 00 is replaced by the buffer number, as usual).

I am not sure that this change is due to the change in Emacs
version, since I made other customizations about the same time.
Is it plausible that this is an Emacs problem?

	dan

Received: from MIT-HTVAX.ARPA by MIT-MC.ARPA  7 Oct 85 21:01:09 EDT
Received: by MIT-HTVAX.ARPA (4.12/4.7) 
	id AA05404; Mon, 7 Oct 85 20:50:42 edt
Date: Mon, 7 Oct 85 20:50:42 edt
From: Peng Wu <pwu@MIT-HTVAX.ARPA>
Message-Id: <8510080050.AA05404@MIT-HTVAX.ARPA>
To: BUG-EMACS@MIT-MC.ARPA, CTaylor@USC-ISIF.ARPA, GZ@MIT-MC.ARPA
Subject: Re:  bug of course
Cc: PWU%MIT-OZ@MIT-HTVAX.ARPA

Thanks. I will look into teh implementation of emacs someday. It
must be wonderful.


Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 7 OCT 85  17:29:46 EDT
Date: Mon, 7 Oct 1985  17:26 EDT
Message-ID: <NSING.12149297938.BABYL@MIT-OZ>
From: NSING%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: compiling scheme code


Emacs seems to recognize scheme mode but when I type M-X Compile,
it goes off and pauses for a while, and then enters scheme. Unfortunately,
it does not put my proceedures into scheme. Am I using the compile
function improperly or does it not work with scheme?


Neil

Received: from MIT-XX.ARPA by MIT-MC.ARPA  7 Oct 85 15:03:44 EDT
Date: Mon 7 Oct 85 15:02:37-EDT
From: Wyn Snow <WSNOW@MIT-XX.ARPA>
Subject: ^V in MM-emacs-replies
To: bug-emacs@MIT-XX.ARPA

CTRL-V isn't working in my Emacs-MMail: REPLY mode only.  Can you fix?

1) ^V is okay in regular Emacs and Emacs-MMail.

2) I do have an Emacs.Vars (but since I don't know any TECO, I can't tell
   if something wierd happened to the file during Gloria's head crash).

Thanks.
-------

Date: Mon,  7 Oct 85 11:42:09 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject:  bug of course
To: BUG-EMACS@MIT-MC.ARPA, CTaylor@USC-ISIF.ARPA
cc: PWU@MIT-OZ
In-reply-to: Msg of Mon 7 Oct 85 10:37-EDT from Peng Wu <PWU%MIT-OZ at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].670892.851007.GZ>

    Date: Mon 7 Oct 85 10:37-EDT
    From: Peng Wu <PWU%MIT-OZ at MIT-MC.ARPA>
    Working in <pwu.vlsitech> the emacs can not read *.bib files. It always
    trapped in error handler.  (*.bib is scribe bibliography file)

The problem was that Biblio Mode was looking for a function called BIBLIO,
finding Biblio Mode instead and going into an infinite loop.  I renamed the
BIBLIO macro to BIBLIO Keys (on OZ).

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 7 OCT 85  10:38:59 EDT
Date: Mon 7 Oct 85 10:37-EDT
From: Peng Wu <PWU%MIT-OZ@MIT-MC.ARPA>
Subject: bug of course
To: bug-emacs%MIT-OZ@MIT-MC.ARPA

Working in <pwu.vlsitech> the emacs can not read *.bib files. It always
trapped in error handler.  (*.bib is scribe bibliography file)

-Peng Wu

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 1 OCT 85  00:55:45 EDT
Received: from MIT-MC.ARPA by MIT-OZ via Chaosnet; 1 Oct 85 00:53-EDT
Received: from DREA-XX.ARPA by MIT-MC.ARPA 29 Sep 85 08:46:01 EDT
Date: Sun 29 Sep 85 09:44:54-ADT
From: Peter Gergely <GERGELY@DREA-XX.ARPA>
Subject: EMACS Library from DREA-XX:  MM-MAIL
To: bug-emacs%mit-oz@MIT-MC.ARPA, tops-20@SU-SCORE.ARPA
Postal-address: 9 Grove St., P.O. Box 1012, Dartmouth, NS  B2Y 3Z7, Canada
Phone-Number: (902) 426-3100 x 215 [8:30am to 4:15pm Atlantic time]
Message-ID: <12147105774.16.GERGELY@DREA-XX.ARPA>

	I have made one small change to the library so please get the
latest one from here again.  I would appreciate if you could drop me a
note saying who has FTP'ed both MM-MAIL, and MMAIL libraries so I can
create a mailing list for updates and changes rather than bothering the
whole list.  Thanks.

	- Peter
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 30 SEP 85  06:14:59 EDT
Received: from MIT-MC.ARPA by MIT-OZ via Chaosnet; 30 Sep 85 06:11-EDT
Received: from DREA-XX.ARPA by MIT-MC.ARPA 26 Sep 85 21:18:28 EDT
Date: Thu 26 Sep 85 22:17:13-ADT
From: Peter Gergely <GERGELY@DREA-XX.ARPA>
Subject: Modified ^R MMAIL YANK in the MMAIL.EMACS Library
To: BUG-EMACS%MIT-OZ@MIT-MC.ARPA, TOPS-20@SU-SCORE.ARPA
Postal-address: 9 Grove St., P.O. Box 1012, Dartmouth, NS  B2Y 3Z7, Canada
Phone-Number: (902) 426-3100 x 215 [8:30am to 4:15pm Atlantic time]
Message-ID: <12146456297.17.GERGELY@DREA-XX.ARPA>

	I know that this may not be the right forum, but I have modified
the ^R MMAIL YANK command in the MMAIL.EMACS Library to do the
following:

!^R MMAIL Yank:! !^R Insert the current message (one being replied to)
Indents arg spaces (default 4).  Leaves point and mark around inserted text.
If the variable MMAIL PRUNE HEADERS is nonzero, a cleanup of the
headers is performed leaving only the Date, From, and Subject fields.!

	The message can be yanked in the middle of text and the original
text will not be modified or indented at all.  With all the headers in
mail messages, I found this feature to be very useful.  Maybe the
default should be to prune headers.

If anyone is interested in this modification, it is available via
ANONYMOUS FTP from <ANONYMOUS>MMAIL.* at DREA-XX.

	- Peter
-------

Received: from MIT-XX.ARPA by MIT-MC.ARPA 21 Sep 85 02:58:11 EDT
Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Sat 21 Sep 85 02:59:44-EDT
Received: from glacier by SU-SCORE.ARPA with TCP; Fri 20 Sep 85 23:54:42-PDT
Received: by glacier with Sendmail; Fri, 20 Sep 85 23:57:17 pdt
Date: Fri, 20 Sep 85 23:57:17 pdt
From: Brian Reid <reid@glacier>
Subject: Emacs doesn't understand my Concept-100 any more
To: bug-emacs@score, bug-emacs@sierra

Some time in the last 6 months the DEC-20 Emacs used at Stanford
stopped supporting the Concept-100 terminal. The symptoms are that
the screen redisplay is completely wrong, and I have to type ^L
about every 20 characters to see what my file looks like. This is
not recent, but it is still annoying. Any hints?
		Brian

Date: Fri, 20 Sep 85 09:44:42 EDT
From: Devon S. McCullough <DEVON@MIT-MC.ARPA>
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].651906.850920.DEVON>

Stupidly asks "write changes to file..." when the buffer is empty and
the file does not exist, because it was a typo at c-X c-F.

Received: from MIT-XX.ARPA by MIT-MC.ARPA 11 Sep 85 23:12:56 EDT
Received: from MIT-MC.ARPA by MIT-XX via Chaosnet; 11 Sep 85 23:20-EDT
Date: Wed, 11 Sep 85 23:12:48 EDT
From: Randwulf Haskins <RH@MIT-MC.ARPA>
Subject:  emacs and ansi-vt100 mode
To: TUTTLE@MIT-XX.ARPA
cc: bug-emacs@MIT-XX.ARPA
In-reply-to: Msg of Mon 9 Sep 85 21:41:59-EDT from Mark R. Tuttle <TUTTLE at MIT-XX.ARPA>
Message-ID: <[MIT-MC.ARPA].642203.850911.RH>

The problem is that the ANSI mode is based on VT100 ANSI, which is
missing some things, most notably insert and delete character
capability.  What there should be, in EMACS as well as in operating
systems, is an ANSI terminal type which takes advantage of insert
and delete character capabilities of terminals which aren't as
brain-damaged as VT100's.  As far as I know, ANSI support on everything
around here is based on VT100. 

Random

Received: from MIT-XX.ARPA by MIT-MC.ARPA  9 Sep 85 21:39:34 EDT
Date: Mon 9 Sep 85 21:41:59-EDT
From: Mark R. Tuttle <TUTTLE@MIT-XX.ARPA>
Subject: emacs and ansi-vt100 mode
To: bug-emacs@MIT-XX.ARPA
cc: tuttle@MIT-XX.ARPA

I am using a terminal that emulates a VT100 in ANSI mode along with
a modem to dialup XX.  When I set my terminal type to ANSI-VT100,
emacs displays an irritating behavior.

Whenever I insert a character into the middle of a line, emacs
seems to delete from the cursor to the end of line, display the
character, and then redisplay the deleted portion of the line.
A similar thing happens when I try to delete a character in the middle
of a line.  This is obviously very slow and irritating at 1200 baud.
My manual seems to indicate that ESC [ n @ will insert n blank characters
from the cursor position and that ESC [ n P will delete n character from
the cursor position and it indicates that this is part of the ANSI mode
definition.

Is there a reason for deleting to end of line and redisplaying the
modified, deleted portion each time a character is inserted or deleted
instead of making use of the escape sequences?
If not, could someone please hack emacs to make use of these sequences?

Thanks,   Mark Tuttle (tuttle@xx)
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 9 SEP 85  20:09:21 EDT
Date: Mon 9 Sep 85 20:13:36-EDT
From: "Dave Braunegg" <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: problem solved
To: emacs-hackers%MIT-OZ@MIT-MC.ARPA
Message-ID: <12141988268.37.DJB@MIT-OZ>

I quoted the " with a  and it worked.  Thanks.

Dave
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 8 SEP 85  19:22:17 EDT
Date: Sun 8 Sep 85 19:23:40-EDT
From: "Dave Braunegg" <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: dumped emacs startup hook
To: emacs-hackers%MIT-OZ@MIT-MC.ARPA
Message-ID: <12141717034.17.DJB@MIT-OZ>

I have two teco lines that I need to have executed at run time for a
dumped emacs.  When I try to put them into the DUMPED EMACS STARTUP HOOK
I run into trouble because of the " in the lines.  I have put them instead
into a library file (DJBMAC) and use the hook to load this library.  Is
there any way to pu these lines directly into the hook in the EMACS.VARS
file?

Both files are in my <DJB>directory.

Thanks,
Dave
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 7 SEP 85  03:21:07 EDT
Date: 7 Sep 1985  03:22 EDT (Sat)
Message-ID: <MDCG.WAYNE.12141279944.BABYL@MIT-OZ>
Sender: MDCG.WAYNE%MIT-OZ@MIT-MC.ARPA
From: Wayne McGuire <Wayne%MIT-OZ@MIT-MC.ARPA>
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: Sorting Paragraphs
cc:   wayne%MIT-OZ@MIT-MC.ARPA

What is the maximum number of bytes the ''sort paragraphs'' command
can handle?  For more than 10k or so of material the function seems to
produce a lot of garbage (i.e., a solid wall of ''^@'''s).

Date: Tue,  3 Sep 85 04:03:39 EDT
From: Pandora B. Berman <CENT@MIT-MC.ARPA>
Subject: lunar
To: GZ@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA, moon@SCRC-STONY-BROOK.ARPA
Message-ID: <[MIT-MC.ARPA].631280.850903.CENT>

    Date: Thu, 29 Aug 85 20:44:36 EDT
    From: Gail Zacharias <GZ@MIT-MC.ARPA>
    Subject: lunar
    To: BUG-EMACS@MIT-MC.ARPA
    (well, it's installed in emacs; so...)
    The Show Message function in the lunar library doesn't work anymore, I
    think because MC is now called MIT-MC.ARPA.

i noticed this problem approaching early this summer and pointed it out to
dave, who fixed it (a matter of editing a few constants and recompiling or
something) when all the msgs with older-style MC name were gone from
COMSATs' queues. perhaps it doesn't work for you because the LUNAR EJ: in
EMACS; or wherever is not this updated version; compare MOON;LUNAR * to the
"installed" version.

Date: Sat, 31 Aug 85 04:01:58 EDT
From: Devon S. McCullough <DEVON@MIT-MC.ARPA>
Subject:  FS TTY INIT redisplay bug
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].629397.850831.DEVON>

I did this in the minibuffer to change from a 24 line VT52 to a 60 line
AAA and the word (Minibuffer) is still on my screen even as I type this.

Date: Thu, 29 Aug 85 20:44:36 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject: lunar
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].628110.850829.GZ>

(well, it's installed in emacs; so...)
The Show Message function in the lunar library doesn't work anymore, I
think because MC is now called MIT-MC.ARPA.

Received: from SUMEX-AIM.ARPA by MIT-MC.ARPA 25 Aug 85 23:20:47 EDT
Date: Sun 25 Aug 85 20:20:27-PDT
From: Mark Crispin <Crispin@SUMEX-AIM.ARPA>
Subject: TEXTI% version of EMACS
To: Lattanzi@SUMEX-AIM.ARPA, BillW@SU-SCORE.ARPA, BUG-EMACS@MIT-MC.ARPA
Postal-Address: 725 Mariposa Ave. #103; Mountain View, CA 94041-1869
Phone: 1 (415) 968-1052
Message-ID: <12138090124.11.CRISPIN@SUMEX-AIM.ARPA>

I discovered the hard way that the new TEXTI% version of EMACS is *NOT*
backwards-compatible with older monitors which don't have the TEXTI%
feature in it.  The PANDAmonium 2020, which presently runs vanilla 4.1,
shows every sign of using the new TEXTI% in EMACS without it being in
the monitor.

Patching the TEXTI% to a JSYS 0 and letting the ERJMP hit worked around
the problem.  Still, I suggest a better test be made so that EMACS is
backwards-compatible.

-- Mark --
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 22 AUG 85  05:00:07 EDT
Date: 22 Aug 1985  04:59 EDT (Thu)
Message-ID: <MDCG.WAYNE.12137103216.BABYL@MIT-OZ>
Sender: MDCG.WAYNE%MIT-OZ@MIT-MC.ARPA
From: Wayne McGuire <Wayne%MIT-OZ@MIT-MC.ARPA>
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: Please add my name
cc:   wayne%MIT-OZ@MIT-MC.ARPA

to bug-emacs.

Date: Mon, 19 Aug 85 21:56:14 EDT
From: Alan Bawden <ALAN@MIT-MC.ARPA>
Subject:  I wonder how long this has been the case?
To: BUG-EMACS@MIT-MC.ARPA
cc: ALAN@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].618407.850819.ALAN>

In EMACS running on MC read in a file from AI (say AI:COMMON;FILES LOSS).
Then -in that buffer- execute in the minibuffer:
    M.M^R Backward Delete Hacking Tabs
The "Undefined or ambiguous function name" error you should get is
apparently caused by emacs going and loading "AI:EMACS;BARE :EJ" instead of
the version of BARE on MC!  (When I translate AI:EMACS; into MC:EMACS; the
problem goes away.)

I don't think this has anything to do with GZ's filename changes.  It looks
like this happens in all versions.

Date: Sat, 17 Aug 85 22:48:24 EDT
From: Alan Bawden <ALAN@MIT-MC.ARPA>
Subject:  but others might disagree
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].616546.850817.ALAN>

In my opinion a filename like "OZ: ALAN;PCL; SETUP CMD >" would look better
if Emacs were to print it either as "OZ: ALAN; PCL; SETUP CMD >" or as
"OZ:ALAN;PCL;SETUP CMD >".

Date: Mon, 12 Aug 85 23:56:37 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject:  longfilename vs. DIRED
To: ALAN@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Mon 12 Aug 85 09:13:34 EDT from Alan Bawden <ALAN at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].610063.850812.GZ>

Fixed.

Date: Mon, 12 Aug 85 09:13:34 EDT
From: Alan Bawden <ALAN@MIT-MC.ARPA>
Subject:  longfilename vs. DIRED
To: GZ@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].609096.850812.ALAN>

In the new EMACS you built on top of the new TECO you assembled I find that
DIRED is broken.  If I do MM DIREDALAN; it tells me there are "No files
with NULL as FN1".  I haven't yet found a way to get DIRED to look at my
whole directory.  I guess this is a result of some incompatibility in
filename handling in the longfilename TECO.

Date: Sat, 10 Aug 85 19:57:46 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].607797.850810.GZ>

There a subtle change that occurs with long filename support, namely it is
possible to have a version number even if there is none in Buffer
Filenames.  For example buffer filenames may be "XX: GZ; FOO BAR", but the
version is 12 (because truename is "XX: GZ; FOO BAR 12").  Emacs doesn't show
the version in the mode line in this case.  To fix that, the code in & Set
Mode Line that does:

      FS D VERS"'E+(FS D VERS+2"'E)"L	    !* Include file's actual version number.!
        Q:.B(Q3+9!*Bufver!)U1
	I_( G1 I)'

should be changed to:

      FS D VERS:"G		    !* If not already shown, include version!
        Q:.B(Q3+9!*Bufver!)U1
	q1"'g+(fs d vers+1"'n)"l I_( G1 I)''

I did this in the source, but I don't know what the state of the MC sources
is, so I didn't recompile anything.

Date: Sat, 10 Aug 85 18:49:14 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject:  TECO 1210
To: BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].607760.850810.GZ>

Bug-Teco:
I have built Teco 1210, finishing up the long filename support for ITS
started (but apparently not debugged) in 1209.  (1210 also contains one more
terminal type for twenex, mainly to free up the OZ disk space that the
waiting-for-merging copy of teco was taking up).

Bug-Emacs:
There was an apparently bogus file in EMACS;EMACS :EJ.  I renamed it to
EMACS BAD:EJ, and made EMACS :EJ a link to [PURE] >.  I then built an
Emacs on Teco 1210, which is EMACS;TS 126.
It seems that SYS2;TS EMACS has been a link to EMACS;TS NE since '82. I
made it a link to EMACS;TS E, and made EMACS;TS E a link to EMACS;TS 125
(it used to point to TS 123).
Thus :EMACS is unchanged, and :NEMACS gets you the new emacs.

Date: Tue, 30 Jul 85 14:29:25 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  MIDAS -> Fasl
To: JPBion@SU-SCORE.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Tue 30 Jul 85 03:03:18-PDT from Joel P. Bion <JPBion at SU-SCORE.ARPA>
Message-ID: <[MIT-MC.ARPA].593723.850730.GUMBY>

I don't think you meant to send this to bug-EMACS.  But I have some
stuff.  I'll contact you directly.

Received: from SU-SCORE.ARPA by MIT-MC.ARPA 30 Jul 85 06:05:23 EDT
Date: Tue 30 Jul 85 03:03:18-PDT
From: Joel P. Bion <JPBion@SU-SCORE.ARPA>
Subject: Re: MIDAS -> Fasl
To: Bug-Emacs@MIT-MC.ARPA
Message-ID: <12131085570.21.JPBION@SU-SCORE.ARPA>

Thanks for the pointer! But, an example would make things a lot easier to
understand! Does anyone have any examples of MIDAS code -> FASL format binary
that I could look at, to get a better idea of how things work?

Thanks again,
	Joel
-------

Date: Sun, 28 Jul 85 06:58:50 EDT
From: Ken Harrenstien <KLH@MIT-MC.ARPA>
Subject: RMAIL display problem - yet more data
To: BUG-ITS@MIT-MC.ARPA, BUG-RMAIL@MIT-MC.ARPA,
    BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].590992.850728.KLH>

Well, with considerable pain I was able to cause an example of
this lossage while keeping a TCP datagram log.  However, the log
doesn't show what I expected; I was looking for the stretch of
duplicated text that I observed, and couldn't find it.  There are
some retransmissions but they are all correct.

Until GSB commented on the fact that the extra stuff seemed to be
a duplicate of previous stuff, I hadn't noticed this attribute, but
since then I've checked every instance and this appears to be always
true.  Something somewhere is being retransmitted or re-used.

Since this happens with both CTN (CRTSTY SUPDUP) and TOPS-20 TN,
it isn't a TOPS-20 user-program problem.  Since the outgoing datagram log on
MC shows no problems, the obvious deduction is that this looks like a
TOPS-20 monitor problem.  As it happens, the duplicated stuff does appear
to correspond to a re-packetized TCP segment.  More tests will be
necessary to confirm this, however.

This also implies that GSB's problem is actually something different
from this one.  Since he mentioned it happening with PEEK, I think
we should confine further discussion to BUG-ITS and leave out
BUG-RMAIL,TECO,EMACS unless more information turns up.

Date: Tue, 23 Jul 85 22:37:28 EDT
From: Glenn S. Burke <GSB@MIT-MC.ARPA>
Subject: re: RMAIL display problem
To: KLH@MIT-MC.ARPA
cc: BUG-ITS@MIT-MC.ARPA, BUG-RMAIL@MIT-MC.ARPA,
    BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].586008.850723.GSB>

I cam make it happen with peek on a 60 high 118 wide screen, just like i
can with rmail.  looks like the cursor positioning goes bonkers as a
function of me typing at it.

Date: Mon, 22 Jul 85 18:06:15 EDT
From: Glenn S. Burke <GSB@MIT-MC.ARPA>
Subject: re: RMAIL display problem  -- you'll like this
To: KLH@MIT-MC.ARPA
cc: BUG-ITS@MIT-MC.ARPA, BUG-RMAIL@MIT-MC.ARPA,
    BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].584681.850722.GSB>

right here in the privacy of my own office, i can reproduce this, freeze
the screen, and get a hardcopy of the lossage.  Isn't VMS wonderful?

Date: Mon, 22 Jul 85 13:30:54 EDT
From: Ken Harrenstien <KLH@MIT-MC.ARPA>
Subject: RMAIL display problem
To: KLH@MIT-MC.ARPA
cc: BUG-ITS@MIT-MC.ARPA, BUG-RMAIL@MIT-MC.ARPA,
    BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].584298.850722.KLH>

Some additional data which supports the theory that a user-program or
ITS TTY bug may be involved:

Date: Thu, 18 Jul 85 22:40:40 EDT
From: Glenn S. Burke <GSB@MIT-MC.ARPA>
Subject: RMAIL display problem
To: KLH@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].581085.850718.GSB>

All the times i have seen such an error i have been able to find duplicated
text on the screen and the supposition was that it was a duplicated
tcp packet or something like that.  I have seen this both internetting
from ru-net to here (from a 20) and i believe just within rutgers
(tops-20 -> tops-20 just on ru-net).
	----------------------
Date: Fri, 19 Jul 85 23:45:04 EDT
From: Glenn S. Burke <GSB@MIT-MC.ARPA>
Subject: tty lossage
To: KLH@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].582348.850719.GSB>

well maybe i should take back what i said last night.
I'm coming from a microvax vaxstation running a vt100 emulator window,
running decnet to a 750 (corwin) from whence i'm doing chaosnet supdup
to mc.  The window size is 94 wide by 55 high [i TOLD it 96 wide at this
end, you know how these things are...]  anyway, i have a two screen long
(at this screen size) message, and if i have it redisplay the first and
get a space (in rmail, go to next screen) before it finishes, it invariably
fucks up.

anyway, there ain't no tcp in THIS network path.

Date: Fri, 19 Jul 85 13:02:03 EDT
From: Jonathan A Rees <JAR@MIT-MC.ARPA>
Subject:  C-M-Q can't be un-done
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].581735.850719.JAR>

In Emacs 162, Teco 1171, ITS 1488 on MIT-MC:

Just a suggestion: shouldn't  ^R Indent SEXP  set itself up so that it can
be un-done with  Undo ?

Jonathan

Date: Fri, 19 Jul 85 04:54:29 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject:  Long filenames
To: GUMBY@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Thu 18 Jul 85 13:59:00 EDT from David Vinayak Wallace <GUMBY at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].581397.850719.GZ>

    Date: Thu, 18 Jul 85 13:59:00 EDT
    From: David Vinayak Wallace <GUMBY at MIT-MC.ARPA>

    You have one?  

Yea, like for example oz:kansas:prog-d;archives;recent-mail txt >.

		   What do you do about all the people who expect the
    cfilename components o be SIXBIT?

Since most of emacs works on twenex as well, this expectation can't be as
unavoidable as one might think (This is not to say that there isn't a lot
of code which does assume this, just that it's fixable).  I don't care if
there is some set of esoteric ITS-only commands which doesn't handle long
filenames, I'd just like basic stuff like ^X^F and ^X^W to work.

How about if we write a GTJFN and JFNS simulation for ITS and just use the
TOPS-20 code? :-)

Seriously though, if somebody puts long filename handling into Teco, I'm
willing to go and fix up whatever Emacs code needs fixing up.

Date: Thu, 18 Jul 85 18:45:59 EDT
From: Ronald I. Greenberg <RIG@MIT-MC.ARPA>
Subject: Sorry, keyboard macros do work.
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].580861.850718.RIG>

     I have figured out that there is no problem with
keyboard macros, i.e. that c-X ( will load in the other
commands for keyboard macros.  Sorry to bother you.

Date: Thu, 18 Jul 85 17:27:42 EDT
From: "Lawrence A. DeLuca, Jr." <HENRIK@MIT-MC.ARPA>
Subject:  strange display bug
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].580771.850718.HENRIK>

I had two windows, the upper window at the top of a file, and the lower
window at the middle of the file.  I was in the lower window, typed

c-X o c-X b Return c-U c-X ^ c-X o c-X o Help l and here is what happened:

I moved to the upper window and selected buffer Main.  As soon as I
expanded the upper window it redisplayed the lower window!  It showed
the top of the file instead of the middle, ie, that which used to be
in the upper window.  As soon as I moved back to the bottom window it
correctly redisplayed the middle of the file.  What is going on here?

Date: Thu, 18 Jul 85 13:59:00 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  Long filenames
To: GZ@MIT-MC.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Thu 18 Jul 85 00:01:44 EDT from Gail Zacharias <GZ at MIT-MC.ARPA>
Message-ID: <[MIT-MC.ARPA].580420.850718.GUMBY>

You have one?  What do you do about all the people who expect the
cfilename components o be SIXBIT?

Date: Thu, 18 Jul 85 12:25:26 EDT
From: Ronald I. Greenberg <RIG@MIT-MC.ARPA>
Subject: Why aren't all the keyboard macro commands loaded?
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].580219.850718.RIG>

     I have encountered a problem in using emacs on both MC and XX.
Apparently the kbdmac library is not being loaded automatically.
Strangely, an apropros shows only a command about executing macros in
q-registers and the begin keyboard macro command, and in fact other
macro commands don't work.  I shouldn't have to load the kbdmac
library myself in order to get the others should I?

Date: Thu, 18 Jul 85 05:55:23 EDT
From: Ken Harrenstien <KLH@MIT-MC.ARPA>
Subject: RMAIL display problem
To: BUG-ITS@MIT-MC.ARPA, BUG-RMAIL@MIT-MC.ARPA,
    BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].580138.850718.KLH>

I'm not sure where the fault for this one might be, hence the shotgun
message.

In RMAIL, when using "space" to step through successive screenfuls
of a long message, sometimes output fails to stop at the mode line;
it continues for several more lines and runs right off the bottom of
the screen, causing the terminal to either scroll or wrap up to
the top (depending on one's terminal).  The screen is then permanently
messed up until a complete redisplay is forced with ^L.

This happens for me when connected to MC either via SUPDUP (ie as a
software TTY) or via TELNET with a :TCTYP DM2500 declaration.  At
first I thought it might be a CRTSTY/SUPDUP problem, but my TELNET
experiments have convinced me that it really is MC's fault.
However, I haven't been able to find a foolproof way of reproducing
the lossage.  All I can say is that in the course of reading through
several SF-LOVERS digests on a 24x79 screen, this bug almost always
crops up someplace, sometimes twice or thrice in a row.  I type:
	N E ^K ^X r				; to invoke RMAIL
	<spaces as needed to read msg> d	; for each message

This is probably a TECO bug of some variety, but there's an off
chance it might be an ITS TTY handling bug.  It's even possible
that some EMACS code is screwing up the redisplay.  This has happened
for quite a while (several months).  I hope someone else has a
notion of what to look for at this point.  If necessary, I could
try again to save a reproducible instance of this, although it is
a rather painful task.

Date: Thu, 18 Jul 85 00:01:44 EDT
From: Gail Zacharias <GZ@MIT-MC.ARPA>
Subject: Long filenames
To: BUG-EMACS@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].579979.850718.GZ>

Emacs doesn't support long filenames on ITS!

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 12 JUL 85  07:08:29 EDT
Date: Fri, 12 Jul 1985  07:07 EDT
Message-ID: <MLY.G.AGM.12126378714.BABYL@MIT-OZ>
Sender: MLY.G.AGM%MIT-OZ@MIT-MC.ARPA
From: "Adam G. Mellis" < Mellis%MIT-OZ@MIT-MC.ARPA>
Subject: expanding the kill ring
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

Is there any that I can make the kill ring
larger than 9 entries?

Adam

Received: from SIMTEL20.ARPA by MIT-MC.ARPA.ARPA; 10 Jul 85 23:22:07 EDT
Date: Wed, 10 Jul 1985  21:18 MDT
Message-ID: <WANCHO.12126031127.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   BUG-EMACS@MC
cc:   WANCHO@SIMTEL20.ARPA, BUG-BABYL@MC
Subject: Append to File broken

M-X Append to File$, when specifying an existing file, does not work.
This has been verified to not work on SCORE and XX as well in vanilla
EMACS with no EMACS.INIT nor EMACS.VARS files.  Z/BABYL depends on
this for its G command...

--Frank

Received: from MIT-XX.ARPA by MIT-MC.ARPA.ARPA;  6 Jul 85 19:54:37 EDT
Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Sat 6 Jul 85 19:55:51-EDT
Date: Sat 6 Jul 85 16:52:27-PDT
From: Chuck Restivo  <RESTIVO@SU-SCORE.ARPA>
Subject: <esc>-s
To: bug-emacs@SU-SCORE.ARPA

[cwr] This used to center lines for me.  Now, it goes and
      looks for sends.txt.  What is the current incantation
      and can it be changed back to what it was?
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 1 JUL 85  11:15:31 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 1 Jul 85 11:15-EDT
Received: from RADC-TOPS20.ARPA by MIT-MC.ARPA.ARPA;  1 Jul 85 11:13:15 EDT
Date: Mon 1 Jul 85 11:12:19-EDT
From: Anthony M. Newton <newton@RADC-TOPS20.ARPA>
Subject: question and/or bug to emacs keyboard macros
To: bug-emacs%MIT-OZ@MIT-MC.ARPA
cc: rms%MIT-OZ@MIT-MC.ARPA


To whomever may be out there:

I'm having a problem with saving and retrieving keyboard macros that I define
within an editing session.  The following is the sequence of keystrokes, with
comment annotations where appropriate.  The purpose is to define a keyboard
macro to: (1) set the fill column at 75, and (2) toggle auto fill mode.
( C- will designate the control character, M- will designate the meta character)

C-X (
C-U 7 5 C-X f
M-X au <alt> f <alt> <cr>
C-X )

M-X name kbd macro$mxplxys                  ! naming the macro some obsure name
M-X view kbd macro$mxplxys                  ! assuring that it is named
M-X write kbd macro$mxplxys                 ! I have tried letting the output
                                            ! default to KMAC^V.:EL as well as
                                            ! naming a file KEY.MAC

M-X run library$kmac$mxplxys                ! I am attempting to force emacs to
                                            ! goto the library and execute the
                                            ! macro.  The result is that the 
                                            ! macro runs as expected

C-X C-Z                                     ! exit emacs
@emacs filename.txt                         ! edit another file

M-X mxplxys                                 ! I get the following error
     -- undefined or ambiguous macro

M-X load library$kmac
M-X mxplxys                                 ! I get the following error
    -- undefined or ambiguous macro

M-X run library$kmac$mxplxys                ! I get the following error
    -- undefined or ambiguous macro


I am using EMACS on the DEC20.  Internal version numbers are:
   TECO version 2.00
   EMACS version 162
External (using the INFORMATION VERSION command) are:
   TECO version 540
   EMACS version 760
(I am guessing that the external set is edit_updates not versions)

I would appreciate any help you can give.  If you need more info (quickly)
my extensions are: (315) 330 2158... (AV) 587 2158.

				Thank you,
				Tony Newton
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 29 JUN 85  11:18:44 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 29 Jun 85 11:18-EDT
Received: from RUTGERS.ARPA by MIT-MC.ARPA.ARPA; 29 Jun 85 11:18:23 EDT
Date: 29 Jun 85 11:15:51 EDT
From: AMARTIN@RUTGERS.ARPA
Subject: Re: Help?
To: Carter@RUTGERS.ARPA
cc: Bug-EMACS%MIT-OZ@MIT-MC.ARPA, EMACS@RU-BLUE.ARPA
In-Reply-To: Message from "_Bob <Carter@RUTGERS.ARPA>" of 29 Jun 85 00:54:00 EDT

During my INIT file (well, at the beginning and the end, at least),
there is no string stored in Buffer Filenames.  Trying to fetch a
string from it under such circumstances gives a QNS error.  However,
if you enter the minibuffer while in a buffer that has a file loaded
into it, Buffer Filenames does contain a filename.

To diagnose this, do the following:

1.  Start your EMACS with that init file.

2.  Wait for the QNS <dink> and then type a question mark to enter the
debbuger.

3.  Wait for the failing code to be displayed, and then type a V, the
debugger's "View a Q-reg" command.  Then type an escape, so that View
Q-reg is prepared to read a variable name instead of a Q reg name.
Now type in "buffer filenames" and hit return.

4.  The value of Buffer Filenames is displayed beneath the line
"Q$Buffer Filenames".  I bet it is zero.

5.  You might as well ^C out at this point.
				/AHM
-------

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 29 JUN 85  00:58:21 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 29 Jun 85 00:58-EDT
Received: from RU-BLUE.ARPA by MIT-MC.ARPA.ARPA; 29 Jun 85 00:58:04 EDT
Date: 29 Jun 85  00:54 EDT (Sat)
From: _Bob <Carter@RUTGERS.ARPA>
To:   Amartin@RED, Bug-EMACS@OZ
cc:   EMACS@RU-BLUE.ARPA
Subject: Help?


Do you have a moment to answer a question?

Why does this expression work in the minibuffer but QNS at "buffer
filenames" in an INIT?

0fo..qsort library filename"e
  fs msname:f6[0
  f~buffer filenames^]0flush.list.0"e
    m(m.m load library)sort]0''

_B

Received: from MIT-OZ by MIT-MC.ARPA via Chaosnet; 27 JUN 85  23:17:26 EDT
Date: Thu, 27 Jun 1985  15:39 EDT
Message-ID: <OAF.12122539639.BABYL@MIT-OZ>
From: OAF%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

I don't know whether this is the correct place to send such a message,
but in 
	TeX mode on TOPS-20 EMACS,
I would request the feature that M-A and M-E (move to beginning and
end of sentence, respectively) recognize left and right curly brackets
as sentence delimiters.  That might be conditional, depending whether
a period precedes the close bracket and two spaces or CR precede the
open bracket (tabs have no significance to TeX).

No doubt I can set such variables/features myself, in which case
someone might drop me a sarcastic note telling me where to look up the
information.

Thank you.

Received: from SIMTEL20.ARPA by MIT-MC.ARPA 21 Jun 85 01:25:18 EST
Date: Thu, 20 Jun 1985  23:24 MDT
Message-ID: <WANCHO.12120811244.BABYL@SIMTEL20.ARPA>
From: "Frank J. Wancho" <WANCHO@SIMTEL20.ARPA>
To:   BUG-EMACS@MC
Subject: New Tape??

Did I read correctly?  Will the new tape include BILLW's mods?  If so,
will they be conditionalized, as they require MONITR mods?  How about
the libraries?  Will there be two sets (with correct version numbers);
one to work with Bill's mods and a standard one?

--Frank

Date: Fri, 21 Jun 85 00:52:42 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  fortran lossage
To: LARSON@SRI-KL.ARPA
cc: BUG-EMACS@MIT-MC.ARPA
In-reply-to: Msg of Thu 20 Jun 85 13:10:29-PDT from LARSON at SRI-KL.ARPA
Message-ID: <[MIT-MC.ARPA].551080.850621.GUMBY>

There's a new fortran mode that will be going out with the tape,
written by Beebe at Utah.  I put a copy in
xx:<gumby>beebe-fortran.emacs.

I don't know if it addresses your problem; I do't use fortran.  So I'd
be interested in knowing what you think of it.

david

Received: from SRI-KL.ARPA by MIT-MC.ARPA 20 Jun 85 21:18:34 EST
Date: Thu 20 Jun 85 13:10:29-PDT
From: LARSON@SRI-KL.ARPA
Subject: fortran lossage
To: bug-emacs@MIT-MC.ARPA

  The fortran modes cause great lossage if you really want to edit
fortran for a dec machine where tabs do reasonable things.  Thus,
I wanted to turn it off.  Easily done, and I can fix the comment
to allow 'same line' comments (like a real language).

  Guess again.

  When I include the following local modes, M-; is still inserting
a line starting with a "C".

	c  Local Modes:
	c  Mode: Fundamental
	c  Comment Begin:"!"
	c  Comment Column:40
	c  Comment Start:"!"
	c  End:

They are being seen, since the mode is recognized as Fundamental.

	Alan
-------

Date: Thu, 20 Jun 85 21:28:22 EDT
From: Leigh L. Klotz <KLOTZ@MIT-MC.ARPA>
To: ZVONA@SRI-AI.ARPA
cc: BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
In-reply-to: Msg of Wed 19 Jun 1985  11:28 PDT from ZVONA at SRI-AI
Message-ID: <[MIT-MC.ARPA].550589.850620.KLOTZ>

I think Gumby wrote the long-needed routine that looks in
system:hostname.txt if it can't use a jsys to get the hostname.

Date: Thu, 20 Jun 85 20:59:11 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  SU TECO/EMACS
To: BillW@SU-SCORE.ARPA
cc: BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA,
    ZVONA@SRI-AI.ARPA
Message-ID: <[MIT-MC.ARPA].550502.850620.GUMBY>

    Date: 20 Jun 1985 00:29-PDT
    From: William "Chops" Westfield <BillW at SU-SCORE.ARPA>

    ...This is done in the latest version of EMACS/TECO
    being distributed out of Stanford - how does one go about making
    that the default version everywhere (MIT people, where should
    it be put?)

I got a copy from Bradford; it's being merged into the tape.

Received: from SU-SCORE.ARPA by MIT-MC.ARPA 20 Jun 85 03:30:50 EST
Date: 20 Jun 1985 00:29-PDT
Sender: BILLW@SU-SCORE.ARPA
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: ZVONA@SRI-AI.ARPA
Cc: bug-emacs@MIT-MC.ARPA, bug-teco@MIT-MC.ARPA
Message-ID: <[SU-SCORE.ARPA]20-Jun-85 00:29:49.BILLW>
In-Reply-To: <ZVONA.12120429714.BABYL@SRI-AI>

uh, like ever since NCP went away, all internet hosts have
"long" host numbers.  use of CVHST should be flushed in favor of
GTHST everywhere!  This is done in the latest version of EMACS/TECO
being distributed out of Stanford - how does one go about making
that the default version everywhere (MIT people, where should
it be put?)

BillW

Received: from SRI-AI.ARPA by MIT-MC.ARPA 19 Jun 85 22:19:14 EST
Date: Wed, 19 Jun 1985  11:28 PDT
Message-ID: <ZVONA.12120429714.BABYL@SRI-AI>
From: ZVONA@SRI-AI
To:   bug-emacs@mc, bug-teco@mc

I fixed the problem I reported by reassembling with HSTNAM defined.
In the next tape that gets sent, the following comment from CONFIG.MID
should be expanded to explain that Arpa hosts with long host numbers,
as well as Chaos hosts, need to define this.

; If you are a non-ARPA Babyl site (more technically, if CVHST doesn't work
; but you need it for packages such as Babyl, eg, at Chaos MIT hosts), you should
; uncomment the following two lines and put your hostname in.
DEFINE HSTNAM
ASCIZ/your official hostname here/!TERMIN

Date: Mon, 17 Jun 85 20:04:49 EDT
From: David Vinayak Wallace <GUMBY@MIT-MC.ARPA>
Subject:  TECO host problem
To: Zvona@SRI-AI.ARPA
cc: BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
In-reply-to: Msg of Mon 17 Jun 1985  09:57 PDT from ZVONA at SRI-SPRM.ARPA
Message-ID: <[MIT-MC.ARPA].547587.850617.GUMBY>

    Date: Mon, 17 Jun 1985  09:57 PDT
    From: ZVONA at SRI-SPRM.ARPA

    Hi, I have an emacs (teco?) problem for you.  SRI-AI has a "big" host
    number (whatever that means).  EMACS here apparently truncates this host
    number (perhaps by using the NOHOST jsys) which fucks up babyl and the
    fancy mode line (and maybe other things).  What I'd like to know is
    whether this has been fixed at MIT (our EMACS is at least a couple
    years out of date) and if so how to get a new EMACS (teco?) source and
    how to compile it.  Can you help?  Or know who could?  Thanks.

I don't understand this report.  Can you supply more bits?

In any case a new EMACS tape should be appearing "Real Soon Now."

Date: Mon, 17 Jun 85 14:53:26 EDT
From: Alan Bawden <ALAN@MIT-MC.ARPA>
Subject:  This went to Bug-Random-Program due to host table vandalization
To: BUG-EMACS@MIT-MC.ARPA, BUG-TECO@MIT-MC.ARPA
Message-ID: <[MIT-MC.ARPA].546909.850617.ALAN>

Received: from SRI-AI.ARPA by MIT-MC.ARPA 17 Jun 85 12:59:58 EST
Date: Mon, 17 Jun 1985  09:57 PDT
Message-ID: <ZVONA.12119888829.BABYL@SRI-SPRM.ARPA>
From: ZVONA@SRI-SPRM.ARPA
To:   bug-emacs@mc, bug-teco@mc
Reply-to: Zvona@SRI-AI.ARPA

Hi, I have an emacs (teco?) problem for you.  SRI-AI has a "big" host
number (whatever that means).  EMACS here apparently truncates this host
number (perhaps by using the NOHOST jsys) which fucks up babyl and the
fancy mode line (and maybe other things).  What I'd like to know is
whether this has been fixed at MIT (our EMACS is at least a couple
years out of date) and if so how to get a new EMACS (teco?) source and
how to compile it.  Can you help?  Or know who could?  Thanks.

Received: from MIT-XX.ARPA by MIT-MC.ARPA 13 Jun 85 15:36:33 EST
Date: Thu 13 Jun 85 15:38:30-EDT
From: Jon Solomon <JSOL@MIT-XX.ARPA>
Subject: random bug with large screen terminals that emulate vt100s
To: bug-emacs@MIT-XX.ARPA

I have a microterm Twist terminal, which has 72 lines on the screen.
When I run emacs, it uses the whole screen, but when it exits it
seems to mark a region on my terminal of 24 lines, instead of the 72
that my terminal has. I find it annoying that I have to reset the terminal
each time I run emacs.

--jsol
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 2 JUN 85  20:20:36 EDT
Date: Sun, 2 Jun 1985  20:19 EDT
Message-ID: <ZZZ.RLK.12116037128.BABYL@MIT-OZ>
Sender: ZZZ.RLK%MIT-OZ@MIT-MC.ARPA
From: "Robert L. Krawitz" <RLK%MIT-OZ@MIT-MC.ARPA>
To:   bug-oz%MIT-OZ@MIT-MC.ARPA, bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: terminal problems (maybe?)

I need to know if anyone else has this problem.  It might not be here.

I'm coming in on a chtn (telnet protocol) from a VAXstation100, which
looks like an ansi terminal (or at least is supposed to), except it's
65 lines long.  So I do a ter ans and a ter len 65.  All is well until
I run emacs.  When I exit emacs, and the cursor is near the bottom of
the screen (as it usually is when you exit normally), the cursor moves
normally until the bottom is reached, and then the screen doesn't
scroll at all.  I. e. everything is printed on the bottom line of the
screen.  When I clear the screen, everything works for the first 24
lines, and then the screen starts scrolling (i. e. it acts like a
24-line screen) even though i ter says I have a 65-line screen and the
output only pauses every 65 lines.  But when I go back into emacs,
everything's fine, I have a full 65-line screen to work with.

Robert^Z

Received: from MIT-OZ by MIT-MC via Chaosnet; 31 MAY 85  15:38:58 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 31 May 85 15:38-EDT
Received: from MIT-XX.ARPA by MIT-MC.ARPA 31 May 85 15:36:58 EST
Date: Fri 31 May 85 15:37:07-EDT
From: Rob Austein <SRA@MIT-XX.ARPA>
Subject: Re: EMACS illegal memory write
To: FONER%MIT-OZ@MIT-MC.ARPA
cc: Bug-EMACS%MIT-OZ@MIT-MC.ARPA, jtw%MIT-OZ@MIT-MC.ARPA,
    shsu%MIT-OZ@MIT-MC.ARPA
In-Reply-To: Message from ""Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>" of Fri 31 May 85 15:32:40-EDT
Office: [NE43-502] 545 Technology Square, Cambridge MA 02139; (617) 253-7341

Looking at the code makes me doubt that this ever worked right, since
it doesn't have the GJ%DEL bit turned on (look for deleted files too).
Have to read it more carefully to see what it will break though, some
time when my head is screwed on a bit more tightly than at the present
moment....
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 30 MAY 85  21:06:56 EDT
Date: Thu, 30 May 1985  21:06 EDT
Message-ID: <FONER.12115259256.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>
To:   Rob Austein <SRA@MIT-XX.ARPA>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Foner%MIT-OZ@MIT-MC.ARPA,
      jtw%MIT-OZ@MIT-MC.ARPA, shsu%MIT-OZ@MIT-MC.ARPA
Subject: EMACS illegal memory write
In-reply-to: Msg of 26 May 1985  18:28-EDT from Rob Austein <SRA at MIT-XX.ARPA>

Thanx for the fix!  I'm not sure yet if it works, but if things break,
I'll certainly let you know.  It's good to see I wasn't completely
paranoid about this library---seems that there really was something
wrong with it.

I now notice new behavior, however, which I think is a bug.  Formerly,
if I had no new mail, either because my mailfile was deleted or had
been read recently, I got [No new mail] every time MAICHK looked.
Now, however, I get [No new mail] if the mailfile is recently read,
but No such file (note no brackets, either) if the mailfile is
deleted.  This looks like the EXEC error from looking for the
(deleted) file.

This used to work; I used to correctly get [No new mail] in either
case.  What happened?

						<LNF>

Received: from MIT-XX.ARPA by MIT-MC.ARPA 28 May 85 13:21:14 EST
Received: from MIT-MC.ARPA by MIT-XX.ARPA with TCP; Tue 28 May 85 13:21:38-EDT
Received: from MIT-OZ by MIT-MC via Chaosnet; 28 MAY 85  13:18:28 EDT
Date: Tue 28 May 85 13:19:34-EDT
From: Randwulf Haskins <rh%MIT-OZ@MIT-MC.ARPA>
Subject: Re: Emacs bug
To: THEOBALD@MIT-XX.ARPA
cc: bug-emacs@MIT-XX.ARPA
In-Reply-To: Message from "Kevin B. Theobald <THEOBALD@MIT-XX.ARPA>" of Mon 27 May 85 21:14:43-EDT

    Date: Mon 27 May 85 21:12:51-EDT
    From: Kevin B. Theobald <THEOBALD@MIT-XX.ARPA>
    Subject: Emacs bug

    I have a consistently reproducable bug somewhere in EMACS or the 
    connections (XX, ROLM) when I run it on a Z-29.

    The text below is in <THEOBALD>BUG-SCREEN.TXT
     ....

    (That is the most common result, but there are others.  Also, it happens
    elsewhere and the result seems to depend on where I am on the screen.)

    Of course, it corrects itself when I type ^L, but its still annoying,
    probably ups the load on the lines (with all the ^L-ing I have to do) 
    and is really annoying when I use MINITS at peak hours.

If I understand this properly, it seems like under certain 
circumstances, you are getting unpredictable things on your screen 
when using a Z-29.  I found this sort of problem when using a Z-29,
so I made mods to EE's Teco to deal with it.  What causes it is that
Z-29's are slower (hence, need more padding) than Z-19's for doing
Insert/Delete Character.  The worst thing I found was inserting
a single tab at the beginning of a line, but I'm sure doing a ^Y in
the right place would do it, too.  I just added another terminal
type called z29 or somesuch that was mostly like a '19, but with
more padding on insert and delete character.  I also added a new
type to EE's Monitr and Exec so that you wouldn't have to go into
Emacs and say M-X Set Terminal Type$z29 all the time (besides 
needing to support it directly for VTS).  Trouble is, TECO is
being changed quite a bit, and I don't want to make mods and mess
things up or get them lost right now.  I was going to add the
appropriate stuff to OZ's Monitr (I can't get at OZ's Exec), but
then lots of things started happening to the Monitr's around 
here also.  Assuming I could get access to sources on the other
20's (which I won't hold my breath for), I could make the mods
to the Exec and check with JTW on the state of various Monitr's
to see if they were ready to be hacked.  Since I know I won't
get access, I'd be willing to try and write down everything that
needs to be done for adding a new terminal type to Exec, Monitr,
and Emacs so someone who is motivated could do it.

Random
-------


Received: from MIT-XX.ARPA by MIT-MC.ARPA; 27 May 85 21:12:33 EST
Date: Mon 27 May 85 21:12:51-EDT
From: Kevin B. Theobald <THEOBALD@MIT-XX.ARPA>
Subject: Emacs bug
To: bug-emacs@MIT-XX.ARPA
cc: theoBALD@MIT-XX.ARPA

I have a consistently reproducable bug somewhere in EMACS or the connections
(XX, ROLM) when I run it on a Z-29.

The text below is in <THEOBALD>BUG-SCREEN.TXT


.   pic_append_transformation \:(argnum)
.  en
.  sv pic_new_transforms \pic_transforms
.  sr pic_transforms
.  nr pic_offset_x pic_offset_x+(ll*pic_units_per_inch)/2000
.  nr pic_offset_y pic_offset_y+((pl-(pic_top+pic_bottom)/2)*pic_units_per_inch)/1000
.  nv indent
.  nv rindent
.  nv ll ll+100	 Kludge to avoid those annoying "10m over" error messages
----------------------------------------------------------------------
.sr pic_args
.fr argnum nargs-1 4 -1
.pic_a_xfation \:(argnum)
.en
.sv pic_new_xfs \pic_xfs
.sv pic_xfs
.nr pic_ox pic_ox+(ll*pic_units_per_inch)/2000
.nr pic_oy pic_oy+((pl-(pic_top+pic_bottom)/2)*pic_units_per_inch)/1000
.nv indent


It was originally generated in 2-window mode, but that is irrelevant; the
dashed line is text, not a window divider.  Go into EMACS and read in the
file.  Go to the fifth line (with ^U^N) and out to the second word (with
^U^F^F^F).  Now delete the word (with ^U12^D).  The word "pic_offset_x"
goes away as desired.  Now hit ^Y.  Instead of the original line I see
something like

.  nr pic_ot$ eY2  pic_offset_x+(ll*pic_units_per_inch)/2000

(That is the most common result, but there are others.  Also, it happens
elsewhere and the result seems to depend on where I am on the screen.)

Of course, it corrects itself when I type ^L, but its still annoying,
probably ups the load on the lines (with all the ^L-ing I have to do) and
is really annoying when I use MINITS at peak hours.

Could you please take a look at this problem.

					- Kevin Theobald
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 26 MAY 85  18:29:14 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 26 May 85 18:28-EDT
Received: from MIT-XX.ARPA by MIT-MC.ARPA; 26 May 85 18:28:10 EST
Date: Sun 26 May 85 18:28:35-EDT
From: Rob Austein <SRA@MIT-XX.ARPA>
Subject: Re: EMACS illegal memory write
To: FONER%MIT-OZ@MIT-MC.ARPA
cc: jtw%MIT-OZ@MIT-MC.ARPA, shsu%MIT-OZ@MIT-MC.ARPA,
    Bug-EMACS%MIT-OZ@MIT-MC.ARPA
In-Reply-To: Message from ""Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>" of Sun 26 May 85 15:13:00-EDT
Office: [NE43-502] 545 Technology Square, Cambridge MA 02139; (617) 253-7341

I increased the sizes of the internal buffers in MAICHK.MID and added
a 1F? to MAICHK.EMACS, and compiled, compressed, and otherwise gronked
everythink needing gronking.  I am fairly sure that your problem was
the midas code overwriting itself when it happened to get a username
39 characters long and when the time of day was a four-digit number.
So you get the first notification for the long username, but the next
pass you try to execute garbage code.  The rest of the changes are
just paranoia in case the problem was really that the code was falling
into the gap or something.

				--Rob
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 26 MAY 85  15:10:09 EDT
Date: Sun, 26 May 1985  15:06 EDT
Message-ID: <FONER.12114145014.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>
To:   jtw%MIT-OZ@MIT-MC.ARPA, shsu%MIT-OZ@MIT-MC.ARPA
Subject: EMACS illegal memory write
CC:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Foner%MIT-OZ@MIT-MC.ARPA

I've complained about this problem before to Bug-EMACS, but I had
fewer specifics.  No one ever answered.  I suspect no one maintains
Twenex EMACS anymore.

However...  this time, I think I know whose library the bug is in, and
it looks like one of you two might know how to fix whatever is going
wrong.  You two are the last writers of the library file, so I presume
you are its authors.

Okay, here's the problem.  For the last several months at least, my
EMACS has been prone to completely random crashes, usually having to
do with illegal memory writes and reads.  Now, I couldn't understand
how EMACS was dying this way, since TECO's memory management seemed
okay, and especially because this happened much more frequently with
large files in my buffers (i.e., when my EMACS was close to URKing
anyway).

Recently, though, I managed to nail down what's going on, at least
some of the time.  I run the MAICHK library, and this library seems to
be responsible for the bad behavior.  It seems that particular
addresses from which I get mail (probably just very long ones) cause
MAICHK to crash my EMACS when it attempts to say
	[Mail waiting - 2:50pm from foo]
I was able to repeat this behavior with an EMACS empty of any buffers,
but loading my init which loads this library.  It was infinitely
repeatable until someone else sent me mail---at which point it stopped
and was unrepeatable.

Now, it seems likely that this library is doing something wrong, given
that part of it is actually running machine code in a q-reg.  It seems
especially so, given that I tried killing the library (with my
mailfile still last written by some address that broke things), then
exited EMACS (which forces MAICHK to update that message), and my
EMACS did NOT bomb.  It only bombed when MAICHK was loaded.
Unfortunately, I don't understand enough about TECO and MIDAS to be
able to debug this problem, especially since I didn't write the code.

So...  in the hopes that one of you two can look at it and maybe find
out what's going on, here's the story.  In the file
OZ:<FONER.EMACS>BROKEN-EMACS.LOG there resides a log of this problem.
I had started up an EMACS, ^X^Z'ed out, and watched MAICHK apparently
trash it.  I then started up a fresh one, killed the MAICHK library,
^X^Z'ed out, and watched my EMACS exit normally.  The log file is a
little hard to read, given that it doesn't include the echo of my
commands (which were simply either M-X Kill Library or ^X^Z in each
case), and that it has cursor control stuff for a Heath terminal in
it.  But you should be able to figure it out.

The init that was running is in the same directory as the log, and is
called EMACS.ORIGINAL-UNDUMPED-OLD-DIRED-6-MAY, and was my EMACS.INIT
file until fairly recently.  (My new EMACS is a dumped EMACS; that'll
likely have its own peculiar problems.)  I shall be changing my LNFLIB
library (which my init loads) shortly, but will, if I change it, leave
the old one around as OLD-LNFLIB so you can find it for debugging.

It's entirely possible that the error is reproduceable without my init
at all, simply by loading MAICHK, creating some hokey long address,
and causing the address to send you mail.  When MAICHK attempts to
display the sender, either during modeline update, autosave, or EMACS
exit, it should crash.  (This, by the way, explains the frustratingly
random occurrence of the errors.  They were a combination of a
modeline update, which happens once a minute in my EMACS, and a long
or somehow otherwise weird address.  I think.)

Thanx for any light you can shed on this.  I'd like not to have to
give up using MAICHK, if that's the bug.  I'd certainly like to know
if you can rule it out, in which case I'm back to ground zero and must
figure out where else the bug resides that keeps wiping out my EMACS.

Thanx much!

						<LNF>

Received: from MIT-OZ by MIT-MC via Chaosnet; 26 MAY 85  14:47:33 EDT
Date: Sun, 26 May 1985  14:43 EDT
Message-ID: <FONER.12114140832.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>
To:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA
Subject: VTS wizard needed
cc:   Foner%MIT-OZ@MIT-MC.ARPA

I need to find someone who can answer a couple questions about
interaction between EMACS and OZ's VTS.  Surely there must be someone
out there who can.

Here's what I'm trying to figure out.  When using Kanef's AYEWBF
program, it tries hard to put notifications into the echo area when
the job being run is EMACS.  It also does the same sort of thing for
particular other jobs, such as LISP.

Well, this works fine running LISP:  notifications get put into the
bottom of the screen.  But in the last few months, this stopped
working for EMACS.  Kanef says the same code in AYEWBF is responsible
for doing notifications regardless of whether one is in EMACS or LISP,
and hence that EMACS is doing something strange with VTS that AYEWBF
can't deal with.  The symptom when running EMACS is that, instead of
putting a notification in the right place, it gets blurted out where
ever the cursor happens to be, preceded by "RL".

Kanef can't fix this; he doesn't know enough about MIT's VTS, and
there are other problems besides.  But *I* will fix this, if I can
find someone who can answer questions about VTS and what EMACS does
with it.

I realize that VTS is a can of worms.  What I'm trying to do is
probably not hard.  Any takers?  Please respond directly to me, not to
one of the lists above.  Thanx much!

						<LNF>

Received: from MIT-OZ by MIT-MC via Chaosnet; 18 MAY 85  13:59:15 EDT
Received: from MIT-SPEECH by MIT-OZ via Chaosnet; 18 May 85 13:57-EDT
Date: Sat 18 May 85 13:55:52-EDT
From: John Wroclawski <JTW@MIT-SPEECH>
Subject: Re: Tab vs. Supdup
To: CPH@MIT-OZ, GZ@MIT-OZ
cc: Bug-EMACS@MIT-OZ, Bug-OZ@MIT-OZ
In-Reply-To: Message from "CPH@MIT-OZ" of Tue 7 May 85 18:16:40-EDT

Hmmm, I guess I never got around to sending this before...
    
    From: CPH@MIT-OZ
    Subject: Tab vs. Supdup
    
        Date: Tuesday, 7 May 1985  15:45-EDT
        From: Gail Zacharias <GZ>
    
    Thanks for the advice; I will write a program to call STCHR% and set
    things up correctly.
    
You will also have to deal with the STMOD% jsys, see below.

    The problem is that when I use a dialup, I'm only getting 7 bits
    transmitted to me (apparently with even parity).  The supdup codes
    come get transmitted by OZ, but when I get them some of them don't
    have the eighth bit turned on.
    
DEC has the interesting idea that the whether or not parity is needed is
determined by the *line type* (i.e. hardwired, chaos NVT, PTY, etc.),
rather than by either the terminal type or a combination of the terminal
and line type, which would be correct. Chaos NVT's don't add parity.
Hardwired (incl. dialup) lines do, unless they're in binary mode. I
guess it's time we designed a fix for this.

    The other problem about the supdup input escapes is that when I send
    ^\ (octal 034) to OZ, nothing special happens; so none of the supdup
    escape sequences can be used.  Will STCHR% fix this too?
    
There are two VTS jsyi of interest, STCHR% and STMOD%. STCHR is for
telling the system about hardware-dependent characteristics of the
terminal, such as whether it can scroll or insert and delete lines.
STMOD is for making a choice among various different modes of terminal
operation that the system can support, such as wrap vs. scroll and how
end-of-page indications are presented. In the normal supdup case of
connecting over a net, both of these words are set by the server that
does the initial connection. To use a hardwired line you will have to
set both yourself.

To turn on ITP you have to set the TM%ITP bit using STMOD%. I don't
know why it's a mode, it seems more like a STCHR% characteristic to me.
Anyway, this will cause ^\ to work as the escape character for sending
bucky bits, etc. *However*, the implementation is incomplete - in
particular the flow control part of ITP is not there, since it is not
used for network terminals. Adding it would be moderately tricky; 
were you planning on using it? Also Twenex's handling of output
resets (%TDORS) isn't quite right, but that needs to be fixed
pretty badly anyway.

-------

Date: Thu, 16 May 85 11:46:27 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  printing key bindings
To: BUG-EMACS@MIT-MC
Message-ID: <[MIT-MC].506036.850516.GUMBY>

If you bind something to e.g. c-X space, describe et al print "Which is on
C-X  ".

Received: from MIT-XX.ARPA by MIT-MC.ARPA; 13 May 85 19:00:26 EST
Date: Monday, 13 May 1985  01:27-EDT
Message-ID: <FHSU.12110776970.BABYL@MIT-XX>
Sender: Richard Furuta <Furuta@WASHINGTON.ARPA>
From: Richard Furuta <Furuta@WASHINGTON.ARPA>
To: emacs@WASHINGTON.ARPA
cc: Furuta@WASHINGTON.ARPA
Subject:   Changing marks
ReSent-From: FHSU@MIT-XX
ReSent-To: bug-emacs@mc
ReSent-Date: Mon 13 May 1985 18:44-EDT

Is there any way to tell Tops-20 Emacs that I do not want the mark
to be moved unless I move it myself?  Having it move the mark
around when I do a Search is annoying.

					--Rick

Received: from MIT-REAGAN by MIT-MC via Chaosnet; 13 MAY 85  00:30:42 EDT
Received: from SUMEX-AIM.ARPA by MIT-REAGAN via INTERNET with SMTP id 4912; 13 May 85 00:30:34-EDT
Date: Sun 12 May 85 21:28:44-PDT
From: Doug Brutlag <brutlag@SUMEX-AIM.ARPA>
Subject: AN EMACS.VARS OR EMACS.INIT TO MAKE EMACS BEHAVE LIKE EDT?
To: info-emacs@MIT-REAGAN.ARPA

Does anyone have a VARS or INIT file that will make EMACS simulate the
VAX EDT editor?  I don't use the EDT editor myself but would like to 
set up an EMACS for a friend used to that editor.

Doug Brutlag@SUMEX
-------

Received: from MIT-XX by MIT-MC via Chaosnet; 12 MAY 85  15:41:56 EDT
Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Sun 12 May 85 15:42:30-EDT
Date: Sun 12 May 85 12:41:20-PDT
From: David Purves <PURVES@SU-SCORE.ARPA>
Subject: Ambassador terminals
To: bug-emacs@SU-SCORE.ARPA


Score is running version 165.  When I try to fire up emacs with an 
ambassador terminal type, emacs appears to hang.  An @info fork
says that emacs has halted at 52700.  

I tried setting the terminal type (at the exec) to zenith, and started
emacs.  It seemed fine (except that is was sending the zenith escape 
sequences, so it was kind of illegible).  I then tried setting the type
within emacs (using M-X Set Terminal Type$AAA$<cr>) and emacs then
froze the terminal, just as it had before.  The only acceptable input
was ^C, which returned me to the exec.

Is the Ambassador not supported here?

--Dave
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 8 MAY 85  13:16:48 EDT
Received: from MIT-MC by MIT-OZ via Chaosnet; 8 May 85 13:15-EDT
Date: Wed,  8 May 85 13:15:07 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  Tab vs. Supdup
To: CPH@MIT-OZ
cc: Bug-EMACS@MIT-OZ, Bug-OZ@MIT-OZ, GZ@MIT-OZ
In-reply-to: Msg of Tue 7 May 1985  18:00 EDT from CPH%MIT-OZ at MIT-MC.ARPA
Message-ID: <[MIT-MC].491706.850508.GUMBY>

STCHR% is documented in JSYS:STCHR.TXT.

Received: from MIT-OZ by MIT-MC via Chaosnet; 8 MAY 85  12:58:01 EDT
Date: Wed 8 May 85 12:56:05-EDT
From: Randwulf Haskins <rh%MIT-OZ@MIT-MC.ARPA>
Subject: Re: Tab vs. Supdup
To: CPH%MIT-AI@MIT-MC.ARPA
cc: Bug-OZ%MIT-OZ@MIT-MC.ARPA, Bug-EMACS%MIT-OZ@MIT-MC.ARPA
In-Reply-To: Message from "Chris Hanson <CPH@MIT-AI>" of Tue 7 May 85 15:05:16-EDT

For documentation on STCHR%, look in MONSYM.MAC (it's in
SS:<OZMON.SRC>).  There is a list of the bits for STCHR%.  Look for
TC%MOV.  You can use TC%MET to tell it that the terminal has a meta
bit.  The interesting thing is that it bombed doing the PSOUT% jsys,
so it's probably using ^P codes in a string to output.  From what you
described doing, I would say that you probably need TC%CID (Character
Insert and Delete) set in the characteristics word, assuming that the
terminal you are using can insert and delete characters.

Random
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 MAY 85  18:14:51 EDT
Date: Tue, 7 May 1985  18:00 EDT
Message-ID: <CPH.12109195956.BABYL@MIT-OZ>
From: CPH%MIT-OZ@MIT-MC.ARPA
To:   Gail Zacharias <GZ%MIT-OZ@MIT-MC.ARPA>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA
Subject: Tab vs. Supdup
In-reply-to: Msg of 7 May 1985  15:45-EDT from Gail Zacharias <GZ>

    Date: Tuesday, 7 May 1985  15:45-EDT
    From: Gail Zacharias <GZ>

Thanks for the advice; I will write a program to call STCHR% and set
things up correctly.  Where is this documented?

    I don't understand why you're having problems with supdup.  You mean you
    can't use the supdup program to go to other sites?  As far as I can see the
    program goes into binary mode, and so should be transmitting full 8 bits.

At no time am I using the supdup program.

The problem is that when I use a dialup, I'm only getting 7 bits
transmitted to me (apparently with even parity).  The supdup codes
come get transmitted by OZ, but when I get them some of them don't
have the eighth bit turned on.

The other problem about the supdup input escapes is that when I send
^\ (octal 034) to OZ, nothing special happens; so none of the supdup
escape sequences can be used.  Will STCHR% fix this too?

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 MAY 85  16:18:18 EDT
Date: Tue 7 May 85 15:45:00-EDT
From: Gail Zacharias <GZ%MIT-OZ@MIT-MC.ARPA>
Subject: Re: Tab vs. Supdup
To: CPH%MIT-AI@MIT-MC.ARPA
cc: Bug-OZ%MIT-OZ@MIT-MC.ARPA, Bug-EMACS%MIT-OZ@MIT-MC.ARPA
In-Reply-To: Message from "Chris Hanson <CPH@MIT-AI>" of Tue 7 May 85 15:05:01-EDT

Just "term supdup" by itself is not meaningful.  Supdup-nvt is not really a
terminal type, it's a class of terminal types.  You have to specify which
capabilities your terminal actually supports, which you do with the STCHR%
jsys (i.e. there is no exec-level support for this).  If you don't do this,
you probably get some meaningless  default set of characteristics which
might cause VTS errors of the sort you're seeing in Emacs.

I don't understand why you're having problems with supdup.  You mean you
can't use the supdup program to go to other sites?  As far as I can see the
program goes into binary mode, and so should be transmitting full 8 bits.
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 MAY 85  16:17:29 EDT
Date: Tue, 7 May 1985  15:33 EDT
Message-ID: <FONER.12109169282.BABYL@MIT-OZ>
From: "Leonard N. Foner" <FONER%MIT-OZ@MIT-MC.ARPA>
Subject: OZ VTS bugginess
To:   cph%MIT-OZ@MIT-MC.ARPA
CC:   Bug-OZ%MIT-OZ@MIT-MC.ARPA, Bug-EMACS%MIT-OZ@MIT-MC.ARPA,
      Foner%MIT-OZ@MIT-MC.ARPA

I have noticed this sort of behavior on OZ before, when using EMACS on
OZ from a LISP machine (rather than using Zwei on the LISPM directly).
Whenever EMACS attempts to echo anything in the echo area (for
instance, during a M-X command), it instead gets bombed by the same
sort of VTS error.

						<LNF>

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 MAY 85  15:08:28 EDT
Received: from MIT-AI by MIT-OZ via Chaosnet; 7 May 85 14:59-EDT
Date: Tue,  7 May 85 14:54:14 EST
From: Chris Hanson <CPH@MIT-AI>
Subject:  Tab vs. Supdup
To: Bug-OZ@MIT-OZ, Bug-EMACS@MIT-OZ
Message-ID: <[MIT-AI].488.850507.CPH>

I am trying to implement a Supdup terminal emulator for use over
RS-232 lines.  To debug this, I have been using TELNET through MINITS
to OZ, then doing @term supdup, which seems to almost work right.

When using EMACS, I did the following thing: on a line containing only
two words, separated by a tab, I did M-Rubout on the first word.  I
was subsequently rewarded with:

?Illegal instruction 104000,,76 at 41475 - JSYS error:
?Terminal cannot perform VTS function
@

It doesn't seem to happen unless the tab is there, by which I infer
that EMACS wants the terminal to perform the tab.  Obviously Supdup
can't do this.

So what's wrong?  Since Supdup works fine over the network, it must be
the case that @term supdup doesn't do the right thing.  Further, it
should not be possible for this error to happen -- I shouldn't have
been able to set my terminal type to Supdup in the first place if it
wasn't meant to be done.

A couple of other problems -- OZ does not recognize the Supdup input
escape character, so I can't use the extended character set or flow
control, both of which I want.  Also, on dialups, there seems to be no
way to turn off parity, so I lose the eighth data bit and subsequently
cannot use Supdup.  This seems pretty silly since there are eight bits
going one way (the meta key on Ambassadors), and only seven bits going
the other.  It seems unlikely that the terminal will check the parity
in only one direction.

Received: from MIT-OZ by MIT-MC via Chaosnet; 27 APR 85  14:00:56 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 27 Apr 85 14:01-EST
Date: Sat, 27 Apr 85 14:00:19 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  Installing EMACS on OZ.
To: BRADFORD@SU-SIERRA
cc: billw@SU-SIERRA, lougheed@SU-SIERRA, satz@SU-SIERRA,
    whp4@SU-SIERRA, emacs-hackers@MIT-OZ
In-reply-to: Msg of Sat 27 Apr 85 05:26:41-PST from Ethan Bradford <BRADFORD at SU-SIERRA.ARPA>
Message-ID: <[MIT-MC].472411.850427.GUMBY>

If you make a DUMPER tape today, I can pick it up before I leave Palo Alto
Monday morning.  My flight is at 7am, so I should pick it up sometime on
Sunday, I suppose.

Received: from MIT-OZ by MIT-MC via Chaosnet; 27 APR 85  08:27:29 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 27 Apr 85 08:28-EST
Received: from SU-SIERRA.ARPA by MIT-MC.ARPA; 27 APR 85 08:26:57 EST
Date: Sat 27 Apr 85 05:26:41-PST
From: Ethan Bradford <BRADFORD@SU-SIERRA.ARPA>
Subject: Installing EMACS on OZ.
To: emacs-hackers%MIT-OZ@MIT-MC.ARPA
cc: lougheed@SU-SIERRA.ARPA, satz@SU-SIERRA.ARPA, whp4@SU-SIERRA.ARPA,
    billw@SU-SIERRA.ARPA

We've built and tested a new version of EMACS here.  It is a merge of
all the changes which have been made at Stanford over the last several
years with the OZ version of EMACS.  What is the proper procedure for
installing the changes back on OZ?  They are so extensive, that I no
longer know which files are changed so I would move the whole
directory over.

-- Ethan
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 21 APR 85  14:52:07 EST
Date: Sun, 21 Apr 1985  14:49 EST
Message-ID: <GZ.12104977936.BABYL@MIT-OZ>
From: Gail Zacharias <GZ%MIT-OZ@MIT-MC.ARPA>
To:   "Robert L. Krawitz" <RLK%MIT-OZ@MIT-MC.ARPA>
Cc:   bug-emacs%MIT-OZ@MIT-MC.ARPA, bug-oz%MIT-OZ@MIT-MC.ARPA
Subject: terminal not getting reset
In-reply-to: Msg of 20 Apr 1985  09:37-EST from Robert L. Krawitz <RLK>

							When I couldn't
    continue the emacs (it really managed to wedge) and had to reset it, I
    couldn't reenable the paging.

In order to enable paging, you have to do TERM PAUSE COMMAND in addition
to TERM PAUSE END-OF-PAGE.  As long as the bits which the EXEC calls "pause
(on) command" are off, the system will not do any kind of pausing.

Received: from MIT-OZ by MIT-MC via Chaosnet; 20 APR 85  16:30:10 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 20 Apr 85 16:25-EST
Date: Sat,20 Apr 85 16:26:24 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  terminal not getting reset
To: RLK@MIT-OZ
cc: bug-emacs@MIT-OZ, bug-oz@MIT-OZ
In-reply-to: Msg of Sat 20 Apr 1985  09:37 EST from Robert L. Krawitz <RLK%MIT-OZ at MIT-MC.ARPA>
Message-ID: <[MIT-MC].462924.850420.GUMBY>

EMACS ought to catch this.

Received: from MIT-OZ by MIT-MC via Chaosnet; 20 APR 85  09:39:39 EST
Date: Sat, 20 Apr 1985  09:37 EST
Message-ID: <ZZZ.RLK.12104659019.BABYL@MIT-OZ>
Sender: ZZZ.RLK%MIT-OZ@MIT-MC.ARPA
From: "Robert L. Krawitz" <RLK%MIT-OZ@MIT-MC.ARPA>
To:   bug-oz%MIT-OZ@MIT-MC.ARPA, bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: terminal not getting reset

I've finally found a reproduceable case of terminal pause on end of
page not getting reset (enabled) upon exit of a program (emacs, of
course).

The other night I couldn't save a file because oz ran out of disk
space, and so emacs exited abnormally (well, twenex did it, but...)
and of course the monitor didn't re-enable paging.  When I couldn't
continue the emacs (it really managed to wedge) and had to reset it, I
couldn't reenable the paging.

I suppose either emacs has to detect this or tops-20 has to have a way
of knowing who requested that paging be disabled.

Robert^Z

Received: from MIT-OZ by MIT-MC via Chaosnet; 19 APR 85  18:03:00 EST
Date: Fri, 19 Apr 1985  18:01 EST
Message-ID: <NSING.12104488598.BABYL@MIT-OZ>
From: NSING%MIT-OZ@MIT-MC.ARPA
To:   David Vinayak Wallace <GUMBY@MIT-MC>
Cc:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: webster
In-reply-to: Msg of 19 Apr 1985  12:57-EST from David Vinayak Wallace <GUMBY at MIT-MC>

m-$ checks the spelling. I wanted to use the dictionary.

Received: from MIT-OZ by MIT-MC via Chaosnet; 19 APR 85  14:39:56 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 19 Apr 85 14:38-EST
Date: Fri,19 Apr 85 14:25:33 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  webster
To: GUMBY@MIT-MC
cc: bug-emacs@MIT-OZ, NSING@MIT-OZ
In-reply-to: Msg of Fri19 Apr 85 12:57:06 EST from David Vinayak Wallace <GUMBY>
Message-ID: <[MIT-MC].461559.850419.GUMBY>

    Date: Fri,19 Apr 85 12:57:06 EST
    From: David Vinayak Wallace <GUMBY>

    m-$ has stopped working for you?

To be more verbose, do you mean you are having trouble with the spell
command, or that you had just forgotten how to invoke it?  If you forget
how to invoke a command, you can always ask EMACS to help you (for
instance, <help> A (or m-X Apropos) SPELL should cause EMACS to tell you
about everything it has with spell in the name.

Received: from MIT-OZ by MIT-MC via Chaosnet; 19 APR 85  13:10:48 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 19 Apr 85 13:08-EST
Date: Fri,19 Apr 85 12:57:06 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  webster
To: NSING@MIT-OZ
cc: bug-emacs@MIT-OZ
In-reply-to: Msg of Fri 19 Apr 1985  09:16 EST from NSING%MIT-OZ at MIT-MC.ARPA
Message-ID: <[MIT-MC].461414.850419.GUMBY>

m-$ has stopped working for you?

Received: from MIT-OZ by MIT-MC via Chaosnet; 19 APR 85  09:17:32 EST
Date: Fri, 19 Apr 1985  09:16 EST
Message-ID: <NSING.12104392943.BABYL@MIT-OZ>
From: NSING%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: webster

I used to be able to look words up from emacs. Has this feature been removed
or have I forgotten how to use it.

thanks,
Neil

Received: from MIT-XX by MIT-MC via Chaosnet; 18 APR 85  02:10:47 EST
Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Thu 18 Apr 85 02:12:00-EST
Date: 17 Apr 1985 23:09-PST
Sender: BILLW@SU-SCORE.ARPA
Subject: Wordstar mode for EMACS?
From: William "Chops" Westfield <BillW@SRI-KL.ARPA>
To: bug-emacs@MIT-XX.ARPA
Message-ID: <[SU-SCORE.ARPA]17-Apr-85 23:09:49.BILLW>

Well, does anyone have such a thing?  (Yes, i know - please dont tell
me about running 8008 simulations on a cray and such...)

Thanks
Bill W
	
Begin forwarded message
Date: Wed 17 Apr 85 22:51:27-PST
From: Francis Colcord <L.LAF%LOTS-B@LOTS-B>
To: billw%Score@LOTS-B
Subject: emacs

I would like to know if any one has written an Emacs initialising file which 
would make emacs pretend that it is wordstar.  I once knew Emacs, but have 
since been using a micro running wordstar.  I would like to edit files on LOTSB 
using emacs, but I cannot remember all of the commands.  I thought that an
initialising file would prevent me from haveing to learn Emacs again.
Please send me the file if you have it somewhere.  I would really appreciate it.
				
				Thanks
					Frank Colcord
-------
	-----------------
End forwarded message
		

Received: from MIT-XX by MIT-MC via Chaosnet; 8 APR 85  18:40:48 EST
Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 8 Apr 85 18:12:46-EST
Date: Mon 8 Apr 85 14:39:27-PST
From: Richard Beigel <BAGEL@SU-SCORE.ARPA>
To: bug-emacs@SU-SCORE.ARPA

Why does my tty hang on ^S in emacs?  I am on a heath via ethertip.
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 APR 85  19:20:57 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 7 Apr 85 19:20-EST
Date: Sun, 7 Apr 85 19:19:52 EST
From: Richard M. Stallman <RMS@MIT-MC>
Subject: MOVEing Regions
To: MDC.WAYNE@MIT-OZ
cc: GUMBY@MIT-MC, carter@RUTGERS, bug-emacs@MIT-OZ,
    wayne@MIT-OZ
Message-ID: <[MIT-MC].445988.850407192033.RMS>

Given the ability to copy the region,
moving the region is just one additional character.
I think this is easy enough to make adding additional
commands unjustified.

Users who really want move commands can easily add them for themselves.

Received: from MIT-OZ by MIT-MC via Chaosnet; 7 APR 85  06:45:59 EST
Date: 7 Apr 1985  06:45 EST (Sun)
Message-ID: <MDC.WAYNE.12101219722.BABYL@MIT-OZ>
From: Wayne McGuire <MDC.WAYNE%MIT-OZ@MIT-MC.ARPA>
Subject: MOVEing Regions
To:   gumby@MIT-MC, carter@RUTGERS.ARPA, bug-emacs%MIT-OZ@MIT-MC.ARPA
cc:   wayne%MIT-OZ@MIT-MC.ARPA

     I should have been more explicit about what I mean by to "move"
text.  I was referring to a process similar to that which is invoked
by the word "move" in MM: to transfer text (a message, a region, etc.)
to another file (or buffer) while at the same time killing or deleting
that text in the buffer from which it is transferred.  "Move"
simultaneously appends and deletes with one command.

     The various append commands in EMACS are somewhat like "copy" in
MM: they transfer text to another buffer or file, but they don't kill
that same text in the source buffer.

     I think Babyl is also missing a MOVE command: o and c-o append
messages to another file, but they don't at the same time delete them
from the source buffer.

     MOVEing, as opposed to merely APPENDing, is often very handy.

-- Wayne

Received: from MIT-OZ by MIT-MC via Chaosnet; 6 APR 85  18:08:15 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 6 Apr 85 18:07-EST
Received: from RU-BLUE.ARPA by MIT-MC.ARPA;  6 APR 85 18:04:48 EST
Date: 6 Apr 85  17:58 EST (Sat)
From: _Bob <Carter@RUTGERS.ARPA>
To:   Wayne McGuire <MDC.WAYNE%MIT-OZ@MIT-MC.ARPA>
Cc:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: Moving Text
In-reply-to: Msg of 6 Apr 1985  06:35-EST from Wayne McGuire <MDC.WAYNE%MIT-OZ at MIT-MC.ARPA>

    From: Wayne McGuire <MDC.WAYNE%MIT-OZ at MIT-MC.ARPA>

			       Shouldn't there exist commands like

         M-X Move to buffer

         M-X Move to file

    to do this job with less fuss?  Perhaps I've overlooked some simple
    existing incantation which already does this.

The function ^R Append to Buffer is defaultly on C-X-A.  Appending to
a file is handled by

			M-X Append to File

But some find it convenient to put this function on C-X C-A, which is
defaultly unused.  Do so by putting the following in your EMACS.INIT.

		   m.m append to fileu:.x()

N.B.  That is a quoted control-caret followed by a quoted control-a.

_B

Received: from MIT-OZ by MIT-MC via Chaosnet; 6 APR 85  18:01:44 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 6 Apr 85 17:59-EST
Date: Sat, 6 Apr 85 17:54:38 EST
From: David Vinayak Wallace <GUMBY@MIT-MC>
Subject:  Moving Text
To: MDC.WAYNE@MIT-OZ
cc: bug-emacs@MIT-OZ
Message-ID: <[MIT-MC].444997.850406180007.GUMBY>

    Date: Sat 6 Apr 85 06:35:17-EST
    From: Wayne McGuire <MDC.WAYNE at OZ>

         At present if one wants to move a section of a buffer to a file
    or to another buffer, one has to define the section as a region, type
    c-w (to wipe out the region), enter a new buffer, and then type c-y
    (to yank the just killed region).  Shouldn't there exist commands like

         M-X Move to buffer

         M-X Move to file

    to do this job with less fuss?  Perhaps I've overlooked some simple
    existing incantation which already does this.

It's not clear what you want.  You can't define the amount to be moved
without making a region (though the limiting case of inserting an entire
buffer or region is available).

But anyway, what would Move to buffer or move to file do?  Do you mean
"Create a new buffer (or file) consisting only of the text in the region?"
Usually I want to move something to another file and then edit it a bit, or
append it to the target file.  The normal way to do that is via putting the
target file in a buffer too.

Or are you complaining about c-W c-Y?  Perhaps you want m-W?

Received: from MIT-OZ by MIT-MC via Chaosnet; 6 APR 85  17:28:57 EST
Date: Sat 6 Apr 85 08:27:16-EST
From:  Wayne McGuire <MDC.WAYNE%MIT-OZ@MIT-MC.ARPA>
Subject: Babyl and Tex Help Files
To: bug-emacs%MIT-OZ@MIT-MC.ARPA, bug-babyl%MIT-OZ@MIT-MC.ARPA,
    bug-tex%MIT-OZ@MIT-MC.ARPA

     What are the chances that EMACS-style help files (with Apropos,
Describe, Character, etc.) will be developed for Babyl, Tex, and
Latex?  The current help file callable from and for Babyl is ok, but
it is missing the valuable Apropos command.  As far as I know no help
for Tex or Latex can be summoned from EMACS; an Apropos command would
be especially useful for both programs, since they are rather large
and complex.

-- Wayne
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 6 APR 85  17:28:51 EST
Date: Sat 6 Apr 85 06:35:17-EST
From:  Wayne McGuire <MDC.WAYNE%MIT-OZ@MIT-MC.ARPA>
Subject: Moving Text
To: bug-emacs%MIT-OZ@MIT-MC.ARPA

     At present if one wants to move a section of a buffer to a file
or to another buffer, one has to define the section as a region, type
c-w (to wipe out the region), enter a new buffer, and then type c-y
(to yank the just killed region).  Shouldn't there exist commands like

     M-X Move to buffer

     M-X Move to file

to do this job with less fuss?  Perhaps I've overlooked some simple
existing incantation which already does this.
-------

Received: from COLUMBIA-20.ARPA by MIT-MC.ARPA;  6 APR 85 16:12:42 EST
Date: Sat 6 Apr 85 16:12:11-EST
From: David Eppstein <Eppstein@COLUMBIA-20.ARPA>
Subject: Library for EMACS C mode
To: Bug-KCC@SU-SIERRA.ARPA
cc: Bug-EMACS@MIT-MC.ARPA

I have created an EMACS library for C mode (and changed HAKLIB to use it).
So far this is only installed on Sierra, in EMACS:CMODE.*.
The code for tab is kind of ugly but it seems to work (at least for
the style of indentation I like; no hooks are provided to change the style).
Also included is a macro on C-M-* to create a block comment of the form
	/*
	** Comment
	** More comment
	*/
Tab or linefeed within such a comment will make more starred comment lines.
-------

Received: from SRI-NIC.ARPA by MIT-MC.ARPA;  2 APR 85 02:29:00 EST
Date: Mon 1 Apr 85 23:27:03-PST
From: Mary Stahl <STAHL@SRI-NIC.ARPA>
Subject: Re: [Mary Stahl <STAHL@SRI-NIC.ARPA>: emacs weirdness]
To: ROODE@SRI-NIC.ARPA
cc: HSS@SRI-NIC.ARPA, Vivian@SRI-NIC.ARPA, BUG-EMACS@SRI-NIC.ARPA,
    Action@SRI-NIC.ARPA, Sappho@SRI-NIC.ARPA, STAHL@SRI-NIC.ARPA
In-Reply-To: Message from "David Roode <ROODE@SRI-NIC.ARPA>" of Mon 1 Apr 85 22:53:11-PST

I'm confused, then.  The key marked <- on my keyboard has, in the past,
been used to delete the previous character, both at the Exec and when
in EMACS.  The <control>B in EMACS always backspaced a character, and
since I never used <control>H, I don't know what it really did.

Now, I find that the same result is gotten by using either the
<- key, <control>B and <control>H.  They all backspace one character.
What I'm trying to say is that this is a change from how my keyboard acted 
last week and I'm having a difficult time adjusting to it.

Sorry if this sounds a bit mixed up.  It's very late and I am frustrated 
dealing with keyboard keys that don't do what they did last time i used
them.
-------

Received: from SRI-NIC.ARPA by MIT-MC.ARPA;  2 APR 85 01:55:10 EST
Date: Mon 1 Apr 85 22:53:08-PST
From: David Roode <ROODE@SRI-NIC.ARPA>
Subject: [Mary Stahl <STAHL@SRI-NIC.ARPA>: emacs weirdness]
To: Stahl@SRI-NIC.ARPA, HSS@SRI-NIC.ARPA, Vivian@SRI-NIC.ARPA
cc: BUG-EMACS@SRI-NIC.ARPA, Action@SRI-NIC.ARPA, Sappho@SRI-NIC.ARPA
Location:  EJ286    Phone: (415) 859-2774

There are two versions of Augterm around... one has that
key being a BACKSPACE (CONTROL-H) and one has it being
DELETE.  We generally have not used any of the ones where
it is DELETE because they also have a loud BELL (other
Augterm is silent on receipt of bell).  So, the behavior
you describe is the normal way it should behave.
                ---------------

Mail-From: SAPPHO created at  1-Apr-85 21:21:10
Mail-From: STAHL created at  1-Apr-85 16:07:37
Date: Mon 1 Apr 85 16:07:37-PST
From: Mary Stahl <STAHL@SRI-NIC.ARPA>
Subject: emacs weirdness
To: action@SRI-NIC.ARPA
cc: stahl@SRI-NIC.ARPA
ReSent-Date: Mon 1 Apr 85 21:21:10-PST
ReSent-From: NIC Operations <ACTION@SRI-NIC.ARPA>
ReSent-Sender: SAPPHO@SRI-NIC.ARPA
ReSent-To: bug-emacs@SRI-NIC.ARPA

Using the editor in MM, I am finding that it is doing a strange thing.
It does not recognize the backspace/delete key (that's <- on my
terminal) while I am editing.  Instead, input from that key is
interpreted as a <control>B, and causes the cursor to backspace a
character.  To delete the previous character, I must hold down the
<control> key while pressing the <- key.  This is a change since
Friday, the last time I used EMACS in MM.  Any clues?

- Mary
-------
-------

Received: from SRI-NIC.ARPA by MIT-MC.ARPA;  2 APR 85 00:23:07 EST
Mail-From: STAHL created at  1-Apr-85 16:07:37
Date: Mon 1 Apr 85 16:07:37-PST
From: Mary Stahl <STAHL@SRI-NIC.ARPA>
Subject: emacs weirdness
To: action@SRI-NIC.ARPA
cc: stahl@SRI-NIC.ARPA
ReSent-Date: Mon 1 Apr 85 21:21:10-PST
ReSent-From: NIC Operations <ACTION@SRI-NIC.ARPA>
ReSent-Sender: SAPPHO@SRI-NIC.ARPA
ReSent-To: bug-emacs@SRI-NIC.ARPA

Using the editor in MM, I am finding that it is doing a strange thing.
It does not recognize the backspace/delete key (that's <- on my
terminal) while I am editing.  Instead, input from that key is
interpreted as a <control>B, and causes the cursor to backspace a
character.  To delete the previous character, I must hold down the
<control> key while pressing the <- key.  This is a change since
Friday, the last time I used EMACS in MM.  Any clues?

- Mary
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 27 MAR 85  05:25:21 EST
Date: Wed 27 Mar 85 05:24-EST
From: Leigh L. Klotz <KLOTZ%MIT-OZ@MIT-MC.ARPA>
Subject: EMACS-HACKERS
To: bug-emacs@MIT-MC

Oops.  EMACS-HACKERS@XX is forwarded to about three people.
EMACS-HACKERS@OZ is forwarded to bug-emacs@mc.  EMACS-HACKERS@XX
had a lot of useless mail for a while, as did the OZ version.  Someone
seems to have forwarded the OZ version back to BUG-EMACS.  Sorry for
the commotion.

Received: from MIT-OZ by MIT-MC via Chaosnet; 26 MAR 85  15:39:48 EST
Received: from MIT-JIMI by MIT-OZ via Chaosnet; 26 Mar 85 15:38-EST
Date: Tuesday, 26 March 1985, 15:36-EST
From: David Vinayak Wallace <Gumby at MC>
Subject: control-g
To: Wayne H. McGuire <MDC.WAYNE at OZ>
Cc: bug-emacs at OZ
In-reply-to: The message of 26 Mar 85 02:29-EST from Wayne H. McGuire <MDC.WAYNE at OZ>

    Date: Tue 26 Mar 85 02:29-EST
    From: Wayne H. McGuire <MDC.WAYNE@MIT-OZ>

	 Typing c-g to interrupt an extended command should also refresh 
    the screen (like c-l) and clear away the garbage in the command line.

I disagree.

1> A full redisplay takes a long time on a slow terminal (e.g. a
   dialup).
2> It echos a ^G in the command line.

Received: from MIT-OZ by MIT-MC via Chaosnet; 26 MAR 85  02:30:21 EST
Date: Tue 26 Mar 85 02:29-EST
From: Wayne H. McGuire <MDC.WAYNE%MIT-OZ@MIT-MC.ARPA>
Subject: control-g
To: bug-emacs@MIT-OZ

     Typing c-g to interrupt an extended command should also refresh 
the screen (like c-l) and clear away the garbage in the command line.


Received: from MIT-OZ by MIT-MC via Chaosnet; 22 MAR 85  23:35:28 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 22 Mar 85 23:34-EST
Date: 22 March 1985 23:35-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
To: bradford @ SU-SIERRA, emacs-hackers @ MIT-OZ
cc: RMS @ MIT-MC

Uh, EMACS-HACKERS goes to Sam Hsu and me.  I hadn't noticed before where
the message was sent.

I'll cast my additional vote agains making ^X-I go to the EMACS node
directly, though I wouldn't object to putting in a comment in the top node
or making ^X-I print out explicit directions for getting to EMACS.


Received: from MIT-OZ by MIT-MC via Chaosnet; 22 MAR 85  18:43:08 EST
Date: Fri 22 Mar 85 18:42:01-EST
From: Robert Scott Lenoil <EB.LENOIL%MIT-OZ@MIT-MC.ARPA>
Subject: META-$ bug
To: bug-emacs%MIT-OZ@MIT-MC.ARPA
cc: bug-spell%MIT-OZ@MIT-MC.ARPA

When trying to spelling check a word, ISPELL tells me "filename was not
specified", and then bounces me into command level.  When I QUIT ispell,
I go back to EMACS and get an ESP error (error with spelling program).
I have not been able to reproduce the error with just any string, so here
is the offending text (I get the spelling error when trying to check the
word "persuasion"):
@watson
*
*remarks
*Hi!  I''m a friendly 6-3 student, trying to make it at M.I.T.  Formerly a
*professional actor (what the !@#$ am I doing here?), I now sing with
*the Logarhythms, a barbershop singing group here at the ''Tute.  As far as
*computers go, I''ve been hacking micros for quite some time, especially
*Commodores.  I (think I) am interested in micros and networking, although
*I''m always open to persuasion.  I will be the first to admit that I love
*the low-level stuff - I guess that I''m just a really low character.  Bye!
*
*done
-------

Date: 17 March 1985 17:11-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject:  query replace and altmodes
To: LIN @ MIT-MC
cc: BUG-EMACS @ MIT-MC
In-reply-to: Msg of 16 Mar 1985 00:42-EST from Herb Lin <LIN>

The altmodes terminate the search and replace strings.  Try ^]^Q$, which
you have to type with ctrl-q ctrl-], ctrl-q, ctrl-q, alt.


Date: 17 March 1985 15:48-EST
From: Devon S. McCullough <DEVON @ MIT-MC>
To: BUG-EMACS @ MIT-MC

I'm getting screwed by the Tecdoc command, when typing in Altmode X
(where X is some teco command I'm curious about) because often there
SUDDENLY appears a --MORE-- on the mode line which misinterprets my
type-in and says FLUSHED...

The screw is that EMACS then gets into a broken mode that can only be
exited by some ^G's.  In this mode type-in still echoes and prompts
still are output to the echo area but nothing else happens.

Why not unFLUSH output as soon as EMACS starts waiting for type-in?
If the user really wants to quit then after looking at the output,
there's always ^G.

Received: from MIT-OZ by MIT-MC via Chaosnet; 17 MAR 85  09:52:29 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 17 Mar 85 09:52-EST
Received: from SU-SIERRA.ARPA by MIT-MC.ARPA; 17 MAR 85 09:52:03 EST
Date: Sun 17 Mar 85 06:53:29-PST
From: Ethan Bradford <BRADFORD@SU-SIERRA.ARPA>
Subject: 2 suggested INFO changes.
To: emacs-hackers%MIT-OZ@MIT-MC.ARPA

I suggest that we make ^X I and ^_ I go directly to the EMACS node in
the info tree instead of to the DIR node.  This would be much less
confusing for EMACS users who are new to INFO.

Also, it would be nice for U to be made synonomous with L for nodes
which have no UP (which is mostly un-infoized files).  In most cases
that would do the right thing and it would be easier on those people
who first learn only the M and U info commands.

Anybody have any strong opinions on this either way?

-- Ethan
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 16 MAR 85  01:35:00 EST
Date: 16 Mar 1985  01:34 EST (Sat)
Message-ID: <GUMBY.12095396023.BABYL@MIT-OZ>
From: David Vinayak Wallace <GUMBY%MIT-OZ@MIT-MC.ARPA>
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: FLUSH LINES should check for a blank string!!


Date: 16 March 1985 00:42-EST
From: Herb Lin <LIN @ MIT-MC>
To: BUG-EMACS @ MIT-MC
cc: LIN @ MIT-MC

this isn't a bug (i don't think), but I need emacs wizard help.

I am trying to diddle an uploaded file from a micro.  I need to translate
the sequence ALTMODE CTRL-P into a return.  I try a query replace, where
the characters I want to replace are quoted with CTRL-Q.  I get the
msg "String to replace is empty".  What should I be doing?

tnx.


Received: from WASHINGTON.ARPA by MIT-MC.ARPA; 15 MAR 85 04:57:32 EST
Date: Fri 15 Mar 85 01:56:35-PST
From: Sam Hsu <fhsu@WASHINGTON.ARPA>
Subject: xsearch
To: bug-emacs@MIT-MC.ARPA

XSEARCH came with the distribution of Emacs, I think.  I'm looking
for the source code.  It blows up on very large files, and I'd like
to fix that.  Thanks.
-------

Date: 14 March 1985 03:11-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject: kbd macros
To: BUG-EMACS @ MIT-MC

Yeah, ^X-( initially has an autoloading definition which gets changed
to a loaded definition when it gets loaded.  The documentation is
also autoloaded.  The library doesn't recover from being flushed
after the documentation is printed because it trashes the ^X-( etc.
key definitions to point to ones in the library.  The initial definitions
should be retained, as they do the right thing about deciding whether to
load the library.  Sort of.


Received: from SRI-NIC.ARPA by MIT-MC.ARPA; 13 MAR 85 08:30:19 EST
Date: Wed 13 Mar 85 05:29:42-PST
From: Ken Harrenstien <KLH@SRI-NIC.ARPA>
Subject: Strange ^X ? and ^X ( interaction
To: bug-emacs@MIT-MC.ARPA

The simplest way to demonstrate this bug is to start up a bare EMACS
without any INIT file, then type:
	C-X ? (
which gives you the blurb on ^R Start Kbd Macro.  It also appears to
smash everything connected with keyboard macros, because if you then
try to repeat the C-X ? ( you get a QNS error.  If you actually try to
execute C-X ( you get another error.  M-X Apropos$Kbd$ works OK if you
don't do the C-X ? (, telling you about all sorts of stuff in the
KBDMAC library, but otherwise will only tell you about ^R Start Kbd Macro,
and it's not even on C-X ( anymore anyway.

This is KBDMAC 41, EMACS 163, TECO 1214, on SRI-NIC (TOPS-20).
-------

Received: from MIT-OZ by MIT-MC via Chaosnet; 13 MAR 85  05:52:03 EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 13 Mar 85 05:51-EST
Received: from SU-SCORE.ARPA by MIT-MC.ARPA; 13 MAR 85 05:51:47 EST
Date: 13 Mar 1985 02:52-PST
Sender: BILLW@SU-SCORE.ARPA
Subject: Re: Dial Up problems
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: MARLENE.SILVER%MIT-OZ@MIT-MC.ARPA
Cc: bug-emacs%MIT-OZ@MIT-MC.ARPA
Message-ID: <[SU-SCORE.ARPA]13-Mar-85 02:52:00.BILLW>
In-Reply-To: The message of Tue 12 Mar 85 09:25:43-EST from Bernard Silver <MARLENE.SILVER%MIT-OZ@MIT-MC.ARPA>

It sounds like the switch that says that your terminal has a
meta key is turned on, when in fact your terminal doesn't
have a meta key, or isnt set up properly to use it.
Here are some suggestions:

	put 0FSTTYFCI$ in your init file.

	change your terminal configuration: right now it looks
	like it is setting the 8th bit to generate either even
	or odd parity (and emacs is interpreting the 8th bit as
	"meta").  You should be able to set the terminal for
	either 0 ("space") parity, or for 8 data bits and
	no parity at all.

BillW

Received: from MIT-OZ by MIT-MC via Chaosnet; 12 MAR 85  09:25:52 EST
Date: Tue 12 Mar 85 09:25:43-EST
From: Bernard Silver <MARLENE.SILVER%MIT-OZ@MIT-MC.ARPA>
Subject: Dial Up problems
To: bug-emacs%MIT-OZ@MIT-MC.ARPA

I am having problems using EMACS on OZ when dialing up (on
258-8260) Im using an AAA terminal at 1200 baud and a Racal-vadic
va3451 modem.

WHen I read in a file, everything appears to be OK, until I
start editing. ^N moves an arbitrary number of lines, sometimes
commands like ^F act as $F, but mostly I get complaints that
Im addressing a character not in the buffer, or I just get beeps
and the cursor doesnt move.

I have had no problems using EMACS when in the lab.  Also, another
user here says that EMACS works fine on MC when dialed up on the
same equipment.  Any suggestions?
				Bernard Silver
-------

Date: 12 March 1985 09:20-EST
From: Daniel Weise <DANIEL @ MIT-MC>
Subject: DEC rainbow.
To: BUG-EMACS @ MIT-MC, blythe @ MIT-OZ

Generally speaking, there is NO software for it.  DEC is giving
away tons of them in the hope that someone out there will make
some software for it.  I have received requests for Scheme and
Logo for them.  (There ain't any.)  I now tell people when they
find out there is no software that they should have looked the
gift horse in the mouth.

Daniel

Received: from MIT-OZ by MIT-MC via Chaosnet; 12 MAR 85  01:07:26 EST
Date: Tue 12 Mar 85 01:06:56-EST
From: Randwulf Haskins <rh%MIT-OZ@MIT-MC.ARPA>
Subject: Re: Question
To: rms%MIT-PREP@MIT-MC.ARPA
cc: info-gnu-emacs%MIT-PREP@MIT-MC.ARPA, info-emacs@MIT-MC
In-Reply-To: Message from "Richard M. Stallman <rms@mit-prep>" of Mon 11 Mar 85 18:11:40-EST

    From: Richard M. Stallman <rms@mit-prep>
    To: info-gnu-emacs@mit-prep, info-emacs@mc

    Currently, when using an Ann Arbor Ambassador
    terminal, GNU Emacs determines some screen settings
    (such as the number of lines to use) from the TERMCAP
    and then sends characters to the terminal to make it
    display that many lines, etc.

    A user has complained about this, ...

I'm curious as to what his complaint would be.  When one is
using UNIX, one comes to expect random things to be sent to
one's terminal.

    His suggestions are either make Emacs not set up the
    screen geometry at all, thus assuming it is already
    set up as specified, or to make it send the "init
    string" and assume that sets it up as specified.

The "right" thing would probably be to read the TERMCAP file
and send the init string from there.  I'm assuming that the
only time you have to worry about this is if the person has
not loaded any TERMCAP into his/her environment and starts
up the editor?  (This is equivalent to the common problem on
the -20 of people not setting their terminal types to
something other than Default, in which case EMACS asks them
on startup what they are on.)  If they already have the TERMCAP
stuff in their environment, presumably the terminal is in the
geometry they want?  The ZEMACS on MIT-EDDIE seems to deal with
this properly, since I just hacked a termcap to do AAA's with
30 lines and everything seems to have worked fine.

Random
-------

Date: 12 March 1985 01:00-EST
From: David Vinayak Wallace <GUMBY @ MIT-MC>
Subject:  emacs for microcomputer
To: CENT @ MIT-MC
cc: BUG-EMACS @ MIT-MC, Blythe @ MIT-OZ
In-reply-to: Msg of 12 Mar 1985 00:47-EST from Pandora B. Berman <CENT>

Perhaps the athena people would know?  At the very least they might know
what sort of OS the crufty thing runs...

Date: 12 March 1985 00:47-EST
From: Pandora B. Berman <CENT @ MIT-MC>
Subject: emacs for microcomputer
To: Blythe @ MIT-OZ
cc: BUG-EMACS @ MIT-MC

    Date: Thu, 7 Mar 1985  15:27 EST
    To:   CENT%MIT-OZ@MIT-MC.ARPA
    From: Blythe%MIT-OZ@MIT-MC.ARPA
    Subject: emacs for microcomputer
    I have a letter inquiring about the availability of EMACS for the DEC
    Rainbow 100.  Does this exist?  Thanks.

damned if i know. explanation: EMACS is a kind of editor, rather than a
particular implementation. the original one was written in TECO on ITS. it
was ported (almost unchanged) to TENEX/TWENEX.  A slightly different EMACS
was written in MacLisp on Multics. various other EMACes or almost-EMACes
have been written for other machines. as smaller machines have been
produced, various people have written EMACes or close-to-EMACS editors for
them. many of the editors for personal computers have varying degrees of
resemblance to the original EMACS. i don't know much about them, so i can't
comment on which would be the closest for the DEC Rainbow. maybe someone
else on BUG-EMACS can give you better information.

Received: from MIT-PREP by MIT-MC via Chaosnet; 11 MAR 85  17:20:58 EST
Received: by MIT-PREP.ARPA (4.12/4.7) 
	id AA00677; Mon, 11 Mar 85 17:20:35 est
Date: Mon, 11 Mar 85 17:20:35 est
From: Richard M. Stallman <rms@mit-prep>
To: info-gnu-emacs@mit-prep, info-emacs@mc
Subject: Question

Currently, when using an Ann Arbor Ambassador terminal,
GNU Emacs determines some screen settings (such as the
number of lines to use) from the TERMCAP and then sends
characters to the terminal to make it display that many lines, etc.

A user has complained about this, but I'm afraid to change
it because I don't know enough about people use those TERMCAP facilities
to know what's best in general.  GNU Emacs is working now the same
way the original editor I started with worked.

His suggestions are either make Emacs not set up the screen geometry
at all, thus assuming it is already set up as specified, or to make
it send the "init string" and assume that sets it up as specified.

Can any one tell me whether either of these actions is likely to work
properly?

Date: 9 March 1985 11:26-EST
From: Devon S. McCullough <DEVON @ MIT-MC>
To: BUG-EMACS @ MIT-MC

Typing the <Help> character in STRING SEARCH gives me the doc for I-SEARCH.
Maybe this is because I set SEARCH EXIT CHAR to be c-@ in my EMACS init.
I entered the mode by typing ^R^@ but don't know how to use it without doc!

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 4 Mar 85 11:07:53-EST
Date: Mon 4 Mar 85 08:06:13-PST
From: Mike Peeler <G.MDP@SU-SCORE.ARPA>
Subject: TECO VT1INI
To: Bug-EMACS@SU-SCORE.ARPA

    EMACS is not making sure my terminal is in absolute
cursor addressing mode.  If somehow my terminal happens to
be in scrolling-region relative addressing mode, I get weird
behavior after I have inserted or deleted a line, since the
scrolling region has been set to a small area around the
mode line.  The funny thing is, I think EMACS used to do
this right at one time.

    The solution, I think, is to add "$[?6l" to the string
at VT1INI in TECO.MID.  Incidentally, VT1RST uses "$[1;24r"
to reset the VT100 scrolling region.  Since lines 1-24 is
the default scrolling region, the "1;24" may be omitted,
leaving just the "$[r".

Regards,
   Mike
-------

Date: 28 February 1985 00:06-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
To: BUG-EMACS @ MIT-MC, CENT @ MIT-MC, GUMBY @ MIT-MC, billw @ SU-SCORE

I wasn't complaining -- it's great.  I just wondered if it was a new fix
for that problem.  Maybe we can scrounge up enough enthusiasm to get the
stuff documented (student labor?) and make a new honest-to-goodness release
of emacs.

Date: 27 Feb 1985 15:48-PST
Sender: BILLW@SU-SCORE.ARPA
Subject: Re:  news from the west
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: KLOTZ@MIT-MC.ARPA
Cc: BUG-EMACS@MIT-MC.ARPA, CENT@MIT-MC.ARPA
Cc: GUMBY@MIT-MC.ARPA
Message-ID: <[SU-SCORE.ARPA]27-Feb-85 15:48:53.BILLW>
In-Reply-To: The message of 27 February 1985 03:20-EST from Leigh L. Klotz <KLOTZ @ MIT-MC>

No, this is the same TEXTI that was availalable before, and
does not support break-on-8th-bit-set.  EMACS works OK, of
course, it just wont use TEXTI on terminals that have FSTTYFCI
turned on...

Sorry
BillW

Date: 27 February 1985 03:20-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject:  news from the west
To: BillW @ SU-SCORE
cc: BUG-EMACS @ MIT-MC, CENT @ MIT-MC, GUMBY @ MIT-MC
In-reply-to: Msg of 26 Feb 1985 01:59-PST from William "Chops" Westfield <BillW at SU-SCORE.ARPA>

Does this TEXTI fix work on terminals that send 8 bit characters -- those
with meta keys.  Last I heard it didn't.  That should be pointed out.
Sites like MIT with large numbers of AAA terminals (meta key, 80x60
screens) will not be able to use the TEXTI hack if it doesn't work with
8-bit input.

Date: 26 Feb 1985 01:59-PST
Sender: BILLW@SU-SCORE.ARPA
Subject: Re:  news from the west
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: GUMBY@MIT-MC.ARPA
Cc: CENT@MIT-MC.ARPA, BUG-EMACS@MIT-MC.ARPA
Cc: KLOTZ@MIT-MC.ARPA
Message-ID: <[SU-SCORE.ARPA]26-Feb-85 01:59:56.BILLW>
In-Reply-To: The message of 26 February 1985 02:07-EST from David Vinayak Wallace <GUMBY @ MIT-MC>

Sigh.  I guess since my message was forwarded to the list, I ought to give
a more technical description of what's been done...  Here is my understanding:

First of all, most of the changes have nothing to do with the version
that GUMBY installed at CSLI.  The only thing in common with that new
version is the "self-updating marks".  I am not sure exactly what self
updating marks are - The code has comments like "see end of TECORD.INFO",
and when I look there, I see nothing about self-updating marks.  I am
trying to track this down now...

The "current" version of EMACS is 163.  Unfortunately, there are several
versions of 163 around - some have separate TECTRM.MID files, and some
don't.  The v163 at SRI contains the original TEXTI code, but didn't have
its version bumped.  Although those modifications were announced over a year
ago, they didn't make it back into "standard" sources - largely because it
doesn't work unless you turn the new code on.

Meanwhile, at Stanford (I think) Ethan Bradford added the self-updating
mark code, and OZ has also made changes.  For better or worse, we are
calling the EMACS with S-U Marks but no TEXTI support version 164.

Version 165 comes about when Ethan merges his changes with the
new code on OZ, and then I add TEXTI support and the other
modifications mentioned in Cent's message.  Maybe it should
be called v166 after the efficiency improvements are in?

Here is a more technical description of the efficiency hacks:

	The TEXTI mods.  When at the end of a line (plus other conditions)
	use TEXTI to read and echo all the way up to a break character.
	TOPS20 has been modified not to echo the break character, and
	to solve other misfeatures that prevented this from being done
	in the past.  Both REL5 and REL6 have been thus patched.  DEC
	has said they will try to get this change into 6.1.  This is
	apparently a really big win if you use DECNet, because the echoing
	in texti is done on the local host.

	Rewrite ALL of the terminal drivers to buffer their output
	until the final return, at which point do the -N form of
	SOUT (instead of psout), which I have already optimized in
	the monitor.  No longer does code look like:
	  MOVEI A,33; PBOUT; MOVEI A,"H; PBOUT
	Instead it is effectively HRROI B,[$H], MOVNI 3,2; SOUT
	Recall the BLAST monitor patch approximately double the
	speed of this form of SOUT for short strings over normal
	PSOUT.  I don't have the heart to compare it to a succession
	of PBOUTS...

	use INSERT MODE terminal MUCH better.  Only go in and out of
	insert mode when absolutely necessary.  Right now, if you
	type ^U 4 A at the beginning of a line, EMACS will do:
	 INS-ON SPACE BACKSPACE INS-OFF "A"   four times! (and INS-ON
	can be a 4 character sequence on an ANSI terminal.) The new
	code does INS-ON "A" "A" "A" "A"  and doesn't turn off
	insert mode at all until characters are output that shouldn't
	be inserted.  The way that this is set up it is relatively
	easy to deal with terminals that can insert arbitrary large
	strings without padding, but normally the users typing speed
	is plenty of "padding".

That's been done.  This is what's still in progress:

	use CRLF, CR, LF for cursor positioning where possible.

And I'm sort of considering (in order of practicality):

	define an IDEAL terminal type.  This would be able to do all
	of the emacs functions in a maximum of two bytes. (on a 25x
	80 display.  Bigger terminals are not "ideal").

	make the IDEAL terminal type do the equivalent of TEXTI
	locally.  This would enable EMACS to use SINs for TTY
	input most of the time. (even better than TEXTI)
	Is this similar to MITs VTS or LEP stuff?  I dunno.

   The above are applicable because many of the "terminals" being
   connected to things these days are actually microcomputers, running
   terminal emulators.  Many of the terminal emulators can be modified.
   Perhaps the ethertip can emulate the IDEAL terminal and translate
   as appropriate for individual terminals.  SUNs can clearly do this.

	Do TEXTI locally in ethertip/sun via an extension to TELNET
	protocol (is there already a set break mask option?  I wish
	all of the TELNET options would be collected into one RFC!)
	6.1 (decnet phase 4) has a facility for doing TEXTI remotely,
	but I suspect that getting it to work over TCP/PUP.etc would
	be pretty hairy.

Most of these changes are at the system level - ie they will not
result in a highly visible improvement (like much faster screen
updating) to users, but should lessen the impact of emacs on the
system.  (they also assume the TTY IO is one of the most expensive
thing that emacs does, which isn't always or necessarily true.
For example, Kirk has suggested that one of the UNIX emacs's like
ELLE be brought up under the assumption that it is more efficient
by not having (interpreted) TECO as an intermediate level).


If anyone has any other suggestions, id be happy to take them
into consideration.


--------------------------------------------------

Now then, perhaps there are sites that find all this interesting,
and would like to get their hands on the code to see if they can
notice any performance differences (By the way, id really like to
hear from anyone who figures out a good way to MEASURE whether this
all helps or not.  Mere CPU time used by EMACS wont be all that
useful, since a lot of what is saved is things like context switching,
which doesn't show up in users runtimes).

The TEXTI code was done at SRI.  You can find a description and
source level patches in SRI-KL:<EMACS>TEXTI.MEM  It may be possible
to convert the source patches to object patches, but I don't know
of anyone who has done so.  Those of you running variations of
Stanford's monitors already have the patches.  Kirk Lougheed at
Stanford cleaned up the coding style and included everything in
STANSW's, and also made it work for version 6, when TTY buffers
are in extended sections.  The modules affected are TTYSRV, COMND,
and FILMSC (I think).

The most recent TECO, TECTRM, EMACS, and so on are at SCORE, in
PS:<EMACS165>.  Help yourself, and send bug reports back to me.

Bill Westfield

PS: I make no claims that any of this is READY for distribution yet.
    Only the impatient or the desperate should take the SCORE stuff
    now.  The changes in SRI-KL:<EMACS> have been running for a while
    and should be pretty stable though...

Date: 26 February 1985 02:07-EST
From: David Vinayak Wallace <GUMBY @ MIT-MC>
Subject:  news from the west
To: CENT @ MIT-MC
cc: BUG-EMACS @ MIT-MC, KLOTZ @ MIT-MC
In-reply-to: Msg of 26 Feb 1985 00:46-EST from Pandora B. Berman <CENT>

This appears to be the version of EMACS I brought up a SU-CSLI,
propagated around the Stanford campus?  If so, it's the version
on the tape which I gave to Leigh that he didn't give back to me
to clean up (hint hint).

Date: 26 February 1985 00:46-EST
From: Pandora B. Berman <CENT @ MIT-MC>
Subject: news from the west
To: BUG-EMACS @ MIT-MC

Date: Mon 25 Feb 85 17:39:00-PST
From: Rob Austein <G.SRA@SU-SCORE.ARPA>
Subject: found on score
To: cent@MIT-MC.ARPA
Reply-To: SRA@MIT-XX.ARPA
thought you might be interested in this.... --r
------------------------------------------------------------------------
I have a new version of EMACS that I would like to install on the various
SU TOPS20 systems as soon as possible.  However, this new EMACS contains a
lot of changes from the version that is currently running, so I would like
some of the more daring people out there to run the new EMACS and see if
they can find any bugs before I subject the general user community to this
version...

To run the new experimental version of EMACS, use the following commands
(or include them in your LOGIN.CMD file):

	DEFINE EMACS: PS:<EMACS165>,PS:<EMACS>,USYS:
	DEFINE EDITOR: PS:<EMACS165>XEMACS.EXE

Here is a brief outline on what is new in this version of EMACS.

Based on VERSION 163 EMACS (SU is currently using 162).  According to MIT,
V163 contains many undocumented changes from V162, that may some day be
documented... Sigh.  From this point, even more has been done, enough that
we are calling the current version V165.

Self-updating marks.  If you delete text that precedes a mark, the marks
	will all be updated so that they continue to point at the same
	place.

new terminal types.
	AVT, SUN, FR100, FR200, ANSI, AVTX, etc.

Performance improvements:
The performance improvements are the biggest change in this version of
EMACS.  Although many of these improvements will have little effect on
apparent user-level performance (eg they will not result in faster screen
updating), they are expected to significantly lessen the impact of EMACS on
the system as a whole - for a given number of EMACS users, the system load
average should be less...  Here is a breakdown of the areas that have been
changed:

  o  TEXTI
	Studies of EMACS use have shown that simple text entry accounts for
	most of the typein directed at EMACS (and editors in general).  The
	TOPS20 monitor and EMACS have both be changed to allow an entire
	line of text to be entered before it becomes necessary to wake up
	the users process and execute actual EMACS code.  The largest
	benefit from this is probably that echoing will occur at interrupt
	level and be essentially instantaneous regardless of system load
	(not including network delays, of course).

  o  Insert mode.
	EMACS has always operated under the assumption that terminals have
	an "insert character" operation, whereas most recent terminals have
	an "insert mode" instead.  By utilizing this feature, it is
	possible to reduce the number of characters that have to be output
	for each character inserted.
	
  o   SOUT improvements.
	Another study of EMACS performance pointed out that sending
	characters to a terminal is sort of an Achilles heel for TOPS20.
	Every character output was carefully looked at to figure out just
	how it should be output.  TOPS20 has been changed to do these check
	on a per-string basis (rather than per-character), which
	approximately halves the cpu time required to output a string for
	certain cases.  EMACS has be updated do use these forms of output
	more often.

Date: Tue 12 Feb 85 10:51:30-EST
From: Anthony J. Courtemanche <AC%MIT-OZ@MIT-MC.ARPA>
Subject: tag search
To: bug-emacs%MIT-OZ@MIT-MC.ARPA

The following bug happend to me today:

I was in the directory kansas:<scheme.scm> and visited the tag table
scm.taggen.  I then did a tag search for the string bignum-one.  After several
files, the search halted with the emacs error message ''DEBUG.SCM Marked
as Never Deleted''.  It put the file DEBUG.SCM into a buffer but it DELETED IT
FROM DISK.

This happened on oz via a supdup from Prep via a telnet from Athena.

--Anthony
-------

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 11 Feb 85 18:38:06-EST
Date: Mon 11 Feb 85 15:29:28-PST
From: Benjamin N. Grosof <GROSOF@SU-SCORE.ARPA>
Subject: same
To: bug-emacs@SU-SCORE.ARPA

Perhaps helpful is that two consecutive tab strokes seem to be what causes
the problem for me.

Benjamin
-------

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 11 Feb 85 18:31:15-EST
Date: Mon 11 Feb 85 15:26:48-PST
From: Benjamin N. Grosof <GROSOF@SU-SCORE.ARPA>
Subject: problem with tabbing
To: bug-emacs@SU-SCORE.ARPA

Hi (is it Mark?),

When I try to tab (i.e. hit the tab key on my Zenith z-29 keyboard) in
emacs text or mss mode, sometimes I go into "I-search" mode and can't
get out by just hitting control-g.

How can I tab then without getting such problems?

Benjamin
-------

Received: from MIT-MC by MIT-OZ via Chaosnet; 7 Feb 85 14:35-EST
Date: 7 February 1985 14:33-EST
From: David Vinayak Wallace <GUMBY @ MIT-MC>
Subject:  completion of buffernames
To: DJB @ MIT-OZ
cc: EMACS-Hackers @ MIT-OZ
In-reply-to: Msg of Wed 6 Feb 85 22:04:00-EST from Dave Braunegg <DJB at OZ>

Why not use c-m-x?  That's what it's for.

Date: Wed 6 Feb 85 22:04:00-EST
From: Dave Braunegg <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: completion of buffernames
To: EMACS-Hackers%MIT-OZ@MIT-MC.ARPA

Can anyone explain to me the difference between invoking a function
via meta-x and assigning it to a key?  Specifically, why does the
INSERT BUFFER function from the COMPLT library do buffer name completion
when I assign it to a key, but not when I invoke it via meta-x as
originally intended?  Does it have to do with the way the F^K handles
input?  It would be a really big win if the completion would work with
a meta-x.

Thanks,
Dave
-------

Date: Fri 1 Feb 85 20:36:24-EST
From: CHRIS J. KELLY <OAF.G.CHRIS%MIT-OZ@MIT-MC.ARPA>
Subject: EMULATION
To: BUG-EMACS%MIT-OZ@MIT-MC.ARPA


I AM A USER OF MIT-OZ WITHOUT ANY
TERMINAL EMULATION.I HAVE AN APPLE
II PLUS COMPUTER WITH A 300BPS 
MODEM,AND HAVE BEEN UNABLE TO
FIND ANY PRGM THAT WILL WORK FOR
ME TO PROVIDE TERMINAL EMULATION.

ABOUT ONE MONTH AGO I CREATED A
DRIVER FOR MY AS APPLE-CAT MODEM
THAT WILL ALLOW ME TO USE ALL (
MOST) ASCII CHARS.I WOULD LIKE TO
KNOW IF ANYONE WOULD LIKE TO
CREAT A TERMINAL TYPE THAT WILL
WORK THE WITH MY COMMUNICATIONS
DRIVER.I HAVE ALL THE INFORMATION
NEEDED TO DO SO.IF SUCH A TERMINAL
TYPE IS CREATED I COULD SHARE MY
DRIVER WITH OTHERS WHO HAVE APPLES
WITH CAT MODEMS,AND PERHAPS DISTRIBUTE
THE DRIVER SOFTWARE WITHIN THE NET.






-CHRIS (CANNOT EVEN TYPE DELETE NOW)

-------

Received: from wisc-gumby.arpa by MIT-XX.ARPA with TCP; Thu 31 Jan 85 17:11:26-EST
Date: Thu, 31 Jan 85 16:11:15 cst
From: mills@wisc-gumby.arpa (Michael Mills)
Message-Id: <8501312211.AA05269@wisc-gumby.arpa>
Received: by wisc-gumby.arpa; Thu, 31 Jan 85 16:11:15 cst
To: cole@sri-kl
Subject: IBM-PC editor
Cc: bug-emacs@mit-xx

Carnegie-Mellon CC recently switched to the Epsilon text editor and has
found it very reliable.  In my experience, it is the most accurate Emacs
type editor in that it almost completely mirrors the Emacs command set,
has similar macro and build-macro functions and even a primitive load-
library procedure.  I don't know how widely distributed it is but I
think it's made by Lugaru software and is relatively inexpensive (~$50).
It is also quicker and more reliable than editors that utilise swap
files (Mince).

							-M.D. Mills

Date: 30 Jan 1985  20:33 PST (Wed)
Message-ID: <FHSU.12083839630.BABYL@WASHINGTON>
From: Sam Hsu <fhsu@WASHINGTON.ARPA>
To:   bug-emacs@MIT-MC.ARPA
Subject: [Furuta: 20 Emacs]

This would be nice, but would take quite some work...
                   ---------------------------------
Date: Wednesday, 30 January 1985  13:24-PST
From: Richard Furuta <Furuta>
Re:   20 Emacs

Has anyone done the equivalent of Unix's M-X shell for Tops-20?

Date: Tue 29 Jan 85 10:25:03-PST
From: COLE@SRI-KL.ARPA
Subject: PC EMACS
To: bug-emacs@MIT-MC.ARPA
cc: cole@SRI-KL.ARPA, klotz@MIT-MC.ARPA, su-bboards@SU-SCORE.ARPA


Can anyone recommend a good (1. easy to use; 2. full-featured) EMACS lookalike
for the IBM PC?  Thanks.

Susan Cole (cole@sri-kl)
-------

Received: from SCRC-STONY-BROOK by MIT-XX via Chaosnet; 22-Jan-85 19:22:31-EST
Received: from SCRC-MERRIMACK by SCRC-STONY-BROOK via CHAOS with CHAOS-MAIL id 164264; Tue 22-Jan-85 19:14:45-EST
Date: Tue, 22 Jan 85 19:13 EST
From: Mike McMahon <MMcM@SCRC-STONY-BROOK.ARPA>
Subject: [JEUCK@SRI-KL.ARPA: MM and EMACS]
To: LARSON@SRI-KL.ARPA
cc: Bug-emacs@MIT-XX.ARPA, bug-mm@SU-SCORE.ARPA
In-Reply-To: The message of 22 Jan 85 17:47-EST from LARSON at SRI-KL
Message-ID: <850122191333.7.MMCM@MERRIMACK.SCRC.Symbolics.COM>

    Date: Tue 22 Jan 85 14:47:08-PST
    From: LARSON@SRI-KL.ARPA

    I have a Z29 terminal and have defined the keypad to do various
    functions under EMACS.  I also have set MM so that it enters the
    editor to enter text.  This works just fine and all my special
    keys function correctly.  If I exit (^X^Z) and return to the send
    prompt of MM and then change my mind and want to re-edit (edit to
    the send prompt) the keypad keys have their functions all
    scrambled.  They still do an EMACS function but not the one I had
    defined. 

If you want to load function keys and the definitions go away when emacs
resets the terminal, it isn't enough just to type out the load commands
in your init file.  Your init file must also arrange for FS TTY MACRO
(q.v.) to type out the commands when the terminal is re-inited.

Received: from SRI-KL.ARPA by MIT-XX.ARPA with TCP; Tue 22 Jan 85 17:48:22-EST
Date: Tue 22 Jan 85 14:47:08-PST
From: LARSON@SRI-KL.ARPA
Subject: [JEUCK@SRI-KL.ARPA: MM and EMACS]
To: Bug-emacs@MIT-XX.ARPA, bug-mm@SU-SCORE.ARPA

  Any ideas, folks?
	Alan
                ---------------

Mail-From: TERRY created at 22-Jan-85 14:39:42
Mail-From: JEUCK created at 22-Jan-85 14:00:04
Date: Tue 22 Jan 85 14:00:04-PST
From: JEUCK@SRI-KL.ARPA
Subject: MM and EMACS
To: action@SRI-KL.ARPA
cc: jeuck@SRI-KL.ARPA
ReSent-date: Tue 22 Jan 85 14:39:41-PST
ReSent-From: ACTION@SRI-KL.ARPA
ReSent-Sender: TERRY@SRI-KL.ARPA
ReSent-To: larson@SRI-KL.ARPA

I have a Z29 terminal and have defined the keypad to do various
functions under EMACS.  I also have set MM so that it enters the
editor to enter text.  This works just fine and all my special
keys function correctly.  If I exit (^X^Z) and return to the send
prompt of MM and then change my mind and want to re-edit (edit to
the send prompt) the keypad keys have their functions all
scrambled.  They still do an EMACS function but not the one I had
defined. 

Thanks for the help.
-------
Allan, if you are the correct person to contact of this problem.
Please respond and let me know what happen.

	Thanks
	Terry
-------

Date: Mon, 21 Jan 1985  18:00 EST
Message-ID: <PARKER.12081419697.BABYL@MIT-OZ>
From: Randy Parker <PARKER%MIT-OZ@MIT-MC.ARPA>
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
cc:   PARKER%MIT-OZ@MIT-MC.ARPA
subject:  M-X Date Edit


Why does M-X Date Edit (which inserts a date line as a comment
on the second line) move the point instead of
leaving it where it was?


Date: 19 January 1985 17:33-EST
From: Devon S. McCullough <DEVON @ MIT-MC>
To: BUG-EMACS @ MIT-MC

On ITS, it would be nice if when visiting a file such as DEVON GLOP, and it says

A buffer named DEVON already exists.
Type buffer name to use, or CR to re-use DEVON: 

the user could simply type ^Y to choose the fn2 as the buffer name.
Personally I'd rather not have to type CR afterwards.

Received: from WASHINGTON.ARPA by MIT-XX.ARPA with TCP; Thu 17 Jan 85 13:23:36-EST
Date: 17 Jan 1985  10:18 PST (Thu)
Message-ID: <FHSU.12080319842.BABYL@WASHINGTON>
From: Sam Hsu <fhsu@WASHINGTON.ARPA>
To:   bug-emacs@MIT-XX.ARPA

i answered BillW's question.

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Thu 17 Jan 85 00:02:20-EST
Date: 16 Jan 1985 20:59-PST
Sender: BILLW@SU-SCORE.ARPA
Subject: more than one version of emacs...
From:  William "Chops" Westfield <BillW@SU-SCORE.ARPA>
To: bug-emacs@MIT-XX.ARPA
Message-ID: <[SU-SCORE.ARPA]16-Jan-85 20:59:01.BILLW>

Is it possible to run more than one version of emacs on a (tops20)
systems at one time?  Basically, I guess what is needed is to have
it look at some logical name other than EMACS: for all of the libraries
and things that it loads...

Thanks
Bill W

Received: from MIT-MC by MIT-OZ via Chaosnet; 8 Jan 85 17:13-EST
Date: 7 Jan 85  13:59 EST (Mon)
From: _Bob <Carter@RUTGERS.ARPA>
To:   HENRY%MIT-OZ@MIT-MC.ARPA
Cc:   Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Subject: Count Words
In-reply-to: Msg of 1 Jan 1985  22:05-EST from HENRY%MIT-OZ at MIT-MC.ARPA

    Date: Tuesday, 1 January 1985  22:05-EST
    From: HENRY%MIT-OZ at MIT-MC.ARPA
    To:   Bug-Emacs%MIT-OZ at MIT-MC.ARPA
    Re:   Count Words

    Emacs should have M-X Count Words, just like Zwei.


Try loading the WORDCOUNT library.

_Bob

Received: from SRI-KL.ARPA by MIT-XX.ARPA with TCP; Wed 2 Jan 85 14:03:49-EST
Date: Wed 2 Jan 85 11:02:05-PST
From: LARSON@SRI-KL.ARPA
Subject: Emacs problem
To: bug-emacs@MIT-XX.ARPA

Date: Mon 24 Dec 84 09:47:17-PST
From: TEX82@SRI-AI.ARPA
Subject: Emacs problem
To: action@SRI-AI.ARPA
cc: Larson@SRI-AI.ARPA

Please relay the following problem to the appropriate EMACS maintainers.

The spelling corrector, operating in TeX mode, couldn't handle apostophes
properly.  E.g., it thought "publisher's" should be "publishers".

Leslie Lamport
-------

Date: Wed 2 Jan 85 10:52:10-PST
From: LARSON@SRI-KL.ARPA
Subject: [TEX82@SRI-AI.ARPA: Emacs problem]
To: bug-emacs@MIT-MC.ARPA

Date: Mon 24 Dec 84 09:47:17-PST
From: TEX82@SRI-AI.ARPA
Subject: Emacs problem
To: action@SRI-AI.ARPA
cc: Larson@SRI-AI.ARPA

Please relay the following problem to the appropriate EMACS maintainers.

The spelling corrector, operating in TeX mode, couldn't handle apostophes
properly.  E.g., it thought "publisher's" should be "publishers".

Leslie Lamport
-------
-------

Date: Tue, 1 Jan 1985  22:05 EST
Message-ID: <HENRY.12076221367.BABYL@MIT-OZ>
From: HENRY%MIT-OZ@MIT-MC.ARPA
To:   Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Subject: Count Words


Emacs should have M-X Count Words, just like Zwei.


Received: from MIT-MC by MIT-OZ via Chaosnet; 15 Dec 84 00:04-EST
Date: 15 December 1984 00:05-EST
From: David C. Plummer <DCP @ MIT-MC>
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
To: CJL @ MIT-OZ
cc: KLOTZ @ MIT-MC, rh @ MIT-EECS, Bug-EMACS @ MIT-OZ, Bug-OZ @ MIT-OZ

    Date: Wed, 21 Nov 1984  10:30 EST
    From: Chris Lindblad <CJL%MIT-OZ@MIT-MC.ARPA>
          rh%MIT-EECS@MIT-MC.ARPA
    In-reply-to: Msg of 21 Nov 1984  06:26-EST from Leigh L. Klotz <KLOTZ at MIT-MC>

        Date: Wednesday, 21 November 1984  06:26-EST
        From: Leigh L. Klotz <KLOTZ at MIT-MC>

        EMACS doesn't open files that it writes to directly.  It opens _TECO_
        OUTPUT or [TECO.OUTPUT, and then does a rename.  This causes several
        problems on certain operating systems.  For instance, LPT: doesn't support
        RENAME.

    I checked a little further, and discovered that the RENAME command has
    the same problem, so this seems to be a bug in RNAMF%. When a new file
    with FBBK0 word 0,,0 is renamed to an existing file with fbbk0 word
    1,,1, the resulting file has fbbk0 word 1,,1, where it should have 0,,0.

One would think DUMPER would also remember the creation date?  Or
does rename toss the new one away?

[All this kludgery I've seen suggested (and probably implemented
by now) is making my stomach turn.]

Date: 11 Dec 1984  19:02 EST (Tue)
Message-ID: <BRD.12070683098.BABYL@MIT-OZ>
From: "Bruce R. Donald" <BRD%MIT-OZ@MIT-MC.ARPA>
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
cc:   brd%MIT-OZ@MIT-MC.ARPA, sundar%MIT-OZ@MIT-MC.ARPA, djb%MIT-OZ@MIT-MC.ARPA
Subject:   Mkdump problem


When trying to save an emacs, (after running MKDUMP) I get the error
message
Libraries to be loaded not consecutive?

What does this mean? How do I fix it? And why did it work this morning
but not now?


Received: from MIT-XX by MIT-OZ via Chaosnet; 11 Dec 84 12:01-EST
Date: Tue 11 Dec 84 11:56:02-EST
From: Michael Travers <MT@MIT-XX>
Subject: WEBSTER from emacs
To: bug-webster@MIT-OZ, bug-emacs@MIT-OZ

It would be nice if the WEBSTER emacs library worked on systems that
use the chaosnet webster service.  If the dictionary files were not
found, it could look for SYS:WEBSTER.EXE and run it as a subfork.
-------

Date: Fri 7 Dec 84 16:00:35-PST
From: Ole Jorgen Jacobsen <OLE@SRI-NIC.ARPA>
Subject: Strange assumption
To: Bug-emacs@SRI-NIC.ARPA
cc: OLE@SRI-NIC.ARPA
Location: SRI International, Phone: (415) 859-4536


When you do a M-X Insert File$ FOO.BAR, Emacs defaults to the
version number of the current file being worked on, i.e if you
were editing RANDOM.TXT.26 and tried to insert UPDATE, it would
look for UPDATE..26 which it (usually) won't find. This is at
least a bad feature if not a bug.

<OLE>
<370>
-------

Date: Wed 5 Dec 84 13:15:04-PST
From: Sam Hsu <fhsu@WASHINGTON.ARPA>
Subject: i answered DMS' question
To: bug-emacs@MIT-MC.ARPA


-------

Received: from MIT-EECS by MIT-OZ via Chaosnet; 5 Dec 84 14:14-EST
Date: Wed, 5 Dec 1984  14:10 EST
Message-ID: <SE.RLK.12069056978.BABYL@MIT-EECS>
From: "Robert L. Krawitz" <SE.RLK@MIT-EECS>
To:   bug-emacs@MIT-OZ
cc:   rlk@MIT-EECS

Strange thing happened under following circumstances:

After logging in as se.rlk from supdup from mit-ford (system 94.39 for
now) --

I did ps5:out.

This is a trivicalc program written in CLUse.  I can provide the
sources.  Nothing much happened -- I ^C'd out and did a ter ans to
exec in case that was why my trivicalc didn't work.  I reset out and
tried again, again I ^C'd out because nothing happened.

I then did ter sup to reset the terminal type, and typed emacs.  I got
an error in error handler something about a q-register being
non-alphabetic or non-numeric or something like that.

I ^C'd, renamed my emacs.vars file to get it out of the way, and reset
emacs. I tried again, same result.

I finally logged out and back in, and got it to work.

Notes:

I will leave <se.hoops>out.exe (the full name of the program) on
oz:<zzz.rlk>out.exe or oz:<zzz.rlk.old-se>out.exe.  The sources for
that if you need them will be in the same place -- *.clu -- note that
the top-level module is named foo.clu.

Since you can't change a supdup terminal on oz, you'll have to move it
back to ee.  Before Monday you can log in as se.rlk, password hoops.

Robert^Z

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 3 Dec 84 19:18:26-EST
Received: from Pescadero by SU-SCORE.ARPA with TCP; Mon 3 Dec 84 16:02:41-PST
Date: Mon, 3 Dec 84 10:02:46 pst
From: Joseph I. Pallas <pallas@Pescadero>
Subject: Cure worse than disease
To: groening@Pescadero, mann@Pescadero
Cc: bug-emacs@score, nowicki@Pescadero

I made a version of the VGTS that respected the VT100 scroll region on
linefeeds.  It works fine.  However, when I tried to use it with Emacs
on a TOPS-20, I discovered something unfortunate--Emacs would set the
scrolling region to be lines 1-24, because it thought the terminal type
was VT100.  It left the region as 1-24 on exit, but the OS still believed
the terminal had 28 lines, and did its paged-output magic accordingly.

Result: top four lines of every page scroll off the pad.  This, I think,
is not good.

Suggestions?

joe

Received: from SU-SCORE.ARPA by MIT-XX.ARPA with TCP; Mon 3 Dec 84 18:52:05-EST
Received: from Pescadero by SU-SCORE.ARPA with TCP; Mon 3 Dec 84 15:48:05-PST
Date: Mon, 3 Dec 84 10:51:08 pst
From: Bill Nowicki <nowicki@Pescadero>
Subject: Re:  Cure worse than disease
To: groening@Pescadero, mann@Pescadero, pallas@Pescadero
Cc: bug-emacs@SU-Score

I assume that you were using "term sun" (which should be changed to
"term vgts or term vgts28") instead of "term vt100".  The "term sun"
command is the same as doing a term vt100 followed by a term page 28.
It sounds like Emacs has a bug, in that it should use the length
given by the OS instead of hardwiring in 24.  As a temporary measure,
just say "term vt100" to the exec, and it will page every 24 lines
instead of every 28.
	-- WIN

Date: Sun 2 Dec 84 16:37:10-EST
From: Dave Braunegg <DJB%MIT-OZ@MIT-MC.ARPA>
Subject: fill column for comments
To: Bug-Emacs%MIT-OZ@MIT-MC.ARPA

Is there any way to make the autofilling of comments look at a
variable other than Fill Column?

I would like the text in my TEX files to fill at the usual place but
have my TEX comments auto-fill out farther to the right as I type
them.

                                        Thanks,
                                        Dave
-------

Date: 1 Dec 1984  17:54 EST (Sat)
Message-ID: <DMS.12068049296.BABYL@MIT-OZ>
From: David Siegel <DMS%MIT-OZ@MIT-MC.ARPA>
Subject: dumped emacs saves old modeline
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

When I make a fast starting version of EMACS using the M-X Dump Emacs
command, the mode line that gets displayed when it is initially
invoked is the mode line that existed when emacs was dumped.  In
particular, the load average and date are wrong. This is really not a
mojor problem, but I was wondering if there would be a way to avoid
this.

-Dave

Received: from SRI-KL.ARPA by MIT-XX.ARPA with TCP; Thu 29 Nov 84 20:18:28-EST
Return-Path: <CHRISTY@SRI-AI.ARPA>
Date: Sat 24 Nov 84 17:46:58-PST
From: TEX82@SRI-AI.ARPA
Subject: EMACS bug
To: action, rms@MIT-OZ.MIT-Chaos
ReSent-Sender: CHRISTY@SRI-AI.ARPA
ReSent-To: bug-emacs@MIT-XX.ARPA
ReSent-From: BILLW at SRI-KL.ARPA (connected to REL5:<STANFORD.SYSDPY>)
ReSent-Date: 29 Nov 1984

When running a Meta-X command that I wrote myself, it bombs
EMACS with an 
?Illegal memory WRITE at 31431
message if I'm using a lot of buffers.  However, it runs fine
if there aren't many buffers.

Leslie Lamport
-------

Received: from MIT-MC by MIT-OZ via Chaosnet; 22 Nov 84 16:08-EST
Date: 22 Nov 1984 13:09-PST
Sender: BILLW@SRI-KL
Subject: Re: Emacs c-X c-W doesn't increment the "number of writes to...
From:  William "Chops" Westfield <BillW@SRI-KL.ARPA>
To: EB%MIT-OZ@MIT-MC
Cc: CJL%MIT-OZ@MIT-MC, Bug-EMACS%MIT-OZ@MIT-MC
Cc: Bug-OZ%MIT-OZ@MIT-MC, KLOTZ@MIT-MC
Cc: rh%MIT-EECS@MIT-MC
Message-ID: <[SRI-KL]22-Nov-84 13:09:45.BILLW>
In-Reply-To: <EB.12065359046.BABYL@MIT-OZ>

The floowing patch, distributed recently on TOPS20, is probably
what you'all need to fix this problem...

	
Date: Sun, 14 Oct 1984  12:02 EDT
From: "Leonard N. Zubkoff" <Zubkoff@TL-20B.ARPA>
To:   Tops-20@SU-SCORE.ARPA
Subject: Bug in Rnamf%

There is a bug in Rnamf% which can cause a file not to be incrementally dumped
by DUMPER.  When a disk file is renamed on top of an existing disk file,
thereby destroying the existing file, the .FBCNT word of the renamed file is
taken from the source file but the .FBBK0 word is taken from the existing file.
Note that this problem is obscure but does occur - the MacLisp compiler, for
example, opens a temporary output file and then renames it to be the correct
file, preserving the generation number from the source file; EMACS also can
tickle this if a file is written back to the same generation number, as it used
the same temporary output file renaming trick (BABYL files for example).  The
fix I applied is to change DSKREN to always zero the .FBBKn words of the
resulting file:

;UPDATE .FBCRE WORD IN FDB

	CALL UPDDTM		;GET CURRENT TIME IN A
	MOVE B,A		;COPY TO B
	MOVE A,DSTFDB		;GET DESTINATION FDB ADDRESS
	SKIPL B			;CURRENT DATE AND TIME KNOWN?
	STOR B,FBCRE,(A)	;YES, STORE INTO FDB

	SETZM .FBBK0(A)		;TL5 Set .FBBK0 to 0
	SETZM .FBBK1(A)		;TL5 Set .FBBK1 to 0
	SETZM .FBBK2(A)		;TL5 Set .FBBK2 to 0

	MOVE D,DIRORA		;GET ADR OF DIR AREA
	-----------------
		

Date: Wed, 21 Nov 1984  11:36 EST
Message-ID: <EB.12065359046.BABYL@MIT-OZ>
From: EB%MIT-OZ@MIT-MC.ARPA
To:   Chris Lindblad <CJL%MIT-OZ@MIT-MC.ARPA>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA,
      "Leigh L. Klotz" <KLOTZ@MIT-MC>, rh%MIT-EECS@MIT-MC.ARPA
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
In-reply-to: Msg of 21 Nov 1984  10:30-EST from Chris Lindblad <CJL>

    Date: Wednesday, 21 November 1984  10:30-EST
    From: Chris Lindblad <CJL>
    I checked a little further, and discovered that the RENAME command has
    the same problem, so this seems to be a bug in RNAMF%. When a new file
    with FBBK0 word 0,,0 is renamed to an existing file with fbbk0 word
    1,,1, the resulting file has fbbk0 word 1,,1, where it should have 0,,0.

If RNAMF% is changed, I think it should set the word to 0,,0
regardless of anything else.  Even if a @renamed file has been backed
up under the old name, it should get backed up again under the new
name.


Date: Wed, 21 Nov 1984  10:30 EST
Message-ID: <GZ.12065346996.BABYL@MIT-OZ>
From: Gail Zacharias <GZ%MIT-OZ@MIT-MC.ARPA>
To:   "Leigh L. Klotz" <KLOTZ@MIT-MC>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA,
      CJL%MIT-OZ@MIT-MC.ARPA, rh%MIT-EECS@MIT-MC.ARPA
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
In-reply-to: Msg of 21 Nov 1984  06:26-EST from Leigh L. Klotz <KLOTZ at MIT-MC>

    Date: Wednesday, 21 November 1984  06:26-EST
    From: Leigh L. Klotz <KLOTZ at MIT-MC>
    There are screws involved in doing it the other way -- something about if
    the system crashes.

The screw (aside from the possibility of leaving a partially written file)
is that on tnx, opening a file for write wipes out the old contents of the file
first, and starts writing the new contents second, so if the system crashes
you could lose both.

Is the problem that the reference counts get copied from the old file or
just that they don't get updated?  If the latter, emacs could reopen the
file for append after the rename, just to touch it.

Date: Wed, 21 Nov 1984  10:30 EST
Message-ID: <CJL.12065346926.BABYL@MIT-OZ>
From: Chris Lindblad <CJL%MIT-OZ@MIT-MC.ARPA>
To:   "Leigh L. Klotz" <KLOTZ@MIT-MC>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA,
      rh%MIT-EECS@MIT-MC.ARPA
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
In-reply-to: Msg of 21 Nov 1984  06:26-EST from Leigh L. Klotz <KLOTZ at MIT-MC>

    Date: Wednesday, 21 November 1984  06:26-EST
    From: Leigh L. Klotz <KLOTZ at MIT-MC>

    EMACS doesn't open files that it writes to directly.  It opens _TECO_
    OUTPUT or [TECO.OUTPUT, and then does a rename.  This causes several
    problems on certain operating systems.  For instance, LPT: doesn't support
    RENAME.

I checked a little further, and discovered that the RENAME command has
the same problem, so this seems to be a bug in RNAMF%. When a new file
with FBBK0 word 0,,0 is renamed to an existing file with fbbk0 word
1,,1, the resulting file has fbbk0 word 1,,1, where it should have 0,,0.

Received: from MIT-MC by MIT-OZ via Chaosnet; 21 Nov 84 06:24-EST
Date: 21 November 1984 06:26-EST
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject:  Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
To: CJL @ MIT-OZ
cc: rh @ MIT-EECS, Bug-EMACS @ MIT-OZ, Bug-OZ @ MIT-OZ
In-reply-to: Msg of Tue 20 Nov 1984  20:31 EST from Chris Lindblad <CJL%MIT-OZ at MIT-MC.ARPA>

EMACS doesn't open files that it writes to directly.  It opens _TECO_
OUTPUT or [TECO.OUTPUT, and then does a rename.  This causes several
problems on certain operating systems.  For instance, LPT: doesn't support
RENAME.

There are screws involved in doing it the other way -- something about if
the system crashes.

Maybe we should fix it or change it.

Date: Wed, 21 Nov 1984  01:24 EST
Message-ID: <PGS.12065247512.BABYL@MIT-OZ>
From: PGS%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

The documentation for C-M-$ says that it looks the word up in Webster's 7th,
unabridged.  Nope.  We have only an abridged version.

Date: Tue, 20 Nov 1984  20:31 EST
Message-ID: <CJL.12065194261.BABYL@MIT-OZ>
From: Chris Lindblad <CJL%MIT-OZ@MIT-MC.ARPA>
To:   Randy Haskins <rh%MIT-EECS@MIT-MC.ARPA>
Cc:   Bug-EMACS%MIT-OZ@MIT-MC.ARPA, Bug-OZ%MIT-OZ@MIT-MC.ARPA
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
In-reply-to: Msg of 20 Nov 1984  19:56-EST from Randy Haskins <rh at MIT-EECS>

    Date: Tuesday, 20 November 1984  19:56-EST
    From: Randy Haskins <rh at MIT-EECS>

									Actually,
    I'm not sure that it's the number of write count that matters, it's probably
    one of the bits in the backup word (like, "has this file been incrementally
    dumped?").  It's probably the fault of OPENF% or something like that, 
    though, not EMACS.

When dumper saves a file, it takes the left half of fbcnt (number of
writes to file) and stores it somewhere in the backup word in the fdb of
the saved file. When it is running an incremental save, it saves all
files that has the left half of fbcnt larger than the value in the
appropriate part of the backup word. If you modify a file, the left half
of fbcnt should be incremented. OPENF% normally increments this number
if a jfn is opened for write access. I don't know why, but when you c-x
c-w to an existing file, in EMACS, the left half of fbcnt is not
incremented. I suspect that EMACS is doing something tricky here, and is
screwing up. EMACS seems to be the only program that I have seen that
has this problem. 

Received: from MIT-EECS by MIT-OZ via Chaosnet; 20 Nov 84 19:53-EST
Date: Tue 20 Nov 84 19:56:05-EST
From: Randy Haskins <rh@MIT-EECS>
Subject: Re: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword
To: CJL@MIT-OZ
cc: Bug-OZ@MIT-OZ, Bug-EMACS@MIT-OZ
In-Reply-To: Message from "Chris Lindblad <CJL@MIT-OZ>" of Tue 20 Nov 84 17:38:47-EST

I've noticed this, too.  This is particularly annoying since for some
reason I have a habit of writing to the same generation most of the time,
except when I'm going to radically change something (this is probably because
I REALLY don't want to know how many times I've saved a file...).  Actually,
I'm not sure that it's the number of write count that matters, it's probably
one of the bits in the backup word (like, "has this file been incrementally
dumped?").  It's probably the fault of OPENF% or something like that, 
though, not EMACS.

Random
-------

Date: Tue, 20 Nov 1984  17:32 EST
Message-ID: <CJL.12065161666.BABYL@MIT-OZ>
From: Chris Lindblad <CJL%MIT-OZ@MIT-MC.ARPA>
To:   Bug-OZ%MIT-OZ@MIT-MC.ARPA, Bug-EMACS%MIT-OZ@MIT-MC.ARPA
Subject: Emacs c-X c-W doesn't increment the "number of writes to file" fdb halfword

When I c-X c-W to an existing file, the "number of writes to file" fdb
halfword for the file is not incremented. This is bad, because DUMPER
won't know that it needs to be backed up again.

Date: 18 Nov 1984  22:38 PST (Sun)
Message-ID: <FHSU.12064725880.BABYL@WASHINGTON>
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
Subject: Sun terminal entry - please add to distribution
To:   bug-emacs@MIT-MC.ARPA

I had requested a Sun "termcap" - BillW@SRI-KL gave me one that almost
worked.  It seems our version of telnet for the Sun-1 and Sun-2 cannot
fully emulate the vt100.  Here is my version, with the addition that
VT1CPS's 2nd JUMPE to remove a Y parameter if it's zero was removed.
The Sun could not recognize $[5H as $[5;1H, for example.
                           -----------------
SUNTB:	34.,,79.		;Nominally 34 lines; otherwise like AMB
	(%TOERS+%TOMVB+%TOMVU+%TOLWR+%TOLID+%TOCID)
	CALL VT1CPS
	CALL VT1CEL
	CALL VT1CES
	CALL VT1CLR
	JFCL
	CALL VT1DSM
	CALL VT1DMV
	CALL SUNILL
	CALL SUNDLL
	CALL AMINSC
	CALL AMDELC
REPEAT 3,JFCL			;(Reset, scroll up, scroll down)
	JFCL			 ; no ini code for SUN
	JFCL			;(Reset temporarily)
	CALL AMINV		;Set/reset inverse video mode
	CALL AMCINV

SUNILL:	HRLZI B,(BP)
	CALL VT1CPS
	MOVEI A,"L
	JRST AMDOIT

SUNDLL:	HRLZI B,(BP)
	CALL VT1CPS
	MOVEI A,"M
	JRST AMDOIT

Date: 18 Nov 1984  03:01 PST (Sun)
Message-ID: <FHSU.12064511678.BABYL@WASHINGTON>
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
To:   bug-emacs@MIT-MC.ARPA

One can't rebind ^_ ?  Apropos tells me I have I-Search on ^_ but ^_
says I have it on ^R Describe...

Date: 14 Nov 1984 12:42-EST
Received: from MIT-MC by MIT-OZ via Chaosnet; 14 Nov 84 12:47-EST
Sender: BIBERMAN@USC-ISI.ARPA
Subject: EMACS-BUGS
From: BIBERMAN@USC-ISI.ARPA
To: BUG-TEACH@MIT-AI.ARPA
Cc: BIBERMAN@USC-ISI.ARPA
Message-ID: <[USC-ISI.ARPA]14-Nov-84 12:42:07.BIBERMAN>
ReSent-From: GZ@MIT-OZ
ReSent-To: bug-emacs@mc
ReSent-Date: Thu 15 Nov 1984 05:34-EST

I AM TRYING TO LEARN EMACS USING A ZENITH Z-100 THRU THE ARPA
NETTO SAY THE LEAST I AM HAVING A GREAT DEAL OF TROUBLE.  ALMOST
NO COMMAND SUGGESTED FOR TRYING WITH THE TEACH-EMACS TUTORIAL
SEEMS TO WORK.  THE CONTROL V AND ESCAPE V DO WORK.  THE CONTROL
U DOES SOMETHING BUT THE CURVSOR FINDS ITS WAY TO THE BOTTOM
RIGHT AND ALMOST ANY COMMAND MAKES IT JUMP SOMEWHERE FOR A BRIEF
MOMENT THEN BACK TO THE BOTTOM RIGHT.  CONTROL N,P, DO NOTHING
EXCEPT MESS UP TEXT.

I AM NOT UNFAMILIAR WITH EDITORS.  I WAS TOLD EMACS IS GREAT.
I'D LIKE TO USE IT.NOW I USE WORDSTAR AND CREATE A FILE, I THEN
CALL THE FILE AFTER SETTING UP AN ADDRESS FOR A MESSAGE UNDER
HERMES AND ALL IS WELL.  BUT---IT WOULD BE NICE TO EDIT A MESSAGE
JUSAT TYPED ON HERMES UNDER "COMPOSE".  FOR EXAMPLE I TYPE LOTS
OFTYPOS LIKE THOSE YOU SEE.  THE SIMPLE TASK OF CLEANING UP SUCH
A MESSAGE WITH EMACS SEEMS BEYONG MY INTELLECT OR THAT OF MY
MACHINE..

I DO GO THRU A MODEM SOFTWARE PACKAGE CALLED MTERM THAT SERVES ME
WELL IN ALL OTHER SITUATIONS...THIS DRIVES A HAYES SMART MODEM AT
1200 BAUD.  ALL THIS GREATSTUFF PRODUCES TEXT WITH A FEW ERRORS
BEFORE EDITING AND COMPLETE HASH AFTER.

TELL ME PLEASE...WHEN USING C-N ETC., AND NO ACTION OCCURS EWVEN
AFTER A LONG WAIT...DO YOU THEN HIT RETURN?  WHEN I TRY TYO
FOLLOW A COMMAND WITH A RETURN I REALLY GET THE CRAZIES.

IF THERE IS SOMETHING SILLY I OVERLOOKED, I'D LIKE TO FIX IT, IN
MY MACHINE OR MY HEAD.  I AM ABOUIT CONVINCED THAT
EMACS+Z100+MTERM+HAYES+ME AS OPERATOR ARE INCOMPATABLE?  TELL ME
THERE IS A SIMPLE ANSWER.  I TYPE BADLY BUT HAVE BEEN USING THE
NET AND EDITOPRS FOR SEVERAL YEARS WITHOUT ANY TROUBLE TILL
NOW.....LUCIEN M.BIBERMAN

Date: 14 Nov 1984 14:42-PST
Sender: BILLW@SRI-KL
Subject: Re:  need terminal stuff for Sun
From:  William "Chops" Westfield <BillW@SRI-KL.ARPA>
To: SHSU@MIT-MC
Cc: BUG-EMACS@MIT-MC, BUG-TECO@MIT-MC
Message-ID: <[SRI-KL]14-Nov-84 14:42:28.BILLW>
In-Reply-To: The message of 14 November 1984 06:46-EST from Sam Hsu <SHSU @ MIT-MC>

See SRI-KL:<EMACS>TECTRM.MID  -   This includes a definition for the SUN,
and also two definitions for the HDS Concept AVT.  A SUN is basically
similar to an AAA with 34 lines of text.  (assuming the the SUN-1 VT100
terminal emulator/TELNet)

BillW

Date: 14 November 1984 06:46-EST
From: Sam Hsu <SHSU @ MIT-MC>
Subject:  need terminal stuff for Sun
To: BUG-EMACS @ MIT-MC, BUG-TECO @ MIT-MC

Anyone have the teco.mid terminal entry for a Sun workstation?  I don't
feel like making one up if someone already has one...

Date: Wed, 14 Nov 1984  06:45 EST
Message-ID: <PGS.12063470968.BABYL@MIT-OZ>
From: PGS%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

C-M-$ no longer works.  It complains about not being able to find a file on
W7:.  Presumably this has something to do with the new disk structure, and
thus can be easily fixed?

Date: Wed, 14 Nov 1984  06:45 EST
Message-ID: <PGS.12063470968.BABYL@MIT-OZ>
From: PGS%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA

C-M-$ no longer works.  It complains about not being able to find a file on
W7:.  Presumably this has something to do with the new disk structure, and
thus can be easily fixed?

Received: from MIT-MC by MIT-OZ via Chaosnet; 13 Nov 84 01:48-EST
Date: 12 Nov 1984  22:48 PST (Mon)
Message-ID: <[SRI-NIC].IAN.12-Nov-84 22:48:55>
From: Ian Macky <Ian@SRI-NIC>
To:   Philip E. Agre <AGRE%MIT-OZ@MIT-MC.ARPA>
Cc:   bug-emacs@MIT-OZ
Subject: Emacs C-M-$
In-reply-to: Msg of 12 Nov 1984  21:25-PST from Philip E. Agre <AGRE%MIT-OZ at MIT-MC.ARPA>

All the Webster stuff I've done uses the W7: device.  WB7: was what
Marty originally called it.  I changed it since the database creators
and documentors and other hangers-on referred to it as W7:...  so
the library or whatever that does C-M-$ ought to be updated to use
W7: and not WB7:

Date: Sun, 11 Nov 1984  14:12 EST
Message-ID: <MHS.12062765940.BABYL@MIT-OZ>
From: MHS%MIT-OZ@MIT-MC.ARPA
To:   BUG-EMACS%MIT-OZ@MIT-MC.ARPA
Subject: Bug in "File is off-line" error handling
Cc:   Mhs%MIT-OZ@MIT-MC.ARPA

I just got a "file is off line" error when I tried to examine it with the
command bound to E in Dired.  Immediately after getting the error message, I
typed "?" to get a list of DIRED commands, so I could see if there was one to
help me queue a retrieval request.  What I got was a teco stack trace.

I vaguely remember something mentioning that this was a feature; I'm not sure.
If it's not, then the symptoms above show a bug.  If it is, then it seems to
me that this feature is only useful to those who are teco hackers and can only
confuse the rest of us.

Perhaps this feature could be controlled with a switch, which defaults to off,
i.e. don't make "?" after an error mean something special.  That way, people
who don't know or don't care about handling teco errors don't have to contend
with "?" changing meaning out from under them, and the smaller group of people
actively teco hacking can keep their "?" habit.

(If you don't like the switch idea, a "file is off line" condition should not
be considered an error in the same sense that a real teco error is.  A real
teco error is unwanted and should be debugged, but a "File is off line"
condition is just rare.)

- Mark

Received: from MIT-APIARY-3 by MIT-OZ via Chaosnet; 31 Oct 84 23:16-EST
Date: Wednesday, 31 October 1984, 23:10-EST
From:  <Henry at MIT-OZ>
Subject: Per-file word abbrevs
To: Bug-Zwei at MIT-OZ, Bug-Emacs at MIT-OZ


Rather than having per-mode word abbrevs or global word abbrevs, 
usually what I really want is per-file word abbrevs. I use word
abbrevs extensively for names of functions and variables in Lisp 
code, or commonly typed words in papers. Per-mode word abbrevs aren't
right, because if you're editing two programs their word abbrevs will
clash, or if you're editing two papers. You also need the ability
to import abbrevs from one file to another. Sometimes with Lisp code
what you really mean is that the abbrevs are per-system, but per-file
would be good enough if you could import the abbrevs from the defsystem 
file, say, or perhaps defsystem ought to have a mechanism for this.
Also, using Meta-X Read/Write Word Abbrev File explicitly is a pain, it should
happen automatically with C-X C-F and C-X C-S [which I tried hacking but the
lack of per-file abbrevs didn't make it win].

What do you think? How easy would this be to do?


Received: from MIT-MC by MIT-OZ via Chaosnet; 30 Oct 84 20:00-EST
Date: Tue 30 Oct 84 16:58:18-PST
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
Subject: Re: Redefining I-Search
To: WANCHO@SIMTEL20.ARPA
cc: dar%MIT-EDDIE@MIT-MC.ARPA, emacs-hackers%MIT-OZ@MIT-MC.ARPA
In-Reply-To: Message from ""Frank J. Wancho" <WANCHO@SIMTEL20>" of Tue 30 Oct 84 15:25:00-PST

Frank,

The VT100 library should have a ^R VT100 I-Search already defined so that
the second ^\ does find the next occurance, and also defines another quote
character instead of ^Q.  If it doesn't, then it's out-of-date.  I do
remember installing my modified version to MIT somewhere... I forget if
it was XX or OZ.  What should happen is that normal i-search take the char
that called it and use it as the re-search command, and find the char that
quoted-insert is on and use that as the quote.
-------

Received: from MIT-MC by MIT-OZ via Chaosnet; 30 Oct 84 17:24-EST
Date: 30 Oct 1984  15:25 MST (Tue)
Message-ID: <WANCHO.12059655374.BABYL@SIMTEL20>
From: "Frank J. Wancho" <WANCHO@SIMTEL20>
Subject: Redefining I-Search
To:   Sam Hsu <FHsu@WASHINGTON>
Cc:   Doug Ruby <dar%MIT-EDDIE@MIT-MC>, emacs-hackers%MIT-OZ@MIT-MC,
      WANCHO@SIMTEL20
In-reply-to: Msg of 30 Oct 1984  09:27-MST from Sam Hsu <FHsu at WASHINGTON.ARPA>

Sam,

The problem with any library trying to redefine I-Search is that ^S
remains hardcoded for subsequent searches in the same search.  In the
case of the VT100 library, I believe it is ^\ that is defined to be
used instead of ^S.  Unfortunately, a second ^\ will terminate the
search instead of going on to the next occurrance of the string typed
so far.  It would be a significant and welcome improvement to the
VT100 library if *someone* could figure out how to redefine the search
terminators to be compatible with the concurrent redefinition of
I-SEARCH!

--Frank

Received: from MIT-MC by MIT-OZ via Chaosnet; 30 Oct 84 11:28-EST
Date: 30 Oct 1984  08:27 PST (Tue)
Message-ID: <FHSU.12059590180.BABYL@WASHINGTON>
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
To:   Doug Ruby <dar%MIT-EDDIE@MIT-MC.ARPA>
Cc:   emacs-hackers%MIT-OZ@MIT-MC.ARPA
In-reply-to: Msg of 29 Oct 1984  11:42-PST from Doug Ruby <dar at mit-eddie>

for ^S/^Q stuff, look at the vt100 library's "vt100 page mode".  it
should also have ^r vt100 i-search.  if not, let me know and i'll
install an updated vt100 library on xx or oz.

Received: from MIT-EDDIE by MIT-OZ via Chaosnet; 29 Oct 84 14:44-EST
Received: by mit-eddie.Mit-chaos.Arpa id AA14300; Mon, 29 Oct 84 14:42:28 est
Date: Mon, 29 Oct 84 14:42:28 est
From: Doug Ruby <dar@mit-eddie>
To: emacs-hackers@mit-oz

Do Emacs library files exist for replacing the ^S and ^Q functions with
alternatives for terminals such as the VT125 or over network connections
like DEC-20 DECnet? Is this in any of the standard dec-20 emacs distributions?

Date: 29 Oct 1984  11:00 PST (Mon)
Message-ID: <FHSU.12059355988.BABYL@WASHINGTON>
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
Subject: wordab question
To:   bug-emacs@MIT-MC.ARPA
Cc:   ecc@MIT-MC.ARPA

I use an init library and dump my environment.  I have WORDAB loaded as
part of this environment.  However, doing this has the following
implication: when I load BIBLIO, the wordab's defined in that library
don't work anymore.  For example, no matter what I do, it won't expand
the bibliographic entries.  Why?

Date: Tue, 23 Oct 1984  22:11 EDT
Message-ID: <ECC.12057861521.BABYL@MIT-OZ>
From: Eugene Ciccarelli <ECC%MIT-OZ@MIT-MC.ARPA>
To:   EB%MIT-OZ@MIT-MC.ARPA
Cc:   Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Subject: ";" in auto-fill mode.
In-reply-to: Msg of 23 Oct 1984  11:53-EDT from EB

This discussion seems to be a little misleading.  The default
EMACS global bindings of Comment Start is 0 (no comments), and
Text Mode doesn't bind it.  So in the default EMCAS, auto-filling
in Text mode works ok, i.e., it doesn't have the behavior EB
described.

The problem arises if you decide to set Comment Start globablly.
Then Text Mode WOULD have a Comment Start set -- since it does
not explicitly bind it off (to 0).  EB's EMACS.VARS file does
indeed set Comment Start.

Philisophical questions (about what it means to have a global
binding of Comment Start, and what a mode should specify) aside,
there is a simple fix for EB:  Have Text Mode Hook bind the
variable to 0.  I.e., change the EMACS.VARS entry to:

Text Mode Hook: "1M.L Auto Fill Mode
		 :I*.	 M.L Paragraph Delimiter
		 0M.L Comment Start
		 0M.L Comment Begin"

Received: from MIT-MC by MIT-OZ via Chaosnet; 23 Oct 84 19:35-EDT
Date: 23 October 1984 19:34-EDT
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject:  m-X Insert File with no argument
To: ZVONA @ MIT-OZ
cc: bug-emacs @ MIT-OZ

EMACS has a more primitive idea of file defaults than for instance Zwei.
You are getting the underlying TECO defaults for commands like
M-X Insert File which use F to read the argument.

Maybe you could re-bind M-X to ^R Instant Extended Command, which reads
the command and its arguments separately, with prompting and completion.
The disadvantages are having to type CR after each arg and not being able
to use - to repeat the command.


Received: from MIT-MC by MIT-OZ via Chaosnet; 23 Oct 84 19:27-EDT
Date: 23 October 1984 19:28-EDT
From: Leigh L. Klotz <KLOTZ @ MIT-MC>
Subject:  ";" in auto-fill mode.
To: FHsu @ WASHINGTON
cc: Bug-Emacs @ MIT-OZ, EB @ MIT-OZ
In-reply-to: Msg of 23 Oct 1984  11:41 PDT (Tue) from Sam Hsu <FHsu at WASHINGTON.ARPA>

    Date: 23 Oct 1984  11:41 PDT (Tue)
    From: Sam Hsu <FHsu at WASHINGTON.ARPA>
    To:   EB%MIT-OZ at MIT-MC.ARPA
    cc:   Bug-Emacs%MIT-OZ at MIT-MC.ARPA
    Re:   ";" in auto-fill mode.

    Perhaps there shouldn't be a comment character for text mode.  Doesn't
    seem necessary for text, whereas it may be good for fundamental mode
    where one might be writing CMD files or whatever.

    It's not that Emacs thinks it's a LISP comment; it just turns out that
    the default comment begin string is ";".

When I pointed this out to RMS a while back he said that he frequently
edits code in text mode, as in documentation or mail.  It's a shame we
don't have modes for regions and automagic recognition of which one to
use.  What does zwei do in text mode for M-;/autofill?  CCA EMACS
undefines the comment character and makes M-; beep.

Date: Tue, 23 Oct 1984  15:21 EDT
Message-ID: <ZVONA.12057786895.BABYL@MIT-OZ>
From: ZVONA%MIT-OZ@MIT-MC.ARPA
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: m-X Insert File with no argument

That this defaults the argument to the current file is random.  That
default is hardly ever useful.  I'd like to be prompted, but it ought
at least to be an error.

Received: from MIT-MC by MIT-OZ via Chaosnet; 23 Oct 84 14:43-EDT
Date: 23 Oct 1984  11:41 PDT (Tue)
Message-ID: <FHSU.12057779569.BABYL@WASHINGTON>
From: Sam Hsu <FHsu@WASHINGTON.ARPA>
To:   EB%MIT-OZ@MIT-MC.ARPA
Cc:   Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Subject: ";" in auto-fill mode.
In-reply-to: Msg of 23 Oct 1984  08:53-PDT from EB%MIT-OZ at MIT-MC.ARPA

Perhaps there shouldn't be a comment character for text mode.  Doesn't
seem necessary for text, whereas it may be good for fundamental mode
where one might be writing CMD files or whatever.

It's not that Emacs thinks it's a LISP comment; it just turns out that
the default comment begin string is ";".

Date: Tue, 23 Oct 1984  11:53 EDT
Message-ID: <EB.12057749052.BABYL@MIT-OZ>
From: EB%MIT-OZ@MIT-MC.ARPA
To:   Bug-Emacs%MIT-OZ@MIT-MC.ARPA
Subject: ";" in auto-fill mode.


There seems to be a problem with auto-fill in Text mode; whenever
						       ; there is a
						       ; semicolon in
						       ; a text line,
						       ; auto-fill
						       ; assumes it is
						       ; a LISP
						       ; comment.

Date: Sunday, October 21, 1984 4:08pm
From: Dirty Harry the <Dialup-Gunner%MIT-OZ@MIT-MC.ARPA>
To: USER-ACCOUNTS%MIT-OZ@MIT-MC.ARPA
cc: EMACS-HACKERS%MIT-OZ@MIT-MC.ARPA
Subject: EMACS-HACKERS was just assassinated by me.
The-Facts: Job 8 on TTY 14 running EXEC, idle for 10

Date: Fri, 19 Oct 1984  09:05 EDT
Message-ID: <ECC.12056669905.BABYL@MIT-OZ>
From: Eugene Ciccarelli <ECC%MIT-OZ@MIT-MC.ARPA>
To:   Sundar Narasimhan #Z#@OZ <SUNDAR%MIT-OZ@MIT-MC.ARPA>
Cc:   bug-babyl%MIT-OZ@MIT-MC.ARPA, bug-emacs%MIT-OZ@MIT-MC.ARPA
Subject: Bug inside babyl library
In-reply-to: Msg of 19 Oct 1984  05:26-EDT from Sundar Narasimhan #Z# at OZ <SUNDAR>

The Babyl library seems to be loading ok for the rest of us, and
it hasn't changed on OZ since April.  So, I expect the problem is
with your vars files.  I have looked at <SUNDAR>EMACS.VARS and
BABYL.VARS and am not sure exactly what the problem is, but have
a couple comments:

1. It is unclear from your bug message what exactly is happening,
in particular, how Babyl is being loaded.  It sounds like it is
being loaded from your EMACS.VARS file.  However, your current
EMACS.VARS, at least, does not load BABYL and you do not include
a sample of the file.  Perhaps you mean that you are loading it
by hand, either with M-X Load LibraryBABYL<return> or C-X R?

2. Your entry for Babyl Setup Hook in your BABYL.VARS has a bug:

Babyl Setup Hook: "1MMLoad LibraryBBOARDw
	...m: M.M Mail with template"

The hook contains Teco code, and that second line is not Teco --
that form is only handled by EMACS for VARS files.  I am also not
sure what the intent is behind that second line.  Is it intended
to bind C-M-M INSIDE Babyl? -- if so, you should know that,
unfortunately, the Babyl command processor does not handle C-M-
commands, and doesn't follow that command-binding convention (of
setting the q-register ...m or similar  qregs).

If the line is intended to bind a key within normal EMACS,
outside Babyl, there is also a problem:  you cannot bind an EMACS
key to a Babyl command since that command disappears when Babyl
is unloaded.  UNLESS you will arrange your VARS file to keep
Babyl loaded at all times.  (Which brings us back to point 1
above.)

In summary, we need more information.  First, just try removing
that second line of the hook and see if that helps at all.  Then
provide us with the intentions of the VARS files (as regards
Babyl) and the relevant code from the files or the manner in
which you load Babyl.

Date: 19 Oct 1984  05:26 EDT (Fri)
Message-ID: <SUNDAR.12056629999.BABYL@MIT-OZ>
From: Sundar Narasimhan #Z#@OZ <SUNDAR%MIT-OZ@MIT-MC.ARPA>
Subject: Bug inside babyl library
To:   bug-emacs%MIT-OZ@MIT-MC.ARPA, bug-babyl%MIT-OZ@MIT-MC.ARPA

Is there something wrong with the babyl library inside emacs ?
When I try loading it, it bombs with IQN-Invalid Q-Register name ?
(Consequently the statement screws up all the other declarations that
come after it in my vars file ).
					Sundar.

