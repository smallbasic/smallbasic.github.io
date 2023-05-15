# LINEQN

> C = LINEQN (A, B [, toler])

Solves linear equations using the Gauss-Jordan method.

- `A` equation coefficience as a matrix
- `B` results of the equations as a column-vector
- `C` result as a Nx1 matrix with the values of the unknowns
- `toler` tolerance number (the absolute value of the lowest acceptable number). Default value is `0` (tolerance not applied).

>One possible problem is numerical instability, caused by the possibility
>of dividing by very small numbers. If, for example, the leading coefficient of one of the rows is very
>close to zero, [...] one would need to divide by that number. This means that any error existed for
>the number that was close to zero would be amplified. [Wikipedia](https://en.m.wikipedia.org/wiki/Gaussian_elimination)

The tolerance number can be used to ensure, that no division by numbers smaller than `toler` will be performed. 

### Example

```
' Solve:
'  x -  y + 2z =  6
' 2x + 3y + 2z = 11
' 3x + 2y +  z =  8

A = [1,-1,2; 2,3,2; 3,2,1]
B = [6; 11; 8]

C = LINEQN(A, B)

print "x = "; C(0,0)
print "y = "; C(0,1)
print "z = "; C(0,2)

' Output: x = 1; y = 1; z = 3
```

