# System

> ENV expr

Returns the value of a specified entry in the current environment table. If the parameter is empty ("") then returns an array of the environment variables (in var=value form).

ENV can be used as SUB for setting or erasing Environment Variables (EV) and ENV can be used as a FUNCtion for returning a particular EV or the whole set of them into an array using:
EVarray=ENV("") 
<pre>

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

</pre>

