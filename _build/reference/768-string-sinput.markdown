# SINPUT

> SINPUT src; var1 [, delim1] [,var2 [, delim2]] ... [,varN [, delimN]]

Splits the string `src` into substrings which are separated by delimiters `delim1` to `delimN` and returns the substrings as `var1` to `varN`. Delimiters can be single characters, numbers or strings.

### Example 1: Split string with delimiter ","

```
src = "1456,Peter,8"

SINPUT src; id, ",", name, ",", age 

print "ID  : " + id
print "Name: " + name
print "Age : " + age

' Output:
' ID  : 1456
' Name: Peter
' Age : 8
```

### Example 2: Split string with complex delimiters

```
src = "if x>1 then y"
SINPUT src; vif, " ", vcond, "then", vdo
print vif, vcond, vdo                       ' Output: if    x>1    y
```


