# TIMEHMS

> TIMEHMS hms| timer, BYREF h, BYREF m, BYREF s

Converts a time-value `hms` or `timer` to hours `h`, minutes `m` and seconds `s` integer values.

Time-value can be:

- a string with the format "hh:mm:ss" as returned by TIME
- a number of seconds from midnight as returned by TIMER

See also TIME and TIMER.

### Example 1: Time string returned by TIME()

```
t = time()

TIMEHMS  t, h, m, s

print "Hours  : "; h
print "Minutes: "; m
print "Seconds: "; s

' Output:
' Hours  : 16
' Minutes: 15
' Seconds: 22
```

### Example 2: Seconds returned by TIMER()

```
t = timer()

TIMEHMS  t, h, m, s

print "Hours  : "; h
print "Minutes: "; m
print "Seconds: "; s

' Output:
' Hours  : 16
' Minutes: 15
' Seconds: 22
```


