# LEN

> d = LEN(x)

Returns the length of the variable `x`.

The return value `d` depends on the type of the variable `x`:

| Type | Return Value             |
|--------|------------------------|
| number | length of the STR(x)   |
| string | length of the string   |
| array  | number of the elements |
| map    | number of the elements |

### Example

```
i = 10
f = 1.234
s = "abc"
dim a1(9)           ' Array with 10 elements
dim a2(9,9)         ' Array with 10x10 elements
m = {x:1, y:2, z:3} ' Map variable with 3 elements

print len(i)        ' Output: 2
print len(f)        ' Output: 5
print len(s)        ' Output: 3
print len(a1)       ' Output: 10
print len(a2)       ' Output: 100
print len(m)        ' Output: 3
```


