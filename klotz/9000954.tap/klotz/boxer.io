Date: Fri, 8 Jul 88 13:07:00 PDT
From: disessa@cogsci.berkeley.edu (Andy diSessa)
Message-Id: <8807082007.AA18001@cogsci.berkeley.edu>
To: boxer@cogsci.berkeley.edu
Cc: mres@dewey.SOE.Berkeley.Edu
Subject: IO

Here is my ancient IO proposal.  Funny thing is, rereading it, it
sounds reasonable again.  Suggestions for simplification?

--Andy
___________________________
8-28-85
Sketch of I/O for Boxer

These are some notes on a proposal for Boxer I/O.
proposal.

There are three classes of IO that I tried to think about.  First,
"conversational programs," of which class the animal game might be a
good example.  The second class is keystroke by keystroke read-in, as one
might do if one wanted to replace tty function by some program, or if
one wanted to use keystrokes within a program to effect real-time
control.  The third is IO for sprites; we already have a little mouse
input system for sprites, which is not at all bad as far as it goes,
but I'm interested in keyboard input for sprites.

I have been motivated a little by compatibility with Logo, but won't
make those points explicit here.

There are two paradigms of IO to consider.  First, like what Ed made,
some kind of popup or other special IO structures.  The second is
"concrete" IO, that is, use mutators and accessors and Boxer's own
concreteness to make that all visible.  Actually, concrete IO ought to
be supported in any case.  The question is what else do we need?  In
the proposal that follows there really is not much additional stuff
(one or two commands) that separates having both popup and concrete
from having only one.

POPUP and READLINE

1. Simplest case of popup: Suppose we have a command POPUP, which,
like Ed's thing, pops up a box at the end of the line being executed
(in the "returned value" place).  Like Ed's thing, it takes an input
which is the thing to display as a prompt in the box.  But in
contrast, let's try for size that you must specify what is to be read
back with another command (POPUP doesn't output).  So you say
READLINE, READCHAR or READBOX.  READLINE returns the line on which the
cursor resides (normally cursor starts on the line after the last line
in the POPUP box) when termination is signaled.  For the moment,
termination can be assumed to be "exit popup box," i.e. ), ] or } from
the top level of popup box.  Probably you ought to be forbidden to
move out of the box with the mouse, or at least, such mouse movement
should terminate READxxx.  Note that if you don't forbid cntrl-P, etc.
you will be able to return some other line than the one you start out
on.  That doesn't seem a problem to me, maybe even a feature (MOVE TO
ONE OF THE FOLLOWING LINES AND TYPE ] TO SIGNAL YOUR SELECTION).
READBOX returns the whole box when the the termination signal is
given.  READCHAR returns one character typed at a time (no termination
necessary).  For conversation, READLINE is the right thing.

POPUP {Type the name of an animal:}
IF READLINE = {OX} POPUP {Absolutely correct!}
WAIT {10 seconds}
POPUP {Would you like to play again?}

A new POPUP replaces the old popup box.  The conversation here is kept
to two-line request/answer pairs.


TEXTBOX and SEND

2.  Beyond two-line request/answer pairs:  One can use mutation to
extend the conversation.  Here I use the special mutator which
essentially does a join-bottom destructively.  This, I think, will be a
common action in BOXER, accumulating things into a box.  What you want
to mutate is the POPUP box, which I'll give the special name TEXTBOX.
With POPUP, READLINE and SEND TEXTBOX, you get Logo like conversations
in the popup box, plus you can clear the text, do other fancy things
with CHANGE TEXTBOX.

POPUP {Type the name of an animal:}
IF READLINE = {OX} SEND TEXTBOX {Absolutely correct!}
SEND TEXTBOX {WOULD YOU LIKE TO PLAY AGAIN?}
IF READLINE = {YES} ANIMAL-GAME ELSE: POPUP {BYE!}

READCHAR and KEYPRESS

3.  TEXTBOX is a sort of tty buffer.  But "permission" to type into it
must be explicitly given with READxxx.  It gets reset when a POPUP
command is used, when a CHANGE TEXTBOX command is used, and, probably,
whenever a command is executed from top level (not sure about that).
So you can look at the last bit of conversation after a program is
done or interupted by executing TEXTBOX.

TEXTBOX doesn't have to be displayed by the use of POPUP.  For
example, for real time control or TTY substitute programs you can ask
if a character has been typed (KEYPRESS?) and snatch the characters
one at a time with READCHAR.  Nothing has been displayed in this way
unless you want to do it.  By the way, there probably should be a way
of disappearing a popup box, though that's not usually necessary.
Call it UNPOP.

Commands so far:
POPUP (UNPOP)
KEYPRESS? READCHAR
READLINE
READBOX
TEXTBOX (as in SEND TEXTBOX)


EDIT

4.  On to concrete IO.  All you really need is to specify which box
the cursor is to type into the way POPUP sends the cursor to the popup
box.  You might call this cursor-sending command EDIT.  READBOX or
READLINE will then permit the editor to run, and return the
appropriately edited thing.  Since you are editing some concrete box,
you probably will not need the returned value from READxxx
(This is slightly hacky, using READxxx without using its value, so
maybe we should have a READ command, which doesn't output.)

CHANGE PROMPT {NOW JUST TYPE A SCORE}
EDIT SCORE
READ
CHANGE TOTAL TOTAL + SCORE

One might want to grab EDIT-executed-at-top-level for a Logo-like editing
function.  A simple thing to do would be simply to move the cursor to
the EDITed box and return to top level; an offscreen box will give you an
error in this top level context.   (General principle, you can't move
the cursor off-screen.) This is not important functionality;
it is not worth a lot of effort.  One use more usual boxer
functionalities (go find the box, type port-to box, etc.).

CURPOS and DISPLAY

5.  To give complete control to EDIT and POPUP, you will want to be
able to change the default position of the cursor (which is the line
following current contents).  CURPOS (better name?) will return the
cursor position in row, character coordinates, top left = {0 0}.
CHANGE CURPOS ... , when typed after a POPUP or EDIT will reposition
the cursor of the editor.  This is one reason I separated the POPUP or
EDIT commands from the specification of how much to READ.  Also to
make professional programs that take over the whole screen for IO when
they are run, DISPLAY takes the name of a box and causes that box to
occupy the full-screen until another DISPLAY is given or until a
return to top-level.  This presumes concrete IO inside the displayed
box.  So you can write and debug your program with the IO box and
other things on the screen, then put a DISPLAY IOBOX into the program,
and you get only the IO to deal with during execution.


MOUSED

6.  How do sprites work?  Basically, each has its own TEXTBOX which
gets typed into when you put the graphics box cursor over the sprite
(and the sprite lights up).  So you can put some s-key, f-key, etc.
definitions in there, and then when you have pointed to that sprite,
you will get sprite-dependent instant actions.  (Clearing the TEXTBOX,
thus, should not mean clearout definitions, just other contents.)  We
need some trigger so that a program can be activated when you point to
a sprite, say MOUSED, the same way R-CLICK, etc. are trigger IO.  Then
you can define MOUSED to be an arbitray IO routine, READLINEing, etc.
as it sees fit.

(definition of MOUSED)
TELL BALLOONSPRITE CHANGE SHAPE {TEXT {HELLO MY NAME IS JOE}}
;; TEXT, if I remember, gets a shape to display text.
WAIT {10 seconds}
TELL BALLOONSPRITE CHANGE SHAPE {TEXT {IF YOU WANT TO CHANGE MY NAME,
					TYPE A NEW ONE}}
TELL NAMESPRITE CHANGE SHAPE {TEXT READLINE}


Technical note:
actually typed into Boxer-accessible space unless (1) one is at top
level (2) a READ command is being executed, i.e. you can gurarantee
that no other program execution is going on.  Thus in this design,
instant keystroke commands will not be executed from a sprites textbox
unless (1) you are operating at top level or (2) you do a READ...

Summary of commands:

POPUP (UNPOP)
KEYPRESS? READCHAR
READLINE
READBOX
TEXTBOX (as in SEND TEXTBOX)
EDIT
CURSOR (CHANGE CURSOR)
DISPLAY
MOUSED



Date: Sun, 10 Jul 88 17:45:36 PDT
From: mres@SOE.Berkeley.Edu (Mitch Resnick)
Message-Id: <8807110045.AA15450@dewey.soe.berkeley.edu>
To: disessa@cogsci.berkeley.edu
Cc: boxer@cogsci.berkeley.edu
In-Reply-To: disessa@cogsci.berkeley.edu's message of Fri, 8 Jul 88 13:07:00 PDT
Subject: IO

A few random (and not necessarily well-thought-through) reactions to
the IO proposal...

(1) I'm not sure why you need the READ primitive for the EDIT case.
Why not just resume when the user terminates editing (leaves the box)?
You do give one reason: you'd like to be able to change the cursor
position (CURPOS) after EDIT and before READ. But why not change the
cursor position before EDIT? i.e.

	TELL SCORE CHANGE CURPOS (0 0)
	EDIT SCORE
	CHANGE TOTAL TOTAL + SCORE

(2) You suggest DISPLAY as a way to make the IO box full screen.
Instead, why not add a primitive that has the same effect asa
double-right-click.

	TELL IOBOX DOUBLE-RIGHT-CLICK

In general, it seems like a good idea to have primitives to duplicate
every function-key and mouse-click command.

(3) An alternative approach for the READxxx commands: let the READxxx
commands take a box name as an input. The commands then read from the
designated box (rather than always reading from a pop-up box).

If you want to read from a new box, you could use POPUP as the input
to READxxx. Or we could add a primitive MAKE-DATA-BOX that takes a
name as input and returns a new data box with that name. So you could
make a new data box and read from that. This approach fits with the
philosophy of having primitives to match the functionality of function
keys.  By using CURPOS and MAKE-DATA-BOX, you could pop up a data box
wherever you want one.


Date: Fri, 29 Jul 88 15:48:38 PDT
From: ehl (Edward Lay)
Message-Id: <8807292248.AA02394@dewey.soe.berkeley.edu>
To: bug-boxer
Subject: bug in stop

STOP always returns to the top level.
This was what was causing Andy's problem with build.  There was an
internal procedure that used stop.  The stop went to the top level and
the value returned was he result of the internal procedure. The build
part was skipped.

ed


Date: Wed, 17 Aug 88 20:53:10 PDT
From: mres@SOE.Berkeley.Edu (Mitch Resnick)
Message-Id: <8808180353.AA19904@dewey.soe.berkeley.edu>
To: boxer@cogsci.berkeley.edu
Cc: mres@SOE.Berkeley.Edu
Subject: novice problems 

Over the last few days, I spent some time helping a computer-naive
teacher learn Boxer. The teacher (named Dan) had NO previous
experience with computers, so even text editing was very new to him.
Dan might not be a very typical case (in fact, he seemed to have more
difficulties than I would expect most novices to have), but I thought
it would be worthwhile to document some of his difficulties. So below
is a (admittedly sketchy) list of some of Dan's difficulties.

----------------------------------------------------------------------
Day 1
----------------------------------------------------------------------

* He continually would move the mouse arrow to a new location and
begin typing without clicking the mouse (so the text would show up in
an unexpected place).

* He had difficulty with the fact that you can't click the cursor to
positions where there is no text. This was particularly a problem when
he wanted to add new text at the bottom of the world box, but he couldn't click the cursor "down there"

* He continually confused graphics boxes and sprite boxes. He created
new graphics boxes several times. He was never sure which of the boxes
to name, or where the cursor should be when he wanted to toggle the
view.

* Several times, when he wanted to name a sprite, he simply put the
cursor inside the sprite box and typed the name. Evidently, he viewed
the naming of a sprite differently from the naming of other boxes (he
had already written some named procedures).

* Several times, when he wanted to clear the graphics screen, he
clicked in the graphics box, then typed cs. 

* After Don showed him how to make a menu box, listing the names of
commonly used procedures, he deleted the procedures themselves,
thinking that he no longer needed them.

* For some reason, he was reluctant to try things incrementally. When
he began writing graphics procedures, he wanted to write the code for
his entire idea before trying out any piece.


-----------------------------------------------------------------------
Day 2
-----------------------------------------------------------------------

* He continued to have confusion between sprite boxes and graphics
boxes. Sometimes, after creating a graphics box, he forgot to create a
sprite box. Then he was surprised when he toggled the view and found
"the x-position and y-position aren't there" (I think he viewed the
graphics and sprite box as a single package). Other times, he created
a sprite box, but outside of the graphics box (this happens if you
create a sprite box directly after creating a graphics box, without
clicking in the graphics box).

* Several times, after naming a sprite, he press Line Feed "in order
to enter the name." That caused the system to crash.

* At one point, he created a second graphics box with a second sprite,
and ran into problems when he tried to give the second sprite the same
name as the first.

* He tended not to read error messages. But he didn't delete them.
Typically, when he saw an error message, he would make some change in
the line and try again. But he never deleted the initial error
message. So on several occasions, he got a new error message, but he
didn't even notice that the system had responded in any way.




