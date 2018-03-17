# ENV

> ENV expr

Adds a variable to or deletes a variable from the current environment variable-table.

ENV can be used as SUB for setting or erasing Environment Variables (EV) and ENV can be used as a FUNCtion for returning a particular EV or the whole set of them into an array using:
EVarray=ENV("")

~~~

' ENV test.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-10
'OK this works
'OK this is supposed to return an array of my Environment variables
EVS=ENV("")
for e in EVS
  ? e
next
?:? "press any..."
pause
'wow it worked! I have a load of them...
'OK now try and set one of my own
cls
myEV1="This is a test of ENV."
ENV "myEV1="+myEV1
'did it get added to list?
EVS=ENV("")
for e in EVS
  ? e
next
?:? "press any..."
pause
'YES!
'OK let's see it
myEV1return=ENV("myEV1")
cls
? myEV1return
?:? "press any..."
pause
'now can we erase it?
ENV "myEV1="
cls
? "myEV1 should be erased, it is now '";ENV("myEV1");"'"
?:? "Test of ENV is complete."
pause
'yes, it was erased because when I ran same code a second time, it wasn't there THEN!
' so it didn't just LOOK erased from a bad call

~~~


~~~
ENV "myEV1="
~~~
 does not erase the variable on Linux...
On Linux I could only erase the variable from a terminal:

~~~
unset $myEV1
~~~

In general:
1. 
Never use names which are already used by the system or another process, such as "PATH", "HOME", "PWD", etc.
You can check which variable names are already used, from SmallBASIC:

~~~
? Environ("")
~~~

2. 
Use short and unique names, such as: "SB1", SB2" or "SBv1", "SBv2", etc.
It will keep the environment-variables-table readable, and will save space in the table.
3.
Don't create more variables then you need. Reuse any variable which is not used.
i.e. if "SB1" is unused anymore, then reuse it: 
~~~
Environ "SB1=5"
~~~
.
Again, it keeps the environment-variables-table readable, and saves space in the table.
4. 
On some systems the environment-variables-table is unique for each session (Linux for example) and this may be a bit confusing.
5.
Environment variables may or may not be case sensitive, i.e. "SB1" may be different then "sb1" on some systems (Linux for example).

