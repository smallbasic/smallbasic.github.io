# INSTR

> INSTR ([start,] s1, s2)

Returns the position of the first occurrence of the string s2 into string s1 (starting from the position 'start'). If there is no match, INSTR returns 0



<pre>

' INSTR oddity.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-08
'this oddity was discovered with inkey failure to work as expected
?instr("ABCD","")    'aha! returns 1
pause
'end
'I am trying to figure out why the following code wont work, it's because instr("anything","")=1
while 1
s=" x=exit n=nice r=random g=globe"
at (xmax-txtw(s))\\2,0:?s
repeat 
  ink=inkey
  ink=upper(ink)
  delay 20
'until ink="X" or ink="Q" or ink="N" or ink="R" or ink="G" '<= this works great!
until instr("XQNRG",ink)>0 '<==== this refuses to work right
cls
at 0,3*txth("Q"):? "You pressed '";ink;"'"
? " instr XQNRG,ink  '";instr("XQNRG",ink);"'  press any..."
pause
if ink="X" then ? "Goodbye":end
wend

</pre>

