# Language

> a MOD b

Modulus. Equivalent syntax to the percent character, eg a % b

<pre>

' LOCATE MOD CHR ASC.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-23
' LOCATE row, column - sets the next print location on screen, rows down, columns across
' a MOD b - returns the remainder of a/b as integer 0 to b-1
'           for example odd number n mod 2 returns 1, while even number n mod 2 returns 0
'           n mod 10 returns 0,1,2,3,4,5,6,7,8 or 9  we will use this is demo
' CHR - returns the CHaRracter for the ASC number, for demo we will print a chart of CHR for ASC numbers 32-128
' ASC(Character) - is a number code for a print characters, 32 is the code for a space
' ? - is shortcut for PRINT
' RIGHT(string,n) - returns right most n characters of string
' STR(n) - returns a number in string form
' : - code statement seperator often used with LOCATE row, column : ? string
' PAUSE optional-number-of-secs - waits for key press or mouse click and/or for a number seconds 
' so lets user decide how long to wait
LOCATE 1,16 : ? "ASC Table 30-129:"  ' locate print spot, print title for our app
FOR column=0 to 9 'print a header, 10 numbers plus + (to add to row value)
  LOCATE 2,column*5+4 : ? "+";column
NEXT
FOR row=3 to 12
  LOCATE row,0 : ? RIGHT(" "+STR(row*10)+":",4)
NEXT
'main table
FOR ASCnumber=30 to 129   'note ASC(32) = space so wont see anything in Table
  row=ASCnumber\\10 ' \\ rounds division down to integer
  column=(ASCnumber MOD 10)*5+5  'times 5 to space out the characters printed plus 5 for column labels
  LOCATE row,column : ? CHR(ASCnumber)
NEXT
PAUSE

</pre>

<pre>

' more MOD.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-23
' n MOD m - returns the remainder of n divided by m, if 0 then m divides n perfectly
' another way to do MOD in SmallBASIC is to use symbol %, n%m is same as n MOD m
' MOD is great to tell if a number is divisible by another (leaves no remainders)
' a number not divisible by any number less to it other than 1, is called a prime number
' here we will list first 100 numbers and tell if prime or give the lowest divisor
'table setup: title header and row labels
LOCATE 0,0 : ? "P=Prime or Lowest Divisor Table"
FOR column=0 to 9 'print a header, 10 numbers plus + (to add to row value)
  LOCATE 2,column*2+7 : ? "+";column
NEXT
FOR row=3 to 12
  LOCATE row,0 : ? RIGHT("    "+STR(row*10-30)+":",6)
NEXT
'main table data
FOR n=1 to 99
  IF n=1 THEN 
    report=" O" 'one is one, neither prime nor not prime
  ELSE
    report=" P" 'letter code for Prime
    FOR i=2 TO n-1
      IF n%i=0 THEN  '<== if n MOD i=0 or n%i=0, THEN i divides n perfectly
        report=" "+STR(i):EXIT  'we found lowest divisor get out of loop
      END IF  
    NEXT
  END IF
  row=n\\10+3 'n\\10 is our number divided by 10 and rounded down, 
  'call it the tens row offset 3 rows down for title and header and blank line
  column=n%10*2+7 '<== use MOD to LOCATE the column (*2 column width + 7 row label offset) 
  LOCATE row,column :? report   '? short for print
NEXT
?:?"O=one is neither prime nor not" '  ?:?"..." print blank line first
PAUSE

</pre>

