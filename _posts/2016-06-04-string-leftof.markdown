---
permalink: /784
layout: post
title:  "LEFTOF"
categories: string
---
String

LEFTOF (s1, s2)

Returns the left part of s1 at the position of the first occurrence of the string s2 into string s1.

<pre>

s1 = "small*SMALL*BASIC*basic"
s2 = "*"
Color 15
? "s1 parameter is:     "; s1
?
? "s2 parameter is:     "; s2
?
?
Color 7
? "Leftof(s1, s2)                = "; Leftof(s1, s2)
? "Left(s1, Instr(s1, s2) - 1)   = "; Left(s1, Instr(s1, s2) - 1)
?
? "Leftoflast(s1, s2)            = "; Leftoflast(s1, s2)
? "Left(s1, Rinstr(s1, s2) - 1)  = "; Left(s1, Rinstr(s1, s2) - 1)
?
? "Rightof(s1, s2)               = "; Rightof(s1, s2)
? "Right(s1, Rinstr(s1, s2) - 1) = "; Right(s1, Rinstr(s1, s2) - 1)
?
? "Rightoflast(s1, s2)           = "; Rightoflast(s1, s2)
? "Right(s1, Instr(s1, s2) - 1)  = "; Right(s1, Instr(s1, s2) - 1)
?
?
? "Leftof(s1, s2) + Rightoflast(s1, s2): "; Leftof(s1, s2) + Rightoflast(s1, s2)
Pause

</pre>

