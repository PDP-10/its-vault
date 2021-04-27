!* -*-TECO-*-!
!~FILENAME~:! !Library for looking up words in Webster's 7th online.!
WEBSTER

!& Dictionary Lookup Word:! !S Lookup the word at or near the cursor
in Webster's 7th unabridged.  With an argument, treats the word or
words in the region as one word and performs the lookup.!

    [0
    "E
     .(:c
     !"!
     -@fABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-': [B
     !"!
     @FABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-'[E
     qB,QEx0
     )J'			    !* Get the word into 0.!
     "#
       .,:F X0'    
    f[b bind
    @FT
Looking_up_0... 0 fs echo active

    fs osteco"G :ft fzSYS:WEBSTER.EXE_0
'
    "#
    fs jname:f6[J
((F=Editor_TypeMAILT"'E)+(Fs Lispt))"N
      :i*NML	Does_not_work_as_inferior_to_MAIL_or_Lispfs err 0'
     :ft
:WEBSTER_0
:JOB_J
:CONTINUE_'
    0

