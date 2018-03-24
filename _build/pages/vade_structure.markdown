Structuring a Program
=====================

> Written by Elmar Vogt, F&uuml;rth, GERMANY

::: siteSub ::
[Home](/) > [Vade](/pages/vade.html)
:::

This chapter will give you an overview about how you can avoid
producing the notorious &raquo;spaghetti code&laquo;, and structure your program
instead into blocks which are easier to debug and maintain.

Routines: Procedures and Functions
----------------------------------

Routines (also called &raquo;subroutines&laquo;) are blocks of code set apart
from the main code. This can be done for a variety of reasons, for
example simply to break down a complex task into individual stages which
are more readily analyzed and maintained. Another reason is reusability;
if the program needs to perform the same task in several stages, it's
more economical to write the code once and reuse it as is necessary.

Routines come in two flavours: &raquo;Procedures&laquo; and &raquo;functions&laquo;.
Syntactically, in SmallBASIC procedures and functions are almost equivalent. The
only difference is that a function returns a value when called, whereas
procedures do not. **A function can only return a single variable**, but
this may be an arbitrarily complex map. If you need to manipulate more
than a single value, you can also pass parameters by reference, see
below.

### Definition

Procedures and functions are defined by embracing a block of code
between the or keyword, resp., at the beginning followed by the
routine's name, and at the end of the block. Parameters are defined as a
comma-separated list of variables following the routine name in
parentheses:

    sub x(hoogla, boogla)
        ...
    end

    func y(arg1, arg2, arg3)
        ...
        y= arg1+arg2
        ...
    end

For a function, the **return value** is determined by assigning an
expression to a variable with the same name as the function, in the
example above in the line .

Note that this is in contrast with most other BASIC dialects which use
the keyword instead. There, also makes the interpreter exit the routine
and return control to the calling code immediately. Not so in : Here,
***all code* up to the keyword is executed**, with all side effects it
may generate.

Routines may be **defined anywhere** in your code; they don't need to be
defined before they are invoked.

### Arguments

Arguments[^1] are passed to a procedure or a function when invoking it
as a list of comma-separated variables and constants following the
routine name. When invoking a procedure, the parentheses are optional,
note though that you use this feature at your own risk. **Parameter
lists in the definition and the call must match** in the number of
arguments.

    y(10, 20)
    ...
    sub y(arg1, arg2, arg3)
        ...
    end

is not legal.

Calling a function and **not using the return value** is no problem:

    y(10, 20)
    ...
    func y(arg1, arg2)
        y= arg1*arg2
    end

will cause no error. The return value is simply discarded. In contrast,
calling a procedure *in lieu* of a function will confuse the
interpreter:

    my_result= x(10, 20)
    ...
    sub x(hoogla, boogla)
        ...
    end

creates an error.

### Variable Scope

Routines help with the modularization of code by &raquo;encapsulating&laquo;
the data, which means that routines have only access to a sub-set of all
variables defined in the program. Most importantly, routines can't read
or write variables defined in other routines. Hence it's impossible that
they would accidentally overwrite other variables. Likewise the routines
also maintain their own &raquo;household&laquo; of variables accessible only
to them.

The keyword is used to define variables &raquo;attached&laquo; to a routine.
The variables come into existance the minute the routine is invoked, and
they're deleted again as soon as the routine is terminated. If a local
variable (or a routine parameter) has the same name as variable
previously defined (in the main program or a routine which called the
current routine), the previous instance is &raquo;shadowed&laquo;, and the
routine will access the local variable instead, until the current
routine is left again. A local variable will also be visible to a
routine which is called from the routine where the local was defined.

The following code may explain the behaviour. It differs in important
details from that of other programming languages and BASIC dialects:

    nagaqk= 100
    zoogla= 200
    gluck
    ? "In main:", nagaqk, zoogla

    sub gluck
      local nagaqk
      nagaqk= 30
      zoogla= 200
      boogla
      ? "In gluck:", nagaqk, zoogla
    end

    sub boogla
      ? "In boogla:", nagaqk, zoogla
      nagaqk= 15
      zoogla= 99
    end

    > In boogla:    30      200
    > In gluck:     15      99
    > In main:      100 99

Let's have a look at what is actually happening here. First, the global
variables and are defined and assigned the values $100$ and $200$, resp.
Next, is invoked and defines a local variable which &raquo;shadows&laquo; the
global variable of the same name. Thus, the value $30$ is assigned to
the local instance of , not to the global one. As opposed to that, there
only is one instance of , and the value $200$ is written to that.

Next, is called, which has access to all the &raquo;knowledge&laquo; has. When
the old values of and are overwritten, this happens again to the local
copy of , but to the global instance of . Had defined its own local copy
of , *that* copy would have been overwritten rather than 's.

The writing done in is still &raquo;felt&laquo; in when control returns there.
But when is left, its local instance of is deleted and the original
instance (defined globally) returns to the surface unscathed. Note that
for there only ever was a single instance. Had had its own instance of ,
the results would also have been different.

Note that local variables can be defined anywhere in the routine. But if
you access a variable before it's defined as local, you will actually
create a new *global* variable first:

    sub hoogla
        zoot= 100

        local zoot
        zoot= 10
        ? zoot
    end hoogla

    > 10

This creates (or overwrites) a global variable with the name and the
value $100$, then creates a local variable with the same name, assigns
it the value $10$, and then destroys the local copy at the end of the
procedure, while the global copy still lives on.

Routines can **recurse**, ie invoke themselves again before they're
finished.[^2] Every time a new instance of the routine is called, it
will also create a new set of parameters and local variables, while the
old set is &raquo;put aside&laquo; and only restored when the execution of the
current routine level is finished.

    hoogla

    sub hoogla
      local zoogla
      
      level= level+1
      zoogla= level
      if level<5 then
        hoogla
      endif
      ? zoogla
    end

    > 5
    > 4
    > 3
    > 2
    > 1

The definitions of **routines may be &raquo;nested&laquo;**, ie one routine
(the &raquo;child&laquo;) may be defined within the code block of another (the
&raquo;parent&laquo;).[^3] Whether you define a routine inside or outside
another routine has little bearing on the variables household of the
child routine. But the child routine is only visible from inside the
parent routine and its &raquo;siblings&laquo;. To any code outside the parent
routine, the child will be invisible:

    hoogla

    child1

    sub hoogla
      local zoogla

      child2
      sub child1
        ? "Here I am"
      end
      
      sub child2
       child1
        ? "I'm here, too"
      end
    end

causes an error in the third line, because is invisible outside . The
rest of the code will be executed fine if you comment out the third
line.

SmallBASIC provides nothing in the way of **static variables**, ie local routine
variables which maintain their value between two subsequent calls of the
routine.

### Passing Parameters

Per default, parameters are passed to procedures and functions **&raquo;by
value&laquo;**, which means that copies of the arguments are created for
the routine. Changing these copies will have no effect on the variable
in the calling code; both instances are independent of each other. This
is true **even for maps and arrays**. This behaviour comes with a
certain penalty, namely when you work with complex maps and do a lot of
recursion. In this case, the interpreter is busy with copying lots of
data which will also require a lot of memory.

To avoid this, you can require in the definition of a routine that some
parameters will be passed &raquo;by reference&laquo;. In this case, no local
copy will be created, but the routine will work on the same data as the
calling code does: Changes to the value of a parameter are propagated to
the caller. To employ passing by reference, the respective parameters in
the routine definition must each be preceded with the keyword , or the
reference operator :

    bunga= 10
    chaka= 20

    hoogla(bunga, chaka)
    ? bunga, chaka

    sub hoogla(zoogla, byref boing)
      zoogla= 99
      boing= 101
    end

    > 10, 101

Besides reducing CPU power and memory required, passing parameters by
reference has the additional effect that a routine can write on the
parameters passed. This enables you to write procedures which change
more than one global variable at a time. Bear in mind that the *calling
code* has no way to &raquo;see&laquo; whether it passes a variable by value or
by reference; the behaviour is completely in the hand of the *called
routine*.

Notice that this behaviour is subtly different from the use of the
reference operator with a regular variable, see . You can (for obvious
reasons) not apply the reference operator inside the routine's code to a
parameter or a local variable.

### One-line Functions

Sometime the code required for a function is short and neatly fits into
one line. In this case, SmallBASIC provides a more concise syntax for function
definitions, namely with the keyword :

    def hoogla(x)= sin(x)*cos(x)

    func zoogla(x)
        zoogla= sin(x)*cos(x)
    end

Both definitions above for and are equivalent.

This does not work for procedures.

Modules
-------

To modularize your code above the level of routines, SmallBASIC offers the option
to include other source files, and to create libraries of &raquo;units&laquo;.

### File Inclusion

In its most simple form, SmallBASIC lets you import other source files into the
current file at runtime:

    include "bunga.bas"

in the code will make the contents of the file available to the file
currently running in the interpreter. &raquo;First level&laquo; code [^4] in
(will be executed immediately.[^5] If the included file contains a
routine with the same name as one defined in the &raquo;mother&laquo; file, an
error occurs; the old version of the routine is *not* replaced.

Think of it as a simple copy-paste operation.

### Units

&raquo;Units&laquo; are a more sophisticated concept in SmallBASIC which allows the
creation of genuine program libraries with their own namespace and
well-defined interfaces.

Units are kept in seperate source files; each file contains exactly one
unit which bears the same name as the file *sans* the extension.[^6]

    file hoogla.bas:
    ...
    unit hoogla
    ...
    export zoogla, boogla
    zoogla= "Hello world!"

    sub boogla(name)
        print "Goodybe", name, "!"
    end

Inside the unit file, you can write code as you would in any source
file, and define variables (simple and composite) and routines
(procedures and functions). All of these variables and routines are
local to the unit file, unless they're defined to be public with the
keyword .

First level code is executed when the library is loaded, but it takes
place in a separate namespace, ie a variable called in the unit file
will not conflict with a variable with the same name in the mother file;
they're two seperate entities.

To use a unit, it must be first be compiled into bytecode. You can do so
from the IDE, or use the command line:

    sbasici hoogla.bas

which creates a file . This must be repeated after updates to the unit
file. Then it can be loaded with the keyword in the mother file which is
to use the library. From this moment on, all ed variables and routines
are available to the mother file. Their name there is a combination of
the unit name, a dot and the variable or routine's &raquo;proper&laquo; name.
With the above code segment from you get:

    file ragaqk.bas:

    import hoogla
    ? hoogla.zoogla
    hoogla.boogla("Clint")

    > Hello world!
    > Goodbye,  Clint   !

It should be painfully obvious that a unit can't import itself again.

[^1]: Most times a disctinction between &raquo;arguments&laquo; and
    &raquo;parameters&laquo; is made in computer literature, but we'll treat
    both as synonyms.

[^2]: At least, they can do so to a reasonable degree of levels.

[^3]: Don't confuse the terminology here with child and parent
    processes/threads.

[^4]: ie, code outside any routines

[^5]: It is an interesting experiment to create such an -file during
    program runtime and import it then. Effectively, such a program
    would &raquo;bootstrap&laquo; itself. Not for the faint at heart.

[^6]: I was informed that this isn't *strictly* true, but you can cause
    great confusion in the IDE if you don't stick to that convention.
