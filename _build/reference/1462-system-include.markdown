# INCLUDE

> INCLUDE SourceFile

Inserts code from SourceFile when the program is compiled.

INCLUDE can be used to split a large file into smaller parts. If you want to use include to create a library, then you should consider to use an UNIT instead.

### Example

Create first file and save it as part1.bas.

```
Print "This is part1.bas"
for i = 1 to 5
  print i
next
```

Create second file wich will include part1.bas.

```
include part1.bas

print "This is part2.bas"
for i = 5 to 1 step -1
    print i
next

' Output:
' This is part1.bas
' 1 2 3 4 5
' This is part2.bas
' 5 4 3 2 1
```
