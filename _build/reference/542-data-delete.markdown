# DELETE

> DELETE A, idx [, count]

Deletes `count` elements at position `idx` of array `A`.

### Example 1: Delete element at position 2

```
a = [1, 2, 3, 4, 5]
print a                 ' Output: [1,2,3,4,5]
delete a, 2
print a                 ' Output: [1,2,4,5]
```

### Example 2: Delete two elements starting at position 2

```
b = [1, 2, 3, 4, 5]
print b                 ' Output: [1,2,3,4,5]
delete b, 2, 2
print b                 ' Output: [1,2,5]
```
