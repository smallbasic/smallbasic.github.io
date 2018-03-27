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

### `if ... then`

The most simple case is an `if ... then` construct, which should
be familiar from other BASIC dialects.

In its regular form, it looks like this:

    if temp>20 then
        print "It's a warm day."
    endif

The expression following `if` need not be in parentheses. The
keyword `then` is optional. The keyword `endif` may be
replaced with `fi` (which is `if` reversed ...).

For more complex cases, alternative branches can be explored with the
keywords `elseif` and `else`:

    if temp>30 then
        print "It's really hot."
    elseif temp>20 then
        print "It's a warm day."
    else
        print "It's cool."
    endif

`Elseif` can be replaced with `elif`. `Else` will
catch all alternatives, if none of the `if` and `elseif`
branches are true.

Note that all the branches can be tested against arbitrary expressions;
they don't need to refer to the same variable. If you want to test a
single value against several possible outcomes, `select ... case`
is probably a better option.

Several `if` clauses can be nested. It's your responsibility to
make sure than they are properly closed, especially when you're using
many `elseif`/`else` branches.

If your `deserts are small`,[^1] and you don't have to process
much code in your `if` clause, then there is a single-line
variation as well:

    if temp>30 then ? "Hot" else ? "Moderate"

Note that in this case, `then` is mandatory, while `endif`
must not be used. You can put several colon-separated commands between
`then` and `else` and after `else`, respectively,
provided you can fit everything into a single line of code.

### `iff(...)`

As with the single-line option above, there is also an `inline` if
clause. `C` users will be reminded of the `x ? y : z` syntax
used there. In , it is the keyword `iff`, followed by a list of
three parameters. The first is the condition, the second the result of
the clause in the case the condition is true, and the third the result
otherwise. The following two examples are equivalent:

    nuffda= iff(hoogla, boogla, zoogla)

    if hoogla
        nuffda= boogla
    else
        nuffda= zoogla
    endif

`Iff` helps you to make your code more concise, and better
readable. Since `iff` is simply a function, it can also show up
within more complex expressions:

    honka= "Hello, " + iff(its_a_boy, "dude", "chick") + "!"

which may or may not help with the readability of your code.

### `select ... case ... end select`

Finally, many programming languages offer a simplified syntax for
testing a single variable (or expression) against a number of
conditions, and SmallBASIC is no exception.

Here, such a clause is introduced with the two keywords `select
case`, followed by a variable or expression. Then, a number of
conditions will be tested with `case` statements, before the whole
clause is closed with `end select`:

    nuffda= 10

    select case nuffda
      case 1
        ? "1"
      case 10
        ? "10"
    end select

Each `case` is followed by an expression (variable or function)
against which the `select case` expression is tested. The
`select case` expression is evaluated only once, namely when
entering the whole construct.

Note that, compared to other programming languages, there are several
limitations to the construct:

-   No `break` required or even allowed. This makes it impossible
    to achieve a `fallthrough` of several `case` clauses
    (intentionally or accidentally).

-   There is no way to compare for inequality (like `case \> 5` --
    this would be an illegal construct), and

-   There is no `default` clause which would serve to catch the
    cases not dealt with explicitly (analogous to the `else`
    clause in `if` constructs).

Loops
-----

### `for ... next`

`For` loops come in two flavours with :

The first is the regular loop which you are probably familiar with from
other programming languages:

    for i=start to end [step inc]
        ...
    next

The `step` keyword and the subsequent increment `inc` (which
can be any expression, not necessarily only a variable) are optional; if
they're missing, the increment is set to `1`. There is no need to add to
the `next` keyword the name of the loop variable.[^2]

The index loop variable `i` will be set to the initial value
`start`, and the code inside the loop executed at least once. Upon
reaching the corresponding `next` statement, the index is compared
to the limit `end` given after the `to` keyword. If the
index is smaller or equal to `end`, the index is incremented by
the `inc`, if this is provided, or by `1`), and the loop is
traversed once more. (If `inc` is negative, the situation is
obviously reversed.)

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

Since the `inc` expression is evaluated after each loop traverse,
you can mess with that as well.

The second `flavour` of `for` is meant to deal with more
complex arrays and maps. It has a slightly different syntax:

    for i in z
        ...
    next

where `z` is an array or map. The `for` loop will be
traversed once for each member of the structure's top dimension (as
evaluated by `len`, see ). The value of `i` is set to:

-   `z(i)`, if `i` is an array, or

-   the `next` key of `z`, if it is a map.

In the case of a map, the map element can be accessed with
`z(i)`.[^3]

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

### `while ... wend` and `repeat ... until`

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

-   In a `while ... wend` loop, the loop is executed as long as
    the expression is *true* (ie, unequal to ~0~), whereas a `repeat
    ... until` loop is executed as long as the expression is
    *false*, or ~0~.

-   In a `while ... wend` loop, the test for the expression is
    performed at the *beginning* of the loop, but in a `repeat ...
    until` loop, the expression test takes place at the *end* of the
    loop. This has the consequence that the `repeat ...` code
    block is guaranteed to be executed at least once, wheres
    the `while ...` code block is not.

`(expression)` can be any valid term which will result in a value
returned, like a variable or a function call. It can even be useful to
employ a constant here, namely when you want to break from the loop
somewhere in the middle of the code block. For example --

    while 1
        ' read user input
        ...
        if user_name=correct
            ? "Name ", user_name, " is correct."
            exit
        endif
        ? "Illegal input"
    wend

In this case your loop should contain an `exit` statement (see
below) to break out of the loop.

This also serves to emulate a `do ... loop` construct that would
allow for a loop to be executed `indefinitely` which SmallBASIC
doesn't feature genuinely.

#### Pathological Cases

It's syntactically legal to omit the expressions for `while` or
`until` completely. In this case the `expression` is always
taken to evaluate to `0`.

With a `while ...wend` loop this doesn't really make sense; the
code inside the loop will simply never be executed. In a `repeat
...until` loop though the situation is different: This loop will
endlessly be executed, and in effect such a construct without an
expression for `repeat` will be equivalent to `do ...loop`
constructs of other languages.

If you employ such a scheme, make sure that you provide a way to leave
the loop, like for example an `exit` statement:

### `exit`

The keyword `exit` lets you exit immediately from the innermost
loop it is found in. (This is equivalent to the `C` statement
`break`.) You can specify a qualifier with `exit`, namely
one of `for`, `loop`, `sub`, or `func`, which
will make SmallBASIC leave the innermost surrounding structure of that
type. (`loop` includes `repeat` and `while`
constructs.)

Exceptions: `try ... catch ... throw`
---------------------------------------------

Exceptions provide a fairly comfortable way to catch runtime errors
occurring unexpectedly in your program. Of course, they can't help with
faulty program logic. Rather, exceptions are supposed to handle files
not conforming to an expected format, hardware problems and the like.

Formally, an exception block somewhat resembles a `select ...
case` sequence. It consists of an outer `bracket` of
`try` and `end try` keywords, which delimites the
`regime` of code to which the exception handling applies.[^4]
Inside this bracket there are one or more `catch` sections, each
of which applies to one particular error condition:

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

Firstly, as shown above, you may provide *several*
`catch`-phrases.[^5] In this case, `error1`, `error2`
and so on must be string expressions. Once an error is raised, these
string expressions are compared to the error message associated with the
error, and the first `catch` section which matches the error
message will be executed,[^6] whereupon the `try ... catch`
section will be left and the `regular` surrounding code will be
resumed. If none of the `catch` expressions matches, program
execution is resumed after `end try`, too.

Your second option is to provide only a *single* `catch`. In this
case, `error1` must be a simple string variable, and the current
error string will be assigned to this variable (provided any error
occured at all). The corresponding `catch` section will then be
executed, regardless of the exact nature of the error.

The second option is thus preferable if you either want to have a
simple `catch all` which will deal with any imaginable error in a
single sweep, or, at the other extreme, if the error conditions you
expect to encounter are so confusing that you'd rather dedicate some
more sophisticated code to them than simple string comparisons against
the error messages.

If no error is caused in the error-generating section, then none of the
`catch` sections are executed. Errors raised outside the `try
... catch` section can't be evaluated inside it. (The will have
caused your program to halt already.)

If no error occured, but you feel facetious, you can use **`throw`
to create any desired error**. The syntax is simply --

    throw my_err

with the parameter `my_err` being the error string. (Outside of a
`catch ... try` block, `throw` will cause the program to
abort.)

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
    `global` treatment.

[^5]: if you'll pardon the pun

[^6]: Which means that, to use the exception mechanism responsibly, you
    must have a good idea what the error messages you may encounter will
    look like.
