Control Flow
============

> Written by Elmar Vogt, F&uuml;rth, GERMANY

::: siteSub ::
[Home](/) > [Vade](/pages/vade.html)
:::

In this section we'll describe a number of ways to establish
control flow in a SmallBASIC program, ie everything which keeps the program
from simply executing line after line of code. It deals with conditional
operations loops, and exceptions.

Conditionals
------------

### 

The most simple case is an construct, which should be familiar from
other BASIC dialects.

In its regular form, it looks like this:

    if temp>20 then
        print "It's a warm day."
    endif

The expression following need not be in parentheses. The keyword is
optional. The keyword may be replaced with (which is reversed ...).

For more complex cases, alternative branches can be explored with the
keywords and :

    if temp>30 then
        print "It's really hot."
    elseif temp>20 then
        print "It's a warm day."
    else
        print "It's cool."
    endif

can be replaced with . will catch all alternatives, if none of the and
branches are true.

Note that all the branches can be tested against arbitrary expressions;
they don't need to refer to the same variable. If you want to test a
single value against several possible outcomes, is probably a better
option, see .

Several clauses can be nested. It's your resposibility to make sure than
they are properly closed, especially when you're using many / branches.

If your &raquo;deserts are small&laquo;,[^1] and you don't have to process
much code in your clause, then there is a single-line variation as well:

    if temp>30 then ? "Hot" else ? "Moderate"

Note that in this case, is mandatory, while must not be used. You can
put several colon-separated commands between and and after ,
respectively, provided you can fit everything into a single line of
code.

### 

As with the single-line option above, there is also an &raquo;inline&laquo; if
clause. &raquo;C&laquo; users will be reminded of the syntax used there. In ,
it is the keyword , followed by a list of three parameters. The first is
the condition, the second the result of the clause in the case the
condition is true, and the third the result otherwise. The following two
examples are equivalent:

    nuffda= iff(hoogla, boogla, zoogla)

    if hoogla
        nuffda= boogla
    else
        nuffda= zoogla
    endif

helps you to make your code more concise, and better readable. Since is
simply a function, it can also show up within more complex expressions:

    honka= "Hello, " + iff(its_a_boy, "dude", "chick") + "!"

which may or may not help with the readability of your code.

### 

Finally, many programming languages offer a simplified syntax for
testing a single variable (or expression) against a number of
conditions, and SmallBASIC is no exception.

Here, such a clause is introduced with the two keywords , followed by a
variable or expression. Then, a number of conditions will be tested with
statements, before the whole clause is closed with :

    nuffda= 10

    select case nuffda
      case 1
        ? "1"
      case 10
        ? "10"
    end select

Each is followed by an expression (variable or function) against which
the expression is tested. The expression is evaluated only once, namely
when entering the whole construct.

Note that, compared to other programming languages, there are several
limitations to the construct:

-   No required or even allowed. This makes it impossible to achieve
    a &raquo;fallthrough&laquo; of several clauses (intentionally or
    accidentally).

-   There is no way to compare for inequality (like -- this would be an
    illegal construct), and

-   There is no clause which would serve to catch the cases not dealt
    with explicitly (analogous to the clause in constructs).

Loops
-----

### 

loops come in two flavours with :

The first is the regular loop which you are probably familiar with from
other programming languages:

    for i=start to end [step inc]
        ...
    next

The keyword and the subsequent increment (which can be any expression,
not necessarily only a variable) are optional; if they're missing, the
increment is set to $1$. There is no need to add to the keyword the name
of the loop variable.[^2]

The index loop variable will be set to the initial value , and the code
inside the loop executed at least once. Upon reaching the corresponding
statement, the index is compared to the limit given after the keyword.
If the index is smaller or equal to , the index is incremented by the ,
if this is provided, or by $1$), and the loop is traversed once more.
(If is negative, the situation is obviously reversed.)

This means that to traverse through a complete array (assuming it uses
sequential indices only), you must configure your loop like this:

    dim x(423)
    ...
    for i=0 to 423
        ...
    next

The index is considered a regular variable inside the loop, and open to
manipulation. This means that you can play tricks like:

    for i=0 to 100000
        ...
        if i=10
            i= 1000001
        endif
    next

Since the expression is evaluated after each loop traverse, you can mess
with that as well.

The second &raquo;flavour&laquo; of is meant to deal with more complex arrays
and maps. It has a slightly different syntax:

    for i in z
        ...
    next

where is an array or map. The loop will be traversed once for each
member of the structure's top dimension (as evaluated by , see ). The
value of is set to:

-   , if is an array, or

-   the &raquo;next&laquo; key of , if it is a map.

In the case of a map, the map element can be accessed with .[^3]

    dim zoogla(5)
    zoogla(3)= "uffda"

    boogla= [[4, 5, 6, 7], 2390023, [3.1415926, "hoogla!"], 99]
    boogla("tchaka")= 500
    boogla.bonka= 999

    for x in zoogla
      ? x
    next
    ?
    for x in boogla
      ? x, boogla(x)
    next 

    > 0
    > 0
    > 0
    > uffda
    > 0
    > 0
    >
    > 0 [4,5,6,7]
    > 1 2390023
    > 2 [3.1415926,hoogla!]
    > 3 99
    > BONKA 999
    > tchaka    500

Since it's only determined at runtime which keys are used to point to
map members, this method is necessary to make it possible to traverse
through all map members in a loop.

For maps, there is no defined order in which the keys will be allotted
to the index variable.

###  and 

When the number of times a loop is supposed to be executed is not known
beforehand (for example, when reading lines from a file when the file
length is unknown), SmallBASIC offers two different loop constructs:

    while (expression)
        ...
    wend

    repeat
        ...
    until (expression)

In both cases the code block between the loop delimiters will be
repeated until an expression will be fulfilled. Note two important
differences though:

-   In a loop, the loop is executed as long as the expression is *true*
    (ie, unequal to $0$), whereas a loop is executed as long as the
    expression is *false*, or $0$.

-   In a loop, the test for the expression is performed at the
    *beginning* of the loop, but in a loop, the expression test takes
    place at the *end* of the loop. This has the consequence that the
    code block is guaranteed to be executed at least once, wheres the
    code block is not.

can be any valid term which will result in a value returned, like a
variable or a function call. It can even be useful to employ a constant
here, namely when you want to break from the loop somewhere in the
middle of the code block. For example --

    while 1
        ' read user input
        ...
        if user_name=correct
            ? "Name ", user_name, " is correct."
            exit
        endif
        ? "Illegal input"
    wend

In this case your loop should contain an statement (see below) to break
out of the loop.

This also serves to emulate a construct that would allow for a loop to
be executed &raquo;indefinitely&laquo; which SmallBASIC doesn't feature genuinely.

#### Pathological Cases

It's syntactically legal to omit the expressions for or completely. In
this case the &raquo;expression&laquo; is always taken to evaluate to .

With a loop this doesn't really make sense; the code inside the loop
will simply never be executed. In a loop though the situation is
different: This loop will endlessly be executed, and in effect such a
construct without an expression for will be equivalent to constructs of
other languages.

If you employ such a scheme, make sure that you provide a way to leave
the loop, like for example an statement:

### 

The keyword lets you exit immediately from the innermost loop it is
found in. (This is equivalent to the &raquo;C&laquo; statement .) You can
specify a qualifier with , namely one of , , , or , which will make
SmallBASIC leave the innermost surrounding structure of that type. ( includes and
constructs.)

Exceptions: 
------------

Exceptions provide a fairly comfortable way to catch runtime errors
occuring unexpectedly in your program. Of course, they can't help with
faulty program logic. Rather, exceptions are supposed to handle files
not conforming to an expected format, hardware problems and the like.

Formally, an exception block somewhat resembles a sequence. It consists
of an outer &raquo;bracket&laquo; of and keywords, which delimites the
&raquo;regime&laquo; of code to which the exception handling applies.[^4]
Inside this bracket there are one or more sections, each of which
applies to one particular error condition:

    try
        ' error-generating section
        ...
        catch error1
            ' dealing with the first error case
            ...
        catch error2
            ' ... second error case
            ...
        ' and so on
    end try

You have basically two options to catch errors this way:

Firstly, as shown above, you may provide *several* -phrases.[^5] In this
case, , and so on must be string expressions. Once an error is raised,
these string expressions are compared to the error message associated
with the error, and the first section which matches the error message
will be executed,[^6] whereupon the section will be left and the
&raquo;regular&laquo; surrounding code will be resumed. If none of the
expressions matches, program execution is resumed after , too.

Your second option is to provide only a *single* . In this case, must be
a simple string variable, and the current error string will be assigned
to this variable (provided any error occured at all). The corresponding
section will then be executed, regardless of the exact nature of the
error.

The second option is thus preferrable if you either want to have a
simple &raquo;catch all&laquo; which will deal with any imaginable error in a
single sweep, or, at the other extreme, if the error conditions you
expect to encounter are so confusing that you'd rather dedicate some
more sophisticated code to them than simple string comparisons against
the error messages.

If no error is caused in the error-generating section, then none of the
sections are executed. Errors raised outside the section can't be
evaluated inside it. (The will have caused your program to halt
already.)

If no error occured, but you feel facetious, you can use **to create any
desired error**. The syntax is simply --

    throw my_err

with the parameter being the error string. (Outside of a block, will
cause the program to abort.)

[^1]: *He either fears his fate too much\
    Or his deserts are small\
    Who dares not put it to the touch\
    To win, or lose, it all* -- Earl of Montrose

[^2]: Currently, you can write *anything* you want there without causing
    an error, but I guess this is more a bug than a feature, and will be
    removed over the next few versions.

[^3]: Yes, that's correct. Read it again.

[^4]: Obviously, in different sections of your code you may want to
    respond to the same error in different ways, thus there's no
    &raquo;global&laquo; treatment.

[^5]: if you'll pardon the pun

[^6]: Which means that, to use the exception mechanism responsibly, you
    must have a good idea what the error messages you may encounter will
    look like.
