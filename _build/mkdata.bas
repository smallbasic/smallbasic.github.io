rem
rem reads reference.json to produce per page json data files
rem

const samplesPath = "/home/chrisws/src/smallbasic.samples/"

tload "reference.json", s, 1
ref = array(s)
keywords = []
map = {}

' create keywords array
for package in ref
  num_items = len(ref[package]) - 1
  for i = 0 to num_items
    item = ref[package][i]
    keywords << upper(item.keyword)
  next i
next package

' create map from keyword to array of samples
func walker(node)
  local fileName = node.path + "/" + node.name
  local found = {}
  local buffer, i, keyword

  tload fileName, buffer
  for i = 0 to len(buffer) - 1
    for keyword in keywords
      'have we already found keyword on another line
      if instr(upper(buffer(i)), keyword) != 0 && found[keyword] == 0 then
        map[keyword] << enclose(mid(fileName, len(samplesPath)), "\"")
        found[keyword] = 1
      endif
    next keyword
  next i
  return 1
end

dirwalk samplesPath, "*.bas", use walker(x)

func sortFunc(l, r)
  local f1 = lower(rightOfLast(l, "/"))
  local f2 = lower(rightOfLast(r, "/"))
  return iff(f1 == f2, 0, iff(f1 > f2, 1, -1))
end

' output the data
for package in ref
  num_items = len(ref[package]) - 1
  package_data = []
  for i = 0 to num_items
    item = ref[package][i]
    item.package = package
    item.samples = map[item.keyword]
    sort item.samples use sortFunc(x, y)
    filename = "_out/data/" + item.nodeId + "-" + lower(package) + "-" + lower(item.keyword) + ".json"
    filename = translate(filename, " ", "")
    buffer = str(item)
    tsave filename, buffer
    item_data = []
    item_data << "\"" + item.keyword + "\""
    item_data << "\"" + item.nodeId + "\""
    package_data << item_data
  next i

  filename = "_out/data/" + lower(package) + ".json"
  buffer = str(package_data)
  tsave filename, buffer

next package
