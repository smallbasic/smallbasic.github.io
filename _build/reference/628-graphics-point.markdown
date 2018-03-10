### Graphics

> POINT (x [, y])

Returns the color of the pixel at x,y.


<p>If the y argument is not specified, x specifies the following info-code:
0 = returns the current X graphics position
1 = returns the current Y graphics position

This demonstrates saving a screen section and redrawing it at different places on screen, a tiling and a moving across the screen.
<pre>

' POINT demo.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-07
for objects = 1 to 300
  if rnd>.5 then
    circle rnd*xmax\\1, rnd*ymax\\1, rnd*50\\1, rnd*5, rnd*16/1 
  else
    rect rnd*xmax\\1, rnd*ymax\\1 step rnd*50\\1, rnd*50\\1, rnd*16/1
  end if  
next
at 0,ymax-2*txth("Q"):?" press any..."
showpage
pause
xw=350:yh=250
bottle 0,0,xw,yh
cls
for y=0 to ymax step yh
  for x=0 to xmax step xw
    pour x,y,xw,yh
    showpage
  next
next
at 0,ymax-2*txth("Q"):?" press any..."
showpage
pause
cls
for x=0 to xmax step 25
  cls
  pour x,ymax\\2-yh\\2,xw,yh
  showpage
  delay 10
next
at 0,ymax-2*txth("Q"):?"done, press any... "
showpage
pause 
sub bottle(xleft,ytop,xwidth,yheight)
  local x,y
  dim screensection(xwidth,yheight)
  for y=ytop to (ytop+yheight-1)
    for x=xleft to (xleft+xwidth-1)
      screensection(x,y)=POINT(x,y)
    next
  next
end
sub pour(xoff,yoff,xwidth,yheight)
  local x,y
  for y=0 to yheight
    for x=0 to xwidth
      colr=screensection(x,y)
      pset x+xoff,y+yoff,colr
    next
  next
end 

</pre>

<pre>

' Note: POINT(x, y) returns the color of the pixel at x,y. But it's
'       also possible to use POINT(0) and POINT(1) to return the current
'       X,Y graphics position...:

' Draw a little circle at the current graphics x,y position:
Sub show_point
  Local x = Point(0) ' This is where the last graphics command left us...
  Local y = Point(1)
  Local c
  c = Point(x, y)    ' Now we know also the color of that point...
  Circle x, y, 3 Color c FILLED ' (CIRCLE does not change current X,Y)
End Sub

' Draw a box and show the corners with a circle:
Line 50, 50, 360, 50 Color 15:     show_point
Line STEP 0, +40 Color 14:         show_point
Line STEP -(360 - 50), 0 Color 15: show_point
Line STEP 0, -40 Color 14:         show_point
Showpage

' Print text inside the box and change its colors:
x = Point(0) + 45
y = Point(1) + 8
text = "That's the POINT !"
x_dot = x + Txtw(text) - 6
y_dot = y + Txth(text) - 5
For b = 7 To 1 Step -1   ' b = Background color
  c = b Xor (16 - b)     ' c = Reversed Foreground color
  Color c, b: At x, y: Print "That's the POINT !"
  Circle x_dot, y_dot, 3 Color c FILLED ' Print a point under '!'
  Paint x - 2, y - 2, b  ' Paint the rest of the box
  Pause 1
  Showpage
Next
Pause

</pre>

