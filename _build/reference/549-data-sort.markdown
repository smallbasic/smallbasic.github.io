# SORT

> SORT byref A [USE cmpfunc( x, y )]

Sorts an array `A` in ascending order. The sorted array is return as `A`, therefore overwriting the initial array. If a compare function `cmpfunc` is specified, 
this function will be used for comparision. The compare function takes two elements of `A` as `x`, `y` to compare and must return: 

- `-1` if `x` is to be placed before `y`
-  `1` if `y` is to be placed before `x`
-  `0` if it doesn't matter which is placed first (which is usually the case when the elements are equal)

### Example 1: Sorting in ascending order

```
A = [5, 3, 8, 2, 1, 7, 9]
sort A
print A                         ' Output [1,2,3,5,7,8,9]
```

### Example 2:  Sorting in ascending order using a compare function

```
func cmpfunc_ascending(x, y)
    if x == y
        return 0
    elseif x > y
        return 1
    else
        return -1
    endif
end

A = [5, 3, 8, 2, 1, 7, 9]
sort A use cmpfunc_ascending(x, y)
print A                         ' Output [1,2,3,5,7,8,9]
```

### Example 3:  Sorting in descending order using a compare function

```
func cmpfunc_descending(x, y)
    if x == y
        return 0
    elseif x < y
        return 1
    else
        return -1
    endif
end

A = [5, 3, 8, 2, 1, 7, 9]
sort A use cmpfunc_descending(x, y)
print A                         ' Output [9,8,7,5,3,2,1]
```
