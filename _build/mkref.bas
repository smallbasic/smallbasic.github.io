rem
rem generate single text file reference
rem

tload "reference.json", s, 1
ref = array(s)
counter = 0

out "SmallBASIC Language reference"
out ""
out "   _____                 _ _ ____           _____ _____ _____"
out "  / ____|               | | |  _ \   /\    / ____|_   _/ ____|"
out " | (___  _ __ ___   __ _| | | |_) | /  \  | (___   | || |"
out "  \___ \| '_ ` _ \ / _` | | |  _ < / /\ \  \___ \  | || |"
out "  ____) | | | | | | (_| | | | |_) / ____ \ ____) |_| || |____"
out " |_____/|_| |_| |_|\__,_|_|_|____/_/    \_\_____/|_____\_____|"
out ""
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
  local i, fileName, buffer
  local num_items = len(ref[package]) - 1
 
  sort ref[package] use cmpfunc(x,y)
  for i = 0 to num_items
    item = ref[package][i]
    counter++
    box counter + ". (" + package + ") " + item.keyword
    
    fileName = "_out/reference_txt/" + item.nodeID + "-" + lower(package) + "-" + lower(translate(item.keyword, " ", "")) + ".txt"
    try 
      tload fileName, buffer, 1
      out buffer
    catch e
      print fileName
      throw e
    end try
  next i
end
