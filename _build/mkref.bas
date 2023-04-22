rem
rem generate single text file reference
rem

tload "reference.json", s, 1
ref = array(s)
counter = 0

out "SmallBASIC Language reference [" + date + "]"
out ""
out "░██████╗███╗░░░███╗░█████╗░██╗░░░░░██╗░░░░░██████╗░░█████╗░░██████╗██╗░█████╗░
out "██╔════╝████╗░████║██╔══██╗██║░░░░░██║░░░░░██╔══██╗██╔══██╗██╔════╝██║██╔══██╗
out "╚█████╗░██╔████╔██║███████║██║░░░░░██║░░░░░██████╦╝███████║╚█████╗░██║██║░░╚═╝
out "░╚═══██╗██║╚██╔╝██║██╔══██║██║░░░░░██║░░░░░██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗
out "██████╔╝██║░╚═╝░██║██║░░██║███████╗███████╗██████╦╝██║░░██║██████╔╝██║╚█████╔╝
out "╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░
out ""

s = ""
mk_cloud("Console", s)
mk_cloud("Data", s)
mk_cloud("Date", s)
mk_cloud("File", s)
mk_cloud("Graphics", s)
mk_cloud("Language", s)
mk_cloud("Math", s)
mk_cloud("String", s)
mk_cloud("System", s)
out s
out ""

mk_ref("Console")
mk_ref("Data")
mk_ref("Date")
mk_ref("File")
mk_ref("Graphics")
mk_ref("Language")
mk_ref("Math")
mk_ref("String")
mk_ref("System")

func cmpfunc(a, b)
  return iff(a.keyword == b.keyword, 0, iff(a.keyword < b.keyword, -1, 1))
end

sub out(s)
  print s
end

sub box(s)
  local l = len(s)
  local span = "+========================================================================================+"
  if (l % 2 == 1) then
    s += " "
  endif
  local g = (len(span) - l) / 2
  out span
  out "|" + space(g) + s + space(g - 2) + "|"
  out span
end

sub mk_ref(package)
  local i, j, fileName, buffer, item
  local num_items = len(ref[package]) - 1
 
  sort ref[package] use cmpfunc(x,y)
  for i = 0 to num_items
    item = ref[package][i]
    counter++
    box counter + ". (" + package + ") " + item.keyword
    out("")
    out(item.signature)
    
    fileName = "_out/reference_txt/" + item.nodeID + "-" + lower(package) + "-" + lower(translate(item.keyword, " ", "")) + ".txt"
    try 
      tload fileName, buffer, 0
      for j = 3 to len(buffer) - 1
        out buffer[j]
      next j
    catch e
      print fileName
      throw e
    end try
  next i
end

sub mk_cloud(package, byref s)
  local i
  local num_items = len(ref[package]) - 1
 
  sort ref[package] use cmpfunc(x,y)
  for i = 0 to num_items
    s += ref[package][i].keyword + " "
    if (len(s) > 100) then
      out s
      s = ""
    endif
  next i
end
