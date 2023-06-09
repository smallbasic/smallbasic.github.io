# ON

> ON n GOTO|GOSUB label1 [, ..., labelN]

Causes a branch of the program to one of the labels `label1` to `labelN`. `n` defines the number of the label. If `n = 1` the first label is used; with `n = N` the Nth label is used. `n` must be in the range 0 to 255.

### Example 1: ON ... GOTO

```
n = 1       ' Change to 1,2,3 or other value

ON n GOTO label1, label2, label3

print "Nothing happend"

end

label label1
print "Goto label 1"
end

label label2
print "Goto label 2"
end

label label3
print "Goto label 3"
end
```

### Example 2: ON ... GOSUB

```
n = 1       ' Change to 1,2,3 or other value

ON n GOSUB label1, label2, label3

print "After GOSUB"

end

label label1
print "Gosub label 1"
return

label label2
print "Gosub label 2"
return

label label3
print "Gosub label 3"
return
```

