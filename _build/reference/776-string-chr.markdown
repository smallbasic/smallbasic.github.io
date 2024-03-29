# CHR

> s = CHR (x)

Returns an one-char string of character with ASCII code `x`.

See ASC to convert a character to ASCII code.

### Example 1

```
print "ASCII code 65 is '" + chr(65) + "'"        ' Output ASCII code 65 is 'A'
```

### Example 2: Get escape character

The CHR command is useful for obtaining and printing the escape character (ASCII 27). For more information about escape codes see article "Escape Codes"

```
PRINT CHR(27) + "[1mTHIS IS BOLD" + CHR(27) + "[0m"
PRINT CHR(27) + "[3mThis is italic" + CHR(27) + "[0m"
PRINT CHR(27) + "[4mThis is underline"
```

### Example 3: Print ASCII table

```
REM display the ASCII and the extended tables

For n = 0 To 255

  If n = 0 Then
    Color 15, 0: Locate 1, 1
    Print "Standard 7-bit ASCII table (character codes 0 - 127):";
  Elseif n = 128 Then
    print
    print
    Input "Press return to see nonstandard table", k
    Color 15, 0: Cls: Locate 1, 1
    Print "Nonstandard 8-bit Extended table (character codes 128 - 255):";
  Endif

  If n <= 31 Then ' control characters (e.g. new-line, tab, etc).
    Read c
  Elseif n = 32 Then ' regular space (invisible...)
    c = "sp"
  Elseif n = 127 Then ' lonesome control character "del"
    c = "del"
  Else
    c = Chr(n) ' ASCII code --> character
  Endif

  Locate (n Mod 16) + 3, (((n \ 16) Mod 8) * 9) + 1

  Color 7: Print Using "000 "; n; ' ASCII code
  Color 14: Print c; ' ASCII (or ANSI) character
Next

Color 7, 0: Print: Print
Print " * Nonstandard characters might look different on another system."

End

' nonprintable control characters (ASCII codes 0..31):
Data "nul", "soh", "stx", "etx", "eot" ' 0..4
Data "enq", "ack", "bel", "bs" , "tab" ' 5..9
Data "lf" , "vt" , "np" , "cr" , "so"  ' 10..14
Data "si" , "dle", "dc1", "dc2", "dc3" ' 15..19
Data "dc4", "nak", "syn", "etb", "can" ' 20..24
Data "em" , "eof", "esc", "fs" , "gs"  ' 25..29
Data "rs" , "us"  ' 30..31
```
