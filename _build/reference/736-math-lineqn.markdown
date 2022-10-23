# LINEQN

> LINEQN (a, b [, toler])

Returns an array with the values of the unknowns. This function solves equations using the Gauss-Jordan method.

- b equations
- b results
- toler tolerance number. (the absolute value of the lowest acceptable number) default = 0 = none...

```
|x| <= toler : x = 0
```

The result is a matrix Nx1. The array is two-dimensional.

```
print "Solve this:"
print "  5x - 2y + 3z = -2"
print " -2x + 7y + 5z =  7"
print "  3x + 5y + 6z =  9"
print

A = [ 5, -2, 3; -2, 7, 5; 3, 5, 6]
B = [ -2; 7; 9]

C = LinEqn(A, B)

print "[x;y;z] = "; C
```

