---
layout: post
title:  "LOCAL"
categories: language
---
Language

LOCAL

Declare local variables inside a SUB or FUNC. Local variables no longer exist once the SUB or FUNC has returned.

```

' LOCAL.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-30
'with the LOCAL keyword varaibles are treated separately 
'from those in main code with the same name even in a GOSUB
var=1
? "var before GOSUB gs1000 ";var
GOSUB gs1000
? "var after return from GOSUB gs1000 ";var
?
var=1
? "var before GOSUB LOCAL_gs1000 ";var
GOSUB LOCAL_gs1000
? "var after return from GOSUB LOCAL_gs1000 ";var
pause
end
label gs1000
var=1000
return
label LOCAL_gs1000
local var
var=1000
return

```

```

' DEF and LOCAL.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-06
'can I use DEF locally in a sub without interfering with main variable or DEF names
def aboutMe() = "I am texting from main code."
? "Hi, ";aboutMe
mySub
? "Goodbye, ";aboutMe
pause
sub mySub()
  'local def aboutMe() = "I am texting from mySub." '<=== note: this did not work 
  local aboutMe
  def aboutMe() = "I am texting from mySub."
? "Hi, ";aboutMe
end

```

