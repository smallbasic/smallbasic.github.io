---
permalink: /615
layout: post
title:  "DRAW"
categories: graphics
---
Graphics

DRAW "commands"

Draw lines as specified by the given directional commands. 


<p>*Graphics Definition Language*
In the movement instructions below, n specifies a distance to move. The number of pixels moved is equal to n multiplied by the current scaling factor, which is set by the S command.
|Un| Move up.|
|Dn| Move down.|
|Ln| Move left.|
|Rn| Move right.|
|En| Move diagonally up and right.|
|Fn| Move diagonally down and right.|
|Gn| Move diagonally down and left.|
|Hn| Move diagonally up and left.|
|Mxy| Move to coordinate x,y. If x is preceded by a + or -, the movement is relative to the last point referenced.|
|B| A prefix command. Next movement command moves but doesn't plot.|
|N| A prefix command. Next movement command moves, but returns immediately to previous point.|
COLOR 9:PSET 80,80
DRAW "R50D70L25U25L15D25NR15"
DRAW "L10U50E25F25"
PSET 118,105
DRAW "R8U16L16D16R8U10NR8U6"
COLOR 12:PSET 100,117
INPUT "Who are you"; A$
? "Hello, ";A$;"!" 

How does S command work? I just tried it in the DRAW example in first DRAW string and I get error: "DRAW: Command 'S' unsupported."
This is how S command work in QBASIC (quote):
<pre>

Sn  Determines the drawing scale by setting the length
     of a unit of cursor movement. The default n is 4,
     which is equivalent to 1 pixel.

</pre>

So this should work just fine:
<pre>

DRAW "S8L10U50E25F25"

</pre>

But apparently S command is unsupported.
