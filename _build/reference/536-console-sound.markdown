# SOUND

> SOUND freq, dur [, vol] [BG]

Plays a sound with the frequency `freg` in Hz for a duration `dur` in milliseconds. The optional parameter `vol` controls the volume of the sound. Volume is in the range from 0 to 100, where 100 is maximum volume. If the optional parameter `BG` is given, the sound will play in the background: SmallBASIC will not wait with program execution until the sound has finished.

### Example1 : Play sound

```
Sound 1000, 800, 50             ' 1000 Hz, 800 ms, 50% volume
```

### Example 2: Play sound in background

```
Sound 1000, 800, 50 BG          ' 1000 Hz, 800 ms, 50% volume
print "This line will be printed immediately"
pause
```



