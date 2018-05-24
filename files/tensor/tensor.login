
:TERPRI
: Sends are ok, but no links, please (only for now) 
   :GAG -1
   :TCTYP REFUSE

: Change MySELF

: All of these are covered in .INFO.;DDTORD > so I won't explain 
     LINKP/ 1
   DELWARN/ 1
    C.ZPRT/ -1
   MORWARN/ 0
    MASSCP/ 1
    CONFRM/ 0
    BELCNT/ 1
    CLOBRF/ 0

: Entertain me as I slink away... 
   BYERUN/ -1

: Leave myself. KILL

: Now set our terminal type. 
:DDTSYM TTYTYP/
:IF N Q&<%TYSTY+%TYDIL+%TYMDM>
   (:DDTSYM TCTYP/
     :IF E Q-%TNSFW
         (:[Software]TERPRI
         )
     :ELSE
         (:--Home?--
         :IF MORE 0
             (:TTYLOC Home 
               :CRTSTY H1500
             )
         )
   )

: Inform his excellence if there is mail (or msgs) waiting 
   :IF E :EXISTS TENSOR MAIL
      >(:--Mail--IF MORE 0
             (:RMAIL
             )
         :ELSE
             (:Postponed
             )
         :CLEAR 
       )
   :ELSE
       (:[No mail]TERPRI
       )

: Set final file default = EXISTS DSK:TENSOR;TENSOR .FOO.

:TERPRI

: Back to being sociable... TCTYP ACCEPT

: Verchink! VK
