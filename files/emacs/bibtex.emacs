!* -*-TECO-*- *! !* Modification of BIBLIO for BibTex Files *!
		 !* Maintained by RICH@AI *!
		 !* Original BIBLIO written by CTaylor@USC-ISIF *!

!* BibTex Bibliography Library *!

!~FILENAME~:! !Macros to facilitate entering a bibliography!
BIBTEX

!& Setup BIBTEX library:! !S Assign keys and load WORDAB library for BIBTEX.!

24*6 FSQVectorm.cBIBTEX_defsQ_Vector_containing_old_BIBTEX_key_definitions.
0m.cBIBTEX_modeSet_to_1_if_BIBTEX_keys_defined,_otherwise_0.
0m.cBIBTEX_windowSet_if_second_window_is_displayed
0m.cBIBTEX_Window_1_SizeTo_remember_old_Window_1_Size
0m.cBIBTEX_String_FileOptional_file_containing_@String_abbreviations
:I*keym.cBIBTEX_BibliographystyleTo_override_default_style_of_KEY
0m.cBIBTEX_TitleOptional_title_for_printing_database_file

:I* Available_bibliographic_entries:__Article,_Bachelor(sThesis),_Book,_InBook,
    __Booklet,_InColl(ection),_InProc(eedings),_Master(sThesis),__Manual,
    __Misc,_Phd(Thesis),_Proc(eedings),_Tech(Report),_Unpub(lished).m.vBIBTEX_window_entries

:I*Entry_names_are:
_
___Article
___Bachelor(sThesis),__Book,__Booklet
___InBook,__InColl(ection),__InProc(eedings)
___Master(sThesis),__Manual,__Misc
___PhD(Thesis),__Proc(eedings)
___Tech(Report)
___Unpub(lished)
_
Command_characters_are:
_
___M-Space_=_Expand_entry;__________M-@_=_Mark_entry;
___M-n_=_Next_field;________________M-p_=_Previous_field;
___C-M-n_=_Next_blank_field;________C-M-p_=_Previous_blank_field;
___M-[_=_Start_of_entry;____________M-]_=_End_of_entry;
___M-._=_Remove_all_blank_fields;___M-/_=_Reinsert_blank_fields;
___________________M-?_=_BIBTEX_Summary.
_
_____________________OTHER_USEFUL_COMMANDS
_
*_Permanently_displays_the_entry_names_at_the_top_of_the_page,
_____"M-X_Show_BIBTEX_entries_in_window$".
*_Turn_off_the_expansion_mode_type,_"M-0_M-X_BIBTEX_Mode$".
*_View_a_entry's_fields_type,_"M-X_List_Word_Abbrevs$entry-name".
*_Change_any_or_all_entry_fields_type,_"M-X_Edit_Word_Abbrevs$".
*_Save_your_definitions_of_entry_names_and_other_words,
_____"M-X_Write_Word_Abbrevs$".
_
This_library_is_based_on_the_word_abbrev_library,__in_fact_it's_loaded
automatically_underneath_the_BIBTEX_library.__This_means_all_of_the_word
abbrev_capablities_are_also_available_with_this_library.
_
This_is_a_trial_version,_please_sent_your_comments(complains)_to_Rich@AI
_
------------------------------------------------------------------------------
m.vBibtex_entries
[1 9:I1				    !* Insert a tab the hard way!
:I*_1	
M.vBIBTEX_blanks		    !* Tab, space, cr and lf!

:I*!~#;$%^&*-_=+[]()\|:`"'{},<.>/? 
m.vWORDAB_Ins_Chars		    !* Standard list minus @!

F[DFile
E?BIBTEX_DEFNS"E		                    !* Load defns file!
 MMRead_Word_Abbrev_FileBIBTEX_DEFNS'             !* from user first!
 "#MMRead_Word_Abbrev_FileEMACS:_BIBTEX_DEFNS''   !* else from Emacs!

0


!^R Next blank BibTex field:! !^R Skip to the next blank bibliographic field.
 Initially all of the field values for a entry are empty and 'M-n' and 'C-M-n'
work the same.  As you fill in values, you may want to skip over the fields
with values, 'C-M-n' does this.  'C-M-n' skips forward to the next blank
field.!

"L-:M(m.m^R_Previous_blank_BibTex_field)'	    !* Negative arg.!

.[1				    !* Save the point in case of error!

!* Search for "={} or end of entry";  If "={}" found position point and loop!

<:S={}=,)+2"L
           -1"N Q1j		    !* ]: error!
	       :I*Hit_end_of_bibliographic_entry FS Err
	       ''
	   R .u1>		    !* ={}: position and remember point in!
				    !* case of error!
0



!^R Next BibTex field:! !^R Skip to the next bibliographic field.
 Skips to the start of the next field, positioning the typing cursor at the
beginning of the field's value.!

"L-:M(m.m^R_Previous_BibTex_field)'    !* Negative arg.!

.[1				    !* Save the point in case of error!

!* Search for "={ or end of entry";  If "={" found position point and loop!

<:S=)+1"N!>!
           Q1j :I*Hit_end_of_bibliographic_entry FS Err'  !* ]: error!
	   .,.+1F={"E C'	    !* move past open bracket if necessary!
	   .u1>			    !* ={}: position and remember point in!
				    !* case of error!
0



!^R Previous blank BibTex field:! !^R Skip to prev. blank bibliographic field.
 Similar to 'C-M-n', but skips backwards to a blank field value.!

"L-:M(m.m^R_Next_blank_BibTex_field)'

.[1				    !* Save the point in case of error!

!* Search for "={} or end of entry";  If "={}" found position point and loop!

<-:S={}=,)+2"L
           Q1J :I*Hit_start_of_bibliographic_entry FS Err'  !* [: error!
	   C .,.+1F={"E C'	    !* forward as necessary!
	   .u1>			    !* ={}: position and remember point in!
				    !* case of error!
0



!^R Previous BibTex field:! !^R Skip to the previous bibliographic field.
 Skips to the previous field, also positions the cursor at the value.!

"L-:M(m.m^R_Next_BibTex_field)'

.[1				 !* Save the point in case of error ! 

!* Search for "={} or end of entry"; If "={}" found position point and loop!

< 1:<.-2,.F=={"E!>! 1R'>	 !* skip over "={" when point is just!
				 !* to the right !
    1:<.-1,.F=="E!>! 1R'>	    !* skip over = also!

    -:S=(+1"N!>!
        Q1J :I*Hit_start_of_bibliographic_entry FS Err' !* [: error!
	C .,.+1F={"E C'	    !* move past open bracket if necessary!
	.u1>			 !* position and remember point!
				 !* in case of error!
0



!Sort entries by key:! !C Sort by key.
 Sorts the bibliographic entries by key.  This function will be
automatically invoked by 'M-.' if the variable 'automatic key sort' is
set non-zero.!

Zj .-1,.F=)"E I
'				    !* Put CRLF at the end of buffer if needed!

Bj
1M(m.m^R_End_of_BibTex_entry)	    !* Skip to first entry!
3,1M(m.m^R_Start_of_BibTex_entry)
-FWL 0L
.F[V B				    !* and set buffer!

1F[ ^P Case

 FWL :FWLFWL1M(m.m^R_End_of_BibTex_entry$)w

H


!Sort entries by author:! !C Sort by author or key field.
Assumes that author names typed in last name first.!

[1

Zj .-1,.F=)"E I
'				    !* Put CRLF at the end of buffer if needed!

Bj
1M(m.m^R_End_of_BibTex_entry)	    !* Skip to first entry!
3,1M(m.m^R_Start_of_BibTex_entry)
-FWL 0L
.F[V B				    !* and set buffer!

1F[ ^P Case
 :SAuthor=Editor=Key=)$+3 U1 Q1"G C' 
   Q1"L :I*No_Author,_ Editor,_or_Key_Field_$FSErr$' "# FWL' W 
   1M(m.m^R_End_of_BibTex_entry$) W 

H


!^R Cleanup BibTex entry:! !^R Delete all @? and empty fields.
 When a entry is expanded all possible fields for that entry are displayed.
You probably don't want to enter information for all of the fields displayed.
After the entry is completed to suit your needs, type 'M-.', to delete empty
optional and empty satisfied alternative entries.  If you have forgotten one
of the required fields, you will be warned and the cursor left at the required
field needing information.  Enter the missing information and retype 'M-.'.
When the entire entry is acceptable, no message will be displayed and the
cursor will be after the closing ']'.!

.[1 [3 [4			    !* Save in case of error!

:L				    !* In case at start of @entryname!
6,1M(m.m^R_Start_of_BibTex_entry)"L '     !* Jump to start exit on error!

.u1
.,.+1F=,"E FG @FT		    !* Do we have a key, find nonblank!
Missing_key_for_this_field.  !* Is it a ","!
           0FSEcho Act 0'	    !* Yes missing key; exit!

!* Loop through entry until all "={}" and "@?" have been deleted. If we find a!
!* "={}" then the following cases are checked: !
!* 1) Is it required?  Force an field!
!* 2) Is it optional(@? opt)?  Delete if empty!
!* 3) Is it conditional(@? or)? Search for other fields.  If one is filled in!
!*    delete this field, otherwise force field!
!* Assume Q1 points to the top of the entry. Note: iteration "<>" is dangerous!
!* because of the ={} hang around!

!LCleanup!
	  :S_)@?={}=,+2u3    !* Look for special fields!
!* Case 1!
	  q3"G
	    Q1J			    !* go back to start of entry!
	    :S_)"E		    !* Missing closing ]?!
	        :I*Missing_closing_")" FS Err !''!'
	           
	    -:S,}(+1"E D'	    !* deleting trailing comma!
	    S_)

	    0fo..Q Automatic_key_sort"N	    !* Exit after sorting!
              7,1M(m.m^R_Start_of_BibTex_entry)    !* Save first line!
	      -FWL 1X4		    !* of this entry for the return!
	      M(m.m Sort_entries_by_key)	    !* Do the sort!
	      S4		    !* Return to position!
	      H'		    !* Exit with sort done!
	    "# Q1,.'		                    !* Normal Exit!
	  '
!* Case 2!
	  q3"E-:S},		    !* @?:  Find end of this field!
	  C :K	oLCleanup		    !* Delete to end of line!
	  '
!* Case 3!
	  q3"L .-1u4 :L	.u2	    !* ={}:  Check for required fields!
	    q4,q2:FB@?u3	    !* Search for "opt", "or", ""!
	    :FWL		    !* Move to either "opt" or "or"!
!* case 3a!
	    q3"E		    !* Req'D line:  Print req'd error!
!EError!      @FT
Missing_the_required_or_one_of_the_alt._bibliographic_fields.
	      @FG 0FSEchoAct	    !* Ring bell, show the msg,!
	      .u8 Q4j Q1,.'	    !* reposition point and exit!
!* case 3b!
	    FWF=Optional"E	    !* @? Opt:  delete line!
!DLine!	        Q4j 0LK oLCleanup' !* Field for successful or cause!

!* case 3c!
	    FWF=or"E FWL	    !* @ or :  Skip to alternate name!
	      .u2 :L .u3 q2j	    !* Save end of line in Q3!
	      <FWL -FW@X2 q3-.:"G 1;'	    !* Find alt names!
	       :I22=>
	      Q1j		    !* Start at begin of entry!

!Next_name!   :S_)2=+2u3	    !* search for alt. name!
	        q3"G oEError'	    !* missing name!

	        .,.+2F={}"E C oNext_name' !* blank, try another name!
		.,.+1F=,"E C oNext_name'  !* blank, try another name!
		0q3 oDLine	    !* found something here, so ok!
	      '
!* case 3d!
	    FWX2		    !* Stuff the unknown keyword in Q2!
            :I*Unknown_keyword_"2"_after_"@?" FS Err  !''''!
	    0			    !* Let'm fix keyword!

            '			    !* End of "={}" check!
				    !* Exit from subr is in loop above!


!^R Incremental BibTex expand:! !^R Fill out any missing fields.
 After typing 'M-.', all of the empty fields will have been deleted.  To
reinstate these fields use 'M-/'.  Typing 'M-/' will redisplay all of the
blank fields at the end of the entry and place the cursor at the first blank
field.!

[1[2 .[3 [4			    !* Save working q-regs!
:L				    !* in case at start of @entryname!
7,1M(m.m^R_Start_of_BibTex_entry)  !* Find entry name!
-FWL FWX1			    !* Place it in Q1!

1M(m.m^R_Mark_BibTex_entry)	    !* Mark entry and copy!
M(m.m^R_Copy_region)		    !* into a buffer!

1M(m.m^R_Un-kill)		    !* Dump entry in buffer!
M(m.m^R_Set_bounds_region)	    !* Narrow the buffer!

-:S) .+1,ZK			    !* Delete trailing )!
Bj :S,				    !* Find end of key!
:FWL B,.K			    !* Delete "entry name[" etc.!

<.u4				    !* End of previous field!
:S=
+1u2				    !* Leave only field name!
  q2"E -FWL q4,.K FWL C I 1K'    !* Field name!
    "# q2"L q4,.K'		    !* No field name on this line!
    "# q2"G -D .,ZK 1;'''	    !* Search failed, delete last ^O etc.!
>

HX2 HK				    !* Save search list and clear buffer!
G1				    !* Place entry name in buffer!
1F<!BIBTEX_increment! M:.e(0)>	    !* Expand virgin entry!
				    !* Trap is from Start BibTex entry!
:S,				    !* Delete head!
:FWL B,.K
Zj -:S) 
0L .,ZK				    !* and tail!

<-:S2; 0LK>			    !* Delete similar fields!

B-Z"E HK M(m.m^R_Set_bounds_full)  !* No new fields!
 Q3j :I*No_additional_fieldsFS Err'

HX2 HK				    !* Save increment fields!
M(m.m^R_Set_bounds_full)	    !* Restore original buffer!

1,1M(m.m^R_End_of_BibTex_entry)    !* Find end of field!
0L .u1 G2			    !* Insert additions!
Q1j -:S},=+2 U3
Q3"G C I,'"# Q3"L FWL I,''	    !* Add missing comma!
:S_) .u2			    !* Display to the end!
Q1j 1,1M(m.m^R_Next_blank_BibTex_field) !* Point to first new field!
Q1,q2



!^R Start of BibTex entry:! !^R Jump to keyword pos. in bibliographic entry.
 Moves the typing cursor to the beginning of the key for the current
entry.!

!* Pre-comma arg (interpreted as binary)(?) does the following:
   ^X = 0 - Normal allow errors, skip to key.
   ^X = 1 - Don't move to key, remain at (.
   ^X = 2 - No key message.
   ^X = 4 - Don't skip to previous field if at key.
!

"L-:M(m.m^R_End_of_BibTex_entry)'	    !* Negative arg!

.[1 QBIBTEX_blanks[2 [3

:L .u3 Q1j			    !* Pickup entry if we're close!
q1,q3:FB(@)+1"E :L'	    !* If this is the first line, stay here!

<&4"E			    !* Don't skip to previous field!
    1:<-@F2: j		    !* jump over blanks!
				    !* Are we at the beginning of a entry?!
      .-1,.F=("E 2R'>'		    !* If so, move to its left!

   -:S(+1"N Q1J		    !* BOF: return to original position!
           -1"E :I*Not_inside_bibliographic_entry FS Err'
                "# -1''	    !* Return -1 as an error flag!
          "#&1"E 2C @F2j'    !* Move point to key!
        	 "#2C'
	         .U1'
  >
!* Check for a key, if it is missing print msg.!
!* Pre-comma arg = 2 no msg, if BIBTEX increment is defined exit to it!

1:<.,.+1F=,"E&2"E 1:<F;BIBTEX_increment>  !* Throw for incremental fields!
   @:FT
Please_enter_the_bibliographic_key.
   0FS EchoAct''>
0



!^R End of BibTex entry:! !^R Jump to end of bibliographic entry.
 Moves the cursor to the end of the current entry (just before the next '@').!

!* ^X = 1 - Remain after ].!

"L-:M(m.m^R_Start_of_BibTex_entry)'	    !* Negative arg!

.[1				    !* Save in case of error!

<:S_)+1"N			    !* Look for end of entry!
          Q1J -1"E:I*Not_inside_bibliographic_entry FS Err'
          -1'			    !* Signal an error!
         "# "E :S@"E ' "# 0l'' !* Move to the end of the entry!
	    .u1'		    !* Save point at the end!
  >
0



!^R Copy key:! !^R Copies the key at the point.
 Makes a copy of the key for this entry after the typing cursor.  This is
useful for copying the key into the key and author's fields, when the
fields all use the author's last name.!

.[1 [2
4,1M(m.m^R_Start_of_BibTex_entry)"L 0'
@:F,X2			    !* Pick up key!
Q1j G2				    !* Return to point and insert!
q1,.



!Show BIBTEX entries in window:! !C Permanently displays entry names.
 Creates a second window at the top of the screen and displays the
bibliographic entry names in it for quick reference.!

 [0
 ff&1"N "'Gu0'		    !* Set Q0 to -1 if arg positive else 0!
         "# qBIBTEX_Window"'Eu0'
 q0,0f  u0			    !* 1 = on; 0 = off!
 q0-qBIBTEX_Window"E 0'	    !* Already set!
 q0M(m.m&_Show_BibTex_entries)	    !* Invert window display!
 q0uBIBTEX_Window		    !* Remember the window status!
 0


!& Show BibTex entries:! !& Subr for entry names in window.!

"E 1M(m.m^R_One_window)	    !* Return to 1 window!
 QBIBTEX_Window_1_SizeUWindow_1_Size' !* Restore old size!
"#
1,2M(m.m^R_Two_windows)	    !* start two windows!
QWindow_1_sizeUBIBTEX_Window_1_Size	!* Remember old size!
-qWindow_1_size+3M(m.m^R_Grow_window)
				    !* Create 3 line window!
1:<M(m.mKill_buffer)BIBTEXW>	    !* Make sure its empty!
M(m.mSelect_buffer)BIBTEXW	    !* Use BIBTEXW in first window!
:I*No_entry_names_available	    !* default response!
fo..Q Bibtex_window_entries[1
G1				    !* dump in buffer!
Bj H@V				    !* display buffer!
M(m.m^R_Other_window)'		    !* Return to user's window!
0



!^R Print BibTex summary:! !^R Print summary of BIBTEX functions.
 Displays a short summary.  The summary is two pages long; if you want to see
the second page type a space, otherwise type '^G'.!

:I*No_entry_names_available	    !* default response!
fo..Q Bibtex_entries[1
:FT1				    !* Display entries!
0FS EchoAct




!^R Unexpand BibTex entry:! !^R Similar to C-X U but for BibTex entries.
 If you expanded an entry template by accident, this function will restore the
entry name as it was before the expansion.  This function is only valid
immediately after the template has been expanded.!

[1[2

1:<.-2,.-1F=)"E		    !* At the key?!
  .-1,.X1 -1D			    !* Delete expander character and save!
  1M(m.m^R_End_of_BibTex_entry)   !* Jump to the entry end!
  M(m.m^R_Unexpand_Last_Word)u2    !* Use word abbrev unexpand!
  G1				    !* Restore expander!
  q2'				    !* Return buffer changes!

  "#:I*Not_at_the_key_position_for_this_unexpand_command FS Err'
  >
0


!^R Mark BibTex entry:! !^R Place point at beginning and mark at the end.
 Places the mark at the end of the entry and the point at the beginning.  This
is useful for deleting or moving an entire bibliographic entry.  With an
argument, n entries from the cursor are marked.!

[1 .[2
M(m.m^R_End_of_BibTex_entry)"L oMarkErr'	!* Find end of entry!
.u1				    !* Q1 = end of entry!
				    !* Find start of entry!

3,M(m.m^R_Start_of_BibTex_entry)"L oMarkErr'
-FWL 0L				    !* Start of entry including @entry!

.,q1F u1j q1:		    !* Put point at front, mark at end!
0				    !* Exit!

!MarkErr! -1"N u1 q1:\u1	    !* Print error msg!
!""!      Q2j :I*Couldn't_mark_1_entries,_so_mark_wasn't_set FS Err'
	  -1			    !* Reset point and exit!


!BIBTEX Mode:! !C Turns BIBTEX key definitions on and off ('M-?' for summary).
 Argument of 0 turns it off.  Otherwise turns it on.!

[0				    !* Exit if already in right state!
FF"E QBIBTEX_Mode"N 
             F=ModeTEX"N
	        1M(M.M Tex_Mode)
		0FS^R InitM.L Compile_Command'
	     0'
	     "# 1U0''	
      "# Q0"E QBIBTEX_Mode"E 0''
           "# QBIBTEX_Mode"N
	   	  F=ModeTEX"N
		     1M(M.M Tex_Mode
		     0FS^R InitM.L Compile_Command'
	          0'''

 Q0uBIBTEX_Mode		    !* Set new the state!

 qBIBTEX_defsu0
 qBIBTEX_mode"N				    !* Turn on BIBTEX!

 qBIBTEX_window"G 1M(m.m&_Show_BibTex_entries)'

 1M(M.M Tex_Mode)		    !* Turn on Tex Mode!
 1M(m.mWord_Abbrev_mode)	    !* Turn on word abbrev mode!
 0M(m.m&_Alter_..D)@A		    !* Allow @ in abbrevs!

:I*BibTexuSubmode		    !* Indicate BibTex on mode line!
0FS^R InitM.L Compile_Command

  q..?  u:BIBTEX_defs(0)	    !* Save current defs!
 q...N  u:BIBTEX_defs(1)
 q...n  u:BIBTEX_defs(12)
  q..N  u:BIBTEX_defs(2)
  q..n  u:BIBTEX_defs(13)
 q...P  u:BIBTEX_defs(3)
 q...p  u:BIBTEX_defs(14)
  q..P  u:BIBTEX_defs(4)
  q..p  u:BIBTEX_defs(15)
  q...  u:BIBTEX_defs(5)
  q../  u:BIBTEX_defs(6)
  q..[  u:BIBTEX_defs(7)
  q..]  u:BIBTEX_defs(8)
 q...C  u:BIBTEX_defs(9)
 q...c  u:BIBTEX_defs(16)
 q..@  u:BIBTEX_defs(10)
 q.._   u:BIBTEX_defs(23)
 q...U  u:BIBTEX_defs(11)
 q...u  u:BIBTEX_defs(18)
 
 m.m^R_Print_BibTex_summaryu..?	    !* Assign new functions!
 m.m^R_Next_blank_BibTex_fieldu...N
 m.m^R_Next_blank_BibTex_fieldu...n
 m.m^R_Next_BibTex_fieldu..N
 m.m^R_Next_BibTex_fieldu..n
 m.m^R_Previous_blank_BibTex_fieldu...P
 m.m^R_Previous_blank_BibTex_fieldu...p
 m.m^R_Previous_BibTex_fieldu..P
 m.m^R_Previous_BibTex_fieldu..p
 m.m^R_Cleanup_BibTex_entryu...
 m.m^R_Incremental_BibTex_expandu../
 m.m^R_Start_of_BibTex_entryu..[
 m.m^R_End_of_BibTex_entryu..]
 m.m^R_Copy_keyu...C
 m.m^R_Copy_keyu...c
 m.m^R_Mark_BibTex_entryu..@
 m.m^R_Abbrev_Expand_Onlyu.._
 m.m^R_Unexpand_BibTex_entryu...U
 m.m^R_Unexpand_BibTex_entryu...u
'				    !* BIBTEX turned on!

"#				    !* Turn BIBTEX off!

 qBIBTEX_window"G 0M(m.m&_Show_BibTex_entries)'

 :I*uSubmode			    !* Clear mode line!
 0M(m.mWord_Abbrev_mode)	    !* Turn off word abbrev mode!
 0M(m.m&_Alter_..D)@_		    !* Disallow @ in abbrevs!

 q:BIBTEX_defs(0)u..?	    !* Restore current defs!
 q:BIBTEX_defs(1)u...N
 q:BIBTEX_defs(12)u...n
 q:BIBTEX_defs(2)u..N
 q:BIBTEX_defs(13)u..n
 q:BIBTEX_defs(3)u...P
 q:BIBTEX_defs(14)u...p
 q:BIBTEX_defs(4)u..P
 q:BIBTEX_defs(15)u..p
 q:BIBTEX_defs(5)u...
 q:BIBTEX_defs(6)u../
 q:BIBTEX_defs(7)u..[
 q:BIBTEX_defs(8)u..]
 q:BIBTEX_defs(9)u...C
 q:BIBTEX_defs(16)u...c
 q:BIBTEX_defs(10)u..@
 q:BIBTEX_defs(23)u.._
 q:BIBTEX_defs(11)u...U
 q:BIBTEX_defs(18)u...u
'				    !* BIBTEX turned off!
 0


!* Following should be kept as (only) long comments so will be compressed out:
 * Local Modes:
 * Fill Column:78
 * Compile Command:m(m.mGenerate Library)BibtexBibtex
 * End:
 * *!
