# SEARCH

> SEARCH A, key, BYREF idx [USE cmpfunc( var1, var2)]

Scans an array `A` for the key `key` and returns the position `idx` of the element.  If the key is not found `idx` contains the value `(LBOUND(A)-1)`. In default-base arrays (starting with element zero) `-1` will be returned.

The optional compare function `cmpfunc` takes 2 vars `var1` and `var2`. `var1` contains the value of the actuell element and `var2` is equal to `key`. The compare function must return `0` or `1` (`false` or `true`). When it returns `1`, the search will stop and the current element position is returned in `idx`.

### Example 1: 1D array of numbers

```
option base 1

A = [1,9,6,4,5,3,7,8,2]         ' 1D array with 9 elements
SEARCH A, 3, ElementID          
print "Element: "; ElementID    ' Output: Element: 6
```

### Example 2: 2D array of numbers

```
option base 1

A = [1,9,6;4,5,3;7,8,2]         ' 2D matrix with 3x3 elements
SEARCH A, 3, ElementID
print "Element: "; ElementID    ' Output: Element: 6
```

### Example 3: Get the element position of the maximum value of an 1D array

```
option base 1

A = [1,9,6,4,5,3,7,8,2]
m = max(A)
SEARCH A, m, ElementID
PRINT "Element: "; ElementID    ' Output: Element: 2
```

### Example 4: 1D array of strings

```
option base 1

A = ["car", "dog", "house", "paper"]
SEARCH A, "house", ElementID
PRINT "Element: "; ElementID        ' Output: Element: 3
```

### Example 5: Compare function, find first element greater than the key

```
option base 1

func findgreater(x,y)
    findgreater = !(x > y)
end

A = [1,2,3,4,5,6,7,8,9]
search A, 5, ElementID USE findgreater(x,y)
PRINT "Element: "; ElementID         ' Output: Element: 6
```

### Example 6: Compare function, find first element which can be divided by the key

```
option base 1

func FindFirstDivider(x,y)
    FindFirstDivider = ( (x mod y) > 0 )
end

A = [1,5,7,4,5,6,7,8,9]
search A, 3, ElementID USE FindFirstDivider(x,y)
PRINT "Element: "; ElementID         ' Output: Element: 6
```

### Example 7: Compare function, find first element with string length given by the key

```
func FindFirstStringWithLenght(x,y)
    FindFirstStringWithLenght = ( len(x) != y )
end

A = ["car", "dog", "house", "paper"]
SEARCH A, 5, ElementID use FindFirstStringWithLenght(x,y)
PRINT "Element: "; elementID          ' Output: Element: 3
```




