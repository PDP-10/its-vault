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


Received: from MIT-AI.ARPA by MIT-MC.ARPA via Chaosnet; 6 DEC 85  02:42:27 EST
Date: Fri,  6 Dec 85 02:41:06 EST
From: "Pandora B. Berman" <CENT%MIT-AI.ARPA@MIT-MC.ARPA>
Subject: test
To: info-emacs@MIT-MC.ARPA
Message-ID: <[MIT-AI.ARPA].8029.851206.CENT>

this is a test to check for obsolete addresses. if you get this, just 
delete it.

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

Date: 13 Apr 84 17:43:21 EST
From: Jeffrey Shulman <SHULMAN@RUTGERS.ARPA>
Subject: EMACS not updating the cursor position
To: info-emacs@MIT-MC.ARPA
cc: dolphin-users@SUMEX-AIM.ARPA


	Our EMACS seems to have developed a strange problem lately that
nobody can explain (there are no apparent software changes):

	Over an Interlisp-D CHAT connection, EMACS is not responding to
cursor positioning commands sent by the mouse.  For example, the mouse
would say C-U 4 C-F and the cursor would just stay still.  If you
refresh the screen with a ^L you *will* find the cursor in the correct
place.  If you type the command by hand it works!  We have determined
that EMACS *is* seeing the commands (via ^_L) but is *not* sending
cursor positioning back to the NVT (running EMACS under PHOTO.)  It
*did* work about two weeks ago just fine but is not working now.  Does
anyone have any possible explaination?

						Jeff
P.S.  The particulars are:
	The CHAT program emulates a DM2500
	We are using EMACS version 162 on a DEC-20
-------

Date: 18 February 1984 00:53 EST
From: Pandora B. Berman <CENT @ MIT-MC>
Subject: test
To: INFO-EMACS-RECIPIENTS @ MIT-MC

this is a test for losing addresses. please ignore.

Date: Tue 14 Feb 84 21:47:53-CST
From: Karl Nyberg <Cmp.Nyberg@UTEXAS-20.ARPA>
Subject: Elle (or Emacs for 11/70)
To: info-emacs@MIT-MC.ARPA

DOes anyone know about the availability of Elle (Elle Looks Like Emacs)
for the 11/70?  Or any other ersatz EMACS for the 11/70 for that matter?
Thanks.
-- Karl --
-------

Date: Thu 2 Feb 84 23:32:39-EST
From: RMS%MIT-OZ@MIT-MC.ARPA
Subject: Last laugh
To: info-emacs@MIT-MC

A similar EMACS can be had free from Fen Labalme at Megatest.
Phone (408) 298-6850.  He is eager to distribute it.
-------

Date: Thu, 2 Feb 84 19:53 EST
From: David Vinayak Wallace <Gumby@MIT-MC.ARPA>
Subject: EMACS name
To: Mark Crispin <MRC@SU-SCORE.ARPA>
Cc: Info-EMACS@MIT-MC.ARPA
In-reply-to: The message of 2 Feb 84 17:16-EST from Mark Crispin <MRC at SU-SCORE>

    Date: Thu 2 Feb 84 14:16:40-PST
    From: Mark Crispin <MRC@SU-SCORE.ARPA>

	 There is an advertisement for Gosling's EMACS in the December 1983
    issue of the "VAX/RSTS Professional", page 81....

	 Too bad RMS didn't trademark the name "EMACS"...

I've seen unix people get very hostile (!) when you mention that EMACS
didn't originate under Unix.


Date: Thu 2 Feb 84 14:16:40-PST
From: Mark Crispin <MRC@SU-SCORE.ARPA>
Subject: chuckle
To: Info-EMACS@MIT-MC.ARPA
Postal-Address: 725 Mariposa Ave. #103; Mountain View, CA 94041
Phone: (415) 497-1407 (Stanford); (415) 968-1052 (residence)

     There is an advertisement for Gosling's EMACS in the December 1983
issue of the "VAX/RSTS Professional", page 81.  They want $395 up for
the binary, $995 up for the source.  This is a version that is claimed
to run on VAX and 68000.  The company is UniPress Software in Highland
Park, NJ.

     Too bad RMS didn't trademark the name "EMACS"...
-------

Date: Mon 8 Aug 83 17:10:47-PDT
From: Scott Jenson <JENSON@SUMEX-AIM.ARPA>
Subject: Recompile problems...
To: info-emacs@MIT-MC.ARPA

To whom it may concern,

	When the SUMEX DEC-2060 computer facility here at Stanford first
started, we got our EMACS lock stock and barrel from another 2060 on campus.
Things have been great until we tried to write our own changes to the
source code. In recompiling, the following seems to work fine:

@midas
*temp_teco
@iddt
*;ytemp
*purify$g

But, the next line:

*mmrun$purify$dump$nemacs.exe$

Bops you into an emacs buffer and flashes a "Attempted to macro a
meaningless number?" error at you. Does anyone know of any host quirks
that may cause this? And while we're at it, is there any documentation of
any kind on general EMACS support, this hit and miss approach that we're
using is just plain tedious.

Thanks in advance,

--Scott Jenson<JENSON@SUMEX-AIM.ARPA>
-------

Date: Mon 8 Aug 83 17:10:47-PDT
From: Scott Jenson <JENSON@SUMEX-AIM.ARPA>
Subject: Recompile problems...
To: info-emacs@MIT-MC.ARPA

To whom it may concern,

	When the SUMEX DEC-2060 computer facility here at Stanford first
started, we got our EMACS lock stock and barrel from another 2060 on campus.
Things have been great until we tried to write our own changes to the
source code. In recompiling, the following seems to work fine:

@midas
*temp_teco
@iddt
*;ytemp
*purify$g

But, the next line:

*mmrun$purify$dump$nemacs.exe$

Bops you into an emacs buffer and flashes a "Attempted to macro a
meaningless number?" error at you. Does anyone know of any host quirks
that may cause this? And while we're at it, is there any documentation of
any kind on general EMACS support, this hit and miss approach that we're
using is just plain tedious.

Thanks in advance,

--Scott Jenson<JENSON@SUMEX-AIM.ARPA>
-------

Date: 21 July 1983 04:32 EDT
From: Kent M. Pitman <KMP @ MIT-MC>
Subject: Change to the MODLIN library
To: INFO-EMACS-RECIPIENTS @ MIT-MC

The MODLIN library now supports a new option, which allows you to see your
filenames in inverted order (as on a Lisp Machine, if you're familiar with
that). The variable is Invert Filenames, which defaults to 0 (the old behavior).
If you set it to 1, you get inverted filenames. eg,

  Normal		Inverted
  FOO;BAR >		BAR > FOO;		on ITS
  PS:<FOO>BAR.TXT	BAR.TXT PS:<FOO>	on Twenex

This may be useful for people who care more about what filename they are editing
than what directory it is on and who typically use filenames long enough that
some part of the filename gets trucated in their modeline for lack of space.

This features is available in MODLIN version 67, which has been distributed
to XX, ML, MC, DM, and OZ. Sources are on MC: EMACS1; MODLIN 67 and
OZ:PS:<EMACS>MODLIN.EMACS.67

Please report bugs to KMP@MC.
-kmp

Date: 4 June 1983 16:00 EDT
From: Richard P. Wilkes <RICK @ MIT-MC>
Subject:  HELP!
To: INFO-EMACS-RECIPIENTS @ MIT-MC

I have several files which only have ^M as a line ender
instead of CR-LF.  I cannot seem to get the Replace String
function to work since the search doesn't recognize the ^M
alone and the control prefix doesn't work either.

Help!  These files are unreadable unless I can change the CR
to CR LF. -r

Date: 14 May 1983 18:27 EDT
From: Kent M. Pitman <KMP @ MIT-MC>
Subject: SKETCH Library
To: INFO-EMACS-RECIPIENTS @ MIT-MC

I had a Sketch library which a few people were using and it had a number
of misfeatures that people didn't seem to like, so it's just been redone
in an incompatible-but-better (I hope) way.

Loading the library SKETCH will set up c-m-S as a dispatch character for
Sketch commands. You can create libraries of sketches and list the contents
of such libraries. You can insert, edit, or view existing sketches from
a library.

The library is mostly self-documenting. A few relevant things that are
not really documented anywhere...

Anything in the sketch which has angle brackets around it will be prompted
for. Hence, you can have a sketch like:

 Dear <Name>,

 Hi, how are you?

and it will prompt "Name: " when you try to insert it, making the obvious
replacement. If you want to put a "<" into a sketch, put control-Q before it.
Also, the character "~" is used to mark the position in the sketch where
you want the cursor to end up. As you might expect, control-Q will quote it.
Also, the format of sketch libraries has changed; control-L separates entries
(also requiring control-Q if it wants to exist in a sketch).

Apologies for any problems this incompatibility will cause. I think the
general effect will be for the better.

Non-MIT maintainers can get the new library from MC:EMACS1;SKETCH 51 or
from OZ:PS:<EMACS>SKETCH.EMACS.51

Send questions/bugs to KMP@MIT-MC.
--kmp

