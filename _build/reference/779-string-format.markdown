# FORMAT

> FORMAT (format, val)

Returns a formated string.

Numbers:

| Format | Description                              |
|:------:|------------------------------------------|
| `#`    | Digit or space                           |
| `0`    | Digit or zero                            |
| `^`    | Stores a number in exponential format.   |
| `.`    | The position of the decimal point.       |
| `,`    | Separator                                |
| `-`    | Stores minus if the number is negative.  |
| `+`    | Stores the sign of the number.           |

Strings:

| Format | Description |
|:------:|-------------|
| `&`    | Stores a string expression without reformatting it.     |
| `!`    | Stores only the first character of a string expression. |
| `\\ \\` | Stores only the first n + 2 characters of a string expression, where n is the number of spaces between the two pairs of backslashes. |

When using `\\ \\`, literals can be inside the `\\` `\\`. These literals are inserted in the final string.

### Example 1

```
PRINT FORMAT("####.##",    1920.64)  ' output 1920.64
PRINT FORMAT("#######",    1920.64)  ' output    1921
PRINT FORMAT("#,###.##",   1920.64)  ' output 1,920.64
PRINT FORMAT("#,###.00",   1920.6 )  ' output 1,920.60
PRINT FORMAT("#,###",      1920.6 )  ' output 1,921
PRINT FORMAT("###,###.00", 1920.6 )  ' output   1,920.60
PRINT FORMAT("00#,###.00", 1920.6 )  ' output 001,920.60

PRINT FORMAT("#####^",     1920.6 )  ' output 1,9E+3

PRINT FORMAT("+#,###.00",  1920.6 )  ' output +1,920.60
PRINT FORMAT("+#,###.00", -1920.6 )  ' output -1,920.60

PRINT FORMAT("-#,###.00",  1920.6 )  ' output  1,920.60
PRINT FORMAT("-#,###.00", -1920.6 )  ' output -1,920.60

PRINT FORMAT("!",     "Test")        ' output T
PRINT FORMAT("\\\\",  "Test")        ' output Te
PRINT FORMAT("\\ \\", "Test")        ' output Tes

PRINT FORMAT("\\  X \\",   "abcde")  ' output abcXde
PRINT FORMAT("\\ X Y \\",  "abcde")  ' output abXcYde
PRINT FORMAT("&\\ X Y \\", "abcde")  ' output abcde
```

### Example 2: Printing numbers in columns

```
for y = 1 to 10
    for x = 1 to 5
        print format("#,###.00   ", (rnd*200000 - 100000)/100);
    next
    print
next
```

### Example 3

PRINT USING and FORMAT use same or similar character codes, here are some practical examples of use, including the creating of a reusable money function that returns a flexible length string for a money amount (dollars and cents format).

```
' USING FORMAT Money.bas 2016-03-06 SmallBASIC 0.12.2 [B+=MGA]
' PRINT USING is excellent for columns of numbers

' A problem with PRINT USING is that it needs a whole statement to itself,
' unlike PRINT that can print a list of expressions in a single statement (with ; , or +)
' another problem with USING, # is that they are place holders which is nice
' for column of numbers but not in following:

currency = "$-###,###,###,###,###,###.00"
bignumber = "###,###,###,###,###,###"
onetrillion = 1000000000000
workers = 150000000

? "First version:"
? using currency; onetrillion;
? " divided by ";
? usg bignumber; workers;  '<=== usg is short for using
? " working people is ";
? usg currency; onetrillion / workers;
? " per working person."
?:?

' Yuck! we need to trim things up, FORMAT works nicely with TRIM
division = "$ " + trim(format(bignumber, onetrillion / workers))
onetrillion1 = "$ " + trim(format(bignumber, onetrillion))
workers1 = trim(format(bignumber, workers))
? "Second version with trim:"
? onetrillion1 + " divided by " + workers1; " working people is "; division; " per working person."
?:?

' lets use what we learned here and make a reusable function: money
? "Third version as a function:"
? money(onetrillion); " divided by "; workers1; " working people is " + money(onetrillion/workers) + " per working person."
?:?

' Print money as columns like in a table. We need to have the same length strings use RIGHT and SPACE
? "Money table:"
for i = 1 to 50
  if rnd > .5 then
    posneg = 1
  else 
    posneg = -1
  endif
  print right(space(15) + money(rnd*10000000000/1000*posneg), 20);
  if i mod 5=0 then print '<== after printing 5 numbers in one line use print to start next line
next

func money(dollarsandcents)
  money = "$ " + trim(format("###,###,###,###,###,###.00", dollarsandcents))
end
```

