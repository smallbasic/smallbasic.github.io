# BCS

> BCS (s)

Converts (B)ASIC-style strings to (C)-style (S)trings by masking escape codes. Escape codes in the string will not be applied to format the string when printed on the screen. Instead escape codes will be printed as they are.

See CBS to unmasked a c-style string, and see article "Escape codes" for more information about escape codes.

```
' define some escape codes
const NORMAL             = "\e[0m"  ' = Cat(0)
const BOLD               = "\e[1m"  ' = Cat(1)
const BOLD_OFF           = "\e[21m" ' = Cat(-1)
const BG_CYAN            = "\e[46m"
const TB                 = "\t"

' Create a string with escape codes
BasicStyleString               = BOLD + "BOLD" + BOLD_OFF + TB + TB + BG_CYAN + "COLORFULL BG" + NORMAL
CStyleString                   = bcs(BasicStyleString)
BackConverted_BasicStyleString = cbs(CStyleString)

print "Basic-style string            : "; BasicStyleString
print "C-style string                : "; CStyleString
print "Back conversion to basic style: "; BackConverted_BasicStyleString

' Output will be (with colors and in bold)
' Basic-style string            : BOLD		COLORFULL BG
' C-style string                : \e[1mBOLD\e[21m\t\t\e[46mCOLORFULL BG\e[0m
' Back conversion to basic style: BOLD		COLORFULL BG
```

