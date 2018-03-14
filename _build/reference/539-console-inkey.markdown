# Console

> INKEY

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

<pre>

' Key values:
Const K_BKSP   = Chr(0x08)  ' BackSpace
Const K_TAB    = Chr(0x09)
Const K_ENTER  = Chr(0x0D)
Const K_ESC    = Chr(0x1B)  ' Escape
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

' Edit string:
Def edit_char(txt, pos, char, ins_mode) = Replace(txt, pos, char, ins_mode = 0)
Def delete_char(txt, pos) = Replace(txt, pos, "", 1)

' Initialize three demo fields:
f_lbl = ["First Name:", "Last Name: ", "Your Hobby:"] ' field label
f_row = [3, 5, 7]     ' label row
f_col = [1, 1, 1]     ' label column
f_len = [10, 10, 20]  ' variable length
f_var = ["", "", ""]  ' variable value

' Index of fields:
Const MIN_IX = Lbound(f_lbl)
Const MAX_IX = Ubound(f_lbl)
ix = MIN_IX   ' Start on first field index
ins_mode = 1  ' Start in insert character mode

' Main demo loop:
While True
  ' Update variables:
  eol = Len(f_var(ix)) + 1                ' End Of Line
  If pos > eol Or pos < 1 Then pos = eol  ' Adjust cursor pos on new field
  ' Update screen:
  For i = MIN_IX To MAX_IX
    ' Print all fields:
    s  = Cat(0) + f_lbl(i) + " "
    s += Cat(3) + f_var(i) + Spc(f_len(i) - Len(f_var(i))) + " " ' + eol
    Locate f_row(i), f_col(i)
    Print s + Cat(0);
    ' Print the cursor:
    If i = ix Then
      If Not ins_mode Then Color 15
      Locate f_row(i), f_col(i) + Len(f_lbl(i)) + pos
      Print Cat(2) + Mid(f_var(i) + " ", pos, 1); ' (+ " " for eol)
    Fi
  Next i
  ' Update status line:
  s = "  (Esc=Stop)   |   " + Iff(ins_mode, "Insert ", "Replace") + Spc(3)
  s += Format("| 00:", ix) + Iff(pos = eol, "EOL", Format("000", pos)) + Spc(1)
  Locate 0, 0: Print Cat(0) + Cat(3) + s;
  Showpage ' SHOWPAGE makes INKEY works smoother (using SB 0.12.2)
  ' Wait for a key:
  Repeat: key = Inkey
  Until key <> ""
  ' Check key:
  Select Case key
  Case K_ESC:    Stop
  Case K_INSERT: ins_mode = Not ins_mode
  Case K_ENTER, K_TAB: ix++: If ix > MAX_IX Then ix = MIN_IX
  Case K_DOWN:   If ix < MAX_IX Then ix++
  Case K_UP:     If ix > MIN_IX Then ix--
  Case K_PGDN:   ix = MAX_IX
  Case K_PGUP:   ix = MIN_IX
  Case K_HOME:   pos = 1
  Case K_END:    pos = eol
  Case K_LEFT:   If pos > 1   Then pos--
  Case K_RIGHT:  If pos < eol Then pos++
  Case K_DELETE: If pos < eol Then f_var(ix) = delete_char(f_var(ix), pos)
  Case K_BKSP:   If pos > 1   Then pos--: f_var(ix) = delete_char(f_var(ix), pos)
  Case Else
    If Len(key) = 1 And Asc(key) >= 32 Then            ' Regular character?
      ins = ins_mode And (Len(f_var(ix)) < f_len(ix))  ' Insert mode
      rep = (Not ins_mode) And (pos <= f_len(ix))      ' Replace mode
      If ins Or rep Then
        f_var(ix) = edit_char(f_var(ix), pos, key, ins_mode)
        pos++  ' Move cursor to next character
      Fi
    Fi
  End Select
Wend

</pre>

I have been a bit stuck with INKEY for some time. I started building a little TextBox editor over a year ago and got stuck on something with INKEY and moved on. As I recall INKEY was not returning unique key numbers but I forget which... posted sometime ago on this issue.
Anyway, this demo is exactly the kind of thing I had in mind! Thank you shian!!!
I wonder if text selecting is also possible, eg [ctrl+]shft+ home | end ?
BTW is CAT working for anyone? I was testing it last night and couldn't get anything going (Windows 10-64 and SB 0.12.2).
<pre>

REM Language:  SmallBASIC 0.12.6 (Linux 32-bit)
REM Purpose:   Special key values returned by INKEY.
REM            (Values returned by INKEY cannot be used for DEFINEKEY).
REM File name: key.bas
REM Unit name: key
REM Version:   1.0.0  24/05/2016
REM Author:    shian

' --- Start demo code ------------------------------------
'
'Import key
'
'? "Press Escape to stop..."
'Repeat: k = Inkey
'  Select Case k
'  Case Key.ENTER    : ? "Key.ENTER"
'  Case Key.TABK     : ? "Key.TABK"
'  Case Key.CLICK    : ? "Key.CLICK"
'  Case Key.FN(1)    : ? "Key.FN(1)"
'  Case Key.FN(12)   : ? "Key.FN(12)"
'  Case Key.CTRL("A"): ? "Key.CTRL(a)"
'  Case Key.ALT("A") : ? "Key.ALT(a)"
'  Case Key.CTRL(Key.Enter) : ? "Key.CTRL(Key.Enter)"
'  Case Key.ALT(Key.Enter)  : ? "Key.ALT(Key.Enter)"
'  Case Key.SHIFT(Key.Enter): ? "Key.SHIFT(Key.Enter)"
'  End Select
'Until k = Key.ESC
'
' --- End demo code ------------------------------------

Unit key

' Useful Constants:
Export BKSP, TABK, ENTER, ESC, BLANK, DEL
Export PGUP, PGDN, LEFTK, RIGHTK, UP, DOWN 
Export INS, HOMEK, ENDK, CLICK
' Useful Functions:
Export FN, CTRL, ALT, SHIFT
Export CTRL_ALT, ALT_SHIFT, CTRL_SHIFT  ' (used by system)
' The left character of INKEY (Useful only for special cases):
Export CTRL_CHR, ALT_CHR, SHIFT_CHR
Export CTRL_ALT_CHR, ALT_SHIFT_CHR, CTRL_SHIFT_CHR

Const CTRL_CHR       = Chr(0x01)    ' for Ctrl+Char
Const ALT_CHR        = Chr(0x02)    ' for Alt+Char
Const SHIFT_CHR      = Chr(0x03)    ' for Shift+Char
Const CTRL_ALT_CHR   = Chr(0x04)    ' for Ctrl+Alt+Char   (used by system)
Const ALT_SHIFT_CHR  = Chr(0x05)    ' for Alt+Shift+Char  (used by system)
Const CTRL_SHIFT_CHR = Chr(0x06)    ' for Ctrl+Shift+Char (used by system)
Const BKSP   = Chr(0x08)            ' BackSpace
Const TABK   = Chr(0x09)            ' Tab key
Const ENTER  = Chr(0x0D)
Const ESC    = Chr(0x1B)            ' Escape
Const BLANK  = Chr(0x20)            ' Space key
Const DEL    = Chr(0x7F)            ' Delete
Const PGUP   = ESC + Chr(0x01)      ' Page Up
Const PGDN   = ESC + Chr(0x02)      ' Page Down
Const LEFTK  = ESC + Chr(0x04)      ' Arrow Left key
Const RIGHTK = ESC + Chr(0x05)      ' Arrow Right key
Const UP     = ESC + Chr(0x09)      ' Arrow Up
Const DOWN   = ESC + Chr(0x0A)      ' Arrow Down
Const INS    = ESC + Chr(0x10)      ' Insert
Const HOMEK  = ESC + Chr(0x11)      ' Home key
Const ENDK   = ESC + Chr(0x12)      ' End key
Const CLICK  = ESC + Chr(0xC0)      ' Left Mouse Button Click
Def FN(n)    = ESC + Chr(0xF0 + n)  ' FN(1) is F1 (up to 12).
Def CTRL(c)  = CTRL_CHR  + Lcase(c) ' Ctrl+a, Ctrl+Enter, etc
Def ALT(c)   = ALT_CHR   + Lcase(c) ' Alt+a, Alt+Enter, etc
Def SHIFT(c) = SHIFT_CHR + c        ' Shift+Enter, Shift+Tab, etc

' These are system shortcuts - so it's advisable NOT to use them at all!
' (however, it's possible to detect them when not used by the system).
Def CTRL_ALT(c)   = CTRL_ALT_CHR   + Lcase(c)  ' Ctrl+Alt+a, etc
Def ALT_SHIFT(c)  = ALT_SHIFT_CHR  + Lcase(c)  ' Alt+Shift+a, etc
Def CTRL_SHIFT(c) = CTRL_SHIFT_CHR + Lcase(c)  ' Ctrl+Shift+a, etc

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

</pre>

When the first character in the two character code is 27, the second character is a code for the given special key. You would need to inspect the SB source to work out the equivalent SmallBASIC key constants, but I'll have a look at generating a constants.bas file that you can include in your programs.
As reported by Shian (thanks Shian!), there are a few problems with INKEY. I'll fix these in the next update. There is supposed to be a different first character code for SHIFT/ALT etc states.
Also, INKEY needs to read from the system event queue to get the next keystroke. It currently does a pause for key, but I think it should actually block in the call to read the queue, that way when you type a key there would be no delay. Either way this doesn't work well for shooter type games, but there is a better way. Have a look at:
https://github.com/smallbasic/SmallBASIC/blob/master/samples/distro-exam...
This uses the DEFINEKEY command to register keystroke handlers for game keys. When you hit the game key, the registered FUNC will get called more or less immediately, somewhere inside the game main loo<p>I think this should work well in the space shooter (which is awesome by the way).
Code for quick lookup of a key code:
http://smallbasic.sourceforge.net/?q=node/1583
