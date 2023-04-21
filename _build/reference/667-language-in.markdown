# IN

> a IN b

- b is an array: Returns the index (1 based) of the first matching element. If no matching element, IN returns FALSE.
- b is a string: Returns TRUE if the value is contained within b.
- for loop: FOR i IN array will cycle through all elements of array, i contains the element.

### Example 1: array

```
print 1   in [-2,-1,1,2]           ' Output 3
print "b" in ["a", "b", "c", "d"]  ' Output 2
```

### Example 2: string

```
print "a"  in "car"                ' Output 1
print "ar" in "car"                ' Output 1
print "d"  in "car"                ' Output 0
```

### Example 3: for loop

```
a = [4,8,2,3,9]
for i in a
    print i
next
'Output 4 8 2 3 9
```

```
a = ["duck", "dog", "cat"]
for i in a
    print i
next
' Output duck dog cat
```

### Example 4: Count files

```
myFiles = FILES("*")

for fl IN myFiles
  if ".bas" IN fl then NumBasFiles++
  if ".txt" IN fl then NumTxtFiles++  
next

print "Number of .bas files: " + NumBasFiles
print "Number of .txt files: " + NumTxtFiles
```

### Example 5

```
' IN keyword is 1-Based, so using "Option Base 1" makes code more consistent:
Option Base 1
Def q(text) = " " + Enclose(text) + " "  ' Enclose text with quotation marks, ""
Def rev(text) = Cat(3) + text + Cat(-3)  ' reverse colors of text
Sub title(text)
  Color 14: Print text: Color 7  ' print title in color
End Sub

title "Use IN to check if sub-string exists within string (see also INSTR):"
s = "Hello 5"
? rev("   s =" + q(s))
? "  "; q("ll") + "In s? "; "ll" In s,, ' (0=FALSE; 1=TRUE)
? "  "; q("LL") + "In s? "; "LL" In s
? "  "; q("l") + " In s? ";  "l" In s,,
? "   5    In s? ";        5 In s

title "Use IN to return the index of matching element in array (1-Based):"
Dim a()
a << "Hello" ' append (<<) three elements to a array
a << "World"
a << 123
'a << [4,"x",6] ' nested array conflicts with the other types.
? rev("   a = " + Str(a) + " ")
? "  "; q("Hello") + "In a: "; "Hello" In a,,
? "  "; q("ello") + " In a: ";  "ello" In a
? "  "; q("HELLO") + "In a: "; "HELLO" In a,,
? "  "; q("World") + "In a: "; "World" In a
? "    123    In a: ";         123 In a,,
? "    12     In a: ";         12  In a
'? "[4,\\"x\\",6] In a: "; [4,"x",6] In a ' (nested array)

title "Use IN to flatten multi-dimension array:"
a = [1, 2, 3; 4, 5, 6; 7, 8, 9, 10, 11; "Hello", "World"]
? rev("   a = " + Str(a) + " ")
? "   ";
For i In a
  ? i; ", "; ' i is used as pointer to a array element inside FOR loop
Next
?
title "Use IN to print nested arrays:"
a = [[1, 2, 3], [4, 5, 6], [7, 8, 9, 10, 11], ["Hello", "World"]]
? rev("   a = " + Str(a) + " ")
? "   ";
For i In a
  ? i; ", "; ' i is used as pointer to a(i) inside FOR loop
Next
?
title "Use IN to print map array:"
a = Array("{x:100, y:300, point:Top-Left}")
? rev("   a = " + Str(a) + " ")
? "   ";
For i In a
  ? i; ":"; a(i); ", "; ' i is used as pointer inside FOR loop
Next
?
title "Use IN to test equality of numbers:"
n = 10.5
? rev("   n = 10.5 ")
? "   n In 10   : "; n In 10    ' (0=FALSE; 1=TRUE)
? "   n In 10.5 : "; n In 10.5
```

