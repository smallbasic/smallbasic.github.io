# String

> VAL (s)

Returns the numeric value of string s.

Here is an opportunity for enhancing SmallBASIC's function VAL, this EVAL is only beginning of what might be done.
<pre>

' VAL test.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-05
s1="123.234*4+1000/2"
? val(s1)
? eval(s1)
pause
func eval(numericexpressionstring)
  'working left to right, no parenthesis
  e=0:cmd="+":ds=""
  for i=1 to len(numericexpressionstring)
    c=mid(numericexpressionstring,i,1)
    if instr("0123456789.",c) then ds=ds+c
    if instr("+-*/",c) or i=len(numericexpressionstring) then
      'execute last cmd if one
      if cmd<>""  then
        d=val(ds)
        select case cmd
        case "+":e=e+d
        case "-":e=e-d
        case "*":e=e*d
        case "/":e=e/d
        end select
        ds="":cmd=""
      end if
      if i<>len(numericexpressionstring) then cmd=c
    end if
  next
  'eval=str(e) '<=== I am setting up something for Turtle strings 
  eval=e        '<=== normal people and usage might want this
end

</pre>


Math EVAL function = evaluates a string as though it were an expression and returns a result.
I've written in Euphoria 4 correct math EVAL function, you can download it and see how it works, if you're really into it:
rapideuphoria.com*math_eval_v1_1_0.zip
It is straightforward to translate that Euphoria code into SmallBASIC code.
EVAL must be around here somewhere, it is a classic. I thought I might find a version in TinyBASIC but I am too much into getting a turtle string to repeat to hunt for it at moment.
The VAL command just converts a string to a number. For EVAL type functionality, the CHAIN command is somewhat similar.
