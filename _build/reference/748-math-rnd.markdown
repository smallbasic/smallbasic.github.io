# RND

> f = RND

Returns a random floating point number in the range 0 to 1.

### Example 1

```
RANDOMIZE
print "Number between 0 and 1   : "; RND()
print "Number between 5 and 12  : "; (12 - 5) * RND() + 5 
print "Number between -5 and -12: "; (-12 - -5) * RND() - 5 
```

### Example 2: Random true/false; random integer between low/high

```
' random true/false, subst 0 or 1 (or -1)
DEF randbin() = IFF(rnd<.5,"True ","False ")

' random integer number between low and high  
DEF randlohi(lo, hi) = (RND * (hi - lo + 1))\1 + lo 

RANDOMIZE

print randbin()
print randlohi(10,20)
```


