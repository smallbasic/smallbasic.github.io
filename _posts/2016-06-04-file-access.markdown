---
layout: post
title:  "ACCESS"
categories: file
---
File

ACCESS (file)

Returns the access rights of the file.


* file - A string expression that follows OS file naming conventions.
Returns file permissions as per chmod() and stat() system calls.
The bits (in octal):
|04000| set user ID on execution|
|02000| set group ID on execution|
|01000| sticky bit|
|00400| read by owner|
|00200| write by owner|
|00100| execute/search by owner|
|00040| read by group|
|00020| write by group|
|00010| execute/search by group|
|00004| read by others|
|00002| write by others|
|00001| execute/search by others|
IF ACCESS("/bin/sh") AND 0o4 THEN
 PRINT "I can read it!"
ENDIF

