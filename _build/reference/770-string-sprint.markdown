# SPRINT

> SPRINT byref s; [USING...;] ...

Create a formated string and storing it to string `s`. SPRINT supports all features of PRINT. See PRINT for detailed information. USG can be used instead of USING.

### Example

```
a = 1000
b = 2000

SPRINT s1; USING "a = #####.00  b = ##,###"; a; b
SPRINT s2; "a + b = "; a; " + "; b; " = "; a + b

print s2     ' Output a =  1000.00  b =  2,000
print s1     ' Output: a + b = 1000 + 2000 = 3000
```
