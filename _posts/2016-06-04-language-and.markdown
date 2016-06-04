---
layout: post
title:  "AND"
categories: language
---
Language

a AND b

Logical AND. Right side is not evaluated if left side evaluates to False.

' The Sign-Bit Bug (part 2):
' Ways to workaround this bug:
'
' 1) It is Safe to manipulate the lower bits, 0 to 30.
'    If your program don't need to manipulate whole 32-bits of integer,
'    then you can safely BAND numbers with 0x7FFFFFFF to create 31-bit
'    unsigned integers (bit-31+ are cleared).
'
'    But you must make sure when using math functions or bitwise NOT (~)
'    that the sign bit (bit-31) always remains intact, i.e. = 0.
'
' 2) A slower way, but safe, is to manipulate 32 bits using BIN() function.
'    In this way you can temporarily convert a number to binary string of
'    32-bits, manipulate whole 32 bits using regular string manipulation,
'    and then convert the binary string back to number, for example:
'
     ' assuming that BIN() returns 32-bits binary string (as it should):
     s = Bin(number)         ' convert number to binary string
     s = Replace(s, 1, "1")  ' set bit-31
     s = Replace(s, 32, "0") ' reset bit-0
     number = Val(s)         ' convert binary string back to number
'    This code will work the same way on both 64-bit and 32-bit systems.
'    It allows you to Shift/Rotate 32-bit numbers safely. So if you don't
'    need the speed of bitwise operators, then this is easy and safe way.
'
' 3) If you still need to manipulate whole 32 bits, using fast bitwise
'    operators, in a safe way that will give the same results on
'    32-bit and 64-bit systems, then it's possible. Just be aware of
'    the following:
'
'    - Never change the sign bit (bit-31 of integer) by using Math
'      operators or function; or by using bitwise NOT (~). This leads
'      to arithmetic result as opposed to bitwise result.
'
'    - Trim double number to integer using 'n = n BAND 0xFFFFFFFF';
'      save the sign-bit using 'save_sign = n BAND 0x80000000';
'      then mask the lower 31 bits using 'n = n BAND 0x7FFFFFFF';
'      then manipulate Only these 31 bits;
'      then restore the sign-bit using 'n = n BOR save_sign'.
'    - To shift bits left: clear the upper bits including the sign bit;
'      then multiply by POW(2, bits) to shift left Only bits-0..30;
'      then set the sign bit (bit-31) using 'n = n BOR bit'.
'
'    - To shift bits right: clear the upper bits including the sign bit;
'      then divide by POW(2, bits).
'
'    - Unverified: use CDBL to avoid saving, clearing, restoring bit-31. 
'
' * Finally, debug your code on both 32-bit and 64-bit systems.

```

? " < SmallBASIC - Truth Table > "
?
? "                          OUTPUTS (0=False, 1=True)                       "
? "           +---------------+---------------------------------------------+"
? "           |  Logical (per |                  Bitwise                    |"
? "   INPUTS  |   expression) |         (for each bit in result)            |"
? " +---------+---------------+---------------------------------------------+"
? " |  a   b  | AND  OR NOT(b)| BAND BOR ~(b) NAND NOR  XOR  XNOR EQV  IMP  |"
? " +---------+---------------+---------------------------------------------+"
' display table (0 and 1 equivalent to 0b0 and 0b1):
For a = 0 To 1 Do
  For b = 0 To 1 Do
    ? Usg " |  0   0  |"; a, b;
    ? Usg "  0  ";
    ' Logical (result compared to False): 
    ? Usg; (a AND b) <> 0;  
    ? Usg; (a OR  b) <> 0;
    ? Usg; (  NOT b) <> 0; 
    ? "|";
    ' Bitwise (result is in bit-0):
    ? Usg; (a BAND b) Band 1;
    ? Usg; (a BOR  b) Band 1;
    ? Usg; (  ~    b) Band 1;
    ? Usg; (a NAND b) Band 1;
    ? Usg; (a NOR  b) Band 1;
    ? Usg; (a XOR  b) Band 1; 
    ? Usg; (a XNOR b) Band 1;
    ? Usg; (a EQV  b) Band 1;
    ? Usg; (a IMP  b) Band 1;
    ? "|"
  Next
Next
? " +---------+---------------+---------------------------------------------+"
? " * for Logical operators 0 is false and any other value is true."
? " * NOT, ~ (Bitwise NOT), operators using only right side value/expression." 
? " * any difference between bitwise NOR and XNOR...?
Pause

```

I am trying to figure out what Usg is and found out USING isn't listed either.
Ah ha!
SB ref txt: <cite> The symbol ? can be used instead of keyword PRINT You can use 'USG' instead of 'USING'. </cite>
I have not seen USING used in this way before, but I am a bit behind.
shian, you must be working with assembler or electronic boards like Raspberry Pi (or both).
I found another keyword which is not listed (I don't remember which); I found that keyword only through pressing F1 in SmallBASIC editor.
I also found wrong/unclear syntax, such as ```
a NOT b
```
 in the reference.
As far as I know and understand NOT takes only the right-side argument, i.e. ```
NOT expr
```

And I found lots and lots of partial descriptions as well, which may lead to frustration until you figure it out by your self...
That's why I wish to write more short examples for each command, to clarify its use. But certainly, the terse description of each command is very intimidating for a novice user.
... I used to program industrial PLCs and controllers, and programs for customers,
usually for free, but my jobs were always simple physical jobs - not intellectual. 
SmallBASIC is much more fun then the popular languages, where you have to read a manual for 2 days just to be able to use a single object. For popular languages, such as Java, you better be a clerk - since there is not much to program - it's more about searching in a hug library what you need for specific task...
Language reference is perfect place to create extended definitions and examples of keywords and their use. They are most useful when short and focused on the keyword. Or, like here, when the keyword is put into perspective with a slew of other keywords. Using the search feature is very time consuming and often fruitless, some code examples are outdated (if you can even find the keyword buried in the code).
Terseness is crucial in Help from built in editor but as you say frustrating if you are unfamiliar with keyword and usage. In other words, the built in Help makes for excellent cheat sheet to remind of spelling/meaning and parameter order.
I remember stumbling upon one of the constants xmax or ymax, trying to reassign the value of one of these built in constants. They are very handy but should also be included in language reference so one doesn't try and use them for variables.
I agree with what you say.
Unlike other popular languages, with 50,000 or more "members", i.e.  keywords, objects, constants, and other esoteric and mystical structures of bits and bytes - SmallBASIC has a very small and quite standard vocabulary that needs to be documented.
 Keyword's documentation must include:
1. Syntax (any formal syntax and abbreviation)
2. Description (exact behaviour, constants)
3. Comments (stuff you better know)
4. Example(s) (short, clear, useful)
5. See also (the actual keyword you were looking for...)
Usually programmers dislike documentation; so this work should be done by another positive soul, who knows the language well enough, and with a bit of discipline and consistency in semantic. 
The built-in help (F1) must be terse; yet the online help (F2) should include the above 5 sections, again, straight to the point and not too wordy.
p.s. the SmallBASIC editor tells you that you "Cannot change a constant" when running ```
xmax = 4
```
 which is great, yet built-in constants must be included in the language reference, since these are actually keywords (hopefully there aren't too many, in that case just add them to a separate section).


REM SmallBASIC
REM created: 11/03/2016
REM I'm using smallbasic_0.12.2, 32-bit and 64-bit versions for Linux.
' The Sign-Bit Bug:
' -----------------
' The Sign Bit, (or the "Most Significant Bit", or the "Leftmost Bit",
' or bit-31 of SmallBASIC integer) - is a bit in a signed number that
' indicates the sign of a number.
' If you write a Bit Manipulation code, be aware that SmallBASIC is
' interpreting your code differnetly on 32-bit or 64-bit system:
' For example, run the following code on 32-bit and 64-bit systems:
```

? "Assigning hexadecimal number to variable or constant:"
n = 0xFFFFFFFF
? n
' On 32-bit system n is: -1
' On 64-bit system n is: 4294967295
?
? "Bitwise NOT (~) a number:"
n = ~0xFFFFFFFF
? Bin(n)
' On 32-bit system n is: 00000000000000000000000000000000
' On 64-bit system n is: 10000000000000000000000000000000
?
? "Raising to power of 32+ bit number:"
n = Pow(2, 32) - 1
? Bin(n)
' On 32-bit system n is: 10000000000000000000000000000000
' On 64-bit system n is: 11111111111111111111111111111111
?
? "Using 64-bit double number instead of 32-bit integer:"
n = Cdbl(0xFFFFFFFF)
? Bin(n)
'  The same result on both systems:
' On 32-bit system n is: 11111111111111111111111111111111
' On 64-bit system n is: 11111111111111111111111111111111
?
? "Using hexadecimal number *in-line*:"
n = 0xFFFFFFFF Band 0x7FFFFFFF
? n
'  The same result on both systems:
' On 32-bit system n is: 2147483647
' On 64-bit system n is: 2147483647
'

```

' -----------
' The code above produces different results on 32-bit and 64-bit systems;
' Therefore it leads to subtle bug with no run-time error, and no other
' indication.
'
' The reason for this inconsistency is the fact that SamllBASIC determine
' the type of variables on the fly. And while the sign bit in a 64-bits
' register is bit-63 - in a 32-bits register is bit-31.
'
' SmallBASIC integers are 32-bit signed integers. The sign bit of
' SmallBASIC integer is bit-31 (base 0). It is Safe to manipulate only
' bits 0 to 30, on both 64-bit and 32-bit systems. But it is Not safe
' to manipulate the sign bit, bit-31.
'
' ...It would be easier if SmallBASIC would have used double numbers
'    (not integers) for bitwise operators.
'    In that case bit-31 would have been a regular bit (not sign bit).
'    But integer manipulation is faster then double number manipulation.
It's interesting...
I know at least one language that solved this conflict internally:
Instead of using 32-Bit signed integers, it uses virtual 31-Bit signed integers.
It allows that programming language to avoid any conflicts with the sign bit-31;
i.e. whenever the number is too big to fit into 31 bits integer, it's converted to double;
so bitwise operators are using 31-bit integers (which are Actually unsigned) Or double.
This internal solution is hidden from the users of the language, i.e. they continue to use the
language as usual; but at the same time it solves lots of bit-level conflicts between 32-bit systems 
and 64-bit systems.
