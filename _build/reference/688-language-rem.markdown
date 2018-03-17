# REM

> REM comment

Code comments. Comments can also be introduced using # and single quote character. 


The # character can only be used as remarks if it is the first character of the line.
' That text-line is just a few remarks
...
REM another comment
...
# one more comment


~~~

' Few ways to comment your code in SmallBASIC:
' This is the most easy way to add a comment:
x = 1 + 1
x = 1 + 1 ' Or like this...
Rem And this is the most traditional way to add remark:
x = 1 + 1
x = 1 + 1: Rem Or like this...
# And finally, this, is also a comment:
x = 1 + 1
x = 1 + 1: # Or like this...

' Now, Who and Why needs a comment? 
' To answer this question allow me to analyze MGA's "Curlie borealis.bas" 
' program; "Curlie borealis" has only one comment on top, which includes the 
' standard info: Name of Program, Programming Language, Author and Date.
' Now, can you tell what "Curlie borealis" does? And how it does it? well,
' without additional comments it's not going to be easy. Look at the code:

' --- Start of "Curlie borealis.bas":
'Curlie borealis.bas for SmallBASIC 0.12.2 [B+=MGA] 2016-04-23
randomize
ff = 440.03:maxi=25000:maxi2=maxi\\2:b=rgb(40,20,30)
color 0,b:cls
while 1
  ff += 9.444
  for i=0 to maxi
    f += ff
    x = min(xmax, -x + cos(f*i))
    y = min(ymax, -y + sin(f*i))
    if cc%6=0 then
      if i< maxi2 then c=rgb(255-255*i\\maxi2,255*i\\maxi2,0) else c=rgb(0,255-255*(i-maxi2)\\maxi2,255*(i-maxi2)\\maxi2)
    else
      c=b
    fi
    pset x, y, c
    if (i%5000==0) then showpage
  next
  cc++
wend
' --- End of "Curlie borealis.bas"

' Now, although the code is very short (less then thousands of lines...), it's 
' almost impossible to decode it... - That's why comments are so useful:
' to remind *yourself* and others what you did and why.
' Let's try to analyze "Curlie borealis.bas" code and add few comments to it:

' --- Start of "Curlie borealis.bas" + Comments:
' Initialize variables for the main loop:
Randomize           ' - I'm not sure why do we need it here... (MGA?)
ff = 440.03         ' Factor for defining x,y location to draw point
maxi = 25000        ' Maximum points to draw in each shape
maxi2 = maxi \\ 2    ' Factor for defining two different color schemes in shape
b = Rgb(40, 20, 30) ' Background color
Color 0, b
Cls
' Run program in an endless loop (Press Ctrl+B or Ctrl+C to stop):
While 1
  ff += 9.444 ' Move the next shape to different x,y location
  
  ' Draw a single shape using two color schemes, or draw an invisible shape:
  For i = 0 To maxi
    ' Define location (x,y) to draw a single point:
    f += ff
    x = Min(xmax, -x + Cos(f * i)) ' (MIN makes sure location is within screen)
    y = Min(ymax, -y + Sin(f * i))
    
    ' Define nice color to draw a point:
    If cc Mod 6 = 0 Then
      If i < maxi2 Then ' One color scheme 
        c = Rgb(255 - 255 * i \\ maxi2, 255 * i \\ maxi2, 0) 
      Else              ' Second color scheme
        c = Rgb(0, 255 - 255 * (i - maxi2) \\ maxi2, 255 * (i - maxi2) \\ maxi2)
      Fi
    Else
      c = b ' Use background color to draw invisible shape
    Fi
    
    ' Draw a single point (pixel):
    Pset x, y, c
    If i Mod 5000 = 0 Then Showpage ' Update screen each 5000 points (smoother)
  Next
  cc++ ' Counter for drawing invisible shape (using background color)
Wend
' --- End of "Curlie borealis.bas" + Comments

' To sum up: 
' Whether you write a short program or long, comments will help you
' and others to understand, debug and improve your program later on; i.e. 
' comments make your code useful!
REM "Curlie borealis.bas" code example taken from: 
REM http://smallbasic.sourceforge.net/?q=comment/1184#comment-1184
REM Without explicit permission from MGA...

~~~


