# SINPUT

> SINPUT src; var [, delim] [,var [, delim]] ...

Splits the string 'src' into variables which are separated by delimiters.

```
src = "if x>1 then y"
SINPUT src; vif, " ", vcond, "then", vdo
print vif, vcond, vdo ' output: if    x>1    y
```

```
src = "1456,Peter,8"
SINPUT src; id, ",", name, ",", age 
print "ID: " + id
print "Name: " + name
print "Age: " + age
```
