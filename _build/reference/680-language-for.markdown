# FOR

> FOR counter = start TO end [STEP incr] ... NEXT

> FOR element IN array (or map) ... NEXT

Defines a FOR/NEXT loop.

- counter - A numeric variable to be used as the loop counter.
- start - A numeric expression; the starting value of counter.
- end - A numeric expression; the ending value of counter.
- incr - A numeric expression; the value by which counter is incremented or decremented with each iteration of the loop. The default value is 1.
- element - A variable to be used as the copy of the current element.
- array - An array or map variable

### FOR counter = start TO end [STEP incr] ... NEXT

SmallBASIC begins processing of the FOR/NEXT block by setting counter equal to start. Then, if 'incr' is positive and counter is not greater than end, the commands between the FOR and the NEXT are executed. When the NEXT is encountered, counter is increased by 'incr', and the process is repeated. Execution passes to the command following the NEXT if counter is greater than end.

If increment is negative, execution of the FOR/NEXT loop is terminated whenever counter becomes less than end. FOR/NEXT loops may be nested to any level of complexity, but there must be a NEXT for each FOR.

### FOR element IN array ... NEXT

The commands-block will be repeated for LEN(array) times. Each time the 'element' will holds the value of the current element of the array.
FOR/NEXT loops may be nested to any level of complexity, but there must be a NEXT for each FOR.

### Example 1

```
for i = 1 to 9
    print i
next

' Output 1 2 3 4 5 6 7 8 9
```
### Example 2

```
for i = 1 to 9 Step 2
    print i
next

' Output: 1 3 5 7 9
```

### Example 3

```
for i = 9 to 1 Step -1
    print i
next

' Output 9 8 7 6 5 4 3 2 1
```
### Example 4

```
a =  [12, 6, 23, -4]

for i in a
    print i
next

' Output 12 6 23 -4
```

### Example 5

```
a =  ["car", "tree", "house"]

for i in a
    print i
next

' Output car tree house
```


### Example 6

```
a = {x:1, s:"test1"}
b = {x:2, s:"test2"}
c = {x:3, s:"test3"}

MapVar = [a,b,c]

for i in MapVar    
    print i.x, i.s
next

' Output:   1 test1
'           2 test2
'           3 test3
```

### Example 7

```
a = {x:1, y:2, s:"test1"}

for i in a
    print i + " = " + a(i)
next

' Output:   y = 2
'           x = 1
'           s = test1
```

### Example 8: Changing counter inside the loop

```
for i = 1 to 10
    i = i + 1
    print i
next

' Output: 2 4 6 8 10
```

### Example 8: Changing stop parameter inside the loop

```
e = 10

for i = 1 to e
    e = 5
    print i
next

' Output: 1 2 3 4 5
```


