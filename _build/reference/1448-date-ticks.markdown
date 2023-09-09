# TICKS

> n = TICKS

Returns the number of milliseconds that have elapsed since start of the operating system.

### Example 1:

```
t = ticks()
print t
```

### Example 2: Game with constant frame rate

```
' ticks() can be used to let your game
' run with a constant frame rate

FramesPerSecond = 20

for xx = 1 to 200

  StartTime = ticks()
  
  'Put your heavy computions here
  cls
  rect 10 + xx, 10, 50+xx, 50
  showpage

  'Delay the execution of the for-loop  
  StopTime = ticks()

  ElapsedTime = StopTime - StartTime

  if(ElapsedTime < 1000 / FramesPerSecond)
    delay(1000 / FramesPerSecond - ElapsedTime)
  endif

next
```

