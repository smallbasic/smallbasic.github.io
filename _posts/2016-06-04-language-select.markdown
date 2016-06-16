---
permalink: /655
layout: post
title:  "SELECT"
categories: language
---
Language

SELECT CASE expr

Perform multiple tests on the expression. Offers a more concise syntax to writing successive IF tests.

(see also CASE and the alternate IF THEN ELIF ELSE FI structure)
just one example:
<pre>

x = 17
select case x
case is < 10
? "x is less than 10"
case 12
? "x is 12"
case 13,14,15
? "x is 13,14,or 15"
case 16 to 20
? "x is between 16 and 20"
end select

</pre>

There are no error messages, but nothing is printed.
It has been my experience that Select Case does not work well with ranges and multiple conditions.
In my opinion, it is only helpful for single case items.
Here is same code in at least a concise form as SELECT CASE using IF THEN ELIF ELSE FI code block structure:
<pre>

x = 17
if x<10 then
  ? "x is less than 10"
elif x=12
  ? "x is 12"
elif x=13 or x=14 or x=15
  ? "x is 13,14,or 15"
elif x>=16 and x<=20
? "x is between 16 and 20"
else
  ? "didn't catch x"
fi
pause

</pre>

SELECT/CASE was originally intended for single values, but the multi-item syntax was recently added:
case 13,14,15
These lines from your example are not (yet) supported:
case is < 10
case 16 to 20
I think the 'is', '<' and 'to' symbols are being incorrectly evaluated as multi-term elements, so there is no error reported.
The case item can be any expression that evaluates to a single term, for example:
(this is example that Chris found later for work around to extend range in one case):
<pre>

How about this:
for x = 0 to 20
? x;
select case x
case iff(x >= 1 AND x <= 5, x, x+1)   '<=== checks several values, a range from 1 to 5
? " = 1-5"
case 5+1
? " = 6"
case 5+2
? " = 7"
case 13,14,15,16,17
? " = 13,14,15,16,17"
case else
? " = other"
end select
next x
pause

</pre>

This will work too for work around to add range to a CASE block:
<pre>

const notlikelyever=-9999999.1234
def ao(a,o,x)=iff(x>a and x<=o,x,notlikelyever)
'I call the alpha omega function ao.
for i=1 to 20
  x=int(rnd*60)-10
  ? x;
  select case x
  case ao(-100,0,x)
    ? " x is >-100 and <=0"
  case ao(0,10,x)
    ? " x is >0 and <=10"
  case ao(10,20,x)
    ? " x is >10 and <=20"
  case ao(20,30,x)
    ? " x is >20 and <=30"
  case ao(30,40,x)
    ? " x is >30 and <=40"
  case else
    ? " did not catch x"
  end select
next
pause

</pre>

