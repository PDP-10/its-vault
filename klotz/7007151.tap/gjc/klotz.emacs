�( �  
[0+8+FQ(+4)[1
0FO10F"G+Q1'
+FQ()+4U1
FQ1"L0'
,Q1:M(Q1+4(]1]0))
   �     �   �   !�   ��  ��   ��  �    {�  S�  �  i�  �  ;�  E�  �   *�  ?   :�  �   H   <�  ��  �   g�  �   t   �+   �  #   �     �  #�  & Setup .EMACS Library�  Get Matching Lines�  ^R Backward Delete Phrase�  ^R Macro Argument�  ^R Select Buffer�  ^R Transpose Preceeding Characters�  ~DIRECTORY~�  ~DOC~ & Setup .EMACS Library�  ~DOC~ Get Matching Lines�  ~DOC~ ^R Backward Delete Phrase�  ~DOC~ ^R Macro Argument�  ~DOC~ ^R Select Buffer�  ~DOC~ ^R Transpose Preceeding Characters�  ~DOC~ ~FILENAME~�  ~FILENAME~�  ~INVERT~�y :i*Textm.vDefault Major Mode
:i*Babylm.vMail Reader Library
:i*Rmailm.vMail Sender Library
1m.vTags Find File
-1m.vDisplay Matching Paren
1m.vInhibit Help Message
72m.vFill Column
@:i*|(Q:.B(Q3+8)F"N(i ):FsFdConvert')|m.vSet Mode Line Hook
2fsEchoLines
@:i*|1m.LAuto Fill Mode|m.vBabyl R Hook
QBabyl R Hookm.vBabyl M Hook
QBabyl R Hookm.vBabyl F Hook
fs%tofci"L
:@i*|65fs^Rinitu|m.vTeco Mode Hook'
fsrgetty-5"E
:i*!"#$%&'()_m.vDigit Shift Table'
fsrgetty-7"E
:i*!@#$%^&*()m.vDigit Shift Table'
65fs^Rinitu.
Q.Ou...O
m.m^R Split Lineu.O
m.m^R Just One Spaceu.. 
m.m^R Kill Sexpu...D
@:i�|1,m(m.m^R CRLF)|
m.m^R Backward Delete Phraseu:.x(,)
fsmachine-(f6AI)"E
m.m^R String Searchu.S'
m.mCompileu..Z
m.m^R Transpose Preceeding Charactersu.T
m.m^R Macro Argumentu..M
m.m^R Select Bufferu:.x()
m(m.mLoad Library)PHRASE
m(m.mText Mode)
:i*CFsEchoDisp
@ftEMACS 10fsEchoActive
0u..9
hkerEMACS;* EMACS@Y:M(HFX*)�  2r1a[0dcq0i
.-2,.�  m(1,fTeco: )
� [0[1[2[3[4[5[6[7[8
f[dfile
fsQPPtru8
fsBCons[..o
i     # Buffer    (Mode)         Filename

13i10i
2u7
0u4fq.b/5u5
<q4-q5;
q:.b(q4+4)[..o
0u1
fsModified"nq11u1'
q:.b(q4+10)"N
fsXModified"Nq12u1''
fsZu3
]..o
.u04,32i
q1&1"n.-2f*'
q1&2"n.-1f-'
2,q:.b(q4+7)\
i g:.b(q4+1)
17-(.-q0):f"gw1',32i
q:.b(q4+3)u1
qBuffer Index-q4"e
qModeu1q0u6
.(q0+3j2a-32"EC'f.)j'
i(1)
32-(.-q0):f"gw1',32i
q:.b(q4+2)u1
q1"n
g1
ET1
q:.b(q4+9)u2
FSDVERS:"G
FSDVERS+1"N
i (g2i)'''
q1"Eq3\i  Characters'
q:.B(Q4+12)u2
q2"Gi  File Read-Only'
q2"Li  Buffer Read-only'
i
%7w
q:.b(q4)+q4u4
>
q6"nq6j'
fsLinesu6q6"efsHeight-(fsEchoLines)-1u6'
q7+1-q6"lq7+1f[Lines'
0f[Window
0fs^RInitf[^RNormal
33.fs^Rinit[ 
:i*Buffer Menu[..j
0[..F
@:i*|0f[Linesm(m.mDescribe)^R Select Bufferh|f[HelpMac
fsHelpMac[?
@:i*|0l@f DS*-.l\[1q1"e0lfg1'
q1m(m.m& Find Buffer)u1
q:.b(q1+4)[..o0fsModifiedw0fsXModifiedw]..o
0l.+2f  .+2,.+4(m.N)|[~
@:i*|0l1a-�"Efg'fD1 (m.N)|[D
qD[.D
@:i*|0l1a-�"Efg'fS1 (m.N)|[S
@:i*|0l1a-�"Efg'f 1 (m.N)|[U
@:i*|l.-z"Ej2l'0|[N
qN[.N
@:i*|-lF=(X*)
"Ezj-l'0|[P
qP[.P
!BACK!
0l0,1a-D"efgoBACK'
@f S*-.l\u1
q1"efgoBACK'
q..ou2q8fsQPUnwind
q2[..ojl
<:s
 ;
0a-D"e@f *-.l\u3q3"n
q3-q:.b(qBuffer Index+7)"e
q1"n]..oq1m(m.mSelect Buffer)wq2[..o''
q3m(m.mKill Buffer)'!<!>'
0a-S"e@f *-.l\u3q3"n
]..oq3m(m.mSelect Buffer)
m(m.m^R Save File)wq2[..o'!<!>'
>
]..o
q1"nq1-q:.b(qBuffer Index+7)"n
q1m(m.mSelect Buffer)''
q2fsBKill�  -:m(m.m^R Delete Phrase)�  [1:i*[2
1,fPattern:f[sstring
.[0FNQ0J
<:S;
0lx1:i221
L>
Q2�  .EMACS�  Emacs library for Klotz.�  S Do useful things.�  ^R Transpose preceeding two characters.�  ^R Read a line and macro it.� ^R Display information about all buffers.
A recursive edit level is entered on a list of all buffers.
On exit the buffer on the current line is selected.
Point is initially on line of current buffer and space will exit (like
^R Exit), so this is very much like List Buffers but
combines listing with selecting in a way that does not involve
much typing or redisplay.  * means modified, - means modified and not
auto-saved, . means current buffer.

D, C-D will mark buffer for deletion on exit.
S will mark buffer for saving on exit.
U will unmark buffer.
N, C-N will go down to next buffer, and wrap after last buffer.
P, C-P will go up to previous buffer, and wrap.
~ will clear modified flags of buffer.�  ^R Calls ^R Delete Phrase with a negative argument.
G(m.m~DOC~ ^R Delete Phrase)jk� C Like Occur, but returns a value instead of printing.
Follow with string, alt, "U" and your favorite Q-register.
This command does not support the numeric argument feature of Occur.� & Setup .EMACS Library
^R Transpose Preceeding Characters
^R Macro Argument
^R Select Buffer
^R Backward Delete Phrase
Get Matching Lines
�  +8+fq(+4)[20[3
<%3,-q2f2u3q3&1@;q3"l0'>
f[BBindq3-1*5,q3*5g2q:..o(0)+q2                                                                                                                                                                                                                                                                                                              