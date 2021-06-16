# ARRAY

> ARRAY [var | expr]

Creates a ARRAY or MAP variable from the given string or expression.

The ARRAY command supports JSON (Javascript object notation) syntax. The MAP provides value-key pair access along with array or dotted notation.
The MAP can be converted back into a JSON string using the STR command. You can test whether a variable is a MAP using the ISMAP command.

The following example shows a possible JSON representation describing a person:

~~~
{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 25,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    },
    {
      "type": "mobile",
      "number": "123 456-7890"
    }
  ],
  "children": [],
  "spouse": null
}
~~~

Example 1:

~~~
Def uline(text) = Cat(2) + text + Cat(-2) ' Underline text
Cls
? uline("1-Dimension Map Array:")
?
a = Array("{x:100, y:300, title:top-left}")
? "a is:       "; a
? "a is map?   "; Ismap(a)
?
? "a.x is:     "; a.x
? "a.y is:     "; a.y
? "a.title is: "; a.title
?
a.x = "N/A"
? "a.x is now: "; a.x
?
?:?:? " Press any key..."
Pause
Cls
? uline("1-Dimension Map Array, with 1-D Nested Map Array:")
?
Dim a(1 To 10, 1 To 2)
a(5, 1) = Array("{x:1, y:3, down:{x:4, y:7}}")
? "a(5, 1) is:            "; a(5, 1)
? "a(5, 1) is map?        "; Ismap(a(5, 1))
? "a is map?              "; Ismap(a)
?
? "a(5, 1).x is:          "; a(5, 1).x
? "a(5, 1).y is:          "; a(5, 1).y
? "a(5, 1).down.x is:     "; a(5, 1).down.x
? "a(5, 1).down.y is:     "; a(5, 1).down.y
?
a(5, 1).down.x = "N/A"
? "a(5, 1).down.x is now: "; a(5, 1).down.x
?
?:?:? " Press any key..."
Pause
Cls
? uline("1-Dimension Map Array, with Two 1-D Nested Map Arrays:")
?
a = Array("{x:1, y:3, down:[{x:4, y:7}, {x:6, y:9}]}")
? "a is:               "; a
? "a is map?           "; Ismap(a)
?
? "a.x is:             "; a.x
? "a.y is:             "; a.y
? "a.down(0).x is:     "; a.down(0).x
? "a.down(0).y is:     "; a.down(0).y
? "a.down(1).x is:     "; a.down(1).x
? "a.down(1).y is:     "; a.down(1).y
?
a.down(1).x = "N/A"
? "a.down(1).x is now: "; a.down(1).x
?
?:?:? " Press any key..."
Pause
Cls
? uline("Create 1-Dimension Map Array without using ARRAY Keyword:")
?
b.x = 40
b.y = 50
b.title = "Top-Left"
? "b.x is:     "; b.x
? "b.y is:     "; b.y
? "b.title is: "; b.title
?
? "b is:       "; b
? "b is map?   "; Ismap(b)
?
?:?:? " Press any key..."
Pause
~~~

Example 2:

~~~
REM SmallBASIC
REM created: 03/04/2016
? "Let's test reading files"
? "FREEFILE is ", FREEFILE
? "OPEN file [FOR INPUT|OUTPUT|APPEND] AS #fileN"
? "OPEN \\"jump\\" FOR INPUT AS #1"
OPEN "jump" FOR INPUT AS #1
? "==================="
? "Test TLOAD to array"
? "==================="
? "TLOAD file, BYREF var [, type]"
? "Loads a text file into array variable."
? "Each text-line is an array element."
? "type 0 = load into array (default)"
?
? "TLOAD #1, i,0"
TLOAD #1,i,0
? "CLOSE file 1 for INPUT"
CLOSE #1
? "========================================"
?
? "ISARRAY ",ISARRAY (i)
? "Process values & instructions"
? "Check for the @ sign"
? "Convert dec2bin"
? "Pad out to 16 bits"
?
? "REDIM i to split destination table"
? "& make dictionary"
REDIM i(1,7)
?
? "Print array contents"
?
? "No","jump",,"bin"
For j=0 to 7
  ? j,i(0,j),,i(1,j)
  next j
?
? "SEARCH list (above) for Assembler"
? "SEARCH i, \\"JEQ\\", r"
SEARCH i, "JEQ", r
? "r = ", r
? "jump   = ",i(0,r)
? "binary = ",i(1,r)

~~~

Example 3:

~~~
? "OPEN \\"dest\\" FOR INPUT AS #1"
OPEN "dest" FOR INPUT AS #1
? "TLOAD #1, i,0"
TLOAD #1,i,0
? "CLOSE file 1 for INPUT"
CLOSE #1
? "Print the dest file shown below.
? 
? "null"
? "M"
? "D"
? "MD"
? "A"
? "AM"
? "AD"
? "AMD"
? "000"
? "001"
? "010"
? "011"
? "100"
? "101"
? "110"
? "111"
?
? "REDIM i to split destination table"
? "& make dictionary"
REDIM i(1,7)
?
? "Print array contents"
?
? "No","func",,"bin"
For j=0 to 7
  ? j,i(0,j),,i(1,j)
  next j
?
? "SEARCH list (above) for Assembler"
? "SEARCH i, \\"AM\\", r"
SEARCH i, "AM", r
? "r = ", r
? "destination = ",i(0,r)
? "binary      = ",i(1,r)
~~~
