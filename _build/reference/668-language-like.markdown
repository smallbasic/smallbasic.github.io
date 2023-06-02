# LIKE

> c = a LIKE b

Regular-expression operator. Compares the left part `a` of the expression with the right side regex pattern `b` and returns `true` or `false`.

- `*` matches any sequence of characters (zero or more)
- `?` 	matches any character
- `[SET]` 	matches any character in the specified set
- `[!SET]` or `[^SET]` matches any character not in the specified set

A set is composed of characters or ranges. A range is defined by character - hyphen - character (as in 0-9 or A-Z).
`[0-9a-zA-Z_]` is the minimal set of characters allowed in the `[..]` pattern construct. To suppress the special
syntactic significance of any of `"[]*?!^-\`, and match the character exactly, precede it with a  `\\`.

For more information about regular-expressions please see http://www.regular-expressions.info/examples.html.

### Option for matching algorithm

> OPTION MATCH PCRE [CASELESS]|SIMPLE

`PCRE` sets as default matching algorithm to (P)erl-(C)ompatible (R)egular (E)xpressions library or back to simple one with `SIMPLE`.

### Example 1

```
print "Hello" LIKE "*[oO]"                ' Output 1
print "Hello" LIKE "He??o"                ' Output 1
print "Hello" LIKE "hello"                ' Output 0
print "Hello" LIKE "[Hh]*"                ' Output 1
print "-[Hello]-" Like "\\-\\[?*\\]\\-"   ' Output 1
```


