Data
====

> Written by Elmar Vogt, F&uuml;rth, GERMANY

::: siteSub ::
[Home](/) > [Vade](/pages/vade.html)
:::

In this chapter, the Vademecum introduces you to the various ways
SmallBASIC handles program data -- both simple variables and more complex
structures.

A Note on Types
---------------

SmallBASIC is **dynamically typed language**[^1]. This means that one and the same
variable can hold numerical values and strings at different times.
Furthermore, necessary conversions are done automatically on the fly,
for example when a string is used as the parameter for a numerical
function:

    x= "3.141"    ' string assignment
    y= cos(x)     ' no problem:
    ' x is automatically converted to a number
    print y

    > -1

While there are also functions for explicit conversions, per default
conversions are done ~tacitly~ by the interpreter, without any
provisions in the SmallBASIC program, and there are also no
~notifications~ when a type conversion occurs. Another consequence
is that the kind of data contained in a variable (or the structure of a
map) is only determined at runtime.[^2] It is up to the programmer
to ensure that his code will ~expect\ the\ unexpected~ and be able
to cope with any data it is fed with.

Simple Variables
----------------

Simple variables **need not be declared**; they come into existence by
their first appearance in the source code. If they are not created
through an assignment, they will be initiated to the value ~0~
(or, equivalently, to the empty string ~\"\"~ (This example
admittedly looks a little silly).

**Value assignment** is done with the ~=~ operator: The value to
the right of it (which may be another variable, a literal, or a more
complicated expression) is assigned to the variable on the left:[^3]

    x= 20
    y= 10
    z= x+y
    ? z

    >30

    a= "Hello world"
    ? a

    Hello world

    "Goodbye world"= q

The last line will cause an error, since the operands are in the wrong
order: It's not possible to assign a variable like ~q~ to a
literal, only the other way around.

Historically, BASIC required the keyword ~let~ before an
assignment:

    let x=20

SmallBASIC offers you the option to use this syntax variant for compatibility
reasons (read: nostalgia), but it's deprecated.

### Numbers

Many languages have different types for various flavours of numbers --
signed or unsigned integers, reals, etc. -- In contrast, SmallBASIC only has a
single class of numbers.[^4]

### Strings

Strings are chains of one or several letters, used to represent words,
sentences or complete texts. A string consisting of zero letters is
called an ~empty~ string. (While I have a strong hunch that
strings are internally represented with UTF-8 unicode characters, it's
probably safer to only assign ASCII letters to them.)

    my_name= "Elmar Vogt"
    ? "Hello, my name is ", my_name

    > Hello, my name is Elmar Vogt

Strings are dynamic objects in , meaning that they have no predefined
length: In the course of a program, they can change their length
arbitrarily, and there is no need to define a maximum length for them. A
theoretical upper length limit is set at 2 billion characters.[^5]

**String concatenation** is done with the `+` operator:

    my_name= "Elmar Vogt"
    greeting= "Hello, my name is "
    welcome= greeting + name
    ? welcome

    > Hello, my name is Elmar Vogt

The `+` operator combines the string operands to the left and to the
right of it to a new, third string, the length of which is the sum of
the individual strings' lengths. If either the left or the right operand
is a number -- a literal or a variable --, then this operand will be
converted to a string before the concatenation. For example, a variable
with the value ~42~ would be converted to a string of two
characters, namely ~4~ and ~2~.[^6]

The **length** of a string is simply the number of characters currently
contained in the string:[^7]

    ? len("Hello world")

    > 11

**String indexing** is done with the first character of a string being
considered to be at position `1`:[^8]

    ? mid("Help me", 4, 1)

    > p

This also means that the index of the *last* character of a string is
equivalent to its length:[^9]

    z= "Help me"
    ? mid(z, len(z), 1)

    > e

A loop designed to iterate over all characters in a string ~x~
must thus look like this:

    for i=1 to len(x)
        ...
    next i

Note that this in contrast with the use of arrays (see below), where the
first array element has the index `0`, and for an array with `n`
elements the highest index is `n-1`.

Complex data structures
-----------------------

Beside simple variables and literals, SmallBASIC also offers the option of
composing arbitrarily complex[^10] variable structures. These come in
two flavours:

Simple arrays (), and maps ().

From 's point of view, both are the same. Technically, arrays are simply
a subset of possible maps, but to make it easier to grasp the concept,
we'll treat both as different entities for the moment.

In contrast to simple variables, complex data structures **must be
declared before use** with the ~dim~ statement.

    dim x

Since (almost) all variables are handled dynamically in SmallBASIC and can change
their structure during their lifetime, it is neither necessary nor
useful to define details or the size of the data structure at hand.

### Arrays [\[array\]]{#array label="array"}

Arrays are the more simple way of agglomerating data into a single
variable. SmallBASIC treats them much like the way other programming
languages do. An array holds a number of variables which are accessed by
means of the array name, and a numerical index, pretty much like a
street address is a combination of the street's name, and a house
number. To access an array member, its name is followed by the index in
parentheses ~()~:

    hoogla(i)= boogla(250)

will assign the value of ~boogla~'s 250th member to the member of
~hoogla~ with the numerical index ~i~.

Array members can be of **mixed content**, ie it's perfectly okay for
one member of an array to hold a number, and for a different member of
the same array to hold a string.

Arrays must be **defined before use**, and while they are dynamic and
can change their size on the fly, room for an array member must be
defined before it can be used, by using the ~dim~ statement along
with a numerical value:

    dim hoogla(250)

will define ~hoogla~ to initially have ~251~ members with indices
~0..250~. This **array indexing** contrasts with the indexing of
strings.

Array members can be erased from the array with ~delete~. Note
that if the `i`th member of an array is deleted, then all array members
with higher indices ~move\ down~ one notch, ie the value of
~x(n)~ will now be in ~x(n-1)~.

Likewise, new array members can be appended to an array with the
operator ~<<~.[^11]

    dim hoogla(250)
    hoogla << 132

means that now ~hoogla~ will have ~252~ members, and the new
~252~nd member (with the index ~251~) will have the value ~132~.

Arrays are not limited to being a chain of values. **Several array
dimensions** can be defined to render arrays of ~rectangular~,
~cubic~, ~tesseractic~ or even higher dimensions:

    dim hoogla(10, 20, 10)
    hoogla(5, 9, 8)= "blubbdi"

will create an array with `11 X 21 X 11` members, or access
one particular member, resp. For obvious reasons, it's not possible to
~delete~ members of such a higher-dimensional array in the above mentioned way.
Likewise, using the appendix ~<<~ operator with a higher-dimensional array
should be avoided.[^12]

The maximum array size is virtually unlimited. But note that with the
introduction of new array dimensions, the space and performance
requirements increase exponentially.

### Maps

Maps differ from arrays in two ways: Firstly, while arrays always have a
linear or ~rectangular~ structure, **maps are ~data\ trees~,
where each map member can be a simple variable, an array or a complete
map**. This structure can become extremely complex during the runtime of
a program. As explained in , since there is no fixed type system, and
hence no predetermined structure for any given map, this means that an
SmallBASIC program must ~anticipate\ all\ known\ unknowns~.

Secondly, map indices aren't limited to a consecutive list of integer
numbers. Rather, **map members can be accessed by any simple variable --
string, integer or real**. This leads to subtle syntax differences when
accessing them and has a number of other consequences. For example, it's
not straightforward anymore to write a loop which will iterate over all
map members, or determine the number of map elements. The concept is
probably more easy to grasp when one doesn't think of maps as of
traditional arrays, but to consider each member a pair of a
~value~, which is stored in the map, and a ~key~ (the index)
by which it is accessed.

These two features in combination with 's automatic conversion features
lead to the fact that **it is fairly easy to inadvertently convert an
array into a map**, a conversion from which there is no easy way back,
and thus to create havoc at runtime.

**Map initialisation** can be done by in three ways: Either explicitly,
by using the ~dim~ keyword *without* an array size (ie, simply
~dim\ x~ is enough), through the ~array~ keyword (see below),
or implicitly by assigning the map members values by a sequence of
comma-separated values, enclosed in square brackets ~\[\]~:

    hoogla= [10, 9, 8, 7, 6, 1]

initialises a simple map ~hoogla~ with ~6~ members with
automatically generated indices from ~0~ to ~5~.

To create more complex structures, each map member which is a map again
must be enclosed in brackets. For example,

    boogla= [1, 2, [4, 5, 6, 7], 2390023, [3.1415926, "hoogla!"], 99]

can be visualized in a structure like this:

    1
    2
    4          5          6         7
    3.1415926  "hoogla!"
    99

To initialise a map in that way, it does *not* need to be defined with
~dim~ beforehand -- actually, a square bracket initialisation will
delete any variable with the same name that may have been existing
before, and create a completely new one.

Furthermore, the ~array~ keyword can be used as an alternative way
to initialize a map (though not an array, confusingly). Basically, what
you do is that you pass your map members in the shape of a
JSON-formatted string[^13] to the ~array~ function:

    boogla= array("[1, 2, [4, 5, 6, 7], [3.1415926, \"hoogla!\"], 99]")

is equivalent to the map definition above. Be aware that you pass *all*
map members to ~array~ wrapped in a single string, rather than as
individual elements. Likewise, if you use string variables in your map,
these must be escaped with backslashes inside the ~array~ argument
(ie, ~\\\"hoogla\\\"~ rather than simply ~\"hoogla\"~.

A further neat feature is that maps of any complexity can be serialized
with a simple ~print~ command to a file. ~Print~ will not
only display a single member, but will format the output as a JSON
string. This means -- without going into too many details regarding file
handling here -- that writing a complete map to a file and loading it
again at a later stage are simple three-liner tasks.

**Access to map members** is possible through two different notations.
The first one contains the key to the map member in parentheses after
the map name:

    boogla(3.1415926)= ...

which is similar to an array access, with the exception that the key may
be a real value, or even a string:

    boogla("nuffda")= ...

The second option uses the ~dot\ notation~ familiar from other
languages like ~C~, seperating the name from the member key with a
dot ~.~:

    boogla.nuffda= ...

The two notations are for the most part equivalent, while the second
alternative makes sure that you're accessing a map, not an array.

For more complex maps with nested structures, you simply ~chain~
your notations to access the lower-level members:

    boogla.nuffda.oingaboinga= ...

The notations can be mixed within a single variable access:

    dim boogla
    z.tschaka= "Hello, world!"
    boogla("gloegk")= z
    ? boogla.gloegk("tschaka")

    > Hello, world!

But this is not recommended, because it is too easy to inadvertently
mess up your dots and parentheses and accessing a non-existent map
member.[^14]

An interesting feature is that with the parentheses notation, a variable
may be used as key, which isn't possible with dot notation:

    z.tschaka= "Hello, world!"
    target= "tschaka"
    ? z(target), z.target

    > Hello, world! 0

When accessing ~z~ in the third line, in the first term
~z(target)~, ~target~ is replaced with its value
~tschaka~ by the interpreter, before looking the map member with
that name up and returning the result, ~\"Hello,\ world!\"~. In the
second term ~z.target~, the interpreter looks for a member of
~z~ with the key ~target~, can't find one, and tacitly
creates a new one which is initialized with the value ~0~.[^15]

This makes the parentheses notation particularly useful when you want to
decide at runtime which map member you want to access: With dot
notation, access is fixed, but with parentheses notation you can pass a
variable to determine which member to use in that instance.

For both arrays and maps, `len(x)` will give you the number of elements in the
structure. But note that this isn't the total number of elements, but
only the number of elements in the ~top\ dimension~.

For example, when initializing an array as

    boogla= [1, 2, [4, 5, 6, 7], 2390023, [3.1415926, "hoogla!"], 99]

    'boogla will be 6, as this is the number of first-dimension
    'members, not 10, which would be the total number of elements.

    'Almost, but Not Quite the Same (Not a Rose by any other Name

    'The near-but-not-quite equivalency of maps and arrays leads to
    'interesting consequences, read: causes for unexpected trouble. For
    'example, in the following code

    dim x
    dim z
    x("hello")= 10
    x(5)= 55
    z(5)= 10
    z("hello")= 55

the third and fourth line cause no errors, but the fifth one does. Why
is this? The cause is, that after the ~dim~ command, ~x~ and
~z~ essentially are still shapeless somethings, but the first
access with a string for an index forces ~x~ to become a map (line
3). Accessing it *afterwards* with a numerical key is no problem at all.
~z~ on the other hand is firstly accessed as an array (line 5),
and this leads to problems, because neither has its size been defined,
nor has the appendix operator been used.

Likewise,

    dim x

    z= "hello"
    x(z)= 3.14
    x << 99

throws an error in the last line, namely ~index\ out\ of\ range~. The
first use of ~x~ forced it to become a map, but unfortunately, the
appendix operator is only defined for arrays,[^16] hence the error.

Finally,

    zoogla= [[1, 2, 3], [10, 11, 12], [99, 98, 97]]

looks tantalizingly like a definition for a two-dimensional array, but
it actually is a map -- which you find out when you try to access it
like an array; ~zoogla(2,\ 2)~ will cause an ~out\ of\ range~
error. Only ~zoogla(2)(2)~ will work.

In a nutshell: Try to avoid arrays whenever possible. In the long
run, you're better off if you force your structures to be maps and
treat them accordingly.

References
----------

### Referencing Routines

The reference operator works on routines:

    boogla= @honk
    zoogla= @buzz
    call boogla, 1, 2, 3
    call @honk, 4, 5, 6
    ? call(zoogla, 5)

    sub honk(x, y, z)
        print x*y*z
    end
    func buzz(x)
        buzz= x*x
    end

    > 6
    > 120
    > 25

The keyword is used to invoke a routine. It is followed by the reference
to the routine, or a variable which holds the reference,[^19], and a
comma-separated list of parameters. Note that if a procedure is ~call~ed, the
parameter list *must not* be in parentheses, while when you ~call~ a function,
it *must*.

[^1]: sometimes also referred to somehow incorrectly as a
    ~typeless~ language

[^2]: Contrast this behaviour to other languages like ~C~, where a
    strict type discipline is enforced.

[^3]: The command ~?~ used below is a shorthand for ~print~:
    It will display the current values of all the following literals or
    variables on the screen.

[^4]: While SmallBASIC internally also represents numbers either as
    integers or, if they carry fractions or exceed the limits for
    integers, as 64 bit reals, this is invisible to the user, since all
    conversions are done implicitly and automatically when required.

[^5]: Even before that SmallBASIC tends to get too tediously slow for all
    practical purposes.

[^6]: Obviously, if *both* operands are numbers, `+` will perform a
    simple addition and assign the sum of both values to the variable on
    the left of the equality sign.

[^7]: The function ~len()~ returns the length of the following
    argument in brackets

[^8]: The function ~mid(x,\ y,\ z)~ returns ~z~ characters from the
    string ~x~, beginning with the ~y~th

[^9]: The function ~len()~ returns the length of its string
    argument, in number of characters

[^10]: ~Complex~ here denoting intricate constructs, not the
    mathematical notion of complex numbers

[^11]: Sorry for the ugly typography here.

[^12]: While technically it works, it will actually transform the array
    into a *one-dimensional* array, arrange the previous values
    sequentially and finally append the new array member. But this is
    dark voodoo and should not be practiced. Besides, there is no
    guarantee that this behaviour will be retained in future versions of
    .

[^13]: ~JavaScript\ Object\ Notation~, see eg
    [Wikipedia](http://en.wikipedia.org/wiki/JSON) for details

[^14]: Since it isn't necessary to declare map members before accessing
    them, you will not get a warning in such a case and may spend many
    hours debugging.

[^15]: Wrap your heads around this, folks. It's important.

[^16]: and it *can* only be defined for arrays, because what would be
    the key for the value appended, if the recipient was a map?

[^17]: We've all been there...

[^18]: and is in the words of its inventor, ~a bit useless~

[^19]: If you think about it, only the latter case is really really
    useful.
