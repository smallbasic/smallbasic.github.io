# EXPRSEQ

> EXPRSEQ BYREF array, xmin, xmax, count USE expression

Returns an array with 'count' elements. Each element has the 'y' value of its position as it is returned by the expression.

```
def f(x) = 2*x

EXPRSEQ v1, 0, 1, 5 USE f(x)
print v1

'same as
v2 = [f(0), f(0.25), f(0.5), f(0.75), f(1)]
print v2
```

