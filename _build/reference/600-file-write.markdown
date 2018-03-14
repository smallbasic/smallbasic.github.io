# File

> WRITE #fileN; var1 [, ...]

Store variables to a file as binary data.


<p>The READ/WRITE command set is used to store variables to a file as binary data.
<p>The common problem with INPUT/PRINT set is there are many conflicts with data.
<pre>PRINT #1; "Hello, world"
<p>The above example only wrote one string and you want read it in one variable, but this is impossible for INPUT command to understand, because INPUT finds the separator comma, so it thinks there are two variables not one.
<p>So, now, you can store arrays, strings etc and what you write is what you will read the next time.
_The parameters can be variables ONLY._
_Its very bad idea to mixed READ/WRITE commands with INPUT/PRINT commands in the same file._

This is how to store numeric arrays into files, WRITE # and read them out again, READ #. The graphic example is longer but also useful as utility...
<pre>

' WRITE READ.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-03
const secwide=200
const sechigh=200
dim sect(secwide,sechigh)
dim fsect(secwide,sechigh)
for i=1 to 100
  if rnd<.5 then
    circle rnd*xmax,rnd*ymax,rnd*100,1,7+(rnd*9)\\1
  else
    circle rnd*xmax,rnd*ymax,rnd*100,1,7+(rnd*9)\\1 filled
  fi
next
getsec 200,400          '<== load array with data
rect 200,400,400,600,15 '<=== draw square around the section captured
savesect                '<== array data to file
input "OK press enter for write read test ";temp
cls
loadsect     '<== file data to array
x=100:y=100
while 1
  cls
  drwsec x,y '<== using data from file
  showpage
  delay 10
  x=x+5:y=y+5
wend
sub savesect
  open "READ WRITE test.dat" for output as #1
  local x,y
  for y=0 to sechigh
    for x=0 to secwide
      write #1,sect(x,y) '<==== array data to file
    next
  next
  close #1
end
sub loadsect
   open "READ WRITE test.dat" for input as #1
  local x,y
  for y=0 to sechigh
    for x=0 to secwide
      read #1,fsect(x,y)  '<=== load file array
    next
  next
  close #1 
end
sub getsec(xstart,ystart)
  local x,y
  'these are all global
  for y=0 to sechigh
    for x=0 to secwide
      sect(x,y)=POINT(xstart+x,ystart+y) '<== data from screen points
    next
  next
end 
sub drwsec(leftx,topy)
  local x,y
  for y=0 to sechigh
    for x=0 to secwide
      pset x+leftx,y+topy,fsect(x,y) '<== array from file
    next
  next
end 

</pre>


<pre>

' This demo sets properties of each tile in a matrix,
' then it stores the array in config file,
' then it loads the array from that config file.
' Note: WRITE/READ are using binary format for storing numbers, therefore
'       number 1, for example, takes the same space as number -26845339.14
Const TILES_X    = 20 ' Maximum tiles in x axis
Const TILES_Y    = 15 ' Maximum tiles in y axis
Const PROPERTIES = 3  ' Maximum properties for each tile in the matrix.
Const P_FILENAME = 1 ' Some demo properties for each tile
Const P_FILETYPE = 2
Const P_HIDE     = 3
' Create 3-dimension array to store tiles properties:
Dim tile(1 To TILES_X, 1 To TILES_Y, 1 To PROPERTIES)
' Demo to set a single tile properties, at x,y=10,2 in matrix:
tile(10, 2, P_FILENAME) = "bricks.bmp" ' file name to load tile from
tile(10, 2, P_FILETYPE) = "BMP16"      ' format of tile-file  
tile(10, 2, P_HIDE)     = 1            ' hide/show [1/0] this tile
 
' Save tiles in config file 1:
Open "tiles1.cfg" For Output As #1
For y = 1 To TILES_Y
  For x = 1 To TILES_X
    For p = 1 To PROPERTIES
      Write #1; tile(x, y, p)
    Next p
  Next x
Next y
Close #1
' Load tiles from config file 1:
Open "tiles1.cfg" For Input As #1
For y = 1 To TILES_Y
  For x = 1 To TILES_X
    For p = 1 To PROPERTIES
      Read #1; tile(x, y, p)
    Next p
  Next x
Next y
Close #1
' Print demo of a single tile properties, at x,y=10,2 in matrix:
? "File name to load tile from: "; tile(10, 2, P_FILENAME)
? "Format of tile-file: "; tile(10, 2, P_FILETYPE)
? "Hide/Show [1/0] this tile: "; tile(10, 2, P_HIDE)
Pause

</pre>

