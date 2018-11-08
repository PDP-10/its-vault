tag
START

RWK@MIT-MC 07/02/77 10:32:45 Re: How to learn about EMACS...With a minimum of pain
To: LISP-STUDENTS at MIT-MC, (FILE [MC:RWK;EMACS LESSON]) at MIT-MC
do the following....
E^K
^XI
and you will be in the info system in EMACS, It will explain how to use it
you should then use it to learn EMACS.  breifly, the commands you need to
use in EMACS to start with are
^X^R read file...It asks for file names, to be ended with a <CR>
^X^W write file
<rubout> delete a char to the left
^D delete a char fowards
^L display the previous line and the current one with a -!- at the current
   location, and then redisplay the current line up to the currsor (current
   location)
^N move down a line
^P move up a line
^U do the next thing 4 times.  ^U^U means 16, ^U^U^U means 64...
   ^U5 means 5, ^U90 means 90, thus ^U^N moves you down 4 lines, ^U7^N 7 lines.
^F moves forward 1 character
^B, same as backspace, moves back one space
^K kill everything from cursor to end of line.  kill <CR> if nothing left on
   line to kill
^Y get back last thing killed
^S search.  takes an argument terminated by a $ searches for as much as you
   have typed in, and beeps if you type in something that isn't there.  ^R
  searches backwards.  ^S or ^R if repeated in the middle of a search repeat
  the search for what has been typed in up to now.
^E  goes to the end of a line
^A  goes to the beginning.
^W  kill region.  a slightly more advance command.  can be recovered from
    with ^Y, just like ^K can.


EMACS uses a 9 bit character set, but your terminal (and mine here) can send
   only 7 bits.  so EMACS provides certain prefix characters to allow us to
   use commands which are on characters which our keyboards don't have.
   These characters are called Control character (some of which we have, like
   letters, but we don't have Control-? (C-?) for example) Meta-Characters
   (which we don't have at all...) and Control-Meta characters (M- and C-M- )
Escape is the prefix for meta as is ^\  ^^ is the prefix for control, but
if the control key works for a given character, use it.  ^C is the prefix
for C-M-  Thus $F means M-F and moves forward a word rather than a char.
C-M-F moves foward a LISP list.  these work for the ^F, ^B, ^K and <delete>
commands, ie M-<delete> deletes the word to the left of the cursor.

C-? followed by a character (including it's prefix char, if needed) tells you
    what a character does.

Antoher useful command is M-altmode (M-Escape) which runs a "mini-buffer"
If you know teco, you can type M-alt and then teco commands, then alt-alt
(just like in TECO) and the teco commands will be executed.  This is because
EMACS is TECO, with a bunch of TECO macros added, and set up to act right away
when you type a character.

another usefull command, which runs a minibuffer is M-X  Meta-X sets up
a minibuffer with MM already in it.  This is useful for a wide variety
of commands which are not on a given character, and which have longer
names.  The most useful of these is MM APROPOS$<string>$$ which
looks to see what EMACS knows about <string>  thus I can type
M-X APROPOS$delete$$ and it will print out all commands which have to
do with deleteing. M-X APROPOS$file$$ will print out everything which
does things with files (or at least which has the string FILE in it's long
name.  All commands have a long name, even if they are normally run by typing
a character.)


