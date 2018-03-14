rem
rem reads the data json file produced by mkdata.bas
rem

unit page

export name
export help
export url
export title
export sourceurl
export changesurl

filename = translate(command, "/reference1/", "/data/")
filename = translate(filename, "/reference2/", "/data/")
filename = translate(filename, ".html", ".json")

if (not exist(filename)) then
  item = ""
  name = ""
  help = ""
  url = ""
  title = ""
  sourceurl = ""
  changesurl = ""
else
  tload filename, s, 1
  item = array(s)
  name = item.keyword
  help = item.help
  url = item.nodeId
  title = item.signature
  filepath = item.nodeId + "-" + lower(item.package) + "-" + lower(item.keyword) + ".markdown"
  filepath = "_build/reference/" + translate(filepath, " ", "")
  sourceurl = "https://github.com/smallbasic/smallbasic.github.io/blob/master/" + filepath
  changesurl = "https://github.com/smallbasic/smallbasic.github.io/commits/master/" + filepath
endif


