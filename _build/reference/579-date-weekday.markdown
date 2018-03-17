# WEEKDAY

> WEEKDAY (dmy| (d,m,y)| julian_date)

Returns the day of the week (0 = Sunday).


> PRINT WeekDay(DATE)
PRINT WeekDay(Julian(31, 12, 2001))
PRINT WeekDay(31, 12, 2001)

SPLIT "Sun Mon Tue Wed Thu Fri Sat", " ", wd
today = "Today is " + wd(WEEKDAY(DATE)) + " " + DATE
PRINT today


