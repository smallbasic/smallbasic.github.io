rem
rem copies the generated reference html to the live site folder
rem

tload "reference.json", s, 1
ref = array(s)
for package in ref
  num_items = len(ref[package]) - 1
  for i = 0 to num_items
    item = ref[package][i]
    in_filename = "_out/reference3/" + item.nodeId + "-" + lower(package) + "-" + translate(lower(item.keyword), " ", "") + ".html"
    out_filename = "../reference/" + item.nodeId + ".html"
    if (not exist(in_filename)) then
      throw "File does not exist:" + in_filename
    endif
    copy in_filename, out_filename
  next i
next package

