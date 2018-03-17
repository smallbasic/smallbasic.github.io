# WINDOW

> WINDOW [x1,y1,x2,y2]

The WINDOW command allows you to redefine the corners of the display screen as a pair of "world" coordinates. WINDOW is also overloaded as a function, returning a system object providing access to the following sub-commands: graphicsScreen1, graphicsScreen2, textScreen, alert, ask, menu, message, showKeypad, insetTextScreen


The world space defined by WINDOW is disabled by a WINDOW command with no parameters.

This is a demo from http://smallbasic.sourceforge.net/?q=comment/1502#comment-1502
It shows how to use the additional WINDOW sub-commands (It is not the traditional use of WINDOW [x1,y1,x2,y2] ).
Tested with SmallBASIC version 0.12.6 (Linux).

~~~

' create the window object, this provides access to a number of sub-commands
w = window()
' select graphics mode screen 1 for output
w.graphicsScreen1()
for i = 0 to 10
  print "this is printed on screen 1"
next i
w.message("[1] click to continue. ")
pause
' select graphics mode screen 1 for output
w.graphicsScreen2()
color 1,3
cls
print "this is printed on screen 2"
w.message("[2] click to continue. ")
pause
w.graphicsScreen1()
print "back to screen 1"
w.message("[3] click to continue. ")
pause
' select the text mode for output
' text mode can display more text but is slow 
' also this is currently broken and will cause a crash 
'w.textScreen()
w.alert("This is an alert", "title")
w.ask("Yes or no?", "Question")
print "your answer was "; w.answer
w.message("[4] click to continue. ")
pause
w.menu("option1", "option2", "option3")
' weirdly the result is sent to the keyboard handler
' it should at least go to w.answer. also there is no option for placement
select case asc(inkey)
case 0
  print "one"
case 1
  print "two"
case 2
  print "three"
case else
  print "unk"
end select
w.message("[5] click to continue. ")
pause
' this raises the virtual keypad on android
w.showKeypad()
' set the font size 
' arg1 = size 
' arg2 = unit amount for size, "px" or "em"
'   px=  pixels
'   em= emphasis - this is a multiplication factor for the current size
' arg3= bold 1=on 0=off
' arg4= italic 1=on, 0=off
' this sets the font to be double in size with bold and italic
' using pixels is likely to give an unexpected result in android
w.setFont(2, "em", 1,1)
cls
? "How does this look?"
w.insetTextScreen(5,10,90,90)
for i = 0 to 200
  ? "This is in the text screen"
next i
' comment out the above cls to see the bug
w.message("spot the bug  ?")
w.setFont(11, "px", 0,0)
? "press a key to end..."
pause

~~~


