### Data

> LEN(d)

Returns the length of the value contained in the variable.


* If x is a string, returns the length of the string.
* If x is an array, returns the number of the elements.
* If x is an number, returns the length of the STR(x).

<pre>

' format text lines
Def set(text, var) = Left(text + Space(60), 60) + Len(var)  
Color 15 
? "var is..." + Space(50) + "Len(var):"
?
Color 7
var = 15.2 ' number
? set("var = 15.2", var)
?
var = "SmallBASIC" ' string
? set("var = \\"SmallBASIC\\"", var)
?
var = [1, 2, "xyz"] ' 1-dimension array
? set("var = [1, 2, \\"xyz\\"]", var)
var = [1, 2, [3, "xyz"]] ' 1-dimension array and 1 nested array
? set("var = [1, 2, [3, \\"xyz\\"]]", var)
var = [1, 2, [3, [4, "xyz"]]] ' 1-dimension array and 2 nested arrays
? set("var = [1, 2, [3, [4, \\"xyz\\"]]]", var)
?
var = [] ' 1-dimension array
? set("var = []", var)
var = [1, 2; "xyz"] ' 2-dimension array
? set("var = [1, 2; \\"xyz\\"]", var)
var = [;;,] ' 3-dimension array
? set("var = [;;,]", var)
?
Dim var() ' empty array
? set("Dim var()", var)
Dim var(16 To 20) ' 1-dimension array
? set("Dim var(16 To 20)", var)
Dim var(16 To 20, 1 To 2) ' 2-dimension array
? set("Dim var(16 To 20, 1 To 2)", var)
?
var = Array("{x:1, y:3}") ' 1-dimension map array
? set("var = Array(\\"{x:1, y:3}\\")", var)
' 1-dimension map array and 1 nested map array:
var = Array("{x:1, y:3, down:{x:4, y:7}}") 
? set("var = Array(\\"{x:1, y:3, down:{x:4, y:7}}\\")", var)
' 1-dimension map array and 1 nested map array:
var = Array("{x:1, y:3, down:[{x:4, y:7}, {x:6, y:9}]}")
? set("var = Array(\\"{x:1, y:3, down:[{x:4, y:7}, {x:6, y:9}]}\\")", var)
Pause

</pre>

I added integer to list (50), and got  len = 2
Now I wonder if Floats change according to precision needed.
Now I wonder if integers change too...
Append quick experiment:
Oh, I guess it's the length of the number as STR'd up to 17 ...then it floats?
<pre>

' Len(number) = Len(Str(number))...
' but IEEE format for float and big numbers is hard to predict...
' few examples on 64-bit system:
? Str(100)                  ' 100
? Str(100.51)               ' 100.51000000000001
? Str(-300.3)               ' -300.30000000000001
? Str(0xFFFFFFFF)           ' 4294967295
? Str(0xFFFFFFFFFFFFFFFF)   ' -1
? Str(99999999999999.888888888888888) ' 99999999999999.890625
? Str(1.999999E+302)        ' 1.999999E+302

</pre>

Yes, I think it is the len of the string in exponent format when the number is too long to store as string without exponent notation.
I was doing long integers and it was matching len(STR number) and when switched to e format it was still the len of the number as string only with e format (very much shorter).
https:support.microsoft.com*en-us*kb*42980
(replace * with / to get the address)
This article shows that it's not easy to convert IEEE floating-point binary numbers to decimal numbers.
