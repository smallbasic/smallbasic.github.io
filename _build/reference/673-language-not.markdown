# NOT

> a NOT b

Invert expression result. Equivalent syntax to the exclamation character, eg a ! b

NOT and ! take only the right side argument:
NOT b
! b
It's wrong to think that the left side argument (a) is part of the result.
And in some cases it leads to an error, for example:

~~~
PRINT  BIN(1 Not 1) ' <-- this is error
~~~

Binary operators work on 2 arguments a,b: +,-,*,/^ are all binary operators needing 2 arguments to do their thing.
shian is saying NOT or ! is NOT Binary but Unary using only 1 argument located at right of NOT or !
So it is very misleading to show a NOT b If you actually try to print that you will get an error using (a not b) and gobbley-gook for ? a not b

~~~
'NOT is a Unary operator.bas   SmallBASIC 0.12.2 [B+=MGA] 2016-03-13
'it makes anything true > false = 0
'it makes the one false=0 > true (and in SmallBASIC returns 1 as C developer would have it)
? !true      'returns 0
? NOT false  'returns 1
b=45
? b;"=b" '45 of course
? !b;"=!b"  '<===========  important one, normal use of ! or NOT output is 0
a=20
? a;"=a" '20 of course
'uncomment next line to see error,
'? (a NOT b);" (a!b) should error because ! only works on b" '(EXPR): Missing ')'
pause

~~~

Thanks shian, on my own I would never have noticed this.
to be precise: NOT is not Bitwise operator, it is a logical operator.

There are two versions of NOT:
NOT, which is logical not,
~, which is bitwise not.

Both are using only the right side expression: NOT(b), ~(b)
NOT inverts the expression b (e.g. true --> false)
~  inverts each bit in b (e.g. 01011 --> 10100)

