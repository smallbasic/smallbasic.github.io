Language reference
==================

BASIC is a very simple language and it is a perfect tool for calculations or utilities.
Its name stands for (B)eginners (A)ll-purpose (S)ymbolic (I)nstruction (c)ode. It was developed by John
Kemeny and Thomas Kurtz at Dartmouth College during the middle of 1960, and was one of the most
popular languages for several decades. {.roleNote}

How to read the language reference syntax
-----------------------------------------

* Everything written inside of [] characters are optional values.
* Everything written inside of { characters means you must select one of them.
* The symbol | means OR.
* The symbols ... mean you can repeat the previous syntax.
* Keywords are written with capital letters.
* Parameters are written with lower letters.
* Keywords with suffix () are functions.
* Parameters with suffix () are arrays.

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

~~~FOO a[, x]~~~

The next example means that you must use the first parameter. You can also use second parameter
but you must separate it with ',' or ';'. You can also repeat the last syntax more times.

~~~FOO var [{,|;} var2 [...]]~~~

  <div class="contentsPanel">
    <div class="contentsHeader">Contents</div>
    <ul>
      <li><span>1</span><a href="/reference/521.html">Console</a></li>
      <li><span>2</span><a href="/reference/581.html">Data</a></li>
      <li><span>3</span><a href="/reference/575.html">Date</a></li>
      <li><span>4</span><a href="/reference/580.html">File</a></li>
      <li><span>5</span><a href="/reference/611.html">Graphics</a></li>
      <li><span>6</span><a href="/reference/662.html">Language</a></li>
      <li><span>7</span><a href="/reference/704.html">Math</a></li>
      <li><span>8</span><a href="/reference/771.html">String</a></li>
      <li><span>9</span><a href="/reference/1439.html">System</a></li>
    </ul>
  </div>

You can find
------------

escape codes under Console or under Articles "Escape Codes"
ARRAY under Data, ISMAP under Data, ISREF under Data

bit color systems under Graphics
STEP under Graphics,  aspect under Graphics, FILLED under Graphics, QBcolors under COLOR under Graphics

"system variables" AKA built in coder constants under System eg, pi, xmax, ymax, cwd...
INCLUDE under System

Allot of information is under Articles > "Welcome to SmallBASIC":
operators eg ~ % ^ ! IN LIKE
special characters eg   [ , ;]  ARRAY definition << append to array
basic stuff about variables, subs and functions
aha! stuff on units, meta commands, options, pseudo operators

TRY CATCH THROW ENDTRY ... located in Language ref > Language unsorted list
  

