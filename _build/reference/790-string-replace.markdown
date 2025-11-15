# REPLACE

> s = REPLACE (source, pos, str [, len])

Writes the string `str` into string `source` at position `pos` and returns the new string. This function replaces `len` characters. The default value of `len` is the length of `str`. Instead of a string, a number can be passed as a parameter. The number will be interpreted as a string.

### Example 1:

```
print replace("abcdef", 3, "1")                 ' Output: ab1def
print replace("abcdef", 3, "12")                ' Output: ab12ef
print replace("abcdef", 3, "123")               ' Output: ab123f
print replace("abcdef", 3, "1234")              ' Output: ab1234
print replace("abcdef", 3, 1234)                ' Output: ab1234     <- number 1234 is interpreted as string "1234"
print replace("abcdef", 3, "1234", 0)           ' Output: ab1234cdef <- inserted, no replacement
print replace("abcdef", 3, "1234", 1)           ' Output: ab1234def  <- only c was replaced
print replace("abcdef", 3, "1234", 2)           ' Output: ab1234ef   <- only cd was replaced
print replace("abcdef", 3, "", len("abcdef"))   ' Output: ab         <- cut
```

### Example 2:

```
Const TEXT = "Red Green Blue"   ' Text to replace:
Const Len_TEXT = Len(TEXT)
Const BLANKS = Len_TEXT - Len(Translate(TEXT, " ", "")) ' number of blanks in TEXT
Const ESCS = Chr(27) + "["
Const BG_BLACK = ESCS + "40m"
Const BG_RED = ESCS + "41m"
Const BG_GREEN = ESCS + "42m"
Const BG_BLUE = ESCS + "44m"
Const BG_YELLOW = ESCS + "43m"

' Helper to print the "name of color" with its color:  
func colors(s)
  s = Translate(s, "Red",    BG_RED + "Red" + BG_BLACK)
  s = Translate(s, "Green",  BG_GREEN + "Green" + BG_BLACK)
  s = Translate(s, "Blue",   BG_BLUE + "Blue" + BG_BLACK)
  s = Translate(s, "Yellow", BG_YELLOW + "Yellow" + BG_BLACK)
  s = Translate(s, " ", "_")
  colors = s  
End Func

Def lset(s) = Replace(Space(30), 1, s + ": ")  ' left justify s in buffer

color 15,0
cls

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
? lset("Center TEXT in buffer");        colors(Replace(Space(30), 15 - (Len_TEXT \ 2) + 1, TEXT))
? lset("(Justify TEXT in buffer)"); colors(Translate(TEXT, " ", Space((30 + BLANKS - Len_TEXT) / BLANKS)))
?
? lset("Replace TEXT with Yellow");  colors(Replace(TEXT, 1, "Yellow", Len_TEXT))
? lset("Override TEXT with Yellow"); colors(Replace(TEXT, (Len_TEXT / 2) - 3 + 1, "Yellow"))
? lset("Delete TEXT");               colors(Replace(TEXT, 1, "", Len_TEXT))
? lset("Create TEXT");               colors(Replace("", 1, TEXT))
```

