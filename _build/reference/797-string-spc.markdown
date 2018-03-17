# SPC

> SPC (n)

Returns a string of n spaces.

These are excellent for maintaining a fixed length string or buffer or record or refining screen output by inserting a specified amount of spaces in a string. This works well with LEFT and RIGHT keywords for Left Center or Right aligning text.

~~~

'here are right aligned numbers in 10 character length string between two single quote marks
while 1
  myNumber=(rnd*10^(rnd*4)\\1)\\1
  ? "'";RIGHT(SPC(10)+STR(myNumber),10);"'";SPC(3)+"press a key or click for next..."
  pause
wend

~~~

I think SPACE and SPC are both the same, see also SPACE.


