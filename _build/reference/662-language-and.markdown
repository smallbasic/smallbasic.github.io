# AND

> a AND b

Logical AND. Right side is not evaluated if left side evaluates to False.

```
a = 1
b = 0

print a and b   ' output is 0

if(a == 1 and b == 0) then print "if statement 1"
if(a == 1 and b == 1) then print "if statement 2"       ' "if statement 2" will not be printed to the screen

c = "test"

if(a == 1 and c == "test") then print "if statement 3"
if(a == 1 and c == "test2") then print "if statement 4" ' "if statement 4" will not be printed to the screen
```

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
' Display table (0 and 1 equivalent to 0b0 and 0b1):
For a = 0 To 1
  For b = 0 To 1
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
  Next b
Next a
? " +---------+---------------+---------------------------------------------+"
? " * For Logical operators 0 is False and any other value is True."
? " * NOT, ~ (Bitwise NOT), operators using only right side value/expression."
? " * XNOR and EQV is the same gate (both return the same result)."
```


## For experts:

The Sign-Bit Bug (part 2):
Ways to workaround this bug:

1. It is Safe to manipulate the lower bits, 0 to 30.
   If your program don't need to manipulate whole 32-bits of integer,
   then you can safely BAND numbers with 0x7FFFFFFF to create 31-bit
   unsigned integers (bit-31+ are cleared). But you must make sure when using math functions or bitwise NOT (~)
   that the sign bit (bit-31) always remains intact, i.e. = 0.

2. A slower way, but safe, is to manipulate 32 bits using BIN() function.
   In this way you can temporarily convert a number to binary string of
   32-bits, manipulate whole 32 bits using regular string manipulation,
   and then convert the binary string back to number, for example:
   assuming that BIN() returns 32-bits binary string (as it should):

   ```
   s = Bin(number)         ' convert number to binary string
   s = Replace(s, 1, "1")  ' set bit-31
   s = Replace(s, 32, "0") ' reset bit-0
   number = Val(s)         ' convert binary string back to number
   ```

   This code will work the same way on both 64-bit and 32-bit systems.
   It allows you to Shift/Rotate 32-bit numbers safely. So if you don't
   need the speed of bitwise operators, then this is easy and safe way.

3. If you still need to manipulate whole 32 bits, using fast bitwise
   operators, in a safe way that will give the same results on
   32-bit and 64-bit systems, then it's possible. Just be aware of
   the following:

   - Never change the sign bit (bit-31 of integer) by using Math
     operators or function; or by using bitwise NOT (~). This leads
     to arithmetic result as opposed to bitwise result.

   - Trim double number to integer using 'n = n BAND 0xFFFFFFFF';
     save the sign-bit using 'save_sign = n BAND 0x80000000';
     then mask the lower 31 bits using 'n = n BAND 0x7FFFFFFF';
     then manipulate Only these 31 bits;
     then restore the sign-bit using 'n = n BOR save_sign'.

   - To shift bits left: clear the upper bits including the sign bit;
     then multiply by POW(2, bits) to shift left Only bits-0..30;
     then set the sign bit (bit-31) using 'n = n BOR bit'.

   - To shift bits right: clear the upper bits including the sign bit;
     then divide by POW(2, bits).

```
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
n = 0xFFFFFFFF
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
```

The code above produces different results on 32-bit and 64-bit systems;
Therefore it leads to subtle bug with no run-time error, and no other
indication.

The reason for this inconsistency is the fact that SamllBASIC determine
the type of variables on the fly. And while the sign bit in a 64-bits
register is bit-63 - in a 32-bits register is bit-31.

SmallBASIC integers are 32-bit signed integers. The sign bit of
SmallBASIC integer is bit-31 (base 0). It is Safe to manipulate only
bits 0 to 30, on both 64-bit and 32-bit systems. But it is Not safe
to manipulate the sign bit, bit-31.

