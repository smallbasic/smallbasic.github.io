# STATSPREADP

> f = STATSPREADP (var1 [, var2, ... , varN])

Biased sample variance. `var1` to `varN` can be single numbers or arrays.

See: https://en.wikipedia.org/wiki/Variance#Sample_variance

### Example

```
A = [1,2,3,4,6]
print "Biased sample variance:   "; statspreadp(A)
print "Unbiased sample variance: "; statspreads(A)

' Output:
' Biased sample variance:   2.96
' Unbiased sample variance: 3.7
```


