---
permalink: /1015
layout: post
title:  "DEFINEKEY"
categories: console
---
Console

DEFINEKEY k,sub

Binds a keystroke to a user defined function


sub moveLeft
   if (block.x > 0) then
     moveBlock -1, 0
   fi
end
defineKey 0xFF04, moveLeft
Refer to keymap.h in the SVN repository for key definitions. TODO: create a keys.bas unit for key constants
<pre>

' DEFINEKEY demo.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-30
'remember Etch-A-Sketch?
'definekey key,sub
'example: 
definekey 0xFF04, moveleft   'press left arrow
definekey 0xFF05, moveright  'press right arrow
definekey 0xFF09, moveup     'press up arror
definekey 0xFF0A, movedown   'press down arrow
definekey 99, togglecolor    'press c for color toggle black (erase), blue, red, white
definekey 115, togglestepper 'press s for stepper 1,5,10,50
definekey 27, quit           'press esc to quit
colr=15
stepper=1
tx=xmax/2
ty=ymax/2
pset tx,ty,0
while 1
  color 0,0
  locate 0,0:? spc(100)
  color colr,0
  locate 0,0
  if colr=0 then color colr,15
  ?"tx= ";tx;" ty= ";ty;" c= ";colr;" s=";stepper;
  if colr=0 then color colr,0
  lc=(lc+1) mod 2
  if lc then pset step 0,0,14 else pset step 0,0,0
  delay 60
wend
sub moveleft
  pset step 0,0
  if tx-stepper>=0 then tx-=stepper:line step -stepper,0 else beep
end
sub moveright
  pset step 0,0
  if tx+stepper<=xmax then tx+=stepper:line step stepper,0 else beep
end
sub moveup
  pset step 0,0
  if ty-stepper>=0 then ty-=stepper:line step 0,-stepper else beep
end
sub movedown
  pset step 0,0
  if ty+stepper<=ymax then ty+=stepper:line step 0,stepper else beep
end
sub togglecolor
  select case colr
  case 0 : colr=9
  case 9 : colr=12
  case 12: colr=15
  case 15: colr=0
  end select
end
sub togglestepper
  select case stepper
  case 1 : stepper=5
  case 5 : stepper=10
  case 10: stepper=50
  case 50: stepper=1
  end select
end
sub quit
  stop
end

</pre>

<pre>

' Note:
' * You may Include "definekey_const.bas" file in another file to make your code more clear.
'
' * Created using SmallBASIC version 0.12.2 (on Linux Mint 17.3).
' * More keys might be included in future/other versions of SmallBASIC.
' * Values for DEFINEKEY cannot be used for INKEY.
' * I could not verify all keys (especially CTRL & ALT seems not to work).
' * Key codes are from "keymap.h": https://sourceforge.net/p/smallbasic/code/HEAD/tree/trunk/smallbasic/src/keymap.h
'
' Demo - add these lines to another BAS file:
' ------------------------------------------
'  Include "definekey_const.bas"
'
'  Definekey DK_LEFT, left_arrow
'
'  Sub left_arrow: i++: ? i; " ";
'  End Sub
'
'  ? "Press Left-Arrow key, or Ctrl+B to stop...": Pause
'  While 1: Wend
' ------------------------------------------
' definekey_const.bas - DEFINEKEY key codes (keymap.h; 30/4/2010)
' Note: bind a regular character with 'DEFINEKEY Asc("a"), sub'
Const IS_PALM_OS = (Left(OSNAME, 1) = "P") ' Else is_UNIX / is_Windows
' PalmOS - H/W keys:
Const DK_PALM_PGUP  = 0xFF01
Const DK_PALM_PGDN  = 0xFF02
Const DK_PALM_BTN1  = 0xFF03
Const DK_PALM_BTN2  = 0xFF04
Const DK_PALM_BTN3  = 0xFF05
Const DK_PALM_BTN4  = 0xFF06
Const DK_PALM_FIND  = 0xFF07
Const DK_PALM_CALC  = 0xFF08
Const DK_BREAK      = Iff(IS_PALM_OS, DK_PALM_BTN4, 0x3) ' MemoPad, Ctrl+C
Const DK_DELETE     = 127 ' (in keymap.h: DELETE = 8,  BACKSPACE = 127)
Const DK_BACKSPACE  = 8
Const DK_TAB        = 9
Const DK_ENTER      = 13  ' 13 is CR (in keymap.h: ENTER = '\\n')
' Common with Handhelds (0xFF00 to 0xFF0F):
Const DK_PGUP       = 0xFF01
Const DK_PRIOR      = DK_PGUP
Const DK_PGDN       = 0xFF02
Const DK_NEXT       = DK_PGDN
Const DK_LEFT       = 0xFF04
Const DK_RIGHT      = 0xFF05
Const DK_UP         = 0xFF09
Const DK_DN         = 0xFF0A
Const DK_DOWN       = DK_DN
' Common on PCs (0xFF10 to 0xFF1F):
Const DK_INSERT     = 0xFF10
Const DK_HOME       = 0xFF11
Const DK_END        = 0xFF12
' Other application keys:
Const DK_MENU       = 0xFF1F
' Function keys (16 codes), e.g. Definekey DK_FUNC(1):
Def DK_FUNC(x)      = 0xFFF0 + x   ' -- Verified with 1-12 (F1-F12)
Def DK_SFUNC(x)     = 0xFFE0 + x   ' ( ...is it for F13-F16 ? )
' Control keys, e.g. Definekey DK_CTRL(ASC("R")):
Def DK_CTRL(x)      = x - 64   ' x must be a capital character
' Alt keys, e.g. Definekey DK_ALT(ASC("r")):
Def DK_ALT(x)       = 0xFF20 + (x - Iff(x >= 97, 57, 31))
' Keypad:
Const DK_KP_DIV     = 0xFFDA
Const DK_KP_MUL     = 0xFFDB
Const DK_KP_MINUS   = 0xFFDC
Const DK_KP_PLUS    = 0xFFDD
Const DK_KP_ENTER   = 0xFFDE
Const DK_KP_HOME    = 0xFFD7
Const DK_KP_UP      = 0xFFD8
Const DK_KP_PGUP    = 0xFFD9
Const DK_KP_LEFT    = 0xFFD4
Const DK_KP_CENTER  = 0xFFD5
Const DK_KP_RIGHT   = 0xFFD6
Const DK_KP_END     = 0xFFD1
Const DK_KP_DOWN    = 0xFFD2
Const DK_KP_PGDN    = 0xFFD3
Const DK_KP_INS     = 0xFFD0
Const DK_KP_DEL     = 0xFFDF
' Mouse:
Const DK_MK_PUSH    = 0xFFC0
Const DK_MK_DRAG    = 0xFFC1
Const DK_MK_MOVE    = 0xFFC2
Const DK_MK_RELEASE = 0xFFC3
Const DK_MK_WHEEL   = 0xFFC4
Const DK_MK_FIRST   = DK_MK_PUSH
Const DK_MK_LAST    = DK_MK_WHEEL

</pre>

