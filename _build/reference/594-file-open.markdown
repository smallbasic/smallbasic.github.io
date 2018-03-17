# OPEN

> OPEN file [FOR {INPUT|OUTPUT|APPEND}] AS #fileN

Makes a file or device available for sequential input, sequential output.


* file - A string expression that follows OS file naming conventions.
* fileN - A file-handle (integer 1 to 256).
-----  
FOR - 
INPUT  Sequential input
OUTPUT  Sequential output
APPEND  Sequential output, beginning at current EOF
-----  
The files are always opened as shared.


