---
layout: post
title:  "ARRAY"
categories: data
---
Data

ARRAY [var | expr]

Creates a ARRAY or MAP variable from the given string or expression

```

' See also Article "New features" -> "User defined structures".
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

```

Thank you.
Ah, new stuff!
I see the string wrapped in curlie brackets, is that required? not [] brackets? or () brackets?
I see the "properties"(?) separated by colon with it's value, is that also required? (well , separates pairs and ; separates rows)
Append: ? "properties", better name is "field"
Associative array is different from common array because of the fields?
ARRAY syntax is like this (I don't see other option):
ARRAY("{varName1:value1, varName2:value2, ...}")
You can use expression or variable instead of string:
Def s = "{varName1:value1, varName2:value2}"
s = "{varName1:value1, varName2:value2}"
...
a = ARRAY(s)
Associative array is not different then common array.
ARRAY() simply creates an array which some programmers like its syntax.
common array is more powerful because instead of fixed names it uses indexes, which you can use inside loops.
To sum up: you don't have to use a.x; a.y - you can simply use a(X), a(Y). 
the term "Field" is mainly used for databases;
the term "Property" is mainly used in object oriented programming syntax.
But in the real life, both "field" and "property" are usually element of an array.
To sum up: you don't need to use any term - you can simply say "variable".
 

JSON is an open-standard format that uses human-readable text to transmit data objects consisting of attribute–value pairs. JSON is a language-independent data format.
Here I quote Chris from Home -- Forums -- Project help -- Tile Map Editor:
<blockquote>
...
If you click File / Export and save the output in JSON format, you can then use the output in a SmallBASIC program like this:
```

tload "map.json" , buffer, 1
tiles= array(buffer)
? tiles.layers(0).data(0)

```

...
</blockquote>
These are good news, because it actually allows us to save and load arrays as regular text files in JSON format (which shares its vision with XML format).
That's useful but can it be applied to other ARRAY types? For example I can make TLOAD and TSAVE work for a one dimensional array but I cannot see how to save or load an ordinary (non MAP) ARRAY with more than one dimension. Have you achieved this? Is it possible? Just wondering. Thanks.
I've copy this code from JSON Wikipedia, it seems like JSON supports more then one 
dimension according to the example... 
The following example shows a possible JSON representation describing a person:
```

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

```

This what Chris wrote at Home -- Forums -- Announcements (10/02/2014):
<blockquote>
...
SmallBASIC implementations: Any
SmallBASIC version 0.11.16 for Ubuntu is now available.
...
Variables:
The MAP variable type combines the features of previously separate "User Defined Structures" and "Associated Array" variables. The MAP provides value-key pair access along with array or dotted notation. The MAP can be initialized from a String variable using the ARRAY command. The ARRAY command supports JSON (Javascript object notation) syntax.
The MAP can be converted back into a JSON string using the STR command. You can test whether a variable is a MAP using the ISMAP command.
The ARRAY command can be used to process web services results. For example: https:raw.githubusercontent.com*smallbasic*SmallBASIC*master*samples*distro-examples*devio*google.bas
</blockquote>
I didn't have time to try anything, and I don't know if there is a function to convert between regular array and map array (is there?); 
If there isn't any function, you can create one, JSON format looks a bit more friendly then XML format, so it must be easy.
Sorry I didn't understand...
See my comment on:     
Home -- Forums -- Project help -- Tile Map Editor -- coffee first...
It shows how easy is to save and load ordinary array with more than one dimension, by using the WRITE and READ keywords to save and load array variables in binary format.
I am trying to make a dictionary with two columns as part of writing an assembler. I can SEARCH the first column and use (0,1) then (1,1) to look up the second column if I REDIM the array loaded from a file.
But I cannot see a way to load the file with two dimensions.
```

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

```

See:  Home -- Language reference -- File -- TLOAD -- How to convert TLOAD's array into nested array
Thanks for your help but REDIM works for me.
```

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
<?code>
