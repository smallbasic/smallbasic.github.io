# DATEFMT

> s = DATEFMT (format, dmy| (d,m,y)| julian_date)

Returns a formatted date string. The input date can be given as a date-string returned by DATE, as the integers `d` for day, `m` for month and `y` for year, or as a julian date. `format` is a string specifying the format of the date: 

| Format | Description               |
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

### Example

```
PRINT DATEFMT("ddd dd, mm/yy", 23, 11, 2001)            ' Output: Fri 23, 11/01
PRINT DATEFMT("mm.dd.yy"     , "23/11/2001")            ' Output: 11.23.01
PRINT DATEFMT("dd.mm.yyyy"   , DATE)                    ' Output: 19.10.2023
PRINT DATEFMT("dddd"         , JULIAN("23/11/2001"))    ' Output: Friday
```

