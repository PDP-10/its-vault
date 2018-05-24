!* -*- Teco -*- EMACS init file for RP !

  !*  Set up personal options !

f[dfile					     !* Bind default file    !
 e? RP;RPMAX :EJ"e				     !* Check for library    !
   m(m.m Load Library)RP;RPMAX'		     !*  Load RPMAX Library  !
f]dfile					     !* Unbind default file  !
m(m.m Text Mode)				     !* Enter text mode	     !
qEMACS Version-140"l				     !* In old emacs only    !
  m(m.m & Process Options)'			     !* Process this stuff   !

3m.vDisplay Matching Paren

  !* Read default EMACS init and run it!

erEMACS;* EMACS@y et.FOO. > :m(hfx*(fjz"Ei '))
