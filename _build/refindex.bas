unit refindex

export build
export build_all

sub build(label_str, package)
  tload "reference.json", s, 1
  local ref = array(s)
  local num_items = len(ref[package]) - 1
  local i, item

  print ("<div class=\"article\">")
  print ("<h1>" + label_str + "</h1>")
  print ("<blockquote>" + label_str + "</blockquote>")
  print ("<div class=\"siteSub\">")
  print ("<p><a href=\"/\">Home</a> &gt;")
  print ("<a href=\"/pages/reference.html\">Reference</a></p>")
  print ("</div>")
  print ("<div class=\"contentsPanel\">")
  print ("<div class=\"contentsHeader\">Contents</div><ul>")

  func cmpfunc(a, b)
    return iff(a.keyword == b.keyword, 0, iff(a.keyword < b.keyword, -1, 1))
  end
  sort ref[package] use cmpfunc(x,y)

  for i = 0 to num_items
    item = ref[package][i]
    print("<li><a href=\"/reference/" + item.nodeId + ".html\">" + item.keyword + "</a></li>")
  next i
  print ("</ul></div></div>")
end  

sub build_all()
  local s, i, j, keywords  
  tload "reference.json", s, 1
  local ref = array(s)

  for i in ref
    for j = 0 to len(ref[i]) - 1
      keywords << [ref[i][j].keyword, ref[i][j].help, ref[i][j].nodeID]
      print 
    next j
  next i

  func cmpfunc(a, b)
    return iff(a[0] == b[0], 0, iff(a[0] < b[0], -1, 1))
  end

  sort keywords use cmpfunc(x,y)

  for i = 0 to len(keywords) - 1
    print ("<a title=\"" + keywords[i][1] + "\" href=\"/reference/" + keywords[i][2] + ".html\">" + keywords[i][0] + "</a>&nbsp;")
  next i  
end  

