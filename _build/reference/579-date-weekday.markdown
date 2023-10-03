# WEEKDAY

> n = WEEKDAY (dmy | (d,m,y) | julian_date)

Returns the day of the week as a number between `0` and `6`. Sunday is `0`. WEEKDAY accepts a string `dmy` as returned by DATE, a number `julian_date` as returned by JULIAN or a date given by the three numbers `d` for day, `m` for month and `y` for year.

### Example 1

```
PRINT WeekDay(DATE)                     ' Output: 3  -> Wednesday
PRINT WeekDay(Julian(31, 12, 2023))     ' Output: 0  -> Sunday
PRINT WeekDay(31, 12, 2023)             ' Output: 0  -> Sunday
```

### Example 2

```
SPLIT "Sun Mon Tue Wed Thu Fri Sat", " ", wd
print "Today is " + wd(WEEKDAY(DATE)) + " " + DATE 
' Output: Today is Wed 13/09/2023
```

