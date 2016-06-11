---
permalink: /586
layout: post
title:  "CHMOD"
categories: file
---
File

CHMOD file, mode

Change permissions of a file. See also ACCESS.


* file - A string expression that follows OS file naming conventions.
* mode - Compatible with system call chmod()'s 'mode' parameter.
' Make myfile available to anyone (read/write)
CHMOD "myfile.bas", 0o666
...
' Make myfile available to anyone (execute/read/write)
CHMOD "myfile.bas", 0o777

