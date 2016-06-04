---
layout: post
title:  "INTERSECT"
categories: math
---
Math

INTERSECT Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, BYREF type, BYREF Rx, BYREF Ry

Calculates the intersection of the two line segments A-B and C-D. Returns: Rx,Ry = cross.


type = cross-type
* 0 No cross (R = external cross)
* 1 One cross
* 2 Parallel
* 3 Parallel (many crosses)
* 4 The cross is one of the line segments edges.

