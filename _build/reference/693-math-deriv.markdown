# DERIV

> DERIV x, maxtries, maxerr, BYREF result, BYREF errcode USE expr

Calculation of derivative.


* `x`: value of x
* `maxtries`: maximum number of retries
* `maxerr`: tolerance
* `errcode`: 0 for success; otherwise calculation error
* `result`: the result
* `expr`: the function f(x)

### Example 1

```
' What is the derivative of f(x) for a given x

def f(x) = 2*x^2+2

x = 3
result = 0
errcode = 0

deriv x, 10, 0.01, result, errcode USE f(x)


def d(x) = 4*x ' Exact derivative of f(x) for comparision

print "Result of DERIV  at x = "; x; " : "; result
print "Exact derivative at x = "; x; " : "; d(x)
```

### Example 2

```
' What is the derivative of f(x) for a given x

def f(x) = x^3 + 2 * exp(2*x)

x = 3
result = 0
errcode = 0

deriv x, 10, 0.000001, result, errcode USE f(x)


def d(x) = 3*x^2 + 4*exp(2*x) ' Exact derivative of f(x) for comparision

print "Result of DERIV  at x = "; x; " : "; result
print "Exact derivative at x = "; x; " : "; d(x)
```
