# JULIAN

> j = JULIAN (dmy | (d,m,y))

Returns the Julian date. Dates must be greater than 1/1/100 AD. The date can be passed as the string `dmy` with the format `DD/MM/YYYY`. Alternatively the date can be given by specificing the parameters `d` for days, `m` for months and `y` for years.

### Example 1: Basic usage

```
PRINT Julian("31/12/2001")
PRINT Julian(31, 12, 2001)
PRINT Julian(DATE)
```

### Example 2: Difference in days between two dates

```
today = Julian(Date())
past = Julian(31, 12, 2001)
print today - past; " days past since 31/12/2001"
```



