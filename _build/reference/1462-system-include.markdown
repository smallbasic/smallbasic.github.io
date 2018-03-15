# INCLUDE

> INCLUDE source-file.bas

Inserts code in the named file when the program is compiled. 

INCLUDE is not in the main list for the Language reference. But here it is, right after IMPORT under the System category!
Here is part_1.bas, the first part of our long program:
<pre>

' "part_1.bas" demo file for INCLUDE keyword.
Label startProgram
Print "i is: "; i

</pre>

Here is part_2.bas, the second (and startup) part of our long program:
<pre>

' "part_2.bas" demo file for INCLUDE keyword - This is the startup file
' to run the demo program.
' -------------
' Include keyword allows us to merge another SmallBASIC source file into 
' our file, which means that any code is common to all files.
' It's useful when the program is too long and we simply want to divide it
' into "pages", instead of one single long "page".
' 
' See also Home -- Language reference -- Graphics -- COLOR -- color_const.bas
' for practical example of Include.
'
' Note: INCLUDE keyword is very different from UNIT keyword. 
'       UNIT allows us to use only specific code, therefore it is more suitable 
'       for modular programming.
'       UNIT also supports "Namespaces": Namespaces allow reuse of same names 
'       in different contexts. e.g. BitLib.Set(x) and StrLib.Set(x) are both 
'       using a function with the same name, "Set", but in different contexts.
' -------------

' Here we include (merge) another file in our program:
' Note: actuall filename must be lower case for Linux.
Include "part_1.bas" 

' demo:
i += 1
If i <= 10 Then Goto startProgram ' startProgram label is in part_1.bas
Pause

</pre>

