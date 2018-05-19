'http://www.gibney.de/parallax_primes
'https://news.ycombinator.com/item?id=17103157

packSize = 10 ' Number of integers per cell
const cellSize = 8

func isPrime(n)
  local s = sqr(n)
  local i = 2
  while i <= s
    if (n % i == 0) then return false
    i++
  wend
  return n > 1
end

func packHasPrimes(num, y)
  local i
  for i = 0 to packSize 
    if (isPrime(num)) then return true
    num += y
  next i
  return false
end

sub drawPattern
  local black = rgb(0,20,0)
  local red = rgb(120,0,0)
  local x, y, col, x1, y1
  local curNum = 1

  for y = 1 to 80
    for x = 0 to y
      col = iff(packHasPrimes(curNum + x, y), black, red)
      x1 = xmax / 2  + (x * cellSize) - (y * cellSize / 2)
      y1 = (y * cellSize)
      rect x1, y1, x1 + cellSize, y1 + cellSize, col filled
    next x
    curNum += packSize * y
  next y
end

color 1,rgb(40,50,0): cls
for packSize = 1 to 50
  drawPattern
  showpage
  delay 100
next
pause
