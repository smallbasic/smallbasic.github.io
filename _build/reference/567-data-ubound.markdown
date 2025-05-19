# UBOUND

> ub = UBOUND (array [, dim])

Returns the upper bound `ub` of an array `array`. `dim` can be used to specify, at which dimension the upper bound should be returned if `array` is a multi-dimensional array. If `dim` is not used the upper bound of the first dimension will be returned.

See LBOUND for lower bound of an array.

### Example 1: Upper bound of one-dimensional arrays

```
dim A(5)
dim B(5 to 10)

print ubound(A)     ' Output: 5
print ubound(B)     ' Output: 10
```

### Example 2: Upper bound of multi-dimensional arrays

```
dim A(5,6,7)
dim B(5 to 10, 7 to 12, 9 to 14)

print ubound(A, 2)     ' Output: 6
print ubound(B, 2)     ' Output: 12
```

### Example 3: Using option base 1

```
option base 1

dim A(5)
dim B(5 to 10)

print ubound(A)     ' Output: 5
print ubound(B)     ' Output: 10
```


