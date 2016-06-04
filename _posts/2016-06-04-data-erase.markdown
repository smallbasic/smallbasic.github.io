---
layout: post
title:  "ERASE"
categories: data
---
Data

ERASE var[, var[, ... var]]

Deallocates the memory used by the specified arrays or variables. After that these variables turned to simple integers with zero value.


DIM x(100)
...
PRINT FRE(0)
ERASE x
PRINT FRE(0)
PRINT x(1):REM ERROR

