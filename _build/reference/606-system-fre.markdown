# FRE

> FRE (x)

Returns system information. eg, 0 = free memory,

Where x:
QB-standard:

---- -------------
0   free memory
-1   largest block of integers
-2   free stack
-3   largest free block
---- -------------

Our standard (it is optional for now):

----- -----------------------
-10   total physical memory
-11   used physical memory
-12   free physical memory
----- -----------------------

Optional-set #1:

----- --------------------
-13   shared memory size
-14   buffers
-15   cached
-16   total virtual memory size
-17   used virtual memory
-18   free virtual memory
----- --------------------

Optional-set #2:

----- ------------------------
-40   battery voltage * 1000
-41   battery percent
-42   critical voltage value (*1000)
-43   warning voltage value (*1000)
----- ------------------------

The optional values will return 0 if not supported.


