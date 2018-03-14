# Graphics

> PLOT xmin, xmax USE f(x)

Graph of f(x).


PLOT 0, 2*PI USE SIN(x)

Apparently we are now plotting with black dots as default on default black background, so need a COLOR call to see the dots.
<pre>

'plot test.bas from SmallBASIC ie PLOT minx, maxx, use f(x)
color 0,15:cls  '<=========== plot use to work without need for this
PLOT 0, 2*PI USE SIN(x)
PLOT 0, 2*PI USE rnd*sin(x) '<==== this is cool!
pause

</pre>

