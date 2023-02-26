# EXIT

> EXIT [FOR|LOOP|SUB|FUNC]

Exits a multi line function definition, a loop, or a subprogram. By default (if no parameter is specified) exits from last command block (loop, for-loop or routine).

* FOR - Exit from the last FOR-NEXT loop
* LOOP - Exit from the last WHILE-WEND or REPEAT-UNTIL loop
* SUB - Return from the current routine
* FUNC - Return from the current function

### Example 1: for

```
for i = 1 to 100
    print i
    exit for
next

' Output: 1
```

### Example 2: while

```
while(i)
    i++
    print i
    exit loop
wend

' Output: 1
```

### Example 3: sub

```
sub MySub(a)
    exit sub
    print a
end

MySub(10)  ' No output, because print in MySub will not be reached
```

### Example 4: func

```
func MyFunc(a)
    exit func
    return a + 10
end

print MyFunc(10)  ' Output: 0, because return command in MyFunc will not be reached
```
