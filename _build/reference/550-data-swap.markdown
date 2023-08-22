# SWAP

> SWAP a, b

Exchanges the values of the two variables `a` and `b`. `a` and `b` may be variables of any type.

### Example 1: Swap numbers

```
a = 1
b = 2

print "Before: "; a, b      ' Output: Before: 1   2
swap a,b
print "After:  "; a, b      ' Output: Before: 2   1
```

### Example 2: Swap strings

```
s1 = "abc"
s2 = "xyz"

print "Before: "; s1, s2    ' Output: Before: abc   xyz
swap s1, s2
print "After:  "; s1, s2    ' Output: After:  xyz   abc
```

### Example 3: Swap arrays

```
A = [1,2,3]
B = [7,8,9]

print "Before: "; A, B      ' Output: Before: [1,2,3]   [7,8,9]
swap A, B
print "After:  "; A, B      ' Output: After:  [7,8,9]   [1,2,3]
```
