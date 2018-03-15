# FILES

> FILES (wildcards)

Returns an array with the filenames. If there are no files returns an empty array.

The directory listing, if assigned to a string, will create a string array. Each filename is assigned to its own element in the string array.
sample program example:
20 a$=FILES("*.*")
30 n=LEN(a$)
40 FOR i = 0 to n-1
50 PRINT a$(i)
60 NEXT i

