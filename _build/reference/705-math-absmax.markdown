# ABSMAX

> f = ABSMAX (var1 [, var2, ... , varN] )

Returns the absolute maximum value of `var1` to `varN`. `var1` to `varN` can be numbers and arrays of numbers.

See ABSMIN for absolute minimum value.

### Example 1: ABSMAX of several numbers

```
a = -3
b = -1
c =  2
print absmax(a, b, c)      ' Output: 3
```

### Example 2: ABSMAX of an array

```
a = [-3,-1,2]
print absmax(a)            ' Output: 3
```

### Example 3: ABSMAX of mixed parameters

```
a = [-3,-1,2]
b = -2
print absmax(a, b)            ' Output: 3
```
