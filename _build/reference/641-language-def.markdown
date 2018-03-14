# Language

> DEF name[(par1[,...])] = expression

Defines a single line function. eg, DEF MySin(x) = SIN(x): ? MySin(pi/2)

This might come in handy sometime.
<pre>

' RND - returns a number from 0 to almost 1
' DEF - one line function definition
'A function for random numbers (integers) between low and high (inclusive)
'here is that function
DEF rand(lo,hi)=(RND*(hi-lo+1))\\1+lo '<======================= RND and DEF
'test the distribution of these numbers with 1000 trials
low=1100:high=1150
DIM a(low-1 TO high+1)
FOR i=1 to 1000
  index=rand(low,high)
  a(index)++
NEXT
total=0
FOR i=low-1 TO high+1
  ? i;":";a(i);", ";
  total+=a(i)
  IF i MOD 10=9 THEN ?
NEXT
?:? "total trials=";total
'result: pretty even spread between two numbers inclusive.
PAUSE

</pre>

<pre>

' DEF and LOCAL.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-06
'can I use DEF locally in a sub without interfering with main variable or DEF names
def aboutMe() = "I am texting from main code."
? "Hi, ";aboutMe
mySub
? "Goodbye, ";aboutMe
pause
sub mySub()
  'local def aboutMe() = "I am texting from mySub." '<=== note: this did not work 
  local aboutMe
  def aboutMe() = "I am texting from mySub."
? "Hi, ";aboutMe
end

</pre>

