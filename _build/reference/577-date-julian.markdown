### Date

> JULIAN (dmy| (d,m,y))

Returns the Julian date. (dates must be greater than 1/1/100 AD).


<pre>PRINT Julian(DATE)
PRINT Julian(31, 12, 2001)

Earlier this month I had done some code to calculate Oil Tank usage and used a ridiculously long and complex formula for calculating the number of days between two dates. I should have used the julian date function:
<pre>

REM julian demo.bas 2016-02-28 SmallBASIC 0.12.2 [B+=MGA]
'oh julian returns the number of days since 1/1/100
'it is perfect for calculating the number of days between two dates
'but the date given to the julian function must be in form dd/mm/yyyy or m,d,y (see help)
'Date just so happens also returns in dd/mm/yyyy format so...
? "Today is ";date
input "To test what julian returns, enter a date dd/mm/yyyy ";adate
? "julian(";adate;") returns: ";julian(adate)
? "That is/was ";abs(julian(adate)-julian(date));" days from today."
?:input "To test the other format julian accepts enter a date as: dd,mm,yyyy(enter) ";d,m,y
? "That is/was ";abs(julian(d,m,y)-julian(date));" days from today."
?:? "Again julian is excellent for calculating the number of days between two dates."
pause
end

</pre>


