(comment)	;-*-LISP-*-

(prog (inf outf counts base *nopoint)
      (setq base 10. *nopoint ())
      (close infile)
      (load '|DSK:RLB%;MANDEX|)
      (load (get 'format 'autoload))
      (load (get 'sort 'autoload))
      (format T '|~%Use DDT type file specs, terminate with CR.|)
      (setq inf '|DSK:MANUAL;MACSYM DOC|)
      (format T '|~%Input (doc) file [default ~A]:| inf)
      (setq inf (mergef (readline tyi) inf))
      (setq outf (namestring (mergef '|* BINDEX| inf)))
      (format T '|~%Output (index) file [default ~A]:| outf)
      (setq outf (mergef (readline tyi) outf))
      (setq counts (generate-index-info inf outf))
      (format T '|~%~D nodes encountered for ~D commands.|
	      (car counts) (cdr counts))
      (quit))
