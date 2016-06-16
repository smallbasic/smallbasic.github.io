---
permalink: /548
layout: post
title:  "SEARCH"
categories: data
---
Data

SEARCH A, key, BYREF ridx [USE cmpfunc]

Scans an array for the key. If key is not found the SEARCH command returns (in ridx) the value. (LBOUND(A)-1). In default-base arrays that means -1. The cmpfunc (if its specified) it takes 2 vars to compare. It must return 0 if x = y; non-zero if x <> y.


<pre>FUNC cmp(x,y)
  cmp=!(x=y)
END
...
DIM A(5)
FOR i=0 TO 5
    A(i)=5-i
NEXT
SEARCH A, 4, r USE cmp(x,y)
PRINT r:REM prints 1
PRINT A(r): REM prints 4

