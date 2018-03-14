# Graphics

> PSET [STEP] x,y [, color| COLOR color]

Draw a pixel.

<pre>

cx=xmax/2  'center x, xmax is built in constant that returns the screen width
cy=ymax/2  'center y, ymax is built in constant that returns the screen height
MyColor=RGB(255,128,0)  'orange?
PSET cx,cy,MyColor   'draws an orange pixel at center of screen

</pre>

(see also STEP that works off the last x,y graphic call)
for instance now that one graphic call is made, we can draw a point 50 pixels directly to the right using STEP
PSET STEP 50,0,MyColor
Without a color specified in 3rd argument PSET will use foreground from last COLOR foreground, background statement.
IF that had never been used it will default to screen printing colors 7,0 (QB scale)
for Colors see RGB, RGBF, and ... hmmm do we have a QB color sampler?
Here is QB color chart:
<pre>

'QB color chart of 16 colors for 0 = black to 15 = bright white
dy=ymax/16
for i=0 to 15
  rect 0,i*dy,xmax,i*dy+dy,i filled
  at 0,i*dy:? i;
next
pause

</pre>

Here is PSET with QB red at center screen:
PSET xmax/2,ymax/2,12 
12 is QB red, 9 is blue, 14 is yellow, 7 dull white, 0 black, 8 is darker gray than 7 usually the colors get brighter
