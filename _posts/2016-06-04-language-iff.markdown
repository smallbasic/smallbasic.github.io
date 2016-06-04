---
layout: post
title:  "IFF"
categories: language
---
Language

IFF expr

Inline version of IF. eg, animal = "cat": fur = IFF( animal = "cat", "yes", "no"): ? fur

animal=IFF(HasFur=1,"Cat","Fish")
or
? IFF(animal="cat"," has fur.", " might not have fur.")
?
```

' RND - returns a number from 0 to almost 1
' IFF - IFF(conditional statement to evaluate, return this if evaluates true, returns this if evaluates false)
FOR i=1 TO 20 'need a random true/false, subst 0 or 1 (or -1)  ;)
  ? IFF(rnd<.5,"True ","False ");   '<======================== RND and IFF
next
?:?
FOR i=1 TO 10  'need a random direction back and forth
  dir=IFF(RND<.5,-360*RND,360*RND)  '<======================== RND and IFF
  ? USING " ####.0000"; dir;
NEXT
?:?
PAUSE

```

