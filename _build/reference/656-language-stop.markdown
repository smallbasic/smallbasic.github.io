# STOP

> STOP [error]

Terminates execution of a program, closes all files opened by the program, and returns control to the operating system. The optional number `error` will be returned to the operating system; if not specified SmallBASIC returns `0`. On Windows, the `error` value is known as ERRORLEVEL.

### Example 1

```
print "Hello world"
stop
print "This will never be printed"
```

### Example 2

```
print "Type exit to stop program"
while (true)
    input "INPUT: ", s
    if(s == "exit") then stop
    print "You typed: ";s
wend
```
