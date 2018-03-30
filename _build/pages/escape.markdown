# Escape codes

SmallBASIC supports a number of escape codes for controlling the display. The codes allow you to set foreground and background colors, change the font and also set underline and inverse text display.

The escape codes are based on [ANSI Codes](http://en.wikipedia.org/wiki/ANSI_escape_code). SmallBASIC also support a number of additional codes which are not part of the standard.

Escape sequences start with the characters ESC (ASCII 27d / 1Bh / 033o )  and [ (left bracket). This sequence is called CSI for  "Control Sequence Introducer".

The supported standard codes are:

```
  \a      beep
  \t      tab (20 px)
  \r      return
  \n      next line
  \xC     clear screen (new page)
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

Useful non-standard codes include:

```
  \003    end of text (flush buffer)
  \m      scroll to the top
  \<1     select backscreen 1
  \<2     select backscreen 2
  \>1     select frontscreen 1
  \<2     select frontscreen 2
```

The CHR command is useful for obtaining and printing the escape character (ASCII 27)

For example:

```
10 PRINT CHR(27) + "[1mTHIS IS BOLD" + CHR(27) + "[0m"
20 PRINT CHR(27) + "[3mThis is italic"  + CHR(27) + "[0m"
30 PRINT CHR(27) + "[4mThis is underline"
```
