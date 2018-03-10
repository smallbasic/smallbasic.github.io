unit page

export name
export help
export url
export title

tload "page.json", s, 1
dat = array(s)
item = dat[command]

name = item.keyword
help = item.help
url = item.nodeId
title = item.signature
