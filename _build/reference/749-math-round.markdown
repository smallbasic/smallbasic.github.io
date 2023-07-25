# ROUND

> f = ROUND (x [, decs])

Rounds `x` to the nearest integer or number with `decs` decimal digits. `decs` is an optional parameter.

### Example 1: Round to nearest integer

```
A = 12.3456  
print round(A)                  ' Output: 12
```

### Example 2: Round integer numbers

```
A = 123456
print round(A/10) * 10        ' Output: 123460
print round(A/100) * 100      ' Output: 123500
print round(A/1000) * 1000    ' Output: 123000
```

### Example 3: Round to decimal digits

```
A = 12.3456  
print round(A)                   ' Output: 12
print round(A, 1)                ' Output: 12.3
print round(A, 2)                ' Output: 12.35
```



