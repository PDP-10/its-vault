
..genjfl/0
..belcnt/1
..sendrp/0
..clobrf/1
..c.zprt/0

:ddtsym ttynum/
:if e q-31
(:jump atari
)

:ddtsym ttynum/
:if e q-33
(:jump atari
)

:ddtsym tygtyp/
:if n q&10000
(:ddtsym xuname/
  :if e q-1'jacobs
  (:ed;norsv
    :sleep 30
    :jump whodat
  )
  :if e q-1'klotz
  (:jump whodat
  )
 )

:ddtsym ttytyp/
:if n q&200000
(:jump whodat
)

:terpri
:--ESG?--
:if more 0 > (:tctyp vt52
:ttyloc 24-612 x7787
:jump whodatî)
:terpri
:--Where are you ?--
:inline  :ttyloc
:--Please briefly describe your terminal ?--
:inline   :tctyp
:jump whodat

:tag atari
:tctyp soft hei 24 wid 39 +%tosai +%tolid +%tocid full +%tprsc no overwrite
:ttyloc Logo 327

:tag whodat
:clear

:ddtsym xuname/
:if e q-1'klotz
(
 ..delwarn/1
 :ddtsym byerun/-1
 :if e :exists ai:klotz;klotz mail
  > (:gmsgs * /n
  :--Read your mail?--
   :if more 0 > (:e m(m.m Read Mail)
  )
  :clear
)
 :exists ai:klotz;klotz .foo.
 =
 :jump endî)

:if e q-1'jacobs
(
..delwarn/2
:intest

:exists ai:klotz;jacobs .die
=
)

:tag end
:vk
