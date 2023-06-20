# PRINT

> PRINT [USING [format];] [expr|str [,|; [expr|str] ...]

Display numbers, strings or values of expressions. The symbol `?` can be used instead of keyword PRINT. You can use USG instead of USING.

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
| ;         | Separates numbers, expressions or string
| ,         | Separates numbers, expressions or string and insert one TAB

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


~~~
REM 3 ways to print hello five time.bas 2016-03-05 SmallBASIC 0.12.2 [B+=MGA]
'It's all in the punctuation at the end of a print statement
'1) no punctiation  = whole print lines CR=carriage return and LF=line feed, ready to go on next line
for i=1 to 5
  print "hello"
next
?:? '2 blank lines

'2) a comma which tabs to next avaiable tab column and will stay on same line until run out of coloumns
for i=1 to 5
  print "hello",
next
? "& this will finish the hello, line."
?:? 'the first ?=print will finish the print line, the 2 two are blank lines

'3) a semicolon (and space after hello)
for i=1 to 5
  print "hello";" ";  'or just print "hello ";
next
? "... this line needs to be finsihed."
pause

~~~

To gain even more control of where your next PRINT statement will end up on screen checkout the older LOCATE keyword and the more modern method of using AT.

~~~

' PRINT can also print to an open file or device (not only to console).
' Note: new-line (or line-break) character(s) is different on each system:
'       Windows and DOS uses a pair of CR and LF characters to terminate lines. 
'       UNIX, Linux, FreeBSD and OS X uses a single LF character only. 
'       Classic Mac operating system uses a single CR character only.
'       * CR is CHR(13); LF is CHR(10).

' Print lines to demo file:
Open "PRINT.TMP" For Output As #1
Print #1, "hello_1" ' print [hello new-line]
Print #1, "Hello_2", "Hello_3"  ' print [hello tab hello new-line]
Print #1, "Hello_4"; "Hello_5"; ' print [hello hello]
Print #1, ' print [new-line]
Print #1, ' print [new-line]
Print #1, ; ' print [].
Print #1, Using "000 &"; 55, "is my mailbox" ' print [055... new-line]
? #1, "Hello_?" ' print [Hello_? new-line]
Close #1
' Load lines from demo file and print them to console:
Open "PRINT.TMP" For Input As #1
Color 0, 7
While Not Eof(1) Do
  Lineinput #1, s
  Print s
Wend
Close #1
Pause

~~~


