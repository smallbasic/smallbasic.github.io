# ROOT

> ROOT low, high, segs, maxerr, BYREF result, BYREF errcode USE expr

Roots of f(x).

ROOT will find the first x-intercept of the given function ( where f(x) = 0 ) in the interval [low,high] 

- low the lower limit
- high the upper limit
- segs the number of segments (spaces)
- maxerr tolerance (IF ABS(f(x)) < maxerr THEN OK)
- errcode 0 for success; otherwise calculation error
- result the result

```
def f1(x) = x - 2 
' Theory: x - 2 = 0 -> x = 2

ROOT 0, 5, 500, 0.001, result, errcode USE f1(x)

if(errcode) then
    print("No root found")
else
    print "Root at "; result
endif
```

```
def f2(x) = x^2 - 2
' Theory: x^2 - 2 = 0 -> x^2 = 2 -> x = +/-sqr(2) = +/-1.41

ROOT -1, 2, 500, 0.001, result, errcode USE f2(x)

if(errcode) then
    print("No root found")
else
    print "Root at "; result 
endif
```


