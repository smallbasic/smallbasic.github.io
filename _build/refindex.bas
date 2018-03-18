unit refindex

export build

sub build(label_str, package)
  tload "reference.json", s, 1
  local ref = array(s)
  local num_items = len(ref[package]) - 1
  local i, item

  print ("<div class=\"article\">")
  print ("<h1>" + label_str + "</h1>")
  print ("<blockquote>" + label_str + "</blockquote>")
  print ("<div class=\"siteSub\">")
  print ("<p><a href=\"/pages/index.html\">Home</a> &gt;")
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
