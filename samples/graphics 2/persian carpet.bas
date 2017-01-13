
'Persian Carpet.bas for SmallBASIC 0.12.2 [B+=MGA] 2016-02-08
'modified from copy from Retrogamecoding link 2016-02-08
'modified some more for Code Library and On-line Samples
REM BASIC Code: Persian Carpet Designs 
REM A modification of original concept from Anne Burns
REM Try colorborder=15, a=3
colorborder=0:a=1
while 1
  'cls
  'INPUT "Enter the border color, 1 - 15 (try 15): ", colorborder
  'INPUT "Enter a value (try 3) > ", a
  CLS
  lft = 1
  'rght=1025 'not symmetric
  rght = 513
  'rght=401
  'rght=257
  'rght=129
  'rght=65
  top = 1
  'bot= 1025 'not symmetric
  bot=513
  'bot = 401
  'bot= 257
  'bot=129
  'bot=65
  LINE lft,top,rght,top,colorborder
  LINE lft,bot,rght,bot,colorborder
  LINE lft,top,lft,bot,colorborder
  LINE rght,top,rght,bot,colorborder
  DetermineColor lft, rght, top, bot, a
  'next line no good for on-line samples
  'at 50,600:? "colorboarder = ";colorborder;" a = ";a
  showpage
  delay 1000
  a=a+1
  if a>=16 then a=1:colorborder+=1
  if colorborder>=16 then colorborder=0
wEND

REM Determine the color based on function f
sub DetermineColor(lft, rght, top, bot, a)
  local c,middlerow,middlecol
  IF (lft < rght - 1) THEN
    c = f(lft, rght, top, bot, a)
    middlecol = int((lft + rght) / 2)
    middlerow = int((top + bot) / 2)
    LINE lft + 1, middlerow,rght - 1, middlerow, c
    LINE middlecol, top + 1, middlecol, bot - 1, c
    DetermineColor lft, middlecol, top, middlerow, a
    DetermineColor middlecol, rght, top, middlerow, a
    DetermineColor lft, middlecol, middlerow, bot, a
    DetermineColor middlecol, rght, middlerow, bot, a
  else
    exit
  END IF
END

REM When b=4, this function takes an average.
FUNC f(lft, rght, top, bot, a)
  local p,b
  p = POINT(lft, top) + POINT(rght, top) + POINT(lft, bot) + POINT(rght, bot)
  'Try values of b = 4 or b = 7
  b=7
  f = (p /b + a) MOD 16
END
