# User guide

> SmallBASIC is a fast and easy to learn BASIC language interpreter ideal for everyday calculations, scripts and prototypes. SmallBASIC includes trigonometric, matrices and algebra functions, a built in IDE, a powerful string library, system, sound, and graphic commands along with structured programming syntax.

### Constants and Variables

* All user variables (include arrays) are 'Variant'. That means the data-type is invisible to user.
* Arrays are always dynamic, even if you had declared their size, with dynamic size and type of elements.
However, SmallBASIC uses, internally, 4 data-types
* Integer  (32bit)
* Real     (64bit)
* String   (<32KB on 16bit / 2GB on 32bit)
* Array    (~2970 elements on 16bit / ~50M elements on 32bit)

Conversions between those types are performed internally. In any case there are functions for the user to do it manually.

### Variable names

Variable names can use any alphanumeric characters, extended characters (ASCII codes 128-255 for non-English languages) the symbol '_', and the symbol '$'. The first character of the name cannot be a digit nor a '$'.

### About the dollar-symbol

The symbol '$' is supported for compatibility. Since in SmallBASIC there are no data-types its use is meaningless.
The dollar in function names will be ignored.
The dollar in variable names will be count as part of the name (that means v and v$ are two different variables). It can be used only as the last character of the name, and only one allowed.
The dollar in system variables names will be ignore it (that means COMMAND and COMMAND$ is the same)
Example of variable names:

```
abc, a_c, _bc, ab2c, abc$ -> valid names
1cd, a$b, $abc            -> invalid names
```

### Integers

This is the default data type. You can declare integers in decimal, hexadecimal, octal and binary form.

```
x = 256   '
x = 0x100 ' Hexadecimal form 1
x = &h100 ' Hexadecimal form 2
x = 0o400 ' Octal form 1
x = &o400 ' Octal form 2
x = 0b111 ' Binary form 1
x = &b111 ' Binary form 2
```

### Reals

Any number which out-bounds the limits or an 'integer' or had decimal digits will be converted automatically to real.

```
x = .25
x = 1.2
```

Reals can be also written by using scientific notation. 1E+2 or 1E-+2, 5E--2, 2.6E-0.25, etc
*Strings*
Strings may be appended to one another using the + operator.
```
b = "Hello, " + "world!"
```

### Constants

Constant variables can be declared by using the keyword CONST.

```
CONST my_pi = 3.14
```

### System Variables

System variables, are constant variables for the programmer. Those variables get values or modified at run-time by the SB's subsystem.
* OSNAME Operating System name
* OSVER Operating System Version (0xAABBCC (A=major, B=minor, C=patch))
* SBVER SmallBASIC Version (0xAABBCC)
* PI 3.14..
* XMAX Graphics display, maximum x (width-1)
* YMAX Graphics display, maximum y (height-1) value
* BPP Graphics display: bits per pixel (color resolution)
* VIDADR Video RAM address (only on specific drivers)
* CWD Current Working Directory
* HOME User's home directory
* COMMAND Command-line parameters
* TRUE The value 1
* FALSE The value 0
*Operators*
Sorted by priority

--- ------------ 
( )  Parenthesis
   
+, -  Unary
~   bitwise NOT
NOT or !  Logical NOT  (NOT false = true)
   
^   Exponentiation
   
*, /, \\  Multiplication, Division, Integer Division
% or MOD  Reminder (QB compatible: a=int(a), b=int(b), a-b*(a/b))
MDL  Modulus  (a%b+b*(sgn(a)<>sgn(b)))
   
+, -  Addition/Concatenation, Subtraction
   
=   Equal
<> or !=  Not Equal
>,    <  Less Than, Greater Than
=>,   =<  Less or Equal, Greater or Equal
>=,   <=  Less or Equal, Greater or Equal
IN  belongs to ... (see "The IN operator")
LIKE  Regular expression match (see "The LIKE operator")
   
AND or &&  Logical AND
OR  or    Logical OR
BAND or &  bitwise AND
BOR  or   bitwise OR
EQV  bitwise EQV
IMP  bitwise IMP
XOR  bitwise XOR
NAND  bitwise NAND
NOR  bitwise NOR
XNOR  bitwise XNOR
--- ------------ 

### Special Characters

-------- ----------------------------------------------- 
&h or 0x  Prefix for hexadecimal constant (0x1F,   &h3C)
&o or 0o  Prefix for octal constant       (0o33,   &o33)
&b or 0b  Prefix for binary constant      (0b1010, &b1110)
[,;]     Array definition (function ARRAY())                    ($1)
<<       Appends to an array (command APPEND)                   ($1)
++       Increase a value by 1 (x = x + 1)                      ($1)
--       Decrease a value by 1 (x = x - 1)                      ($1)
p=       Another LET macro (x = x p ...). Where p any character of -+/\\*^%&
:        Separates commands typed on the same line
&        Join code lines (if its the last character of the line). The result line its must not exceed the max. line size.
#        Meta-command (if its the first character of the line) or prefix for file handle
@        The 'at' symbol can by used instead of BYREF          ($1)
'        Remarks
-------- ----------------------------------------------- 

_Pseudo operators_. These operators are replaced by compiler with a command or an expression.

### Statement OPTION keyword parameters

This special command is used to pass parameters to the SB-environment. There are two styles for that, the run-time (like BASE) which can change the value at run-time, and the compile-time (like PREDEF) which used only in compile-time and the value cannot be changed on run-time.

### Run-Time

### Statement OPTION BASE lower-bound

The [OPTION BASE]{.code} statement sets the lowest allowable subscript of arrays to _lower-bound_. The default is zero. The [OPTION BASE]{.code} statement can be used in any place in the source code but that is the wrong use of this except if we have a *good* reason. In most cases the [OPTION BASE]{.code} must declared at first lines of the program before any [DIM]{.code} declaration.

### Statement OPTION MATCH [PCRE [CASELESS]|SIMPLE]{.code}

Sets as default matching algorithm to (P)erl-(C)ompatible (R)egular (E)xpressions library or back to simple one. Matching-algorithm is used in [LIKE]{.code} and [FILES]{.code}.
PRCE works only in systems with this library and it must be linked with. Also, there is no extra code on compiler which means that SB compiles the pattern every time it is used.

### Compile-Time

### Statement OPTION PREDEF parameter

Sets parameters of the compiler. Where [parameter]{.code}
* QUIET Sets the quiet flag (-q option)
* COMMAND cmdstr Sets the [COMMAND$]{.code} string to [var]{.code} (useful for debug reasons)
* GRMODE [widthxheight[xbpp]] Sets the graphics mode flag (-g option) or sets the preferred screen resolution. Example: (Clie HiRes)

~~~
OPTION PREDEF GRMODE 320x320x16
~~~

* TEXTMODE Sets the text mode flag (-g- option)
* CSTR Sets as default string style the C-style special character encoding ('\\')

### Meta-commands

#!...
Used by Unix to make source runs as a script executable
#sec: section-name
Used internally to store the section name. Sections names are used at limited OSes like PalmOS for multiple 32kB source code sections.
#inc: file
Used to include a SmallBASIC source file into the current BASIC code
#unit-path: path
Used to setup additional directories for searching for unit-files This meta does nothing more than to setting up the environment variable SB_UNIT_PATH. Directories on Unix must separated by ':', and on DOS/Windows by ';'
Examples

```
#inc:"mylib.bas"
...
MyLibProc "Hi"
*Arrays and Matrices*
Define a 3x2 matrix
A = [11, 12; 21, 22; 31, 32]
```

That creates the array

--- ----
11  12
21  22
31  32
--- ----

The comma used to separate column items; the semi-colon used to separate rows. Values between columns can be omitted.
```
A = [ ; ; 1, 2 ; 3, 4, 5]
```

This creates the array

-  -  -
0  0  0
1  2  0
3  4  5
-  -  -

Supported operators:
Add/sub:

```
B = [1, 2; 3, 4]: C = [5, 6; 7, 8]
A = B + C
C = A - B
```

Equal:

```
bool=(A=B)
```

Unary:
```
A2 = -A
```

Multiplication:
```
A = [1, 2; 3, 4]: B = [5 ; 6]
C = A * B
D = 0.8 * A
```

Inverse:
```
A = [ 1, -1, 1; 2, -1, 2; 3, 2, -1]
? INVERSE(A)
```

Gauss-Jordan:
```
? "Solve this:"
? "  5x - 2y + 3z = -2"
? " -2x + 7y + 5z =  7"
? "  3x + 5y + 6z =  9"
?
A = [ 5, -2, 3; -2, 7, 5; 3, 5, 6]
B = [ -2; 7; 9]
C = LinEqn(A, B)
? "[x;y;z] = "; C
```

There is a problem with 1 dimension arrays, because 1-dim arrays does not specify how SmallBASIC must see them.

DIM A(3)
------ ----
1 2 3
------ ----
or
-- 
1
2
3
-- 

And because this is not the same thing. (ex. for multiplication) So the default is columns
DIM A(3) ' or A(1,3)

- - -
1 2 3
- - -

For vertical arrays you must declare it as 2-dim arrays Nx1

DIM A(3,1)

-- 
1
2
3
-- 

Nested arrays are allowed

```
A = [[1,2] , [3,4]]
B = [1, 2, 3]
C = [4, 5]
B(2) = C
print B
```

This will be printed
```
[1, 2, [4, 5], 3]
```
You can access them by using a second (or third, etc) pair of parenthesis.

```
B(2)(1) = 16
print B(2)(1)
```

Result:
    16

*The operator IN*

IN operator is used to compare if the left-value belongs to
right-value.

```
' Using it with arrays
print 1 in [2,3]        :REM FALSE
print 1 in [1,2]        :REM TRUE
print "b" in ["a", "b", "c"] :REM TRUE
...
' Using it with strings
print "na" in "abcde"   :REM FALSE
print "cd" in "abcde"   :REM TRUE
...
' Using it with number (true only if left = right)
print 11 in 21          :REM FALSE
print 11 in 11          :REM TRUE
...
' special case
' auto-convert integers/reals
print 12 in "234567"    :REM FALSE
print 12 in "341256"    :REM TRUE
```

### The operator LIKE

LIKE is a regular-expression operator. It is compares the left part of the expression with the pattern (right part). Since the original regular expression code is too big (for handhelds), I use only a subset of it, based on an excellent old stuff by J. Kercheval (match.c, public-domain, 1991). But there is an option to use PCRE (Perl-Compatible Regular Expression library) on systems that is supported (Linux); (see OPTION).

The same code is used for filenames (FILES(), DIRWALK) too. In the pattern string:

------ -------------------------------------------------- 
*      matches any sequence of characters (zero or more)
?      matches any character
[SET]  matches any character in the specified set,
[!SET] or [^SET]  matches any character not in the specified set.
------ -------------------------------------------------- 

A set is composed of characters or ranges; a range looks like character hyphen character (as in 0-9 or A-Z). [0-9a-zA-Z_] is the minimal set of characters allowed in the [..] pattern construct.
To suppress the special syntactic significance of any of `[]*?!^-\\', and match the character exactly, precede it with a `\\'.

```
? "Hello" LIKE "*[oO]" : REM TRUE
? "Hello" LIKE "He??o" : REM TRUE
? "Hello" LIKE "hello" : REM FALSE
? "Hello" LIKE "[Hh]*" : REM TRUE
```

*The pseudo-operator <<*

This operator can be used to append elements to an array.
```
A << 1
A << 2
A << 3
? A(1)
```

*Syntax of procedure (SUB) statements*

```
 SUB name [([BYREF] par1 [, ...[BYREF] parN)]]
  [LOCAL var[, var[, ...]]]
  [EXIT SUB]
  ...
END
```

*Syntax of function (FUNC) statements*

```
FUNC name[([BYREF] par1 [, ...[BYREF] parN)]]
  [LOCAL var[, var[, ...]]]
  [EXIT FUNC]
  ...
  name=return-value
END
```

On functions you must use the function's name to return the value. That is, the function-name acts like a variable and it is the function's returned value.
The parameters are 'by value' by default. Passing parameters by value means the executor makes a copy of the parameter to stack. The value in caller's code will not be changed.

Use [BYREF]{.code} keyword for passing parameters 'by reference'. Passing parameters by reference means the executor push the pointer of variable into the stack. The value in caller's code will be the changed.

```
' Passing 'x' by value
SUB F(x)
  x=1
END
x=2
F x
? x:REM displays 2
> ' Passing 'x' by reference
SUB F(BYREF x)
  x=1
END
x=2
F x
? x:REM displays 1
```

You can use the symbol @ instead of [BYREF]{.code}. There is no difference between @ and [BYREF]{.code}.

```
 SUB F(@@x)
  x=1
END
```

On a multi-section (PalmOS) applications sub/funcs needs declaration on the main section.

```
sec:Main
declare func f(x)
#sec:another section
func f(x)
...
end
```

Use the [LOCAL]{.code} keyword for local variables. [LOCAL]{.code} creates variables (dynamic) at routine's code.

```
SUB MYPROC
  LOCAL N:REM LOCAL VAR
  N=2
  ? N:REM displays 2
END
N=1:REM GLOBAL VAR
MYPROC
? N:REM displays 1
```

You can send arrays as parameters.
When using arrays as parameters its better to use them as [BYREF]{.code}; otherwise their data will be duplicated in memory space.

```
SUB FBR(BYREF tbl)
  ? FRE(0)
  ...
END
SUB FBV(tbl)
  ? FRE(0)
  ...
END
' MAIN
DIM dt(128)
...
? FRE(0)
FBR dt
? FRE(0)
FBV dt
? FRE(0)
Passing & returning arrays, using local arrays.
func fill(a)
  local b, i
  dim b(16)
  for i=0 to 16
    b(i)=16-a(i)
  next
  fill=b
end
DIM v()
v=fill(v)
```

### Single-line Functions

There is also an alternative [FUNC DEF]{.code} syntax (single-line functions). This is actually a macro for compatibility with the BASIC's DEF FN command, but quite useful.

```
FUNC name[(par1[,...])] = expression
or
DEF name[(par1[,...])] = expression
DEF MySin(x) = SIN(x)
? MySin(pi/2)
```

*Nested procedures and functions*

One nice feature, are the nested procedures/functions. The nested procedures/functions are visible only inside the "parent" procedure/function.
There is no way to access a global procedure with the same name of a local.

```
FUNC f(x)
    Rem Function: F/F1()
    FUNC f1(x)
        Rem Function: F/F1/F2()
        FUNC f2(x)
            f2=cos(x)
        END
        f1 = f2(x)/4
    END
    Rem Function: F/F3()
    FUNC f3
        f3=f1(pi/2)
    END
REM
? f1(pi) : REM OK
? f2(pi) : REM ERROR
f = x + f1(pi) + f3 : REM OK
END
```

### Units

Units are a set of procedures, functions and/or variables that can be used by another SB program or SB unit. The main section of the unit (commands out of procedure or function bodies) is the initialization code.

A unit declared by the use of [UNIT]{.code} keyword.

```
UNIT MyUnit
```

The functions, procedure or variables which we want to be visible to another programs must be declared with the [EXPORT]{.code} keyword.

```
UNIT MyUnit
EXPORT MyF
...
FUNC MyF(x)
...
END
```

Keep file-name and unit-name the same. That helps the SB to automatically recompile the required units when it is needed. To link a program with a unit we use the [IMPORT]{.code} keyword.

> IMPORT MyUnit

To access a member of a unit we must use the unit-name, a point and the name of the member.

```
IMPORT MyUnit
...
PRINT MyUnit.MyF(1/1.6)
Full example:
file my_unit.bas:
UNIT MyUnit
EXPORT F, V
REM a shared function
FUNC F(x)
    F = x*x
END
REM a non-shared function
FUNC I(x)
    I = x+x
END
REM Initialization code
V="I am a shared variable"
L="I am invisible to the application"
PRINT "Unit 'MyUnit' initialized :)"
file my_app.bas:
IMPORT MyUnit
PRINT MyUnit.V
PRINT MyUnit.F(2)
```

### The pseudo-operators

++/--/p=
The ++ and -- operators are used to increase or decrease the value of a
variable by 1.

```
x = 4
x ++ : REM x <- x + 1 = 5
x -- : REM x <- x - 1 = 4
```

The generic p= operators are used as in C Where p any character of -+/\\*^%&|
```
x += 4 : REM x <- x + 4
x *= 4 : REM x <- x * 4
```

All these pseudo-operators are not allowed inside of expressions

```
y = x ++ ' ERROR
z = (y+=4)+5 ' ALSO ERROR
```

### The USE keyword

This keyword is used on specific commands to passing a user-defined expression.

```
SPLIT s," ",v USE TRIM(x)
```

In that example, every element of V() will be 'trimmed'.
Use the x variable to specify the parameter of the expression. If the expression needs more parameter, you can use also the names y and z

### The DO keyword

This keyword is used to declare single-line commands. It can be used with WHILE and FOR-family commands.

```
FOR f IN files("*.txt") DO PRINT f
...
WHILE i < 4 DO i ++
```

Also, it can be used by IF command (instead of THEN), but is not suggested.

### Using LOCAL variables

When a variable is not declared it is by default a global variable. A usual problem is that name may be used again in a function or procedure.

```
FUNC F(x)
  FOR i=1 TO 6
    ...
  NEXT
END
FOR i=1 TO 10
  PRINT F(i)
NEXT
```

In this example, the result is a real mess, because the [var i]{.code} of the main loop will always (except the first time) have the value 6!
This problem can be solved if we use the [LOCAL]{.code} keyword to declare the [var]{.code} in the function body.

```
FUNC F(x)
  LOCAL i
  FOR i=1 TO 6
    ...
  NEXT
END
FOR i=1 TO 10
  PRINT F(i)
NEXT
```

It is good to declare all local variables on the top of the function. For compatibility reasons, the func./proc. variables are not declared as 'local' by default. That it is WRONG but as I said ... compatibility.

### Loops and variables

When we write loops it is much better to initialize the counters on the top of the loop instead of the top of the program or nowhere.

```
i = 0
REPEAT
  ...
  i = i + 1
UNTIL i > 10
```

p.. Initializing variables at the top of the loop can make code more readable.

## Loops and expressions

```
FOR-like (loops) commands evaluate both the "destination" and the exit-expression every time.
FOR i=0 TO LEN(FILES("*.txt"))-1
    PRINT i
NEXT
```

In that example the 'destination' is the LEN(FILES("*.txt"))-1 For each value of i the destination will be evaluated. That is WRONG but it is supported by BASIC and many other languages.
So, it is much better to be rewritten as

```
idest=LEN(FILES("*.txt"))-1
FOR i=0 TO idest
    PRINT i
NEXT
```

Of course, it is much faster too.


