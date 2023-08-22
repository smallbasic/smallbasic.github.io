# STEP

> FOR i = a TO b STEP s

Specifies the loop counter increment `s` in a FOR loop. The variable `i` will be increased in every loop by amount `s`. `s` can be a positive or negative number.

See FOR for more information.

### Example 1: Positive step

```
for t = 1 to 10 step 2
    print t
next

' Output: 1 3 5 7 9
```

### Example 2: Negative step

```
for t = 10 to 1 step -2
    print t
next

' Output: 10 8 6 4 2
```
