# DATEFMT

> DATEFMT (format, dmy| (d,m,y)| julian_date)

Returns formatted date string.

| Format | Desription               |
|--------| -------------------------|
|D       | one or two digits of Day |
|DD      | 2-digit day              |
|DDD     | 3-char day name          |
|DDDD    | full day name            |
|M       | 1 or 2 digits of month   |
|MM      | 2-digit month            |
|MMM     | 3-char month name        |
|MMMM    | full month name          |
|YY      | 2-digit year (2K)        |
|YYYY    | 4-digit year             |

See also DATE and DATEDMY.

```
PRINT DATEFMT("ddd dd, mm/yy", "23/11/2001")
REM prints "Fri 23, 11/01"
```

