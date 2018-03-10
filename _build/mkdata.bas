tload "reference.json", s, 1
ref = array(s)
out = {}
for package in ref
  num_items = len(ref[package]) - 1
  for i = 0 to num_items
    item = ref[package][i]
    filename = "_out/reference2/" + item.nodeId + "-" + lower(package) + "-" + lower(item.keyword) + ".html"
    out[filename] = item
  next i
next package

print out