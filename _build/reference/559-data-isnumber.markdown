### Data

> ISNUMBER (x)

Returns true if x is a number (or it can be converted to a number).


<pre>? ISNUMBER(12)          :REM true
? ISNUMBER("12")        :REM true
? ISNUMBER("12E+2")     :REM true
? ISNUMBER("abc")       :REM false
? ISNUMBER("1+2")       :REM false
? ISNUMBER("int(2.4)")  :REM false

