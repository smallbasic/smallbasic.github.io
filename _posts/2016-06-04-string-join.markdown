---
permalink: /545
layout: post
title:  "JOIN"
categories: string
---
String

JOIN words(), delimiters, string

Returns the words of the specified string into array 'words'.


s="/etc/temp/filename.ext"
SPLIT s, "/.", v()
JOIN v(), "/", s
PRINT "[";s;"]"
displays:
[/etc/temp/filename/ext]

