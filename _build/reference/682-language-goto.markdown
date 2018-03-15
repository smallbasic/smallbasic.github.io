# GOTO

> GOTO label

Causes program execution to branch to a specified position (label).

<pre>

' Note: GOTO is known to create "spaghetti code", i.e. winding code which is
'       hard to follow, to understand, and to maintain.
'       IF...THEN, SELELCT CASE, SUB, FUNC and DEF are much better ways to
'       write branching code.
         
While True 
  x = Rnd
  tries += 1
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
Pause

</pre>

GOTO loop jumping is surest way to stack overflow error!
Modular coding and GOTO do not mix well. Use GOTO with extreme caution within code blocks if you must.
You probably should mean "GOSUB stack overflow error";
GOTO is a freelancer freak (like me...), he can change direction at any time. (unless you try to GOTO Label inside a sub routine, which is insane anyway).
Only GOSUB must have obligations, and as human being, it leads to nervous breakdown...
P.S. In Euphoria programming language the stack dynamically expends and shrinks forever.

Hi shian,
Well memory might be playing tricks with me because I don't use GOSUB or GOTO that often except translating old code. It could very well be GOSUB I am remembering or any GOTO into or out of a subroutine.
In your large industrial programs how many times do use GOTO and are confident you have written the best code possible?
I never use GOTO.
The best code is always relative to schedule. At certain moment the program must be finished, and sometimes you know very well that you could do MUCH better work if only you had more time... life.

