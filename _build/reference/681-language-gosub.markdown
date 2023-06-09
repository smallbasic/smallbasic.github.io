# GOSUB

> GOSUB label

Causes program execution to branch to the specified label;
when the RETURN command is encountered, execution branches
to the command immediately following the most recent GOSUB command.

GOSUB should be used with caution. Using subroutines is more versatile
and much easier to read.

See ON for `ON n GOSUB Label1` for branching depending on a number `n`.

### Example 1: Using GOSUB

~~~
while(ii < 20)
  gosub Inc
wend

end ' ends the program
  
label Inc
ii++
print ii
return
~~~

### Example 2: Same as example 1, but using a subroutine instead of GOSUB

~~~
while(ii < 20)
  Inc()
wend
  
sub Inc()
  ii++
  print ii
end
~~~

