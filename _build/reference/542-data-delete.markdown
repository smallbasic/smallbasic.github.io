# DELETE

> DELETE a, idx [, count]

Deletes 'count' elements at position 'idx' of array 'a'.

* a - An array-variable.
* idx - Position in the array.
* count - The number of the elements to be deleted.

Example 1: Delete element at position 2

```smallbasic
a = [1,2,3,4,5]
print a
delete a, 2
print a
```

Example 2: Delete two elements starting at position 2

```smallbasic
b = [1,2,3,4,5]
print b
delete b, 2, 2
print b
```
