rem
rem reads the data json file produced by mkdata.bas
rem

unit page

export name
export help
export url
export title

filename = translate(command, "/reference1/", "/data/")
filename = translate(filename, "/reference2/", "/data/")
filename = translate(filename, ".html", ".json")

if (not exist(filename)) then
  throw "File does not exist:" + filename
endif

tload filename, s, 1
item = array(s)
name = item.keyword
help = item.help
url = item.nodeId
title = item.signature

