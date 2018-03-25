Source Code Format
==================

> Written by Elmar Vogt, F&uuml;rth, GERMANY

::: siteSub ::
[Home](/) > [Vade](/pages/vade.html)
:::

Here you learn about the basics of BASIC, so to speak. This chapter deals with the way a SmallBASIC program composed.

A program consists of a single source file. It is possible to include
libraries from external source files with the Unit-mechanism (see ).

Source files are simple text files. They can be written in **ASCII** or **UTF-8**.

The basic program component is a line of text, ending with or characters.[^1]

SmallBASIC is **case-insensitive**: The names and will always refer to the same
variable or function. Likewise, keywords are case-insensitive: Both and
are legal variants of the same command.

**Whitespace** -- i.e., non-printing characters like spaces and tabs --
is ignored in SmallBASIC, except inside string literals where it is retained. [^2]

    for a = 0 to 10

    for a=0to 10

But note that the omission of whitespace can lead to parsing errors: If
the above line were abbreviated to

    fora=0to10

this would cause an error, because and wouldn't be recognized as
keywords anymore. Rather, SmallBASIC would consider and to be variable names.[^3]

Each program line contains one or more commands. Multiple commands on a
line are **separated by a colon**.

    print "Hello world!"
    print "Wonderful day."

    print "Hello world!" : print "Wonderful day."

**Line continuation**: If the ampersand is the last character on a line,
then the interpreter will assume that the current command extends to the
next line as well.

    X = 245 * 198 - sqr(5)

    X = 245 * 198 &
            - sqr(5)

Literals
========

Numbers
-------

Numbers can be written in the usual manner, using either
&raquo;conventional&laquo; or scientific notation. All of the following
examples are legal numbers in:

    1, 0, -1, 1.2, -23232.5, 1.902e-50, -.423

As is shown in the last example, numbers with an absolute value `<1` need not be preceded with `0`.

Integer numbers can also be represented in hexadecimal, octal and binary
notation with various prefixes:

**hexadecimal**: `&h, 0h, &x, or 0x`

**octal**: `&o or 0o`

**binary**: `&b or 0b`

    &hAFFE0815, &o4242, &b100101011
    0hAFFE0815, 0o4242, 0b100101011

String literals
---------------

String literals are character sequences which are to be treated as
program data &raquo;as is&laquo;, not as variable or keyword names. String
literals are bracketed by double quotes.

    "This is a string literal"
    this will be considered as a sequence of keywords

Note that when a string literal is to be extended across more than one
line, it must be properly closed before the continuation ampersand and
re-opened on the subsequent line with the delimiter character:

    print "Hello &
            world!"     ' error

    print "Hello " &
            "world!"        ' correct

Identifiers
===========

Identifiers -- &raquo;names&laquo; for variables and functions -- follow the
usual conventions:

They consist of a letter or an underscore , followed by one or more of
the following:

-   other letters

-   digits ( -- )

-   the underscore

-   the dollar sign (only as the last character of the identifier, see
    below)

A single underscore is a legal complete identifier.

Identifiers can have virtually unlimited length. All characters are
significant in resolving an identifier (ie, to determine whether two
identifiers refer to the same variable.)[^4]

Traditionally, in BASIC the **dollar sign** serves as a signal to
indicate that a name identifies a string variable, if used as the last
character of the identifier (i.e., `my_name$`).

Since SmallBASIC is a typeless language (see below) where variables can hold
values of any type, such a signal would be misleading, yet it has been
retained for the sake of compatibility. It may be placed as the last
character of an identifier only. Here it serves two distinguish between
identifiers ( and are two different identifiers), but has otherwise no
function.

Comments
========

**Line comments** can be introduced in three ways:

-   With the keyword,

-   With the apostrophe character,

-   With a hash sign.

Everything on the current line following the comment introduction will
be ignored in program execution.

If the keyword is used and it is preceded by other commands on the
current line, it must be separated from the previous commands by a colon
If the hash sign is used, it must be the first character on the line.
(See also the use of a hash sign in &raquo;shebanging&laquo; a script, )

    for a=0 to 10      ' this is a valid comment
       print a         : rem this also
    # this is a whole line commented out
    next a
    rem the last comment

    print "Hello world!"   rem vain commenting attempt

The in the last line above will cause an error, because it needs to be
preceded with a colon .

There are no provision for **block comments**.

[^1]: Don't worry about this, your operating system will handle it
    right. It may only every be an issue if you use source files written
    in one OS and then transferred to a different one.

[^2]: All listings in the vademecum follow the same convention and show
    the source code as you would have typed it in in the IDE. If a line
    in the listing begins with a greater-than sign , this indicates a
    response of the program printed on your screen.

[^3]: As a rule of thumb, it's advisable to always leave spaces around
    keywords.

[^4]: This is in contrast to many older BASICs. The *Commodore BASIC*
    shipped with the honourable C64, for example, allowed identifiers of
    arbitrary length, but used only the first two letters for
    resolution: and were considered to refer to the same variable.
