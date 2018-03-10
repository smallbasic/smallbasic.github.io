### String

> BCS (s)

Converts (B)ASIC-style strings to (C)-style (S)trings.

<pre>

' Note: BCS allows to save special formatting characters as a regular text (or
'       you could directly use C-Style formatting without using BCS at all).
' --- Formatting strings/characters/functions:
' " and \\ are common to SB and C - so to avoid problems use C-Style directly:
Const DQM = "\\x22" ' " character as C-Style string (Double Quotation Mark)
Const BKS = "\\x5C" ' \\ character as C-Style string (Back Slash)
' CHR(0) signals the End-Of-String in C-String (Null-Terminated-String):
Const NTS = "\\0"   
' Special formating strings:
Const CSI = Chr(27) + "["      ' Control Sequence Introducer
Const CSI_NORMAL = CSI + "0m"  ' Reset all terminal attributes
Const CSI_YELLOW = CSI + "33m" ' Supported foreground colors (30m-37m)
Const CSI_CYAN   = CSI + "36m"
Const CSI_WHITE  = CSI + "37m"
Const CSI_BOLD   = CSI + "1m"  ' = Cat(1)
Const CSI_ULINE  = CSI + "4m"  ' = Cat(2)
' Special formating characters:
Const C0_HT = Chr(9)           ' HT  - Horizontal Tabulation (tab) (-C- \\t)
Const C0_LF = Chr(10)          ' LF  - Line Feed (-C- \\n)
Const C0_FF = Chr(12)          ' FF  - Form Feed (clear screen) (-C- \\f)
Const C0_CR = Chr(13)          ' CR  - Carriage Return (-C- \\r)
Const C0_NL = C0_CR + C0_LF    ' CNL - Cursor Next Line (Windows style for \\n)
Def tb(n) = String(n, C0_HT)   ' few tabs (HT)
Def nl(n) = String(n, C0_NL)   ' few New lines (CNL)
' Headings text formats:
Const NEW_PAGE = Bcs(CSI_NORMAL + C0_FF)
Def H1(s) = Bcs(nl(2) + tb(5) + CSI_BOLD + CSI_WHITE + s + CSI_NORMAL + nl(1))
Def H2(s) = Bcs(nl(1) + tb(1) + CSI_ULINE + CSI_YELLOW + s + CSI_NORMAL + nl(1))
Def H3(s) = Bcs(nl(1) + tb(2) + CSI_ULINE + CSI_CYAN + s + CSI_NORMAL + nl(1))
' Normal text formats:
Func T2(s) = Bcs(tb(1) + s)
Func T3(s) = Bcs(tb(2) + s)

' --- Start demo:
' Convert some text to C-Style strings, and append to t array:
t << NEW_PAGE
t << H1("Main Title")
t << H2("Sub Title")
t << T2("Some " + DQM + "text" + DQM + " in English,")
t << T2("Some " + BKS + "more text" + BKS + " in English -")
t << T2("And even more text in English.")
t << H3("Sub-Sub Title")
t << T3("And again! text in English;")
t << T3("That's it." + NTS + "This text is hidden from C ... :)")
' Save t array in a Regular text file (as C-Style strings):
Tsave "demo-doc.txt", t
' Load lines from text file into a array:
Tload "demo-doc.txt", a 
' Convert C-Style strings back to Basic-Style strings and print them:
For i in a
  ? Cbs(i)
Next
Pause
' "demo-doc.txt" file will contain these lines:
' ---------------------------------------------
' \\e[0m\\f
' \\r\\n\\r\\n\\t\\t\\t\\t\\t\\e[1m\\e[37mMain Title\\e[0m\\r\\n
' \\r\\n\\t\\e[4m\\e[33mSub Title\\e[0m\\r\\n
' \\tSome \\x22text\\x22 in English,
' \\tSome \\x5Cmore text\\x5C in English -
' \\tAnd even more text in English.
' \\r\\n\\t\\t\\e[4m\\e[36mSub-Sub Title\\e[0m\\r\\n
' \\t\\tAnd again! text in English;
' \\t\\tThat's it.\\0This text is hidden from C ... :)

</pre>

