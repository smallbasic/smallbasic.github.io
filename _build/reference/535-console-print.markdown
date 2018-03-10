### Console

> PRINT [USING [format];] [expr|str [,|; [expr|str]] ...

Display text or the value of an expression.


*PRINT SEPARATORS*
| TAB(n)| Moves cursor position to the nth column.|
| SPC(n)| Prints a number of spaces specified by n.|
| ;| Carriage return/line feed suppressed after printing.|
| ,| Carriage return/line feed suppressed after printing.|
*PRINT USING*
<p>Print USING uses the FORMAT() function to display numbers and strings. Unlike FORMAT it can also include literals.
* [_] - Print next character as a literal. The combination _#, for example, allows you to include a number sign as a literal in your numeric format.
* [other] Characters other than the foregoing may be included as literals in the format string.
p.. When a PRINT USING command is executed the format will remains on the memory until a new format is passed. Calling a PRINT USING without a new format specified the PRINT will use the format of previous call.
<pre>PRINT USING "##: #,###,##0.00";
FOR i=0 TO 20
    PRINT USING; i+1, A(i)
NEXT
....
PRINT USING "Total ###,##0 of \\ \\"; number, "bytes"
The symbol ? can be used instead of keyword PRINT You can use 'USG' instead of 'USING'.

quote: <strong>It's all in the punctuation at the end of a print statement</strong>
<pre>

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

</pre>

To gain even more control of where your next PRINT statement will end up on screen checkout the older LOCATE keyword and the more modern method of using AT.
<pre>

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

</pre>

