---
permalink: /809
layout: post
title:  "PAUSE"
categories: system
---
System

PAUSE [secs]

Pauses the execution for a specified length of time, or until user hit the keyboard.

PAUSE n - n is optional number of secs, with or without n, PAUSE will wait for key press or mouse click (or the optional amount of secs) before executing next statement.
BUT! be warned PAUSE may interfere with INKEY or PEN(3) events if they follow a PAUSE.
PAUSE is the perfect choice for the PRINT "Hello World" classic first program. Now days, that screen wont stay up long enough to see without something like PAUSE to halt program execution (for the user to see the output screen).
<pre>

'ribbons.bas SmallBASIC 0.12.2 [B+=MGA] 2016-03-24
'new and improved update of SB and Bpf posts 2015-04-16 B+
at 80,610:? "Wait 8 secs or press any for next screen..."
const a=127
while 1 
  for i=0 to 9
    b=rnd^2:c=rnd^2:d=rnd^2
    for x=1 to 600
      cl=RGB(a+a*sin(b*x),a+a*sin(c*x),a+a*sin(d*x))
      line x,i*60+1 step 0,60,cl
    next x
  next i
  pause 8 '<=========== pause waits 8 secs or key press
wend

</pre>

