# SINPUT

> SINPUT src; var [, delim] [,var [, delim]] ...

Splits the string 'src' into variables which are separated by delimiters.


SINPUT "if x>1 then y"; vif, " ", vcond, "then", vdo
? vcond, vdo
' result=
' x>1   y


