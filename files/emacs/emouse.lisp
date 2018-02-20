;;; -*- Mode: LISP; Package: USER; Base: 10; Fonts:CPTFONT; -*-
;;;
;;; Everyone should load indirect through this file.
;;;
;;; A source to the EMOUSE library is on TURNIP;EMOUSE SOURCE, but the master
;;; copy of that source is OZ:PS:<EMACS>EMOUSE.SOURCE
;;;
;;; Binaries are
;;; Rel 4  BIN  - TURNIP;EMOUSE R4BIN
;;; Rel 4 QBIN  - TURNIP;EMOUSE R4QBIN
;;; Rel 5  BIN  - TURNIP;EMOUSE R5BIN
;;; Rel 5 QBIN  - TURNIP;EMOUSE R5QBIN
;;; Sys98 QFASL - TURNIP;EMOUSE SYS98

(LET ((EXT (COND ((STATUS FEATURE SYMBOLICS)
		  (IF (STATUS FEATURE 3600.) "BIN" "QBIN"))
		 (T "")))
      (REL (COND ((STATUS FEATURE SYMBOLICS)
		  (FORMAT NIL "R~D" (SI:GET-RELEASE-VERSION)))
		 (T
		  (FORMAT NIL "SYS~D" (SI:GET-SYSTEM-VERSION))))))
  (LOAD (FORMAT NIL "MC: TURNIP; EMOUSE ~A~A" REL EXT)))
