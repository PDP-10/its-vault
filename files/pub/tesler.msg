5-NOV-74  0038		network site MAXC
 Date:  5 NOV 1974 0038-PST
 From: TESLER at PARC-MAXC
 Subject: NEW VERSION OF PUB
 To:   JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 
 I had planned to ask each site to put this up one at a time, but
 on second thought I think I can handle simultaneous revisions
 AS LONG as they are minor.  That is, go ahead and take the sources,
 make whatever fixes are necessary to get them working, but
 please do not add new features this time around if you can help it.
 
 The files you will need are listed in <PUB>PARCSAIL.FTP,
 plus PUBSTD.DFS.  If you fetch *.SAI,*.CMD, and PUBSTD.DFS,
 that will do it as well, plus some spurious files.
 
 I don't know where all the UNCVFILs have gone, but I think that
 CMU and MIT will have to define them again in FILES.SAI.
 
 SITE.SAI has conditional compilation switches you should set.
 For MIT, both ITSVER and SAILXGP are true.  For CMU, it is
 CMUVER and CMUXGP.
 
 Your PUBSTD.DFS is probably OK, but compare with mine.  I changed
 SINGLE-DOUBLE-TRIPLE SPACE to use the new SPACING declaration.
 SPACING 1 = SPREAD_2 = SPACING 1 LINE
 The point is you can also say SPACING 20 MILLS or PREFACE 1 INCH.
 That's all the mill stuff I have added so far.  Soon, SKIPs.
 Anyway, to make it work at your site, find the last occurrence of
 RASTVERTI in PASS2.SAI and fill in your code (at that
 point INTRA is zero, your global interline sppacing is zero;
 this only happens if NEEDVERTI i.e., SPACING n MILLS or PREFACE n MILLS
 was used).
 
 Also the last part of my PUBSTD.DFS is a PARC font equivalence table
 which only applies here because we have so many fonted devices.
 Don't take it -- it slows down PUB measurably to read it.
 
 This version is 5% faster than the last.  Maybe faster ones in the
 future.
 
 A guide to the sources...
 
 PROCS.SAI is an alphabetical list of nearly every procedure in pass
 one.  It is machine-generated, and used to provide EXTERNAL,
 INTERNAL, and FORWARD declarations at compilation time.  PUBLIC
 means INTERNAL/EXTERNAL; PRIVATE means local to a file.
 
 The $"# after every procedure declaration that is PUBLIC or PRIVATE
 is necessary for my PROCS generator to work.  Things are
 DEFINEd such that all compiles.
 
 The files to compoile are shown in COMPILE.CMD; load methods that
 are known to work are in LOAD.CMD, LOAD2.CMD.  Read ABC, DEF,
 PQR, and STUVX, as well as PASS1 and SHARE to see what is going on.
 COMMON and SITE as well as DATUM and FONTS are read by both passes
 one and two.
 
 Current sources are at both SUAI and PARC on <PUB>.
 
 If you want a warning printed when there is a character not
 defined in the current font, add your code to FONTS.SAI's
 SETDEVICEPARAMETERS (MINCHARW) and also to XLENGTH.
 
 Yell if anything goes wrong.
 -------
 


28-OCT-74  1806		network site MAXC
 Date: 28 OCT 1974 1804-PST
 From: TESLER at PARC-MAXC
 Subject: VERTICAL SPACING PROPOSAL AND QUESTIONS FOR YOU
 To:   JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 
 Mill specifications in PUB will not be implemented all at once in
 November, but rather in increments over a period of months.
 
 Step 1 is to give pass 2 a vertical spacing capability. I have in
 mind a vertical analog to justification. SKIP N is like DELTA+N; SKIP
 TO LINE N IS LIKE DELTA(N); column break is like line break;
 inter-line spacing is like inter-character spacing; and inter-
 paragraph spacing is like word breaks.
 
 One could specify "vertical justify" mode in which the lines of a
 column were spread out to fill the column -- except for a calf column
 (explicit NEXT PAGE analogous to BREAK). Another mode would spread
 paragraphs apart but not lines within a paragraph.  Spreading would
 be suppressed above vertical tabs (SKIP TO LINE N).
 
 SKIP, SPREAD, and PREFACE could be specified in mills. This could
 vary dynamically throughout the document.
 
 The question is, can your XGP service systems support dynamically
 changing vertical spacing (a) on a 1-column page, and (2) on a
 multi-column page. On our XGP, what we will do is set the
 document-global inter-line spacing to 0 and precede every line with a
 vertical skip directive.  Things can be set up so that if the feature
 was never encountered in pass 1 -- or if a site could not support the
 feature -- then the global inter-line spacing would be set and things
 done as before.
 
 I plan to start coding this right after the "sneak" feature, which is
 scheduled for this coming weekend. I would make pass 2 as general as
 I can, but for the moment limit pass 1 -- probably to specifying a
 mill preface and/or spread, maybe limited to one-column text.
 
 No word yet from ISI on their attempts to bring up PUB.î
 -------
 


22-OCT-74  2111		network site MAXC
 Date: 22 OCT 1974 2110-PDT
 From: TESLER at PARC-MAXC
 Subject: Proposed SNEAK Feature
 To:   JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 cc:   fiala
 
 The command
 SNEAK '177&"D"&37
 would sneak into the current text line the four characters:
 '177 '104 '63 '67
 without counting them towards filling and justification.
 If this occurs after a BREAK but before a new paragraph is begun,
 a new paragraph will be begun with the snuck characters as its
 first; but in VERBATIM mode (sorry) this new paragraph will be
 BREAKed (??) immediately (sic).
 The purpose of this feature would be to provide postprocessors
 of document files with control information.
 Usually, sites would declare macros like
 .macro GRONK(FLUTZ) $(SNEAK '177&"G"&FLUTZ&".")$
 so users could say {GRONK 52~ for short.
 The octal constants normally illegal in PUB (like '177) would be
 legal in the argument of SNEAK.
 This feature is similar to PICHAR, but different.
 Please comment soon if you have an opinion; I want to
 put this in for PARC use.
 -------
 

9-OCT-74  1634		network site MAXC
 Date:  9 OCT 1974 1632-PDT
 From: TESLER at PARC-MAXC
 Subject: PROPOSED CHANGE IN PUB'S XGP MODE
 To:   Pub-users:, JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 
 Now, if an area is declared to be say 50 lines high, it becomes
 approximately 50*(height of font 1) raster units high,
 while if it is declared 60 chars wide, it becomes exactly
 60*CHARW raster units wide.
 This makes computation of area height quite painful for
 users, so I propose a variable CHARH analogous to CHARW, to be
 used in an analogous manner.
 Eventually, PUB may have specifications in standard units like MILLS
 or INCHES, and this is a step in that direction, but easier to
 implement.
 Objections should be filed within 3 days or it will be done.
 -------
 
9-OCT-74  1727		network site MAXC
 Date:  9 OCT 1974 1727-PDT
 From: TESLER at PARC-MAXC
 Subject: SOME USERS REPLIED ALREADY
 To:   TAFT, JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 
 BACKWARD COMPATIBILITY.
 
 One way would be to default CHARH to the height of font 1 plus the
 intra-line spacing. However, this would defeat the purpose of the
 change, which is to have users be confident that a vertical inch is 6
 "LINES" and a horizontal inch is 12 "CHARS" regardless of font.
 
 Therefore, I propose that users desiring backward compatibility for
 existing manuscripts should insert the statement:
 
 	CHARH _ !XGPFONTHEIGHT(1) + !XGPINTRA ;
 
 after their FONT declarations.  I will add to PUB the functions
 !XGPFONTHEIGHT(fontid) and !XGPFONTWIDTH(fontid,character) to
 facilitate this and similar tasks.
 -------
10-OCT-74  1148		network site MAXC
 Date: 10 OCT 1974 1151-PDT
 From: TESLER at PARC-MAXC
 Subject: CHARH
 To:   BH at SU-AI
 
 I see what you mean.  There seems to be no good
 solution other than to implement mill specifications:
 
 AREA HEADING TOP 500 MILLS HEIGHT 800 MILLS LEFT 1300 MILLS RIGHT 1300
 MILLS ;
 
 With possible pairs being TOP-HEIGHT TOP-BOTTOM LEFT-WIDTH
 LEFT-RIGHT INNER-WIDTH INNER-OUTER.  INNER means the inside margin
 of a book, i.e., ODDLEFTBORDER.
 
 Specifications in LINES should be converted to mills by
 multiplication by the height of font 1.  CHARS would be converted
 by CHARW.  Or maybe the height of the current font is better as
 you suggest.  I do NOT think I will get around to the nice temporary
 area declarations you would like.
 
 PAGE FRAME WIDTH 8500 MILLS HEIGHT 11000 MILLS
 would be standard but redeclarable for legal size paper or whatever.
 Some installations would clip areas coming too close to
 the frame.
 
 If this suggestion helps your world, tell me and I will
 (1) Look into the implementation;
 (2) Ask everybody else their opinion.
 -------


11-OCT-74  0925		network site MAXC
 Date: 11 OCT 1974 0925-PDT
 From: TESLER at PARC-MAXC
 Subject: 80-LINE PROPOSAL FOR MILL SPECIFICATIONS IN PUB
 To:   JOHNSSON at CMU-10A, BH at SU-AI, PJ at MIT-AI,
 To:   TUGENDER at ISI-DEVTENEX, TESLER
 
 There was some vigorous objection to the CHARH proposal on the
 grounds that 20 lines should be 20 lines and not a pseudonym for
 3.333 inches.  If someone wants 3.333 inches they should say 3333
 mills.
 
 After looking at the code, I am willing to provide the following new
 facilities.
 
 	PAGE FRAME <distance> WIDE <distance> HIGH
 	TEXT|TITLE AREA <name>
 		{<measurement><distance> | <LINES|CHARS> i [TO j]~...
 		[IN c COLUMNS <distance> <WIDE|APART>]
 	TOPBORDER
 
 where TOPBORDER along with EVENLEFTBORDER and ODDLEFTBORDER specify
 the displacement of the page frame from the edges of the paper;
 
 where <distance> is for example:
 
 	350 mills
 	4 inches
 	16 lines
 	1 char
 
 and <measurement>s come in pairs of:
 
 	TOP-BOTTOM or TOP-HEIGHT or BOTTOM-HEIGHT
 	LEFT-RIGHT or LEFT-WIDTH or RIGHT-WIDTH
 
 TOP, BOTTOM, LEFT, and RIGHT all specify borders, e.g., BOTTOM
 <distance> is the distance from the bottom of the area to the bottom
 of the page frame.  If a measurement pair is omitted, its borders
 default to 0-0.
 
 All distances are converted to mills at declaration time. Conversions
 of CHARS and LINES to mills use the factors CHARWIDTH and LINEHEIGHT,
 which can be set by the user.  For compatibility, CHARW settings in
 raster units will be converted to CHARWIDTH, and LINEHEIGHT will be
 initiallized to the height of font 1.  Brian Harvey suggests a slight
 incompatibility, namely that LINEHEIGHT be continuously recomputed in
 terms of the current font instead of font 1.  Thus, SELECT 3 followed
 by an AREA declaration would consider the LINES of the area to be
 font 3 lines.  Negative values of LINEHEIGHT would indicate
 stickiness, i.e., font changes would not affect them.
 
 The third distance associated with each measurement pair (e.g., WIDTH
 with LEFT and RIGHT) will be computed at the time the area is opened
 on each page; thus if the PAGE FRAME has changed in the meantime, the
 borders will remain as declared.
 
 Defaults would vary at different sites.  Examples:
 
 	EVENLEFTBORDER_ODDLEFTBORDER_1300
 	TOPBORDER_1000
 	PAGE FRAME 6900 MILLS WIDE 9000 MILLS HIGH
 	TITLE AREA HEADING TOP 0 MILLS HEIGHT 600 MILLS
 	TEXT AREA TEXT TOP 650 MILLS BOTTOM 200 MILLS
 	TITLE AREA FOOTING BOTTOM 0 MILLS HEIGHT 150 MILLS
 	PLACE TEXT
 
 Mill-valued variables and functions available to the user include:
 
 	AREALEFT, AREARIGHT, AREAWIDTH,
 	AREATOP, AREABOTTOM, AREAHEIGHT,
 	AREACOLUMNS, COLUMNLEFT, COLUMNRIGHT, COLUMNWIDTH,
 	LMARGMILLS, RMARGMILLS, INDENT1MILLS, etc.,
 	FONTWIDTH(fontname,character), FONTHEIGHT(fontname),
 	XCOLUMN, YCOLUMN, XFRAME, YFRAME, XROOM, YROOM
 
 XCOLUMN and YCOLUMN give the current text position relative to the
 upper left corner of the current column.  XFRAME and YFRAME give them
 relative to the page frame. XROOM and YROOM are the balance unused in
 the line and column, respectively.
 
 Vertical spacing by mills and inches will also be provided, e.g.,
 SKIP 1 INCH and PREFACE 200 MILLS.
 
 Comments about this proposal are encouraged. If no dissuasive
 arguments are forthcoming by Monday, October 14, implementation will
 begin.  I hope to release it in November.
 -------
 
11-OCT-74  1228		1,BH
 Subject: Proposed PUB changes [mail to Tesler]
 Sounds pretty good to me.  If CHARHEIGHT (which should really be called
 LINEHEIGHT) is to have both dynamic recomputing and constantness as
 options, it might as well default to constant for backward compatibility
 and let people like me say .CHARHEIGHT_-CHARHEIGHT; in macro files.
 Make sure this interfaces right with inter-line spacing (which I seem
 to remember is incorrectly called intra-line in some documentation).
 OBTW there should be a way to change inter-line spacing in the middle.
 This is because people who are drawing boxes out of vertical bars etc.
 want to be able to make it be zero temporarily.  I have been telling people
 to set it to zero permanently and create hack fonts with height four more
 than the real height, but that's a crock.  If the variable CHARHEIGHT
 thing is done, I reiterate, it hairs up the meaning of the variables
 LINE, LINES, etc.  I would say that LINE is the actual number of text
 lines put out so far in the area or on the page or whatever it is, and
 LINES (i.e., lines to go in the area) should not be a real variable at
 all, but should be computed when used by taking the actual room left
 in mills and dividing by the height of the current font, if CHARHEIGHT
 is negative, or font 1 if CHARHEIGHT is positive.  Whew!
 P.S.--While you're at it, whatever happened about the table of
 contents bug?  Tnx.

11-OCT-74  1315		network site MAXC
 Date: 11 OCT 1974 1312-PDT
 From: TESLER at PARC-MAXC
 Subject: LINEHEIGHT
 To:   BH at SU-AI
 
 By George, you are right, why did I ever call that variable
 !XGPINTRA?
 You will be able to get your temp areas by:
 AREA TEMP TOP YFRAME HEIGHT 14 LINES
 so don't worry about LINE and LINES too much for that.
 As for your formulas, I agree.
 
 Some time you must remind me how your XGP can vary intra-line
 spacing.  If you don't reply, I will assume it is in the manual.
 
 I worked two days on the table of contents bug and gave up.
 First I though the trouble was that he had roman numeral pge
 numbers.  PUB insists upon leaving the maximum space possible,
 i.e., enough for LXXXVIII, and this dumped the word to the next
 line.  So I changed the page number to numerals and
 left more space, but it still spilt over!  So I am utterly
 confused, because it doesn't happen to people here.  I will take
 a look at some local hack macos and send you a suggestion.
 -------
