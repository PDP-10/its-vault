

:terpri

:ddtsym byerun/-1

..genjfl/0
..belcnt/1
..sendrp/0
..delwarn/1
..clobrf/1
..c.zprt/0


 logo;ts ee, mmcm;chtn bin

:ddtsym tygtyp/
:if n q&10000 > (:pgs; rpict
:tctype tv,wholine 1,nobow
:jump rest
)

:clear
:--119 Harmony Lane ?--
:if more 0 > (:tctyp glass
:ttyloc McComb, Mississippi
:jump quit
)

:--Commons Room at ESG ?--
:if more 0 > (:tctyp vt52
:ttyloc VT52: ESG 24-612 x7787
:jump rest
)


:terpri
:--Back Room at ESG  ?--
:if more 0 > (:ttyloc ESG Back Room 24-623 x7787
               :terpri
               :--Do you plan to use EMACS ?--
               :if more 0 > (:tctyp hp line 100 page 35 tab
                            )
               :else (:tctyp glass no more tab
                     )
               :jump rest
             )

:terpri
:--Where are you ?--
:inline  :ttyloc
:--What type terminal are you using ?--
:inline   :tctyp


:tag rest
:clear

:gmsgs /n
:if e :exists ai:logo;klotz mail
> (:--Read your mail?--
:if more 0 > (:emacs
)
:clear
)

:tag quit
:exists logo;klotz .foo.
:clear

:vk
