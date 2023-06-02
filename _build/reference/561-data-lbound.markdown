# LBOUND

> lb = LBOUND (array [, dim])

Returns the lower bound `lb` of an array `array`. `dim` can be used to specifiy, at which dimension the lower bound should be returned if `array` is a multi-dimensional array. If `dim` is not used the lower bound of the first dimension will be returned.

### Example 1: Lower bound of one-dimensional arrays

```
dim A(5)
dim B(5 to 10)

print lbound(A)     ' Output: 0
print lbound(B)     ' Output: 5
```

### Example 2: Lower bound of multi-dimensional arrays

```
dim A(5,6,7)
dim B(5 to 10, 7 to 12, 9 to 14)

print lbound(A, 2)     ' Output: 0
print lbound(B, 2)     ' Output: 7
```

### Example 3: Using option base 1

```
option base 1

dim A(5)
dim B(5 to 10)

print lbound(A)     ' Output: 1
print lbound(B)     ' Output: 5
```


