### Math

> ATAN2 (x, y)

Inverse tangent (x,y).

<pre>

'Both atan(n) and atan2(y, x) return an angle measured in radians.
'The return measure is from -pi to pi. In demo below it is converted
'to angle between 0 and 360 degrees.
'atan2 is better for detecting angle's quardrant because 
'x and y are given separartely.
'y the vertical change is given first.
centerX = xmax / 2 : centerY = ymax / 2
pen on
while asc(inkey) <> 27
  cls
  locate 0,20: ? "ATAN2 demo, used to detect angle of mouse to screen center."
  line centerX, centerY, centerX + 200, centerY
  at centerX + 210, centerY - 10 : ? "0 degrees (or radians)"
  mouseX = pen(4) 
  mouseY = pen(5)
  line centerX, centerY, mouseX, mouseY, 15 'draw line from center to mouse
  differenceX = mouseX - centerX
  differenceY = mouseY - centerY 
  a = atan2(differenceY, differenceX) '< notice y difference is listed first
  
  'VVVVVVVVVVVVVVVVVVVVVVVV  atan2 returns neg number for angles > 180
  if a < 0 then a += 2 * pi  
  '^^^^^^^^^^^^^^^^^^^^^^^^  if want a = 0 to 2*pi, instead of -pi to pi
  
  arc centerX, centerY, 100, 0, a 'draw the arc from 0 to angle
  s = "Angle of mouse to center of screen ~ "+deg(a)\\1+" degrees"
  locate 30, 20 : ? s
  showpage
  delay 10
wend

</pre>

