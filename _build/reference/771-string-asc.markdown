# ASC

> ASC (s)

Returns the ASCII code of first character of the string s.

Also see CHR

```
print "ASCII value of A is "; ASC("A")
```

The following example prints an ASCII table.

~~~

' LOCATE MOD CHR ASC.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-23
' LOCATE row, column - sets the next print location on screen, rows down, columns across
' a MOD b - returns the remainder of a/b as integer 0 to b-1
'           for example odd number n mod 2 returns 1, while even number n mod 2 returns 0
'           n mod 10 returns 0,1,2,3,4,5,6,7,8 or 9  we will use this is demo
' CHR - returns the CHaRracter for the ASC number, for demo we will print a chart of CHR for ASC numbers 32-128
' ASC(Character) - is a number code for a print characters, 32 is the code for a space
' ? - is shortcut for PRINT
' RIGHT(string,n) - returns right most n characters of string
' STR(n) - returns a number in string form
' : - code statement seperator often used with LOCATE row, column : ? string
' PAUSE optional-number-of-secs - waits for key press or mouse click and/or for a number seconds 
' so lets user decide how long to wait

LOCATE 1,16 : ? "ASC Table 30-129:"  ' locate print spot, print title for our app
FOR column=0 to 9                    ' print a header, 10 numbers plus + (to add to row value)
  LOCATE 2,column*5+4 : ? "+";column
NEXT
FOR row=3 to 12
  LOCATE row,0 : ? RIGHT(" "+STR(row*10)+":",4)
NEXT
'main table
FOR ASCnumber=30 to 129              ' note ASC(32) = space so wont see anything in Table
  row=ASCnumber\10                   ' \ rounds division down to integer
  column=(ASCnumber MOD 10)*5+5      ' times 5 to space out the characters printed plus 5 for column labels
  LOCATE row,column : ? CHR(ASCnumber)
NEXT
PAUSE

~~~


