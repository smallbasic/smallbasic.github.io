# SPACE

> s = SPACE (n)

Returns a string of `n` spaces.

### Example 1:

```
print "A" + space(5) + "B"    ' Output: A     B
```

### Example 2: Insert string into a buffer

```
' s is a string ("" or longer); l is length of buffer (0+);
Def lset(s, l) = Left(s + Space(l), l) ' left justify text
Def rset(s, l) = Right(Space(l) + s, l) ' right justify text
Const buffer = 10 ' length of buffer

While True Do
  Color 7, 0: Cls
  Print "[ Using a buffer of "; buffer; " spaces ]"
  Print
  Input "Enter text into buffer (Enter 'S' to stop): ", text
  IF text = "S" Or text = "s" Then
    Stop
  Endif
  Color 7, 0: Locate 5, 0: Print "Left justified:  ";
  Color 0, 7: Print lset(text, buffer);
  Color 7, 0: Locate 7, 0: Print "Right justified: ";
  Color 0, 7: Print rset(text, buffer);
  Pause 
Wend
```
