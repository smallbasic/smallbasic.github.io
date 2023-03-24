# IFF

> IFF (condition, return_value_true, return_value_false)

Inline version of IF.

### Example 1

```
animal = "cat"
fur = IFF( animal == "cat", "yes", "no")
print fur
```

### Example 2

```
Eq = "sin"
x = 5

ans = iff(Eq == "sin", sin(x), cos(x))
print ans

' Alternative syntax:

if(Eq == "sin") then
    ans = sin(x)
else
    ans = cos(x)
endif

print ans
```

### Example 3

```
x = 4

ans = iff(x <= 5, 0, 10)
print ans 
```

