# Escape codes

SmallBASIC supports a number of escape codes for controlling the display. The codes allow you to set foreground and background colors, change the font and also set underline and inverse text display.

The escape codes are based on "ANSI Codes" (http://en.wikipedia.org/wiki/ANSI_escape_code). SmallBASIC also support a number of additional codes which are not part of the standard.

Escape sequences start with the characters ESC (ASCII 27d / 1Bh / 033o )  and [ (left bracket). This sequence is called CSI for  "Control Sequence Introducer".

The supported standard codes are:

```
  \t      tab (20 px)
  \a      beep
  \r      return
  \n      next line
  \xC     clear screen (new page)
  \e[K    clear to end of line
  \e[0m   reset all attributes to their defaults
  \e[1m   set bold on
  \e[4m   set underline on
  \e[7m   reverse video
  \e[21m  set bold off
  \e[24m  set underline off
  \e[27m  set reverse off
  \e[nm   n colors - 30..37 foreground, 40..47 background
```

Useful non-standard codes include:

```
  \e[ A<text> Displays an alert box
  \e[ K       Displays the virtual keyboard
  \e[ L       Displays a label at the bottom of the screen
```

The CHR command is useful for obtaining and printing the escape character (ASCII 27)

For example:

```
10 PRINT CHR(27) + "[1mTHIS IS BOLD" + CHR(27) + "[0m"
20 PRINT CHR(27) + "[3mThis is italic"  + CHR(27) + "[0m"
30 PRINT CHR(27) + "[4mThis is underline"
```