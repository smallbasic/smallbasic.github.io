# ASC

> n = ASC (s)

Returns the ASCII code of first character of the string `s`.

See CHR for converting a ASCII code to a character.

### Example 1

```
print "ASCII value of A is "; ASC("A")      ' Output: ASCII value of A is 65
```

### Example 2: Create an ASCII table.

```
LOCATE 1,16 : ? "ASC Table 30-129:"  ' locate print spot, print title for our app

FOR column = 0 to 9                    ' print a header, 10 numbers plus + (to add to row value)
  LOCATE 2, column * 5 + 4 : ? "+"; column
NEXT

FOR row = 3 to 12
  LOCATE row, 0 : ? RIGHT(" " + STR(row * 10) + ":", 4)
NEXT

'main table
FOR ASCnumber = 30 to 129              ' note ASC(32) = space so wont see anything in Table
  row = ASCnumber \ 10                 ' \ rounds division down to integer
  column = (ASCnumber MOD 10) * 5 + 5  ' times 5 to space out the characters printed plus 5 for column labels
  LOCATE row,column : ? CHR(ASCnumber)
NEXT
```

