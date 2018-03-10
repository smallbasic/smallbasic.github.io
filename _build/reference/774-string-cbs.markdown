### String

> CBS (s)

Converts (C)-style strings to (B)ASIC-style (S)trings.

<pre>

' See 'C - Strings' (http://www.tutorialspoint.com/cprogramming/c_strings.htm)
' to learn about strings in C language.
' See 'Escape sequences in C' (https://en.wikipedia.org/wiki/Escape_sequences_in_C)
' for "Table of escape sequences".

' --- Compare C string to SmallBASIC string (code...):
 ' C string (very compact):
? Cbs("         \\r\\n\\n\\t\\x22No \\tmore \\tCoffee...??!\\x22\\a")
Pause
' The equivalent SmallBASIC string (code): 
? "         ";
Locate Ypos, 0: ?: ?: ? ,; ' \\r\\n\\n\\t
? Chr(34); "No ", "more", "Coffee...??!" + Chr(34) + Chr(7) ' \\x22No \\tmore \\tCoffee...??!\\x22\\a"
Pause

' --- Print few demo strings as SmallBASIC and C: 
Def cs(s) = Cat(3) + Cbs(s) + Cat(-3) ' C string in reverse color
Const SP = " <--> "
' "SmallBASIC string" <--> "C string":
? "Hello\\f World!"; SP; cs("Hello\\f World!")  ' \\f = Formfeed (clear screen)
? "Hello\\0 World!"; SP; cs("Hello\\0 World!")  ' \\0 = null-terminated string
? "\\tHello World!"; SP; cs("\\tHello World!")  ' \\t = Horizontal Tab
? "Hello\\n World!"; SP; cs("Hello\\n World!")  ' \\n = Newline
? "Hello World\\r!"; SP; cs("Hello World\\r!")  ' \\r = Carriage Return (home pos)
? "Hello World\\a!"; SP; cs("Hello World\\a!")  ' \\a = Alarm (Beep, Bell)
? "Hello \\x22World!\\x22"; SP; cs("Hello \\x22World!\\x22")  ' \\xhh char as hexadecimal number
Pause 

</pre>

