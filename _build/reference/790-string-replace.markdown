# REPLACE

> REPLACE (source, pos, str [, len])

Writes str into pos of source and returns the new string.

This function replaces only _len_ characters. The default value of _len_ is the length of _str_.

```
s="123456"
...
' Cut
? replace(s,3,"",len(s))
...
' Replace
? replace(s,2,"bcd")
...
' Insert
? replace(s,3,"cde",0)
...
' Replace & insert
? replace(s,2,"RRI",2)
```

~~~
'replace test.bas 2016-02-26
'function replace(source,pos,str [,len])     len of source is default
s="123456"
' Cut
? replace(s,3,"",len(s)) 'returns 12
? replace(s,3,"")        'returns 123456
? replace(s,3,"",1)      'returns 12456  yes!
' Replace
? replace(s,2,"bcd") 'returns 1bcd56
' Insert
? replace(s,3,"cde",0) 'returns 12cde3456
' Replace & insert
? replace(s,2,"RRI",2) 'returns 1RRI456
pause

~~~


~~~
' Helper to print the "name of color" with its color:

  Const ESCS = Chr(27) + "["
  Const BG_BLACK = ESCS + "40m"
  Const BG_RED = ESCS + "41m"
  Const BG_GREEN = ESCS + "42m"
  Const BG_BLUE = ESCS + "44m"
  Const BG_YELLOW = ESCS + "43m"
  s = Translate(s, "Red",    BG_RED + "Red" + BG_BLACK)
  s = Translate(s, "Green",  BG_GREEN + "Green" + BG_BLACK)
  s = Translate(s, "Blue",   BG_BLUE + "Blue" + BG_BLACK)
  s = Translate(s, "Yellow", BG_YELLOW + "Yellow" + BG_BLACK)
  s = Translate(s, " ", "_")
  colors = s  
End Func
Def lset(s) = Replace(Space(30), 1, s + ": ")  ' left justify s in buffer

' Text to replace:
Const TEXT = "Red Green Blue"
Const Len_TEXT = Len(TEXT)
Const BLANKS = Len_TEXT - Len(Translate(TEXT, " ", "")) ' number of blanks in TEXT

' Syntax: REPLACE (source, pos, str [, len]):
? lset("TEXT is"); colors(TEXT)
?
? lset("Replace Green with Yellow"); colors(Replace(TEXT, 5, "Yellow", 5))
? lset("Append Yellow");             colors(Replace(TEXT, Len_TEXT + 1, " Yellow"))
? lset("Prepend Yellow");            colors(Replace(TEXT, 1, "Yellow ", 0))
? lset("Insert Yellow after Red");   colors(Replace(TEXT, 5, "Yellow ", 0))
?
? lset("Delete Green"); colors(Replace(TEXT, 5, "", 6))
? lset("Chop Red");     colors(Replace(TEXT, 1, "", 4))
? lset("Chop Blue");    colors(Replace(TEXT, Instr(TEXT, " Blue"), "", Len(" Blue")))
?
? lset("Left justify TEXT in buffer");  colors(Replace(Space(30), 1, TEXT))
? lset("Right justify TEXT in buffer"); colors(Replace(Space(30), 30 - Len_TEXT + 1, TEXT))
? lset("Center TEXT in buffer");        colors(Replace(Space(30), 15 - (Len_TEXT \\ 2) + 1, TEXT))
? lset("(Justify TEXT in buffer)"); colors(Translate(TEXT, " ", Space((30 + BLANKS - Len_TEXT) / BLANKS)))
?
? lset("Replace TEXT with Yellow");  colors(Replace(TEXT, 1, "Yellow", Len_TEXT))
? lset("Override TEXT with Yellow"); colors(Replace(TEXT, (Len_TEXT / 2) - 3 + 1, "Yellow"))
? lset("Delete TEXT");               colors(Replace(TEXT, 1, "", Len_TEXT))
? lset("Create TEXT");               colors(Replace("", 1, TEXT))
Pause

~~~


