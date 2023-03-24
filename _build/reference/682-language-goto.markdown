# GOTO

> GOTO label

Causes program execution to branch to a specified position (label).

GOTO is known to create "spaghetti code", i.e. winding code which is
hard to follow, to understand, and to maintain. IF...THEN, SELELCT CASE,
SUB, FUNC and DEF are much better ways to write branching code.

### Example 1

```
label FirstLine
    
ii++
print ii
if(ii == 10) then goto LastLine 
goto FirstLine

label LastLine
```

### Example 2

```
randomize

While True 
  x = Rnd
  tries++
  
  While True
    If x < 0.05 Then 
      Print "x < 0.05 (after "; tries; " tries)."
      Goto exitLoops ' here we exit all loops unconditionally.
    Elif tries = 10 Then
      Print "missed! (after "; tries; " tries)."
      Goto exitLoops ' here we exit all loops unconditionally.
    Else
      Exit Loop ' here we exit only the inner WHILE loop
    Fi
  Wend
  
Wend

Label exitLoops
Print
Print "Out of loops now."

```



