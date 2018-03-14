# Data

> SEARCH A, key, BYREF ridx [USE cmpfunc]

Scans an array for the key. If key is not found the SEARCH command returns (in ridx) the value. (LBOUND(A)-1). In default-base arrays that means -1. The cmpfunc (if its specified) it takes 2 vars to compare. It must return 0 if x = y; non-zero if x <> y.


<pre>FUNC cmp(x,y)
  cmp=!(x=y)
END
...
DIM A(5)
FOR i=0 TO 5
    A(i)=5-i
NEXT
SEARCH A, 4, r USE cmp(x,y)
PRINT r:REM prints 1
PRINT A(r): REM prints 4

<pre>

' Note: I'm not sure yet about a practical use for [USE cmpfunc] syntax...
Def q(text) = Enclose(text) ' Enclose text with quotation marks, ""
Def rev(text) = Cat(3) + text + Cat(-3)  ' reverse colors of text
Sub title(text)
  ?: Color 14: Print text: Color 7  ' print title in color
End Sub

Dim a(5 To 7)
a(5) = "Hello" 
a(6) = "World"
a(7) = 123
? rev(" Dim a(5 To 7) = " + Str(a) + " ")
title "Use SEARCH to find index of matching element in array (Base LBOUND(a)):"
Search a, "Hello", i:  ? "Search a, " + q("Hello") + ", i: "; i
Search a,  "ello", i:  ? "Search a, " + q("ello") + " , i: "; i
Search a, "HELLO", i:  ? "Search a, " + q("HELLO") + ", i: "; i
Search a, "World", i:  ? "Search a, " + q("World") + ", i: "; i
Search a,     123, i:  ? "Search a, " + " 123   "  + ", i: "; i
Search a,      12, i:  ? "Search a, " + " 12    "  + ", i: "; i
title "Use IN to find index of matching element in array (Always Base 1):"
? q("Hello") + " In a: ";  "Hello" In a
? q("ello") + "  In a: ";   "ello" In a
? q("HELLO") + " In a: ";  "HELLO" In a
? q("World") + " In a: ";  "World" In a
? " 123    In a: ";            123 In a
? " 12     In a: ";            12  In a
Pause

</pre>

<pre>

Option Base 1
' x is the current array element of search;
' y is the array element (key) that we search for.
Func create_new_array(x, y, Byref new_a)
  ' Create a new array:
  If x <> 0 Then Append new_a, x 
  
  ' Standard expression to continue the search:
  create_new_array = Not (x = y) 
End Func

' Start demo:
a = ["a"; "b", "c", "d", "e"; "f"] ' Array for search
e = "c"     ' Element (key) to find
Dim new_a() ' Initialize empty new array
Search a, e, ix Use create_new_array(x, y, new_a)
? "Array for search: "; a
?
? "Element (key) to find: "; e
?
' Check return-index (ix):
If ix = Lbound(a) - 1 Then
  ? "Element not found in array."
Else
  ? "Element found in array at index: "; ix
Fi
?
? "New array created on search: "; new_a
Pause

</pre>

