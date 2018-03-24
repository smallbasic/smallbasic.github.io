A Quick and Painless Introduction
=================================

> Written by Elmar Vogt, F&uuml;rth, GERMANY

::: siteSub ::
[Home](/) > [Vade](/pages/vade.html)
:::

This chapter is designed to give you an overview over SmallBASIC and
lets you determine whether the language suits your needs.

Two Words of Caution
--------------------

-   This booklet is about the SmallBASIC programming language -- it's *not* an
    introduction to programming in general. While not a lot of software
    background is expected from the reader, it is assumed that common
    programming concepts are already understood.[^1] Some knowledge in
    programming languages like &raquo;C&laquo;, Pascal, or Ruby is useful.

-   SmallBASIC is a language with a long and varied history. Some features which
    are still present in its code are no longer actively supported.
    These deprecated features may be removed in future releases, and, to
    keep the Vademecum concise, they will not be dealt with in this
    document.

Features, or: Is it for me?
---------------------------

SmallBASIC started life as something like an &raquo;extended handheld calculator&laquo;,
designed for PIMs[^2] running the Palm OS. One release note read,
It's not meant to be a full-fledged programming language, and it
will never be. Please don't ask us to turn it into one.

Some time has gone by since, and *Nicholas Christopoulos* and *Chris
Warren-Smith*, the driving forces behind the project, have developed
SmallBASIC into a dialect of the BASIC language which is neither &raquo;small&laquo; (in
the sense of it's capabilities), nor does it share too much with classic
BASIC dialects.[^3]

Today, some of SmallBASIC's features are:

-   SmallBASIC is a multi-platform BASIC language: Currently, Linux, Windows and
    Android are supported.[^4]

-   The language is pretty compact: The Debian installer for Linux, for
    example, comes as a single file with ca. 600 kb.

-   SmallBASIC features a very comprehensive set of mathematical functions.

-   It is an interpreted language with no compilation runs required.

-   SmallBASIC supports structured programming, user-defined structures and
    modularized source files. It is not object-oriented, though.

-   It also shows much leeway in questions of syntax: For many commands,
    there are alternatives, and for many constructs, there are different
    synonyms available.

-   SmallBASIC comes with its own little IDE.

-   Graphics primitives (like lines, circles, etc.) are provided, as
    well as sound and simple GUI functions.

Resources
---------

Here you will find a few internet resources that might be helpful for
you when you want to get more closely acquainted with :

-   <http://smallbasic.github.io/> is the central hub for
    information about SmallBASIC in general -- a good starting point for a user of
    SmallBASIC. It leads you to the download of the current SmallBASIC versions and provides
    a lot of background information.

-   <https://github.com/smallbasic/SmallBASIC/> hosts the source code
    and cutting-edge SmallBASIC releases -- most interesting if you want to
    contribute to the further development of SmallBASIC.

-   <https://www.facebook.com/groups/12117250426/> and
    <https://www.facebook.com/pages/SmallBASIC/110997952286349> are two
    Facebook groups dedicated to SmallBASIC. (Both don't exactly swamp you with
    traffic either.)

-   You can get directly in touch with the developing team of SmallBASIC through
    [e-mail](mailto:smallbasic@gmail.com).

Licenses
--------

-   SmallBASIC is released under the [GNU General Public License version 2.0 (GPLv2)](http://www.gnu.org/licenses/old-licenses/gpl-2.0)

-   This document, the &raquo;Vademecum&laquo;, is released under the
    [Creative Commons License by-nc-nd](http://creativecommons.org/licenses/by-nc-nd/3.0/de/deed.en_GB).
    In short, this license means that you are free to reproduce and
    distribute this document in any non-commercial manner, as long as
    you don't change the author's name (that's mine), and as long as the
    contents remain unchanged.

[^1]: If you're struggling with terms like &raquo;strings&laquo;,
    &raquo;loops&laquo;, or &raquo;pointers&laquo;, this booklet might not be for
    you.

[^2]: &raquo;Personal Information Manager&laquo; -- for you youngsters out
    there, that's a smartphone without connectivity.

[^3]: On a completely unrelated tangent, I'm convinced that one of the
    reasons BASIC has become much less popular today than many of the
    more strictly standardized languages like &raquo;C&laquo;, Python, or
    Ruby, is that though there actually *is* a standard for the
    language, it never has really been implemented. Rather, every BASIC
    dialect shows its own strengths and shortcomings, and one never
    really knows what one gets when one toys with a new dialect. This is
    one of the charms of working with BASIC, but of course it makes
    maintaining or porting software written in that language a
    nightmare.
    Back to our scheduled programme.

[^4]: Older ports for Palm OS, DOS, and several others are no longer
    actively maintained. While some of these versions are still around,
    they may miss many of the features described here.
