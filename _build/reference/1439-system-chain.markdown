# CHAIN

> CHAIN source

Compile and run the given source. Source can be a file name, a line of code or an array of code. Use ENV to share variables with the parent process.

Example 1: Using constants; Note: `\"` is used to create a quote inside the string

```
Chain "? \"100 + 50 is: \"; 100 + 50" 

' Output: 100 + 50 is: 150
```

Example 2: Using variables

```
Env "SB1=6"
Env "SB2=2"
Chain "? Env(\"SB1\") ^ Env(\"SB2\")" 

' Output: 36
```

Example 3: Using an array

```
Env "SB1=3"
  
Dim a()          
a << "x = Env(\"SB1\")"
a << "For i = 1 To 5"
a << "? i * x; Spc(1);"
a << "Next i"

Chain a 

' Output: 3 6 9 12 15
```

Example 4: Using a file and returning a value

```
' First we have to create a bas-file to show how chain works with files

' Create an array
Env "SB1=4"  

Dim a()      
a << "x = Env(\"SB1\")"
a << "For i = 1 To 5"
a << "? i * x; Spc(1);"
a << "Next i"
a << "Env \"SB1=\" + Str(i):"    ' Return value using SB1

' Write array to file
tsave("chaindemo.bas", a)

' Peparations are done. Now a bas-file can be chained
Chain "chaindemo.bas" 

print
print "Return value SB1 is: "; Env("SB1"); 

' Output: 
' 4 8 12 16 20
' Return value SB1 is: 6
```

Example 5:

```
' Create demo bas file (could be any SmallBASIC file):
Open "chaindemo.bas" For Output As #1
? #1, "Sub count10(n)"
? #1, "  Local i"
? #1, "  Color 14"
? #1, "  For i = n To 10
? #1, "    Print i; " + Enclose(", ") + ";" 
? #1, "  Next i"
? #1, "  Env " + Enclose("SB1=") + " + Str(i) ' return value to parent
? #1, "End Sub"
? #1, 
? #1, "Color 7: ? " + Enclose("I'm The Child Program...! I can count!") + ": ?"
? #1, 
? #1, "n = Val(Env(" + Enclose("SB1") + ")) ' get value from parent"
? #1, 
? #1, "count10 n ' run sub-routine to count n to 10"
? #1, 
? #1, "?:?"
Close #1

' Load demo bas file into array:
Tload "chaindemo.bas", lines
Env "SB1=2" ' Set value for child program (1..10)
' Execute the demo bas file (the array):
Chain lines
' now print the return value from child program:
Color 7:  ? "I'm The Parent Program..."
?
Color 15: ? "Child program returned value: "; Env("SB1")
```

Example 6: Creating an eval function

```
' Dedicated to MGA.
' s is any legal SmallBASIC Math Expression as String, e.g. "1 + 2 / 4"
Func eval(s)
  Chain "Env " + Enclose("SBEVAL=") + " + Str(" + s + ")"
  eval = Val(Env("SBEVAL"))
End Func

' now run few demos:
? eval("1+2") 
? eval("Rad(45) * 2") 
? eval("PI / 2 + PI")
? eval("0b1111 * Pow(2, 4)")
? eval("Sin(2) * Tan(4) / Cos(6)")
? eval("1 + 2 / 4")
? eval("6 * (Pow(2, 4) * 8)")
? eval("Rad((45 * 3) - 20) * 2")
```



