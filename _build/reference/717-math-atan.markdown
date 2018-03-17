# ATAN

> ATAN (x)

Inverse tangent.

Trig lesson two in TAN offers a lead in to this little demo:

~~~

' pin the tail.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-13
' look how simple ATAN returns an angle from a ratio y/x 
 
tw=txtw(string(22,"W")):xlimit=xmax-tw
th=txth("Q"):ylim=ymax-2*th
maxdistance=(xmax^2+ylim^2)^.5
winner=0 : windistance=maxdistance
for i=1400 to 0 step -100 ' draw target
  if i mod 200=0 then cc=12 else cc=15 'alt red/white
  circle 0,0,i,1,cc filled
next
color 14,4
for player=1 to 12
  xtail=rnd*xlimit 'keeps the player tail in one line on the screen, hopefully
  ytail=rnd*ylim   'keeps the player on the screen and screen from scrolling, hopefully
  angle=deg(atan(ytail/xtail))\\1 '<====== notice no angle involved with atan we feed it a ratio
                                                  ' DEG converts the angle to degrees from radians
  distance=((xtail^2+ytail^2)^.5)\\1
  tail="^<"+str(player)+" deg:"+str(angle)+" dist:"+str(distance)
  at xtail,ytail:? tail
  if distance < windistance then windistance=distance:winner=player
  pause
next
color 15,0 'cause a screen scroll on purpose
at 0,ymax-th: ? "The winner is "+str(winner)+" at "+str(windistance)+" press any..."
pause

~~~


