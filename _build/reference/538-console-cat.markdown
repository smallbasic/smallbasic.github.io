# CAT

> CAT (x)

Returns a console code. 0 = reset, 1 = bold, -1 bold-off, 2 = underline, -2 = underline-off, 3 = reverse, -3 = reverse-off.


<pre>? cat(1);"Bold";cat(0)

<pre>

' Note: tested and works with SB 0.12.2 on Linux 64-bit.
Color 14, 1
? Cat(1); "This is Bold text"; Cat(-1)
?
? Cat(2); "This is Underline text"; Cat(-2)
?
? Cat(3); "This is Reverse text"; Cat(-3)
? 
' Cat(0) resets ALL attributes, including colors.
? Cat(1); Cat(2); "This is Bold & Underline text"; Cat(0) 
?
? Cat(2); Cat(3); "This is Underline & Reverse text (with default colors)"; Cat(0)
Pause

</pre>

<pre>

' Note: tested and works with SB 0.12.2 on Linux 64-bit.
' See also Article "ESCAPE codes" for more codes.
Const ESCS = Chr(27) + "[" ' Escape sequence prefix.
Const BG_BLACK = ESCS + "40m" ' background colors
Const BG_GREEN = ESCS + "42m"
Const ATTR_OFF = ESCS + "0m"  ' reset ALL console attributes
Const BOLD_ON  = ESCS + "1m"  ' strong
Const BOLD_OFF = ESCS + "21m"
Const LINE_ON  = ESCS + "4m"  ' underline
Const LINE_OFF = ESCS + "24m"
Const REVE_ON  = ESCS + "7m"  ' reverse
Const REVE_OFF = ESCS + "27m"
Def green(text)   = BG_GREEN + text + BG_BLACK
Def bold(text)    = BOLD_ON + text + BOLD_OFF
Def uline(text)   = LINE_ON + text + LINE_OFF
Def reverse(text) = REVE_ON + text + REVE_OFF

? green(bold("This is Green Bold text"))
?
? uline("This is Underline text")
?
? reverse("This is Reverse text")
? 
Color 14 ' yellow text color
' ATTR_OFF resets ALL attributes, including colors.
? green(bold(uline("This is Green, Bold & Underline text"))) + ATTR_OFF
?
? reverse(uline("This is Underline & Reverse text (with default colors)"))
Pause

</pre>

<pre>

' Note:
' * You may Include "csi_const.bas" file in another file to make your code more clear.
'
' * "Supported" codes, are those supported by SmallBASIC IDE (not by another Terminal Emulator).
' * CSI is "Control Sequence Introducer" (or "Control Sequence Initiator"), i.e. Chr(27) + "[".
' * See also: Home -- Articles -- ESCAPE codes
' * See also: Home -- Language reference -- Graphics -- COLOR -- color_const.bas
' * See  https://en.wikipedia.org/wiki/ANSI_escape_code  for more Escape codes.
'
' demo - add these lines to another BAS file:
' ------------------------------------------
'  Include "csi_const.bas" ' actuall filename must be lower case for Linux.
'
'  Color 14: ? "Press a key to start..."
'  Pause
'  ? C0_FF + CSI_UNDERLINE + CSI_BG_BLUE + "It's me...!" + CSI_NORMAL
'  ? "It's me again...!" + C0_BEL
' ------------------------------------------

' csi_const.bas constants:
Const CSI = Chr(27) + "[" ' Control Sequence Introducer
' Reset all terminal attributes to their defaults:
Const CSI_NORMAL = CSI + "0m"
' Supported foreground color values for characters (30m-37m):
Const CSI_BLACK   = CSI + "30m"
Const CSI_RED     = CSI + "31m"
Const CSI_GREEN   = CSI + "32m"
Const CSI_YELLOW  = CSI + "33m"
Const CSI_BLUE    = CSI + "34m"
Const CSI_MAGENTA = CSI + "35m"
Const CSI_CYAN    = CSI + "36m"
Const CSI_WHITE   = CSI + "37m"
' Supported background color values for characters (40m-47m):
Const CSI_BG_BLACK   = CSI + "40m"
Const CSI_BG_RED     = CSI + "41m"
Const CSI_BG_GREEN   = CSI + "42m"
Const CSI_BG_YELLOW  = CSI + "43m"
Const CSI_BG_BLUE    = CSI + "44m"
Const CSI_BG_MAGENTA = CSI + "45m"
Const CSI_BG_CYAN    = CSI + "46m"
Const CSI_BG_WHITE   = CSI + "47m"
' Supported font attributes (these returned by CAT as well):
Const CSI_BOLD          = CSI + "1m"  ' = Cat(1)
Const CSI_BOLD_OFF      = CSI + "21m" ' = Cat(-1)
Const CSI_UNDERLINE     = CSI + "4m"  ' = Cat(2)
Const CSI_UNDERLINE_OFF = CSI + "24m" ' = Cat(-2)
Const CSI_REVERSE       = CSI + "7m"  ' = Cat(3)
Const CSI_REVERSE_OFF   = CSI + "27m" ' = Cat(-3)
' Other font attributes:
Const CSI_ITALIC        = CSI + "3m"
Const CSI_ITALIC_OFF    = CSI + "23m"
Const CSI_BLINK         = CSI + "5m"
Const CSI_BLINK_OFF     = CSI + "25m"
' Supported cursor movment:
Const CSI_EL  = CSI + "K"    ' EL - Erase in Line (clear to end of line).
' Supported C0 Control Codes (See https://en.wikipedia.org/wiki/C0_and_C1_control_codes):
Const C0_BEL = Chr(7)         ' BEL - bell (beep) (-C- \\a)
Const C0_HT  = Chr(9)         ' HT  - Horizontal Tabulation (tab) (-C- \\t)
Const C0_LF  = Chr(10)        ' LF  - Line Feed (-C- \\n)
Const C0_FF  = Chr(12)        ' FF  - Form Feed (clear screen) (-C- \\f)
Const C0_CR  = Chr(13)        ' CR  - Carriage Return (-C- \\r)
Const C0_NL  = C0_CR + C0_LF  ' CNL - Cursor Next Line (Windows style for \\n)
' Note: New-Line (or line-break) character(s) is different on each system:
'       Windows and DOS uses a pair of CR and LF characters to terminate lines.
'       UNIX, Linux, FreeBSD and OS X uses a single LF character only.
'       Classic Mac operating system uses a single CR character only.
'       ... And the list goes on (https://en.wikipedia.org/wiki/Newline).

' Useful non-standard codes (for Android and FLTK versions):
Const CSI_ALERTBOX = CSI + " A"  ' Displays an Alert Box
Const CSI_KEYBOARD = CSI + " K"  ' Displays the Virtual Keyboard
Const CSI_LABEL    = CSI + " L"  ' Displays a Label at the bottom of the screen

</pre>

