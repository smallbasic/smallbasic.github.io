# REDIM 

> REDIM var([lower TO] upper [, …] [, …])

Reshape the array `var` while preserving the contents of the array. The array will have `(upper - lower) + 1` elements. If `lower` is not specified, and `OPTION BASE 1` hasn’t been used, elements start at 0.

Redim can be used to add more elements to an array, to reshape a row-vector to a column-vector or reshape to a matrix.

### Examples

```
A = [1, 2, 3, 4, 5, 6, 7, 8, 9]     ' Row vector (1D array) with 9 elements
print A                             ' Output: [1,2,3,4,5,6,7,8,9]

redim A(12)                         ' Reshape to row vector with 13 elements
print A                             ' Output: [1,2,3,4,5,6,7,8,9,0,0,0,0] 

redim A(8, 0)                       ' Column vector with 9 elements
print A                             ' [1;2;3;4;5;6;7;8;9]

redim A(2, 2)                       ' Reshape to 2D-matrix with 3x3 elements
print A                             ' Output: [1,2,3;4,5,6;7,8,9]

redim A(2, 5)                       ' Reshape to 2D-matrix with 3x6 elements
print A                             ' Output: [1,2,3,4,5,6;7,8,9,0,0,0;0,0,0,0,0,0]
```

