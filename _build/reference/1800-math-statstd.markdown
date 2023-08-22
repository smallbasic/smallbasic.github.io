# STATSTD

> f = STATSTD (var1 [, var2, ... , varN)

(Corrected sample) standard deviation. `var1` to `varN` can be single numbers or arrays.

see: [Wikipedia - Standard Deviation](https://en.wikipedia.org/wiki/Standard_deviation)

### Example 1: Using an array

```
A = [2,2,4,4,14]
print statstd(A)        ' Output: 5.09901951359278
```

### Example 2: Using two arrays

```
A = [2,2,3,4,14]
B = [7,9,7]
print statstd(A, B)     ' Output: 4.14039335605413 
```

### Example 3: Using an array and a number

```
A = [2,2,3,4,14]
B = 5
print statstd(A, B)     ' Output: 4.56070170039655
```

### Example 4: Using numbers

```
A = 3
B = 5
C = 4
print statstd(A, B, C)  ' Output: 1
```

