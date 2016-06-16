---
permalink: /589
layout: post
title:  "DIRWALK"
categories: file
---
File

DIRWALK directory [, wildcards] [USE ...]

Walk through the specified directories. The user-defined function must returns zero to stop the process.


<pre>FUNC PRNF(x)
  ? x
  PRNF=TRUE
END
...
DIRWALK "." USE PRNF(x)

