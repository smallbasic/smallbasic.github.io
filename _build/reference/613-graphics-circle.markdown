# Graphics

> CIRCLE [STEP] x,y,r [,aspect [, color]] [COLOR color] [FILLED]

Draws a circle (or an ellipse if the aspect is specified).

<pre>

' Aspect ratio is relation between width-height of a circle,
' for example:
' aspect = 1   = Perfect circle;
' aspect = 1.5 = Stretch circle vertically (ellipse);
' aspect = 0.5 = Stretch circle horizontally (ellipse);
' let's draw perfect circles for the flower:
Const ASPECT_RATIO = 1
' define parameters for main circle:
Const CENTER = [150, 150] ' [x, y] define the center point to draw a circle
Const RADIUS = 50         ' radius in pixels (pixel is a single point)
Const TEXT = "Smile!"     ' text to print in the middle of main circle
' define parameters for leafs:
Const LEAF_RADIUS = 30    ' using smaller circles for leafs
' center point for straight leafs (distance from main circle's center):
Const LEAF_CENTER_STRAIGHT   = RADIUS + LEAF_RADIUS
' rotate center point for transverse leafs (distance as above):
Const LEAF_CENTER_TRANSVERSE = LEAF_CENTER_STRAIGHT * Sin(Rad(45))
' Start the program:
Print " Press any key to draw leaf by leaf...";
Pause
Cls
' draw one invisible point to set the 'current position':
Pset CENTER Color 0
' let's use shorter variable names (easier to read):
a = ASPECT_RATIO
r = LEAF_RADIUS
' draw the straight leafs (relative to the 'current position'):
c = LEAF_CENTER_STRAIGHT
Circle Step 0, -c, r, a Color 15 FILLED: Pause ' top
Circle Step 0, +c, r, a Color 14 FILLED: Pause ' down
Circle Step -c, 0, r, a Color 13 FILLED: Pause ' left
Circle Step +c, 0, r, a Color 12 FILLED: Pause ' right
' draw the transverse leafs (relative to the 'current position'):
c = LEAF_CENTER_TRANSVERSE
Circle Step -c, -c, r, a Color 11 FILLED: Pause ' top-left
Circle Step +c, +c, r, a Color  8 FILLED: Pause ' down-right
Circle Step +c, -c, r, a Color 10 FILLED: Pause ' top-right
Circle Step -c, +c, r, a Color  9 FILLED: Pause ' down-left
' draw the main circle:
Circle CENTER, RADIUS, ASPECT_RATIO Color 14
' print text in the middle of main circle:
At CENTER(0) - (Txtw(TEXT) \\ 2), CENTER(1) - (Txth(TEXT) \\ 2)
Color 15: Print TEXT;
Pause

</pre>

<pre>

'Another aspect or circle.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-16
'with aspect it is not the same old circle
cx=xmax/2:cy=ymax/2:rface=250:reye=50:xle=cx-100:xre=cx+100:dir=1
while 1
  cls
  circle cx,cy,rface,1,14 filled
  circle xle,cy,reye,1-a,9 filled
  circle xre,cy,reye,1-a,9 filled
  circle cx,cy+130-a*50,100+a*50,.21+2*a,12 filled
  circle cx,cy+100-a*50,100+a*50,.21+a,14 filled
  at 0,0 :?a
  showpage
  delay 1
  a+=.002*dir
  if a=.26 then dir=dir*-1
  if a=-.1 then dir=dir*-1
wend

</pre>

