!* -*-TECO-*- !

!~Filename~:! !Functions for editing C code.!
C

!& Setup C Library:! !S Set up the C ..D table.!

  m.vC_..D			    !* Define ..D for C Mode.!
  [..O FSBCREATE G..D
  [0 0U0<Q0*5+1JFA%0-200.;> ]0 !* Make all Alphabetic!
  (*5+1JF(
  [*5+1JF(
  <*5+1JF_ !* angle brackets are like space!
  {*5+1JF(
  )*5+1JF)
  ]*5+1JF)
  >*5+1JF_
  }*5+1JF)
  $*5+1JF/ !* dollar sign quotes!
  "*5+1JF|
  11.*5+1JF_ !* Tab!
  12.*5+1JF_ !* LF!
  14.*5+1JF_ !* FF!
  15.*5+1JF_ !* CR!
  40.*5+1JF_ !* Space!
  =*5+1JF_ !* = breaks!
  '*5+1JF| !* ' is a string delimiter!
  .*5+1JF_
  ,*5+1JF_
  41.*5+1JF'
  %*5+1JF'
  ;*5+1JF'
  :*5+1JF_
  HXC_..D



!C Mode:! !C Setup things for editting C code.
Like LISP mode, but uses C syntax.
Also makes the following command character assignments:
    C-M-D   ^R Down List
    C-M-K   ^R Kill Sexp!

    M(M.M LISP_Mode)
    M.M Make_Local_Q-register[.Q
    M.Q ...D
    M.Q ...K
    M.M ^R_Down_ListU...D
    M.M ^R_Kill_SexpU...K

    M.Q ..D
    qC_..DU..D		    !* Set up ..D properly!

    :IComment_Start/*	    !* Setup for C style comments !
    (@:I*\_*/\)M.L Comment_End
    (@:I*\/*_\)M.L Comment_Begin
    40 M.L Comment_Column
    1M(M.M &_Set_Mode_Line)C
    

