### System

> UNIT name

Declares the source module as a unit. Units are a set of procedures, functions and/or variables that can be used by another program or unit.

As of SmallBASIC version 0.12.6:
1. UNIT supports 'namespace' (Namespaces allow reuse of same names in different contexts. e.g. BitLib.Set(x) and StrLib.Set(x) are both using a function with the same name, "Set", but in different contexts). 
2. UNIT name on Linux system is no longer case sensitive (which makes life easier for Linux users).

The UNIT file is strlib.bas:
<pre>

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

</pre>

Demo file, demo.bas, which is using strlib.bas above:
<pre>

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

</pre>

1. While UNIT can be used as a collection of sub-routines for your own
   program, UNIT is particularly useful for creating a general-purpose
   library.
   General purpose library can be useful for many programs or projects, 
   the same way the internal routine "PRINT" is useful for many programs,
   and not only for specific one.
2. It is very important to keep the syntax of EXPORTed routines fixed.
   For example: 
   Imagine that the internal routine "PRINT" will use a new syntax in 
   future version of SmallBASIC, something like:
   <pre>
PRINT [fileN,] x, y, color, "string"  ' the "new" syntax
</pre>

   In this case many older programs will not work with the new version
   of SmallBASIC.
   
   The same way, when you create a UNIT to be used as a general-purpose
   library, you must keep the syntax of EXPORTed routines fixed, so old
   programs will continue to work well with newer versions of your UNIT.
   
3. If you modify an existing UNIT, you should assign to it a new version number.
   The easy way to maintain a <a href=https://en.wikipedia.org/wiki/Software_versioning> Software versioning</a> is like this:
   
   "Unit Name", Version major.minor.revision, Release_Date
   
   For example: <pre>
REM Unit "StrLib" Version 1.15.11, 20/3/2016
</pre>

     
   <strong>major number:</strong> is increased when there are significant jumps in functionality such as changing the framework which could cause incompatibility with interfacing programs.
   <strong>minor number:</strong> is incremented when only minor features or significant fixes have been added.
 
   <strong>revision number:</strong> is incremented when minor bugs are fixed.
   
   By assigning a version number, other users will know what to expect from the
   modified version. You should also add a short description of the changes 
   that you have made.
   
4. If your UNIT is quite advanced, and you expect it to work differently in
   future versions, you can use the following method which allows Old & New
   programs to work with your unit correctly:
   
   Instead of using a fixed syntax for sub routines, such as:
   
   <pre>
ZipText(string, method, fileName)
</pre>

   
   Use a single object parameter which has a default value of 0:
   
   <pre>
ZipText(x)
</pre>

   
   Now, in version 1.0.0 for example, x might have this syntax as an array:
   
   <pre>
x is [string, method, fileName] ' Version 1.0.0
</pre>

   
   And in some future version, x might have another syntax, such as:
   
   <pre>
x is [string, method, fileName, format] ' Version 1.1.0
</pre>

   Or...
   <pre>
x is [string, fileName] ' Version 1.14.5
</pre>

   Etc.
   
   The <pre>
ZipText(x)
</pre>
 routine will verify the number of arguments
   and/or their type (array, string, etc) and execute the correct code for this
   version's-syntax.
   
   This method is especially useful for maintaining a big project for a long
   time, which is going to offer more and more features in the future. It will
   allow old programs to work as usual, and new programs to benefit from the
   new features.
   
5. UNIT should Export <strong>only</strong> routines or constants (variables)
   which related to the specific use of that unit. 
   For example, UNIT which offers string manipulation routines should <strong>only</strong> 
   Export string manipulation routines or string constants.
   
   If UNITs contain routines for many different uses, it is likely that two
   UNITs will have to IMPORT each other - and this is basically illogical.
6. * UNIT must be documented well, so other users can use it.
   * UNIT should be efficient, because it should serves many other programs.
   * Routines syntax should be consistent and standard, to be easy to use.
   * UNIT is saved as Byte-Code (SBU), which is fast and does not include
     spaces, comments, etc. So feel free to add enough comments and spaces...
     
There are more about UNITs (shared libraries), but the most important: 
 When you write a UNIT to be used by others, try to be merciful... i.e.
 write clear and documented code, and make it easy for others to use your
 UNIT.
