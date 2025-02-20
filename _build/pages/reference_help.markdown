Language Reference Syntax
=========================

+ Everything written inside of [] characters are optional values.
+ Everything written inside of { characters means you must select one of them.
+ The symbol | means OR.
+ The symbols ... mean you can repeat the previous syntax.
+ Keywords are written with capital letters.
+ Parameters are written with lower letters.
+ Keywords with suffix () are functions.
+ Parameters with suffix () are arrays.

~~~
FOO     <- This is keyword
FOO()   <- This is function
foo     <- This is variable/parameter
foo()   <- This is array/parameter
{A|B}   <- This means that you must type A or B
[{A|B}] <- This means that you must use A or B or nothing
~~~

The following example means that you must give the first parameter (a) but you can use the second (x)
only if you want to. But if you want to use the (x) you must also separate it from (a) with a comma.

~~~
FOO a[, x]
~~~

The next example means that you must use the first parameter. You can also use second parameter
but you must separate it with ',' or ';'. You can also repeat the last syntax more times.

~~~
FOO var [{,|;} var2 [...]]
~~~
