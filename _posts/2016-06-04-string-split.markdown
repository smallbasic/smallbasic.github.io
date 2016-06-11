---
permalink: /769
layout: post
title:  "SPLIT"
categories: string
---
String

SPLIT string, delimiters, words() [, pairs] [USE expr]

Returns the words of the specified string into array 'words'.


s="/etc/temp/filename.ext"
SPLIT s, "/.", v()
FOR i=0 TO UBOUND(v)
  PRINT i;" [";v(i);"]"
NEXT
displays:
0 []
1 [etc]
2 [temp]
3 [filename]
4 [ext]

