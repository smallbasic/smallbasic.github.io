---
permalink: /539
layout: post
title:  "INKEY"
categories: console
---
Console

INKEY

Returns the last key-code in keyboard buffer, or an empty string if there are no keys. Special key-codes like the function-keys are returned as 2-byte string.


k=INKEY
IF LEN(k)
  IF LEN(k)=2
    ? "H/W #"+ASC(RIGHT(k,1))
  ELSE
    ? k; " "; ASC(k)
  FI
ELSE
  ? "keyboard buffer is empty"
FI

```

Option Base 1 ' (field 1, 2, 3...)
' key values (on my system):
Const K_BACKSP = 8
Const K_TAB = 9
Const K_ENTER = 13
Const K_ESCAPE = 27
Const K_DELETE = 127
' if LEN(key) = 2 then add 256:
Const K_LEFT = 256 + 4
Const K_RIGHT = 256 + 5
Const K_UP = 256 + 9
Const K_DOWN = 256 + 10
Const K_INSERT = 256 + 16
Const K_HOME = 256 + 17
Const K_END = 256 + 18
' left justify string in buffer:
Def lset(s, length) = Left(s + Space(length), length)
' edit string:
Def edit_char(txt, pos, char, rep_mode) = Replace(txt, pos, char, rep_mode <> 0)
Def delete_char(txt, pos) = Replace(txt, pos, "", 1)
' init demo fields (f):
Const F_PROMPT = 1
Const F_INPUT = 2
Const F_LENGTH = 3
' [F_PROMPT; F_INPUT; F_LENGTH]:
f = ["First Name:", "Last Name:", "Hobby"; "", "", ""; 10, 10, 20]
' index of fields:
Const MIN_IX = Lbound(f, 2)
Const MAX_IX = Ubound(f, 2)
ix = MIN_IX ' ix = field index
pos = 99999999 ' init cursor position
' start demo:
While True Do
  ' update vars:
  text = f(F_INPUT, ix)
  text_len = Len(text)
  eol = text_len + 1 ' end of line
  field_len = f(F_LENGTH, ix)
  If pos > eol Then pos = eol ' adjust cursor pos
  ' update screen:
  For i = MIN_IX To MAX_IX
    Locate i * 2, 1 ' fields
    Color 7, 0: ? f(F_PROMPT, i) + " ";
    col = Xpos
    Color 15, 3: ? lset(f(F_INPUT, i), f(F_LENGTH, i));
    Color 7, 0: ? " "; ' eol
    If i = ix Then ' cursor
      Color 0, 14 - (replace_mode <> 0)
      Locate i * 2, col + pos - 2
      ? Mid(f(F_INPUT, ix) + " ", pos, 1); ' + eol
    Fi
  Next
  ' update status line:
  Color 0, 7: Locate Ypos + 3, 0
  ? "  (Esc=Stop)   |   "; Iff(replace_mode, "Replace", "Insert "); Spc(3);
  ? Format("| 00:", ix); Iff(pos = eol, "EOL", Format("000", pos)); Spc(1);
  ' wait for a key:
  key = ""
  While key = "" Do key = Inkey
  ' convert key to number:
  Select Case Len(key)
  Case 1: key = Asc(key) ' regular key
  Case 2: key = 256 + Asc(Right(key, 1)) ' special key
  End Select
  ' check key:
  Select Case key
  Case K_ESCAPE: Stop
  Case K_INSERT: replace_mode = Not replace_mode
  Case K_DOWN:   If ix < MAX_IX Then ix++
  Case K_UP:     If ix > MIN_IX Then ix--
  Case K_ENTER, K_TAB: ix++: If ix > MAX_IX Then ix = MIN_IX
  Case K_HOME:   pos = 1
  Case K_END:    pos = eol
  Case K_LEFT:   If pos > 1 Then pos--
  Case K_RIGHT:  If pos < eol Then pos++
  Case K_DELETE: If pos < eol Then f(F_INPUT, ix) = delete_char(text, pos)
  Case K_BACKSP: If pos > 1 Then pos--: f(F_INPUT, ix) = delete_char(text, pos)
  Case Else ' regular char:
    is_char = key >= 32 And key <= 255 And key <> 127
    ins = replace_mode And (pos <= field_len) ' insert
    rep = Not replace_mode And (text_len < field_len) ' replace
    If is_char And (ins Or rep) Then
      f(F_INPUT, ix) = edit_char(text, pos, Chr(key), replace_mode)
      pos++
    Fi
  End Select
Wend

```

I have been a bit stuck with INKEY for some time. I started building a little TextBox editor over a year ago and got stuck on something with INKEY and moved on. As I recall INKEY was not returning unique key numbers but I forget which... posted sometime ago on this issue.
Anyway, this demo is exactly the kind of thing I had in mind! Thank you shian!!!
I wonder if text selecting is also possible, eg [ctrl+]shft+ home | end ?
BTW is CAT working for anyone? I was testing it last night and couldn't get anything going (Windows 10-64 and SB 0.12.2).
```

' Note:
' * You may Include "inkey_const.bas" file in another file to make your code more clear.
'
' * Created using SmallBASIC version 0.12.2 (on Linux Mint 17.3).
' * More special keys might be included in future/other versions of SmallBASIC.
' * Values returned by INKEY cannot be used for DEFINEKEY.
' 
' Demo - add these lines to another BAS file:
' ------------------------------------------
' Include "inkey_const.bas" 
'
' ? "Press Up Arrow key..."
' Repeat: k = Inkey: Until k = K_UP
' ? "User pressed Up Arrow key!"
' ------------------------------------------
' inkey_const.bas - Special INKEY values:
Const K_BKSP   = Chr(0x08)  ' BackSpace
Const K_TAB    = Chr(0x09)
Const K_ENTER  = Chr(0x0D)
Const K_ESC    = Chr(0x1B)  ' Escape
Const K_SPACE  = Chr(0x20)
Const K_DELETE = Chr(0x7F)
Const K_PGUP   = K_ESC + Chr(0x01)  ' Page Up
Const K_PGDN   = K_ESC + Chr(0x02)  ' Page Down
Const K_LEFT   = K_ESC + Chr(0x04)  ' Arrow Left
Const K_RIGHT  = K_ESC + Chr(0x05)  ' Arrow Right
Const K_UP     = K_ESC + Chr(0x09)  ' Arrow Up
Const K_DOWN   = K_ESC + Chr(0x0A)  ' Arrow Down
Const K_INSERT = K_ESC + Chr(0x10)
Const K_HOME   = K_ESC + Chr(0x11)
Const K_END    = K_ESC + Chr(0x12)
Const K_CLICK  = K_ESC + Chr(0xC0)  ' Left Mouse Button Click

' ' Use this code to test and print key codes as hexa:
' ' --------------------------------------------------
' Print "Press Ctrl+B to stop..."
' While 1: k = Inkey: l = Len(k)
'   If l Then
'     ? "0x"; Right("00" + Hex(Asc(k)), 2);
'     If l = 2 Then ? Right("00" + Hex(Asc(Mid(k, 2))), 2);
'     Print
'   Fi
' Wend

```

Notes (I'm using SB 0.12.2 on Linux 64-bit):
1. INKEY has internal delay that makes it behave not smoothly.
2. INKEY returns a very limited set of keys (not including control-keys, functions, Shift-Alt-Ctrl combinations).
When the first character in the two character code is 27, the second character is a code for the given special key. You would need to inspect the SB source to work out the equivalent SmallBASIC key constants, but I'll have a look at generating a constants.bas file that you can include in your programs.
As reported by Shian (thanks Shian!), there are a few problems with INKEY. I'll fix these in the next update. There is supposed to be a different first character code for SHIFT/ALT etc states.
Also, INKEY needs to read from the system event queue to get the next keystroke. It currently does a pause for key, but I think it should actually block in the call to read the queue, that way when you type a key there would be no delay. Either way this doesn't work well for shooter type games, but there is a better way. Have a look at:
https://github.com/smallbasic/SmallBASIC/blob/master/samples/distro-exam...
This uses the DEFINEKEY command to register keystroke handlers for game keys. When you hit the game key, the registered FUNC will get called more or less immediately, somewhere inside the game main looI think this should work well in the space shooter (which is awesome by the way).
