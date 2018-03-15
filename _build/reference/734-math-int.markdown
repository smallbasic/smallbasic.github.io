# INT

> INT (x)

Rounds x downwards to the nearest integer.

I think /1 will convert a number to an integer in less keystrokes than INT, they both round down for positives and up for negatives.
In other words, they both drop the fractional part of the number.
<pre>

'INT or alternate.bas 2016-03-06 SmallBASIC 0.12.2 [B+=MGA]
'I think number\\1 is eqivalent to INT(number) in less keystrokes
' both of these convert a number to an integer and both round down to do it.
for i = 1 to 20
  'which coin should I use
  if rnd<.5 then TF=int(rnd*2) else TF=rnd*2\\1
  ? TF,
  if TF then ? "It is true now."; else ? "Now it's false.";
  ?spc(3)+"press a key or click for next..."
next
for i=0 to -10 step -1 'they seem to behave the same for negatives too
  test=i+rnd
  ? "test = ";test
  ? "test\\1 " ;test\\1
  ? "int(test) ";int(test)
  ?
next
pause

</pre>

