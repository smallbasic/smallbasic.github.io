rem
rem generate sbasic_ref.csv
rem

tload "reference.json", s, 1
ref = array(s)
counter = 0
const maxHelp = 120

func cmpfunc(a, b)
  local keyword = iff(a.keyword == b.keyword, 0, iff(a.keyword < b.keyword, -1, 1))
  return iff(a.type == b.type, keyword, iff(a.type < b.type, -1, 1))
end

sub out(s)
  print s
end

mk_ref("Console")
mk_ref("Data")
mk_ref("Date")
mk_ref("File")
mk_ref("Graphics")
mk_ref("Language")
mk_ref("Math")
mk_ref("String")
mk_ref("System")

sub mk_ref(package)
  local i, fileName, buffer, item, row, signature, help
  local num_items = len(ref[package]) - 1

  sort ref[package] use cmpfunc(x,y)
  for i = 0 to num_items
    item = ref[package][i]

    fileName = "reference/" + item.nodeID + "-" + lower(package) + "-" + lower(translate(item.keyword, " ", "")) + ".markdown"
    try
      tload fileName, buffer, 0
      '# TICKS
      '
      '> TICKS
      '
      'Returns the number of milliseconds that have elapsed since start of the operating system.
      '
      ' ====>
      '
      'Console,command,AT,521,"AT x, y","Moves the console cursor to the specified position. x,y are in pixels."
      '
      signature = translate(translate(mid(buffer[2], 3), "\"", "\"\""), "`", "")
      help = translate(translate(buffer[4], "\"", "\"\""), "`", "")
      for h = 5 to min(15, len(buffer) - 5)
        help = help + " " + translate(translate(translate(translate(buffer[h], "\"", "\"\""), "`", ""), "-", ""), "~", "")
      next
      if (len(help) > maxHelp) then
        help = left(help, maxHelp) + " ..."
      endif
      row = package + "," + item.type + "," + item.keyword + "," + item.nodeID + ",\"" + signature + "\",\"" + help + "\""
      out row
    catch e
      print fileName
      throw e
    end try
  next i
end

