# DEF

> DEF name[(par1[,...])] = expression

Defines a single line function. 

See FUNC for multiline functions and SUB for multiline subroutines.

Example 1: Function with one parameter

~~~
def f(x) = 2*x+3

print f(3)
~~~

Example 2: Function with two parameters

~~~
def f(x,y) = 2*x + 3*sin(y)

print f(1,2)
~~~

Example 3: Random number between low and high

~~~
' A function for random integer numbers between low and high (inclusive)
DEF randi(lo, hi) = (RND * (hi - lo + 1))\1 + lo

' A function for random float numbers between low and high (inclusive)
DEF randf(lo, hi) = (RND * (hi - lo + 1)) + lo

print randi(0, 100)
print randf(0, 100)
~~~

Example 4: DEF and LOCAL

~~~

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

~~~


