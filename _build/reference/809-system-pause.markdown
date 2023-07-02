# PAUSE

> PAUSE [secs]

Waits for a key press, a mouse click or the optional amount of seconds `secs`before executing next statement.

PAUSE may interfere with INKEY or PEN events.

### Example 1

```
print "Before PAUSE - press a key, mouse button or wait 5s"
pause 5
print "After PAUSE"
```

### Example 2

```
' ribbons.bas SmallBASIC 0.12.2 [B+=MGA] 2016-03-24
' new and improved update of SB and Bpf posts 2015-04-16 B+

at 80,610: ? "Wait 8 secs or press any for next screen..."
const a = 127

while 1 
  for i = 0 to 9
    b = rnd^2
    c = rnd^2
    d = rnd^2
    for x = 1 to 600
      cl = RGB(a + a * sin(b * x), a + a * sin(c * x), a + a * sin(d * x))
      line x, i * 60 + 1 step 0, 60, cl
    next x
  next i
  pause 8 '<=========== pause waits 8 secs or key press
wend
```


