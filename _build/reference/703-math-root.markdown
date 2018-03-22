# ROOT

> ROOT low, high, segs, maxerr, BYREF result, BYREF errcode USE expr

Roots of F(x).

- low the lower limit
- high the upper limit
- segs the number of segments (spaces)
- maxerr tolerance (IF ABS(F(x)) < maxerr THEN OK)
- errcode 0 for success; otherwise calculation error
- result the result

```
FUNC F(x)
 F = SIN(x)
END
...
ROOT 1, 5, 500, 0.00001, result, errcode USE F(x)
```

