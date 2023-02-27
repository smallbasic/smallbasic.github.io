# ERASE

> ERASE var[, var[, ... var]]

Deallocates the memory used by the specified arrays or variables. After that these variables turned to simple integers with zero value.

### Example

```
DIM x(100)

x(1) = 1
x(2) = 2

ERASE x

PRINT x(1)    ' This will create an error
```

