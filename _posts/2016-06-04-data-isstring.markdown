---
layout: post
title:  "ISSTRING"
categories: data
---
Data

ISSTRING (x)

Returns true if x is a string (and cannot be converted to a number).


? ISSTRING(12)      :REM false
? ISSTRING("12")    :REM false
? ISSTRING("12E+2") :REM false
? ISSTRING("abc")   :REM true
? ISSTRING("1+2")   :REM true

