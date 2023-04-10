# UNIT

> UNIT name

Declares the source module as a unit. Units are a set of procedures, functions, constants or variables that can be used by another program or unit.

- UNIT supports 'namespace' (Namespaces allow reuse of same names in different contexts. e.g. BitLib.Set(x) and StrLib.Set(x) are both using a function with the same name, "Set", but in different contexts).
- While UNIT can be used as a collection of sub-routines for your own program, UNIT is particularly useful for creating a general-purpose library. General purpose libraries can be useful for many programs or projects, the same way the internal routine “PRINT” is useful for many programs, and not only for specific one.

Use EXPORT to export procedured, functions, constants or variables. Only exported names can be access in the main program.

### Example 1: Simple Unit

First an example of the unit. Please save it with the filename "MyTestUnit.bas"

```
UNIT MyTestUnit

export MyFunc
export MySub
export MyConst = 3.1415
export MyVar = 5

func MyFunc(a,b)
    return a + b
end

sub MySub(a,b)
    print "a + b = "; a + b
end
```

Second an example on how to use the unit.

```
import MyTestUnit as u

u.MySub(1,2)

print u.MyFunc(2,3)
print u.MyConst

u.MyVar = u.MyVar + 5
print u.MyVar
```


### Example 2: A unit for using sring


The UNIT file is strlib.bas:

~~~

' File: strlib.bas
' ------------
' In this demo we are using UNIT to add more useful String commands to
' SmallBASIC, by carefully creating our own String-Library: strlib.bas
'
' This demo includes only two useful functions, Lset() and Rset(); You
' can add more useful functions, subs, constants - but make sure that
' they are all String commands (not Array, File, Data, etc).
'
' Write your code carefully and efficiently, because you will use these
' commands frequently in other projects. And don't forget to debug the
' code and to add clear documentation, for you and for others.
'
' See also Home-->Article-->Welcome to SmallBASIC-->Units.
' ------------
'

' Here we declare that this file is a UNIT file.
' Note: Keep file-name and unit-name the same. That helps the SB to
'       automatically recompile the required units when it is needed (i.e.
'       to create strlib.sbu file).
'       The actual file name must be in lower case for Linux OS.
Unit strlib ' (without .bas extension)
' Here we allow other SmallBASIC files to use some of our library keywords:
Export Lset, Rset

' Left justify string s in buffer of length b.
' example: x = Lset(" SmallBASIC ", 15) ' --> x is " SmallBASIC    "
Func Lset(s, b)
  Local l = Len(s)

  If l >= b Then
    Lset = Left(s, b)
  Else
    Lset = s + Space(b - l)
  Fi
End
' Right justify string s in buffer of length b.
' example: x = Rset(" SmallBASIC ", 15) ' --> x is "    SmallBASIC "
Func Rset(s, b)
  Local l = Len(s)

  If l >= b Then
    Rset = Right(s, b)
  Else
    Rset = Space(b - l) + s
  Fi
End

~~~

Demo file, demo.bas, which is using strlib.bas above:

~~~
' Here we declare that this file is using another UNIT file.
' Note: The actual file name must be in lower case for Linux OS.
Import strlib ' (without .bas extension)
' Note: To access a member of a UNIT we must use the unit-name, a point
'       and the name of the member, e.g. Strlib.Lset("Hello", 10).
' demo:
Color 14, 1
Locate 4, 30
Print Strlib.Lset("  -->>", 25)
Locate 5, 30
Print Strlib.Lset(Strlib.Rset("This way...", 18), 25)
Locate 6, 30
Print Strlib.Rset("-->>  ", 25)
Pause
~~~


