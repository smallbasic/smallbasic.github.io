---
permalink: /628
layout: post
title:  "POINT"
categories: graphics
---
Graphics

POINT (x [, y])

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

