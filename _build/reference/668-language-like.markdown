# LIKE

> a LIKE b

Regular-expression operator. Compares the left part of the expression with the right side regex pattern.


~~~

' From  Home -- Articles -- Welcome to SmallBASIC -- The operator LIKE :
' LIKE is a regular-expression operator. It is compares the left part of the
' expression with the pattern (right part).
'
' Since the original regular expression code is too big (for handhelds),
' I use only a subset of it, based on an excellent old stuff by J. Kercheval
' (match.c, public-domain, 1991).
' But there is an option to use PCRE (Perl-Compatible Regular Expression
' library) on systems that is supported (Linux); ( see OPTION:
'
'    Statement OPTION MATCH PCRE [CASELESS]|SIMPLE
'
'     Sets as default matching algorithm to (P)erl-(C)ompatible (R)egular
'     (E)xpressions library or back to simple one.
'     Matching-algorithm is used in LIKE and FILES.
'
'     PRCE works only in systems with this library and it must be linked with.
'     Also, there is no extra code on compiler which means that SB compiles
'     the pattern every time it is used. ).
'
' The same code is used for filenames (FILES, DIRWALK) too.
' In the pattern string:
'
'  * 	matches any sequence of characters (zero or more)
'  ? 	matches any character
'  [SET] 	matches any character in the specified set,
'  [!SET] or [^SET] 	matches any character not in the specified set.
'
' A set is composed of characters or ranges; a range looks like character
' hyphen character (as in 0-9 or A-Z). [0-9a-zA-Z_] is the minimal set of
' characters allowed in the [..] pattern construct.
'
' To suppress the special syntactic significance of any of "[]*?!^-\\",
' and match the character exactly, precede it with a  '\\'.
? "Hello" LIKE "*[oO]" : REM TRUE
? "Hello" LIKE "He??o" : REM TRUE
? "Hello" LIKE "hello" : REM FALSE
? "Hello" LIKE "[Hh]*" : REM TRUE
' Few more...
?
? "-[Hello]-" Like "\\-\\[?*\\]\\-" ' True
? Cbs("\\nFiles which start with Capital letter or _:\\n"); Files("[A-Z_]*")
? Cbs("\\nFiles which are NOT .bas or .BAS files:\\n"); Files("*[!.bas][!.BAS]")
If "It <strong>wasn't</strong> me!" Like "*<[!/]?*>*</?*>*" Then
  ? Cbs("\\nTrue, someone is using HTML tag...!")
Fi
link = "See also: http://www.regular-expressions.info/examples.html for demos."
If link Like "*http*://?*.?*" Then
  ? Cbs("\\nTrue, someone is advertising on our site...!")
Fi
Pause

~~~

