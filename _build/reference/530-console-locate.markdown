# LOCATE

> LOCATE row, column

Moves the console (text-mode) cursor to the specified position. `row` and `column` are in text-mode character cells.

See AT for positioning the cursor in pixel.

### Example 1:

```smallbasic
locate 5,7
print "text at row 5 and column 7"
```

### Example 2: Print text always in center of window

```smallbasic
' Define functions to calculate lines and columns
Def lines() = (Ymax + 1) \ Txth("x")   ' maximum lines in window
Def columns() = (Xmax + 1) \ Txtw("x") ' maximum columns in window

' Define functions to calculate position of text
Def center_line() = lines \ 2
Def center_column(text) = (columns \ 2) - (Len(text) \ 2)

' attributes for printing text (ESCAPE codes):
Const ESC = Chr(27)
Const bold_on  = ESC + "[1m"  ' strong
Const bold_off = ESC + "[21m"
Const line_on  = ESC + "[4m"  ' underline
Const line_off = ESC + "[24m"
Const reve_on  = ESC + "[7m"  ' reverse
Const reve_off = ESC + "[27m"

' colors for printing text:
Const WHITE = 7
Const BLACK = 0
Const YELLOW = 14
Const BLUE = 1

Const HELLO = "* Hello World! *" ' text to print.

' loop until user press Esc key:
While Inkey <> Chr(27)
    ' update screen if user resized the window:
    If (x <> Xmax) Or (y <> Ymax) Then
        Color WHITE, BLACK
        Cls
        
        Print Using "Please resize window (Esc=Stop) 000:0000"; lines(), columns();
        
        ' Print hello world:
        l = center_line()
        c = center_column(HELLO)
        
        Color YELLOW, BLUE
        Locate l - 1, c: Print bold_on + HELLO + bold_off;
        Locate l    , c: Print reve_on + HELLO + reve_off;
        Locate l + 1, c: Print line_on + HELLO + line_off;
        
        ' remember current windows size:
        x = Xmax
        y = Ymax
    Endif
Wend
```
### Example 3: Print ASCII table

```smallbasic
' LOCATE MOD CHR ASC.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-23
'
' LOCATE row, column: sets the next print location on screen,
'                     rows down, columns across
' a MOD b           : returns the remainder of a/b as integer 0 to b-1
'                     for example odd number n mod 2 returns 1, whil
'                     even number n mod 2 returns 0
'                     n mod 10 returns 0,1,2,3,4,5,6,7,8 or 9 
'                     we will use this in demo
' CHR(number)       : returns the CHaRracter for the ASC number,
'                     for demo we will print a chart of CHR for ASC
'                     numbers 30-129
' ASC(Character)    : is a number code for a print characters, 32 is
'                     the code for a space
' ?                 : is shortcut for PRINT
' RIGHT(string,n)   : returns right most n characters of string
' STR(n)            : returns a number in string form
' :                 : code statement seperator often used with
'                     LOCATE row, column : ? string

LOCATE 1, 16 : ? "ASC Table 30-129:"        ' locate print spot, print title for our chart
FOR column = 0 to 9                         ' print a header, 10 numbers plus + (to add to row value)
    LOCATE 2, column * 5 + 4 : ? "+";column
NEXT
FOR row = 3 to 12
    LOCATE row, 0 : ? RIGHT(" " + STR(row * 10) + ":", 4)
NEXT
FOR ASCnumber = 30 to 129                   ' note ASC(32) = space so wont see anything in Table
    row = ASCnumber \ 10                      ' \ rounds division down to integer
    column = (ASCnumber MOD 10) * 5 + 5       ' times 5 to space out the characters printed plus 5 for column labels
    LOCATE row, column : ? CHR(ASCnumber)     '<=========== handy reference
NEXT
```



