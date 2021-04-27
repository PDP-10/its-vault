!* -*-TECO-*- !

!~FILENAME~:! !Emacs library for Klotz.!
.EMACS

!& Setup .EMACS Library:! !S Do useful things.!

   m(m.mRun_Library)MKDUMP
   :i*Textm.vDefault_Major_Mode
   :i*Babylm.vMail_Reader_Library

   1m.vTags_Find_File		    !* Use *TAGS* buffer instead of current one.!
   -1m.vDisplay_Matching_Paren
   1m.vInhibit_Help_Message
   1m.vAuto_Fill_Mail_Buffer
   80m.vFill_Column
   
   @:i*|(Q:.B(Q3+8!*bufdat!)F"N (i_):Fs Fd Convert')|m.vSet_Mode_Line_Hook

   @:i*| 1m.L Auto_Fill_Mode|m.v Babyl_R_Hook
   QBabyl_R_Hookm.vBabyl_M_Hook
   QBabyl_R_Hookm.vBabyl_F_Hook
   @:i*| M.M ^R_Forward_Phraseu.,
         M.M ^R_Backward_Phraseu..,
	 M.M ^R_Mark_Phraseu...,
	 M.M ^R_Backward_Delete_Phraseu:.x(,)|m.vPHRASE_Setup_Hook

   m(m.m Load_Library)PHRASE   

   65 fs ^Rinitu.		    !* Make Control-Alt insert an alt.!
   
   Q.Ou...O		    !* Exchange C-O and C-M-O.!
   m.m ^R_Split_Lineu.O
   m.m ^R_Just_One_Spaceu.._
   m.m ^R_Kill_Sexpu...D	    !* I hate what C-M-D does.!
   m.m ^R_My_CRLFu�
   m.m ^R_Toggle_Auto_Fill_Modeu:.x()
   
   m.m Compileu..Z		    !* Compile according to Major Mode.!
   
   m.m ^R_Transpose_Preceeding_Charactersu.T
   m.m ^R_Macro_Argumentu..M
   m.m Buffer_Menuu:.x()  !* Modified from TMACS.!
   m.m Completing_Select_Bufferu:.x(B)
   m.m ^R_Setup_Mail_Bufferu:.x(M) !* Leaves you in a buffer at toplevel.!
   m.m ^R_View_Kill_Ringu:.x()

   @:i*\ @:i*|2fs Echo Lines|fs tty macro
       m(fs tty macro)

       :@i*|fs %tofci"L65 fs ^Rinitu'|m.vTeco_Mode_Hook
       fs rgetty-5"E		    !* AI TV.! 
         :i*!"#$%&'()_m.v Digit_Shift_Table'
       "# 0m.v Dight_Shift_Table'
       fs machine-(f6AI)"E
       m.m ^R_String_Searchu.S'  !* I want realtime rubout processing.!
       :i*CFs Echo Disp
       @ft EMACS_1 0fs Echo Active
       M(HFX*)
       fs ^R Mode"E :m..L'\m.vDumped_EMACS_Startup_Hook

   m(m.m Text_Mode)
   
   M(qDumped_Emacs_Startup_Hook)
   0u..9
   HK
   fs osteco"G hker <emacs>emacs.init'
   "#er EMACS;*_EMACS'
   @Y :M(HFX*)

!^R Transpose Preceeding Characters:! !^R Transpose preceeding two characters.!
    2r 1a[0 d c q0i
    .-2,.

!^R Macro Argument:! !^R Read a line and macro it.
If nothing is typed, macro the last thing macroed.!
    1,fTeco:_[1
    F~1"N Q1m.vLast_Line_Macroed' ]1
    m(QLast_Line_Macroed)


!Buffer Menu:! !C Display information about all buffers.
A recursive edit level is entered on a list of all buffers.
On exit the buffer on the current line is selected.
Point is initially on line of current buffer and space will exit (like
^R Exit), so this is very much like List Buffers but
combines listing with selecting in a way that does not involve
much typing or redisplay.  * means modified, - means modified and not
auto-saved, . means current buffer.

<space> returns to the buffer described by the current line.
. returns to the current buffer.
D, C-D marks buffer for deletion on exit.
S marks buffer for saving on exit.
U unmarks buffer.
N, C-N go down to next buffer, and wrap after last buffer.
P, C-P go up to previous buffer, and wrap.
~ clears modified flags of buffer.
^G aborts.!

    [0[1[2[3[4[5[6[7[8			!* save regs!
    f[d file
    fsQPPtru8				!* 8: point to unwind before!
					!* selecting a different buffer!
    fsBCons[..o			!* get us a buffer!
    i_____#_Buffer____(Mode)_________Filename
    
    13i 10i
    2u7				        !* 7: line count!
    0u4 fq.b/5u5			!* 4: .B index, 5: stopping point!
    < q4-q5;				!* Go thru buffer table; stop at end!
      q:.b(q4+4!*bufbuf!)[..o	        !* make the buffer current so can!
					!* check modified, readonly, etc.!
      0u1				!* 1: flag bits!
      fsModified"n q11u1'		!* 1&1: nonzero if modified!
      q:.b(q4+10!*bufsav!)"N	        !* Ignored unless auto save mode.!
        fsXModified"N q12u1''	!* 1&2: nonzero if Xmodified!
      fsZu3				!* 3: no. of characters in buffer!
      ]..o			        !* back to listing buffer!
      .u0 4,32i				!* 0: start address of this line!
      q1&1"n .-2f*'			!* indicate if modified!
      q1&2"n .-1f-'			!* indicate if not auto saved!
      2,q:.b(q4+7!*bufnum!)\		!* Type the buffer's number!
      i_ g:.b(q4+1!*bufnam!)		!* Type buffer's name,!
      17-(.-q0):f"gw 1',32i		!* move to column 17!
      q:.b(q4+3!*bufmod!)u1		!* 1: buffer's major mode!
      qBuffer_Index-q4"e		!* if current buffer!
	qModeu1 q0u6			!* then use current mode, and save .!
	.( q0+3j 2a-32"E C' f. )j '	!* and put dot next to number!
      i(1)				!* Type major mode!
      32-(.-q0):f"gw 1',32i		!* move to column 32!
      q:.b(q4+2!*bufvis!)u1
      q1"n
        g1				!* Insert its filenames if it has them!
        ET1
        q:.b(q4+9!*bufver!)u2		!* Get actual version number.!
	FS D VERS:"G
           FS D VERS+1"N
	     i_( g2 i)'''		!* Print file version if valid.!
      q1"E q3\ i__Characters'		!* No filename, type the size.!
      q:.B(Q4+12!*bufnwr!)u2
      q2"G i__File_Read-Only'
      q2"L i__Buffer_Read-only'
      i
     %7w				!* add CRLF, increment line count!
      q:.b(q4)+q4u4			!* advance past this buffer!
      >
    q6"n q6j'				!* goto line with current buffer!
    fsLinesu6 q6"e fsHeight-(fsEchoLines)-1u6'   !* 6: current fsLines!
    q7+1-q6"l q7+1f[Lines'		!* set fsLines so that only the amount!
					!* of screen needed is used, reducing!
					!* redisplay of rest of buffer.!
    0f[Window				!* start display at top!
    0fs^RInitf[^RNormal		!* make normals undefined!
    33.fs^Rinit[_			!* space exits ^R mode!
    :i*Buffer_Menu[..j			!* use reasonable mode line!
    0[..F				!* don't let user screw himself!
    :i*[Abort_Resumption_Message

    !* Now bind some keys for editing the buffer menu!

    @:i*| 0f[Lines m(m.mDescribe)Buffer_Menu h|f[HelpMac   !* HELP: describe us!
    fs HelpMac[?		        !* Put on ?, too.!

    @:i*| 0l @f_DS*-.l \[1 q1"e 0l fg 1'	!* 1: buffer number!
    q1m(m.m&_Find_Buffer)u1		!* 1: buffer index!
	  q:.b(q1+4!*bufbuf!)[..o 0fsModifiedw 0fsXModifiedw ]..o
	  0l .+2f__ .+2,.+4(m.N) |[~	!* ~: clear modified flag!

    !* ., return to buffer with the . in the fourth column.!
    !* The code for <space> does a throw back out of the!
    !* recursive edit, so this will loop until it wins.!
    !* There is always a . in the buffer.!
    @:I*| J 2L <:s.; fs hpos-5"E m_'>|[.
    
    !* D, C-D: Mark buffer for deletion.!
    @:i*| 0l 1a-�"E fg ' fD 1 (m.N) |[D 
    qD[.D

    !* S: mark buffer for saving!
    @:i*| 0l 1a-�"E fg ' fS 1 (m.N) |[S

    !* U: unmark buffer!
    @:i*| 0l 1a-�"E fg ' f_ 1 (m.N) |[U

    !* N, C-N: Down line and wrap.!
    @:i*| l .-z"E j 2l'0 |[N
    qN[.N

    !* P, C-P: Up line and wrap.!
    @:i*| -l F=(X*)
         "E zj -l' 0|[P
    qP[.P

    !* ^G, abort.!
    m.mAbort_Recursive_Edit[.G

    !BACK! 			    !* let user see buffer, and move around.!
    0l 0,1a-D"e fg oBACK'	    !* don't exit on marked buffer!
    @f_S*-.l \u1		    !* 1: buffer index of new buffer!
    q1"e fg oBACK'		    !* don't exit on no buffer.!
    q..ou2 q8fsQPUnwind	    !* 2: buffer menu buffer!
				    !* cleanup all pushed stuff so that!
				    !* it isn't stored in .B after buffer!
				    !* selection!
    q2[..o jl			    !* menu buffer, move past header!
    < :s
_;				    !* find first marked buffer!
	0a-D"e @f_*-.l \u3 q3"n	    !* D: kill it!
		q3-q:.b(qBuffer_Index+7)"e	    !* if killing selected buffer,!
		    q1"n ]..o q1m(m.mSelect_Buffer)w q2[..o''
				    !* select new one first!
		q3m(m.mKill_Buffer)' !<!>'
	0a-S"e @f_*-.l \u3 q3"n	    !* S: save it!
		]..o q3m(m.mSelect_Buffer)
		m(m.m^R_Save_File)w q2[..o' !<!>'
	>
    ]..o				!* restore selected buffer!
    q1"n q1-q:.b(qBuffer_Index+7)"n	!* if new buffer index, and if!
					!* different from current buffer!
      q1m(m.mSelect_Buffer)''		!* select new buffer!
    q2fsBKill 			!* kill menu buffer!

!^R Backward Delete Phrase:! !^R Calls ^R Delete Phrase with a negative argument.
G(m.m~DOC~ ^R Delete Phrase)jk!
    -:m(m.m ^R_Delete_Phrase)

!* Yes, I know putting it in a buffer does less string consing.!
!Get Matching Lines:! !C Like Occur, but returns a value instead of printing.
Follow with string, alt, "U" and your favorite Q-register.
This command does not support the numeric argument feature of Occur.!

    [1 :i*[2
    1,fPattern: f[sstring
   .[0 FNQ0J
   <:S;
    0l x1 :i221
L>
Q2

!Mail Buffer:! !C Mail selected buffer.
Use to send mail set up with ^R Setup Mail Buffer.!

    m(m.ARMAIL&_Mail_Buffer)
    @ft_(mail_queued)

    0fs echo active
    m(m.m^R_Buffer_Not_Modified)
    m(m.mSelect_Buffer)
    

!^R Setup Mail Buffer:! !^R Quick mail.  Sets up a buffer named *MAIL*
for mail by RMAIL & Mail Buffer.  Type Mail Buffer to mail. With an argument,
it reselects the old mail buffer; otherwise, it creates a new mail buffer.!

    FS HSNAME:F6[0
    ET DSK:0;*MAIL*_>
    m(m.m Select_Buffer)*MAIL*
    FF"N '		    !* Finished if it is a continuation.!
    HK
    iTo:_
--Text_Follows_This_Line--

    4J				    !* Go to "To:" Field.!
    0fo..qAuto_Fill_Mail_Buffer"G 1m.lAuto_Fill_Mode
    0fo..qSetup_MAIL_Setup_Hook[1 Q1"N m1'
    :i*CFs Echo Disp
    @ft Type_M-X_Mail_Buffer_to_Mail.

    0fs echo active
    

!^R My CRLF:! !^R Doesn't break lines in auto fill mode..!

    1,m(m.m^R_CRLF)

!^R View Kill Ring:! !^R Shows contents of ..K.!

    m(m.mView_Q-REG)..K


!^R Toggle Auto Fill Mode:! !^R With no argument, toggles auto fill mode.
With a positive argument, sets the fill column to that column.
With a negative argument, turns off auto fill mode.!
    
    fs ^rargpu1
    q1-3"E m(m.m^R_Set_Fill_Column)	    !* If a real arg, use it for fillc.!
            1m(m.mAuto_Fill_Mode)' !* and turn on filling.!
    q1-5"E m(m.mAuto_Fill_Mode)'' !* if negative, turn off!
    q1"E m(m.mAuto_Fill_Mode)'	    !* no arg, toggle.!
    

!* This was written by Larry S. Rosenstein@MIT-XX!
!Completing Select Buffer:! !C Select or create buffer.
Functionally equivalent to standard Select Buffer.
Accepts buffer number as a numeric arg, buffer name as
numeric or string arg, and selects that buffer.

Otherwise prompts for a buffer name.

Can terminate buffer name with return, which selects buffer 
 with exactly that name (creating it if it does not exist). 
If terminated with Space, matches input to list of buffer names
 and displays longest common prefix
Escape, is like space, except that if the result is unambiguous
 the buffer is selected.

^U deletes input, ^L redisplays, ? show a list of possibilities.!
  
				    !* get standard select buffer!
				    !* into QO!
  m(m.m&_Get_Library_Pointer)EMACS m.mSelect_Buffer [O
  FF&1 "N F:MO '		    !* we have numeric arg!
  "E :F"G F:MO ' '	    !* we have string arg!

  F"Ew :I*Select_Buffer ' [4	    !* prompt string!

  FS QP PTR [P

  MMM_&_Check_Top_levelbuffers
  FQ.B/5 [0			    !* # entries in Q.B!
  0[1				    !* start current buffer entry!
  F[ B BIND
  0[2				    !* # buffers!

  < Q1-Q0;
    %2
    G:.B(Q1+1!*bufnam!)		    !* buffer name!
    I

    Q1\				    !* buffer INDEX!
    I

    Q:.B(Q1)+Q1 U1		    !* advance to next buffer!
    >

  1F[ ^P CASEw _:L2L	    !* sort!

  5+(10*Q2)FS Q VECTOR[L	    !* q-vector of buffer names!
				    !* and Q.B indices!
  2U:L(0) 1U0 BJ
  Q2< :X:L(Q0) %0w L
      \U:L(Q0) %0w L
    >

  HK QPrevious_Buffer[3	    !* default => Q3!
  1,Q3m(m.m&_Find_Buffer) "L Q:.B(1)U3 '

  @:I*/
    :I*CFS ECHO DISPLAY
    @FT4_(3):_
    H@T
  /[R				    !* redisplay macro!

  MR
  @:I*/
   :FTYou_are_entering_the_name_of_a_buffer_to_be_selected.
RUBOUT_will_erase_the_last_character_you_typed
__(erasing_all_the_characters_will_abort_this_command),
^U_will_erase_what_you_have_typed,
^L_will_redisplay,
^Q_will_quote_the_following_character,
RETURN_will_choose_the_exact_buffer_you_have_typed
__(a_null_value_chooses_the_default:3),
SPACE_will_match_your_input_to_the_existing_buffer_names,
ESCAPE_will_act_like_SPACE,_and_if_the_result_is_unambiguous_
__it_will_select_the_buffer,
?_will_display_buffer_names_that_match_your_input.

  0U..H 0FS FLUSHEDw F/F[ HELP MAC

  [8 [9

  <HX0 :FOL0  U1 :FOL0�  U2  !* get indices into QL!
					    !* of buffer names that!
					    !* match input so far!

   

   FIU0				    !* read a char!
   Q0F��_? "L
     Q0- "E FIU0 '		    !* unspecial!
     Q0I -1 @T !<!> '		    !* insert and print out!

   Q0-�"E Z"E  '
              0AU0		    !* get deleted char!
	      -D		    !* delete it!
	      Q0-32 "L MR '	    !* if control char, complete redisplay!
	      "# :I*X FS ECHO DISPLAY ' !* else erase it!
	      !<!> '		    !* read another char!
   Q0- "E HK MR !<!> '	    !* ^U: erase all & redisplay!
   Q0- "E MR !<!> '		    !* ^L: redisplay!
   Q0-� "E �FS ECHO OUT 0; ' !* return: exit loop!

   (Q0- "'E)(Q0-_ "'E) "N    !* escape or space!
     Q2-Q1 "E FG !<!> '		    !* input matches nothing!

     HX8			    !* input => Q8!
     (F~:L(Q1)8 "'E)((Q2-Q1/Q:L(0))-1 "'E) "N
       HK G:L(Q1) MR
				    !* have either an!
				    !* exact match or single!
				    !* match!

       Q0- "E		    !* if input was escape!
				    !* select buffer!
         �FS ECHO OUTw 0; '
       "# !<!> ' '		    !* else go back for more!


				    !* ambiguous--!
				    !* get common prefix!
     Q:L(Q1)U8 Q:L(Q2-Q:L(0))U9	    !* first match => Q1!
				    !* last match => Q2!
     F~98 F"G-1U9		    !* # matching chars => Q2!
       HK 0,Q9G8 MR'		    !* get largest matching prefix!
				    !* and redisplay!

     FG !<!> '			    !* ambiguous!

   Q0-? "E			    !* ?: list possibilities!
    
     :FT 
Buffer_Name_________Visited_File_Name


     Q2-Q1/Q:L(0) <
       Q:L(Q1+1)U0		    !* buffer index!
       [3
         Q:.B(Q0+1!*bufnam!)U3 FT3
	 FT__ 20-(FS TYO HPOS)<FT_>
	 Q:.B(Q0+2!*bufvis!)U3 Q3"N
	   FT 3 '
       ]3
       FT

       Q:L(0)+Q1 U1>
     FT 0U..H 0FS FLUSHEDw F MR'
  >

  Z "E G3 '			    !* user did return with nothing!
				    !* use default!

  HX0 -1FOL0 "L		    !* does buffer exist?!
    :I*C FS ECHO DISPLAY	    !* NO !
    @FT(New_Buffer)
    0FS ECHO ACTIVE '

  HX*(QP FS QP UNWIND):m(m.mSelect_Buffer)	    !* select after!
						    !* unwinding QP!
  
