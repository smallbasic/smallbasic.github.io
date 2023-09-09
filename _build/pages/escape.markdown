# Escape codes

SmallBASIC supports a number of escape codes for controlling the display. The codes allow you to set foreground and background colors, change the font and also set underline and inverse text display. The escape codes are based on [ANSI Codes](http://en.wikipedia.org/wiki/ANSI_escape_code).

## Supported standard codes

```
  \a      beep
  \t      tab (20 px)
  \r      return
  \n      next line
  \"      quote "
  \\      Backslash \
  \e[K    clear to end of line
  \e[nG   move to column n
  \e[s    save cursor position
  \e[u    restore cursor position
  \e[0m   reset all attributes to their defaults
  \e[1m   set bold on
  \e[3m   set italic on
  \e[4m   set underline on
  \e[7m   reverse video
  \e[21m  set bold off
  \e[21m  set italic off
  \e[24m  set underline off
  \e[27m  set reverse off
  \e[nm   n colors - 30..37 foreground, 40..47 background
```

## Using escape codes directly

Instead of `\e` the command CHR(27) is useful for obtaining and printing the escape character.

```smallbasic
PRINT CHR(27) + "[1mTHIS IS BOLD" + CHR(27) + "[0m"
PRINT CHR(27) + "[3mThis is italic"  + CHR(27) + "[0m"
PRINT CHR(27) + "[4mThis is underline"

PRINT "\e[32mGreen text"
PRINT "\e[32m\e[47mGreen text on white background"
PRINT "First line\nSecond Line"
```

## Using the EscapeCode Unit

The EscapeCode Unit makes it easier to use escape codes and to deal with different colors for foreground and background. The unit can be downloaded  or copy pasted from the [SmallBASIC Github website](https://github.com/smallbasic/smallbasic.plugins/blob/master/units/EscapeCodes.bas). Please save the unit in the same directory as your basic file.

Here an example on how to use the unit:

```smallbasic
' SmallBASIC 12.25
' Example for using UNIT "EscapeCodes"
' For more information see: https://smallbasic.github.io/pages/escape.html

import EscapeCodes as esc

print "FORMATING TEXT:"
print
print esc.NORMAL + "WITHOUT ANY FORMAT " + esc.ITALIC + "ITALIC " + esc.ITALIC_OFF + esc.BOLD + "BOLD " + esc.BOLD_OFF + esc.UNDERLINE + "UNDERLINE " + esc.UNDERLINE_OFF + esc.REVERSE + "REVERSE" + esc.REVERSE_OFF
print
print "USE COLORS:"
print
print esc.BG_BLACK   + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_RED     + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_GREEN   + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_YELLOW  + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_BLUE    + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_MAGENTA + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_CYAN    + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.BG_WHITE   + esc.BLACK + "  BLACK  " + esc.RED + "   RED   " + esc.GREEN + "  GREEN  " + esc.YELLOW + " YELLOW " + esc.BLUE + "  BLUE    " + esc.MAGENTA + " MAGENTA " + esc.CYAN + "  CYAN  " + esc.WHITE + "  WHITE  " + esc.NORMAL
print esc.NORMAL
print "USE COLORS AND FORMATS:"
print
print esc.NORMAL + esc.BOLD + esc.UNDERLINE + esc.GREEN + esc.BG_WHITE + "BOLD + UNDELINE + COLOR" + esc.NORMAL
print
print "CONTROL THE CURSOR:"
print
print esc.MOVE_TO_COLUMN(4) + "MOVE TO COLUMN 4"
print "TABS:" + esc.TB + "ONE TAB" + esc.TB + esc.TB + "TWO MORE TABS"
print "YOU SHOULD NOT READ THIS" + esc.RET + "RETURN TO BEGIN OF LINE "
print "FIRST LINE" + esc.NEXTLINE + "NEXT LINE"
print esc.SAVECURSOR + "YOU SHOULD NOT READ THIS" 
print esc.RESTORECURSOR + esc.CLEAR_LINE + "SAVE AND RESTORE THE CURSOR POSITION"
print
print "OTHER:"
print
print esc.QUOTE + "YOU CAN USE QUOTES" + esc.QUOTE
print esc.BP + "A BEEP SHOULD BE AUDIBLE"
```

## Escape codes in SmallBASIC console version

In the console version of SmallBASIC (sbasic.exe or sbasic) most of the escape codes, for example [ANSI Codes at wikipedia](http://en.wikipedia.org/wiki/ANSI_escape_code), can be used in version 12.25 or later. Support of escape codes depends on the operating system and the terminal you are using.


