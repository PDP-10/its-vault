

:terpri

:ddtsym byerun/-1
..genjfl/0
..belcnt/1
..sendrp/0
..delwarn/1
..clobrf/1
..c.zprt/0
:terpri
:--Commons room at ESG ?--
:if more 0 > (:tctyp vt52 speed 300
               :ttyloc VT52: ESG 24-612 x7787
               :jump end
             )

:terpri
:--Back Room at ESG ?--
:if more 0 > (:ttyloc ESG Back Room 24-623 x7787
               :terpri
               :--Do you plan to use EMACS ?--
               :if more 0 > (:tctyp hp line 100 page 18
                            )
               :else (:tctyp glass line 100 no more
                     )
               :jump end
             )


:terpri
:--Where are you ?--
:inline  :ttyloc
:--What type terminal are you using ?--
:inline   :tctyp

:tag end
:clear


:exists users2;klotz .foo.
:clear
:vk
