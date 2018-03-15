rem
rem reads reference.json to produce per page json data files
rem

tload "reference.json", s, 1
ref = array(s)
for package in ref
  num_items = len(ref[package]) - 1
  package_data = []
  for i = 0 to num_items
    item = ref[package][i]
    item.package = package
    filename = "_out/data/" + item.nodeId + "-" + lower(package) + "-" + lower(item.keyword) + ".json"
    filename = translate(filename, " ", "")
    buffer = str(item)
    tsave filename, buffer
    item_data = []
    item_data << item.keyword
    item_data << item.nodeId
    package_data << item_data
  next i

  filename = "_out/data/" + lower(package) + ".json"
  buffer = str(package_data)
  tsave filename, buffer

next package
