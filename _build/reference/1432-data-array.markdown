# ARRAY

> A = ARRAY [s | expr]

Creates a ARRAY or MAP variable from the given string `s` or expression `expr`. The ARRAY command supports JSON (Javascript object notation) syntax. The MAP provides value-key pair access along with array or dotted notation. 

See STR for converting a MAP variable into a JSON string.

### Example 1: JSON string to MAP

```
a = array("{Name: Alice, Age: 20}")
print a
print a.Name + " is " + a.Age + " years old"

' Output:
' {"Age":20,"Name":"Alice"}
' Alice is 20 years old
```

### Example 2: JSON with nested MAP

```
a = Array("{x:1, y:3, down:{x:4, y:7}}")
print a                                    ' Output: {"down":{"y":7,"x":4},"x":1,"y":3}
```

### Example 3: Array string to array

```
a = Array("[1,2,3]")
print a                 ' Output: [1,2,3]
```
