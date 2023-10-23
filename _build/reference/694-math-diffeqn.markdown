# DIFFEQN

> DIFFEQN x0, y0, xf, maxseg, maxerr, BYREF yf, BYREF errcode USE expr

Solving first-order differential equations using Runge-Kutta method.

- `expr` : f(y,x) = dy/dx with start condition: y(x = x0) = y0 
- `x0`, `y0` : initial x, y  
- `xf` : final x
- `yf` : result
- `maxseq` : equivalent to precision
- `maxerr` : maximum allowed error 
- `errcode` : 0 for success; otherwise calculation error  

### Example 1

```
' Solving dy/dx = 7*y^2 * x^3 with start condition y(2) = 3 

def f1(x,y) = 7*y^2 * x^3

y0 = 3
x0 = 2
yf = 0
xf = 1 
maxseg = 10000
maxerr = 0.001
errcode = 0

diffeqn x0, y0, xf, maxseg, maxerr, yf, errcode USE f1(x,y)

' Exact solution for comparision
def g1(x) = -1 / (7/4 * x^4 - 85/3)

print "g1(xf) = "; g1(xf)
print "yf(xf) = "; yf

if(errcode != 0) then
    print "Error solving equation"
    print "Increasing maxseg might help"
endif
```

### Example 2

```
' Defining the differential equation for a stiffness system

def f2(y,t) = -1000*y + 3000 - 2000 * exp(-t)

' Solving equation at time tf = 0.001 seconds with y(0) = 0
y0 = 0
t0 = 0
yf = 0
tf = 0.001 
maxseg = 1000
maxerr = 0.001
errcode = 0

diffeqn t0, y0, tf, maxseg, maxerr, yf, errcode USE f2(y,t)

' Exact solution for comparision
def g2(t) = 3 - 0.998*exp(-1000*t) - 2.002 * exp(-t)

print "g2(tf) = "; g2(tf)
print "yf(tf) = "; yf

if(errcode != 0) then
    print "Error solving equation"
    print "Increasing maxseg might help"
endif
```





