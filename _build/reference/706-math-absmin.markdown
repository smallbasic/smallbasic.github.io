# ABSMIN

> f = ABSMIN (var1 [, var2, ... , varN] )

Returns the absolute minumum value of `var1` to `varN`. `var1` to `varN` can be numbers and arrays of numbers.

See ABSMAX for absolute maximum value.

### Example 1: ABSMIN of several numbers

```
a = -3
b = -1
c =  2
print absmin(a, b, c)      ' Output: 1
```

### Example 2: ABSMIN of an array

```
a = [-3,-1,2]
print absmin(a)            ' Output: 1
```

### Example 3: ABSMIN of mixed parameters

```
a = [-3,-1,2]
b = -2
print absmin(a, b)          ' Output: 1
```
