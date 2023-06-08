# NOT

> y = NOT {a|expr}

Logical operator to invert variable or expression result. Equivalent syntax to `y = !a`. NOT returns true if variable or expression result is false or zero. Otherwise it returns false.

For bitwise NOT use the ~ operator.

### Example 1:

```
print not true    ' Output: 0
print not 100     ' Output: 0
print not false   ' Output: 1
print not 0       ' Output: 1
```

### Example 2: NOT in an if statement

```
IsRunning = false                ' Replace with true
if(NOT IsRunning) then print "Program is not running"
```

```
a = 0             ' Replace i.e. 10
if(NOT a) then print "Value is zero"
```

### Example 3: Bitwise NOT using ~

The NOT-operation performs a bitwise inversion on all bits of a number. This leads to the following (maybe unexpected) result:

```
print bin(~0b1001)      ' Output: 11111111111111111111111111110110
```

### Example 4: Operate bitwise NOT only on last n bits

If you want to operate NOT only on the last `n` bits of the numbers, you can use the following code:

```
n = 4
a = 0b1010

print bin((~a) BAND ((1 lshift n ) - 1)) 

' Output 101
```
