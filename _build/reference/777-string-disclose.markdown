# DISCLOSE

> DISCLOSE (str[, pairs [, ignore-pairs]])

Discloses a string.


Default pairs and ignore pairs
table{border:1px solid black;padding:8px}.
|First non white-space character|Check|Ignore|
|"|""|''|
|'|''|""|
|(|()|""''|
|[|[]|""''|
|{|{}|""''|
|<|<>|""''|
|"|""|''|
s = "abc (abc)"
? s; tab(26); disclose(s, "()")
' prints abc
s = "abc (a(bc))"
? s; tab(26); disclose(s, "()"); tab(40); disclose(disclose(s, "()"), "()")
' prints a(bc), bc
s = "abc (a='(bc)')"
? s; tab(26); disclose(s, "()", "''"); tab(40); &
    disclose(disclose(s, "()", "''"), "()", "''")
' prints a='(bc)', nothing

