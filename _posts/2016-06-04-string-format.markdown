---
permalink: /779
layout: post
title:  "FORMAT"
categories: string
---
String

FORMAT (format, val)

Returns a formated string.


<p>Numbers:
* '#' Digit or space
* 0 Digit or zero
* ^ Stores a number in exponential format. Unlike QB's USING format this is a place-holder like #.
* . The position of the decimal point.
* , Separator.
* - Stores minus if the number is negative.
* + Stores the sign of the number.
<p>Strings:
* & Stores a string expression without reformatting it.
* ! Stores only the first character of a string expression.
* \\\\  Stores only the first n + 2 characters of a string expression, where n is the number of spaces between the two backslashes. Unlike QB, there can be literals inside the \\ \\. These literals are inserted in the final string.
? FORMAT("#,##0", 1920.6) : REM prints 1,921
? FORMAT("\\  - \\", "abcde") : REM prints "abc-de"

PRINT USING and FORMAT use same or similar character codes, here are some practical examples of use, including the creating of a reusable Money function that returns a flexible length string for a money amount (dollars and cents format).
<pre>

' USING FORMAT Money.bas 2016-03-06 SmallBASIC 0.12.2 [B+=MGA]
'PRINT USING is excellent for columns of numbers
columnformat="#,###,###.0000     " '<=== oh it does spaces too!
for i=1 to 50
  print usg columnformat;rnd*10000000000/1000;
  if i mod 5=0 then print '<== after printing 5 numbers on line use print to start next line
next
?:?
'A problem with PRINT USING is that it needs a whole statement to itself,
' unlike PRINT that can print a list of expressions in a single statement (with ; , or +)
' another problem with USING, # is that they are place holders which is nice
' for column of numbers but not in following:
currency="$-###,###,###,###,###,###.00"
bignumber="###,###,###,###,###,###"
onetrillion=1000000000000
workers=150000000
? using currency;onetrillion;
?" divided by ";
? usg bignumber;workers;  '<=== usg is short for using
?" working people is ";
? usg currency;onetrillion/workers;
?" per working person."
?:?
'Yuck! we need to trim things up, FORMAT works nicely with TRIM
division="$ "+trim(format(bignumber,onetrillion/workers))
onetrillion1="$ "+trim(format(bignumber,onetrillion))
workers1=trim(format(bignumber,workers))
? onetrillion1+" divided by "+workers1;" working people is ";division;" per working person."
?:?
'lets use what we learned here and make a reusable function: money
? money(onetrillion);" divided by ";workers1;" working people is "+money(onetrillion/workers)+" per working person."
?:?
'test money in columns, dang we need to have the same length strings use RIGHT and SPACE
for i=1 to 50
  if rnd>.5 then posneg=1 else posneg=-1
  print right(space(15)+money(rnd*10000000000/1000*posneg),20);
  if i mod 5=0 then print '<== after printing 5 numbers on line use print to start next line
next
pause
func money(dollarsandcents) 'oh - numbers are saved
  money="$ "+trim(format("###,###,###,###,###,###.00",dollarsandcents))
end

</pre>

' Must add extra space after '\\', if not there is an error:
? format("\\ _ \\", "abcde")   ' --> error missing ')'
? format("\\ _ \\ ", "abcde")  ' --> "ab_cd "
? format("\\  _ \\ ", "abcde") ' --> "abc_de "
? Usg "\\ _ \\"; "abcde"   ' --> error or prints nothing
? Usg "\\ _ \\ "; "abcde"  ' --> "ab_cd "
? Usg "\\  _ \\ "; "abcde" ' --> "abc_de "
    Add new comment 
chrisws replied on Mon, 03/21/2016 - 07:16 Permalink
Thanks for your report. This
Thanks for your report. This will be fixed in the next update. Note the backslash character is used to escape double quotes in strings. As such you need to use double backslash to escape the escape
