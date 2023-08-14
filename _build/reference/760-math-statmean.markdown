# STATMEAN

> f = STATMEAN (var1 [, var2, ... , varN)

Arithmetical mean (average). `var1` to `varN` can be single numbers or arrays.

### Example 1: Using an array

```
A = [2,2,3,4,14]
print statmean(A)         ' same as: sum(A) / len(A)
' Output: 5
```

### Example 2: Using two arrays

```
A = [2,2,3,4,14]
B = [7,9,7]
print statmean(A, B)      ' Output: 6
```

### Example 3: Using array and number

```
A = [2,2,3,4,14]
B = 5
print statmean(A, B)      ' Output: 5
```

### Example 4: Using numbers

```
A = 3
B = 5
C = 4
print statmean(A, B, C)   ' Output: 4
```
