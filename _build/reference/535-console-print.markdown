# PRINT

> PRINT [#file] [USING [format];] [expr|str [,|; [expr|str] ...]

Display numbers, strings or values of expressions. The symbol `?` can be used instead of keyword PRINT. You can use USG instead of USING.

If a file handle `#file` is given, the output of print will be redirected to the corresponding file. See OPEN for more information on handling files.

To gain more control of where your next PRINT statement will be placed on screen, see LOCATE and AT.

### Example 1: Basic usage

```
print 1                             ' Output: 1
print 1+1                           ' Output: 2
print cos(pi)                       ' Output: -1
print "Text"                        ' Output: Text
```

### Example 2: Print strings and numbers

```
print "abc" + "def"                 ' Output: adcdef
print "abc" + " def"                ' Output: abc def
print "abc" + 1 + "def" + cos(pi)   ' Output: abc1def-1
print "abc" + 1 + 2 + "def"         ' Output: abc12def  <- 1 and 2 are treated as strings
```

### Example 3: Print strings and variables

```
a = 1
b = 2
c = a + b
print "a = " + a                    ' Output a = 1
print "b = " + b                    ' Output b = 2
print "a + b = " + c                ' Output c = 3
```

## PRINT SEPARATORS

| Separator | Description
|:---------:|:---------------------------------------- 
| TAB(n)    | Moves cursor position to the nth column.
| SPC(n)    | Prints a number of spaces specified by n.
| ;         | Separates numbers, expressions or strings
| ,         | Separates numbers, expressions or strings and insert one TAB

If `;` and `,` are used as last character of a print command, carriage return/line feed (new line) will be suppressed after printing.

In contrast to the `+` operator to concatenate the output as shown in the examples above, the `,` and `;` operators can be used to concatenate
the output and at the same time evaluate expressions.

### Example 1: Using , and ;

```
a = 1
b = 2
print "a + b = " + a + b    ' Output: a + b = 12      <- a and b treated as strings
print "a + b = " ; a + b    ' Output: a + b = 3       <- a + b was evaluated
print "a + b = " , a + b    ' Output: a + b =      3  <- a + b was evaluated
```

### Example 2: Suppress new line

```
print "abc";     ' <- new line suppressed
print "def"

' Output: abcdef
```

### Example 3: Using TAB and SPC

```
print "1" + tab(5) + "2"       ' Output 1    2
print "1" + spc(1) + "2"       ' Output 1 2
```

## PRINT USING

PRINT USING uses the FORMAT function to display numbers and strings. Unlike FORMAT it can also include literals.

When a PRINT USING command is executed the format will remain in memory until a new format is passed. Calling `PRINT USING` without a format string specifies that PRINT will use the format of the previous call.

Using `_` (underscore) will print the next character as a literal. The combination `_#`, for example, allows you to include a number sign as a literal in your numeric format.

See FORMAT for more information on how to define the format string.

### Example 1: Basic usage

```
a = 1000
b = 2000
PRINT USING "#,###.##"; a                    
PRINT USING "#,###.## "; a; b                ' <- Format is applied to all variables         
PRINT USING "a = #####.00  b = #####"; a; b  ' <- One formated string with placeholders for two variables

' Output: 1,000.
' Output: 1,000. 2,000.             
' Output: a =  1000.00  b =  2000   
```

### Example 2: Apply format multiple times

```
a = 1000
b = 2000
PRINT USING "#,###.##"      ' Store format string

PRINT        a              ' Print without format
PRINT USING; a              ' Print with stored string
PRINT USING; b              ' Print with stored string

PRINT USING "####.00"; a    ' Print with new format string and store string
PRINT USING; b              ' Print with stored string

' Output:
' 1000
' 1,000.
' 2,000.
' 1000.00
' 2000.00
```

## Print using VT100 codes

Escape codes can be used with PRINT. For more information please read the article "Escape codes"


## More Examples

### Example 1: 3 ways to print hello

```
' 3 ways to print hello five time.bas 2016-03-05 SmallBASIC 0.12.2 [B+=MGA]
'It's all in the punctuation at the end of a print statement

'1) no punctiation  = whole print lines CR=carriage return and
' LF=line feed, ready to go on next line
for i = 1 to 5
  print "hello"
next
print : print '2 blank lines

'2) a comma which tabs to next avaiable tab column and will stay
' on same line until run out of coloumns
for i = 1 to 5
  print "hello",
next
'the first print will finish the print line, the 2 two are blank lines
print "& this will finish the hello, line."
print : print 

'3) a semicolon (and space after hello)
for i = 1 to 5
  print "hello";" ";  'or just print "hello ";
next
print "... this line needs to be finsihed."
```

### Example 2: Print to a file

```
Open "PRINT.TXT" For Output As #1
Print #1, "hello"
Close #1
```

