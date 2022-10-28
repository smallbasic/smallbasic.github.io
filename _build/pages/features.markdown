# New features

> SmallBASIC has a number of new features intended to broaden its appeal as a general purpose scripting language (Note - Written in 2008).

## Local variable declaration and assignment ##

You can now declare and assign a local variable on the same line

~~~
local foo = "foo"
~~~

## Program defined window geometry ##

The SDL version now allow the window geometry to be set from your program.

~~~
  option predef grmode 200x300
~~~

## User defined structures ##

User defined structures in SmallBASIC are a form of compound variable allowing individual elements to be referenced.

The following example loads the system password table and prints the contents of the first user (works only in Linux):

~~~
tload "/etc/passwd", buffer

dim users

for row in buffer
  
  split row, ":", fields()
  
  if (ubound(fields) > 0) then
    local user
    user.name = fields(0)
    user.passwd = fields(1)
    user.userId = fields(2)
    user.groupId = fields(3)
    users << user
  fi
next row

print users(0)
~~~

## Associative arrays ##

Regular SmallBASIC arrays are indexed by integers within the upper and lower bounds of the array. Associative arrays take a string as the array index and like plain SmallBASIC variables, come into existence when ever they are referenced.

The following example loads the system password table then prints the groupID value of the "mail" user account:

~~~
tload "/etc/passwd", buffer

users = {}

for row in buffer
  
  split row, ":", fields()
  
  if (ubound(fields) > 0) then
    local user
    user.name = fields(0)
    user.passwd = fields(1)
    user.userId = fields(2)
    user.groupId = fields(3)
  
    users(user.name) = user
  
  fi
next row

print users("mail").userId
~~~

## Unit name pathing ##

Units now have the ability to include a path component in a unit name.

~~~
import other.something.foo
? foo.my_var
~~~

Then in the foo.bas file:

~~~
Unit other.something.Foo
export my_var
~~~

The unit file would be saved in $UNITPATH/other/something. If not defined, $UNITPATH is inferred from the host program directory.

## IN operator ##

When applied to arrays the IN operator now returns the 1 based index position, for example:

~~~
a &lt;&lt; "cat"
a &lt;&lt; "dog"
? "dog" in a 'prints 2
~~~

## Logical expression short-circuit evaluation ##

In the code fragment below, if A and B are both func's and the A func returns TRUE, then the B func is not called since the expression outcome will still be the same, the expression will evaluate to TRUE.

~~~
if (A OR B) ...
~~~

In the next code fragment, if C and D are both func's and the C func returns FALSE, then the D func is not called since the expression outcome will still be the same, the expression will evaluate to FALSE.

~~~
if (C AND D) ...
~~~


## Func/Sub pointers ##

The @ operator can be used to obtain the address of a sub or func. The call statement is then used to invoke the sub or func pointed to by the pointer variable.

~~~
func foo(s)
 foo="foo!"+s
end

sub bar
 ? "in bar"
end

p = @foo
? call(@foo, "#")
? call(p, "%")
pb = @bar
call pb
call @bar
~~~

## Enhanced chain ##

The chain command can now take a string or array of strings as the argument in lieu of a file name. After calling chain, the calling program now successfully resumes.

~~~
tload list, code
chain code
~~~

## Lazy strings ##

Strings are normally defined using double quote characters. If the closing quote character is not present then the end of line marker is used to terminate the string definition, for example:

~~~
a = "this is a string
b = " and this is another string
? a;b
~~~

## Double equals ##

BASIC traditionally uses a single equals symbol for assignment and comparison, for example:

```
a = "cat"
if (a = "cat"): print "cat": endif
```

SmallBASIC now allows you to use double equals to avoid a clash of programming habits with other languages you may happen to use.

```
a = "cat"
if (a == "cat"): print "cat": endif
```

