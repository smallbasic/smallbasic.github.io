'
' adds syntax highlight handling for code blocks
'

tload trim(command), buffer
inBlock = false
for s in buffer
  if (trim(s) == "```smallbasic") then
    ' highlight marker already applied here
    print(s)
    inBlock = true
  else if (trim(s) == "```" || trim(s) == "~~~") then
    ' block start or end
    if (inBlock) then
      print "```"
    else
      print "```smallbasic"
    endif
    inBlock = !inBlock
  else
    print(s)
  endif
next
