# SIN

> SIN (x)

Sine.

First off, Trig lessons started in COS comments of this Language reference, check that for some remarks about trig functions.
2nd, SIN and COS use radians for angle measure, just use the RAD function to convert an angle in degrees to radians. Radians are circle measures based on pi instead of degrees.
2*pi = one circle 360 degrees 
    pi = 180 degrees half a circle
 pi/2 = 90   degrees 1/4 circle
 pi/4 = 45   degrees 1/8 circle
 pi/6 = 60   degrees 1/6 circle
pi/12= 30   degree s 1/12 circle
3rd, Here is a demo of cool stuff you can do with SIN and COS:

~~~

'Drawing spiral around point.bas SmallBASIC 0.12.2 [B+=MGA] 2016-03-13
'using SIN and COS in a most common situation drawing at an angle from a point
cx=xmax\\2:cy=ymax\\2
for degree=0 to 360 step 10   'zero is due East
  line cx,cy step 10*(degree^.5)*cos(rad(degree)),10*(degree^.5)*sin(rad(degree)),rgb(0,0,degree\\360*128+127)
  at 0,0: ?spc(100)
  at 0,0
  if degree=0 then
    ? " 0 degrees don't worry, you haven't seen nothing yet! press any...
  else
    ? degree;" degrees press any..."
  end if
pause
next
? "Notice how the the drawing started due East for 0 degrees and"
? "as the angle increased the drawing went around clock-wise."
pause
cls
'now I am doing a LOGO like program and I want 0 degrees to be due North
'due North is -90 degrees for clock-wise rotation so subtract 90 from degrees  
for degree=0 to 360 step 10
  line cx,cy step 10*(degree^.5)*cos(rad(degree-90)),10*(degree^.5)*sin(rad(degree-90)),rgb(0,0,degree\\360*128+127)
  at 0,0: ?spc(100)
  at 0,0
  if degree=0 then
    ? " 0 degrees don't worry, you haven't seen nothing yet! press any..."
  else
    ? degree;" degrees press any..."
  end if
pause
next
? "Notice how the drawing started due North because of the -90 adjustment made in SIN and COS calls"
?:? "press any to end..."
pause

~~~

this is the crucial line:

~~~

line cx,cy step 10*(degree^.5)*cos(rad(degree)),10*(degree^.5)*sin(rad(degree)),rgb(0,0,degree\\360*128+127)

~~~

the multiple 10*(degree^.5) to both SIN and COS controls how far the extension of the line will be from point cx,cy "origin"
here as the degrees increase so did the extension out which cause the spiral effect
The COS calculation was used for x "the run" or horizontal component and the SIN calculation was used for y "the rise" or vertical component.
This is really, really important to use and play with even if you don't understand all the details, the code will serve you well.
Still I did my best to explain how this works, so it is a bit wordy... 

~~~

' sin and cos use.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-15
'                    SIN and COS work as a team
'SIN and COS are used most for drawing points in circle around a central point.
'Here we are going to divide a circle into n sections to draw an n sided polygon,
'for instance, divide a circle into 3 equal parts and you get equilateral triangle (all sides =)
'divide by 4 and get a square, by 5 a pentagon, 6 a hexagon.... all equal sides
'I have to spend some time explaining why this works and a triangle diagram is really needed
'but here goes, imagine a pie sitting on top of a given center point cx,cy
'it is cut into n equal slices each piece has a central angle of 360/n or in radians 2*pi/n
'a polygon just cuts the round parts off with straight lines to each end at outer edge.
'remember COS is the leg adjacent to the angle in question divide by hypotenuse
'or COS(inner angle) = adj/hyp 
'x is the adjacent side, the hypotenuse is the radius
'so COS(inner angle) = x/radius  
'or radius * COS(angle) = x  multiple each side by radius
'x = radius * COS(angle)
'but remember this is distance relative to center point not a screen coordinate
'to make absolute screen point it is: x = cx + radius*COS(angle)
'SIN works out similar 
'SIN(inner angle) = opposite/hyp  
'and again y is opposite side (of inner angle) and the hypotenuse is the radius of circle
'SIN(angle) = y/radius    multiply each side by radius
'radius*SIN(angle) = y 
'y = radius * SIN(angle)
'to make absolute screen point it is y = cy + radius*SIN(angle)
'So going around a central point x=cx+radius*COS(angle),y=cy+radius*SIN(angle)
'will locate points equal distance from center for equal sided polygon
cx=xmax/2 : cy=ymax/2 'here's our center move it anywhere on screen
'cx=100 : cy = 500 '<== try different center points
'radius=100 'draw points in a radius of 100 around cx,cy
radius=150 'fits center text better
while 1
  cls
  circle cx,cy,3,1,14 'this shows the central point in small yellow circle
  
  'what polygon shall we draw?
  ?"A regular polygon is a many sided figure with equal sides."
  ?"A triangle is a 3 sided polygon, a square 4, a pentagon 5..."
  input "(<=2 quits) Enter the number of sides for a polygon to draw ";n
  if n<3 then end  'need at least 3 sides
  
  'make the first point 0 degrees or directly East of center point (offset 0)
  'you can off set the first point by some degree amount to spin the polygon by the offset
  offset=0 
  'offset=pi/10  'pi/18 = 10 degrees, pi/36 = 5 degrees... play with this to spin polygon
  for centralAngle=0+offset to 2*pi+offset step 2*pi/n     
    '2*pi is a circle (360 degrees) divide by n get inner angles of pie slices that's our step
    
    'radius * cos(centralAngle) = our needed x coordinate to center point so add cx for absolute screen coordinate
    'radius * sin(centralAngle) = our needed y coordinate to center point so add cy for absolute screen coordinate 
    if centralAngle=0+offset then  'first point location
      xstart=cx+radius*cos(centralAngle)
      ystart=cy+radius*sin(centralAngle) 'get the ball rolling by recording first point
    else
      line xstart,ystart,cx+radius*cos(centralAngle),cy+radius*sin(centralAngle)
      xstart=cx+radius*cos(centralAngle)
      ystart=cy+radius*sin(centralAngle)                         
    end if 
    delay 300 'to show the progress of draw   
  next
  s="press any..."
  at cx-txtw(s)/2,cy-txth(s)/2:?s  'this puts cue right where you will see it
  pause
wend
'you are just a few simple steps away from spinning these polygons!

~~~

Perfect.
1. All elementary information in a single place. 
2. Documented very well (even I understand, at least how to use it).
3. Simple, short, and practical demo code.
As far as I concerned: they may shut down Wikipedia right now. 
Thanks!
By the way... 
Is it possible to <strong>accurately</strong> calculate the <strong>Length</strong> of an Arc (segment of an ellipse)?
Can I get the length of an Arc in let's say millimetres? As if it was a regular line?

(arc length discussion picked up on forum)
Here is graph of the three main Trig ratios:

~~~

' sin-cos-tan.bas from FLTK samples
cls
at 0,ymax/2+txth("Q")
color 1: ? "sin(x)":
color 8: ? "cos(x)":
color 12: ? "tan(x)"
line 0,ymax/2,xmax,ymax/2  'central or x axis, ymax/4 is multiplier scaled to 1/4 of ymax
for i=0 to xmax
pset i,ymax/2-sin(i*2*pi/ymax)*ymax/4  color 1
pset i,ymax/2-cos(i*2*pi/ymax)*ymax/4 color 8
pset i,ymax/2-tan(i*2*pi/ymax)*ymax/4 color 12
next
pause

~~~

