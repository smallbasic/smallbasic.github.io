# THROW

> THROW [info [, ...]]

The THROW command is used to initiate a catch-able error. If there is no surrounding TRY/CATCH block, THROW can be used to abort the program. Optional a string `info` can be used to create an error message.

### Example 1: Abort a program

```
throw("Error")
```

### Example 2: Initial a catch-able error 

```
try
    a = 1
    if(a == 1) then throw("a == 1")
    if(a == 2) then throw("a == 2")
catch err
    print "Error: "; err
end try
```
