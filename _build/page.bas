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
export lastedit
export package

githost = "https://github.com/smallbasic/smallbasic.github.io"

jsonFile = translate(command, "/reference1/", "/data/")
jsonFile = translate(jsonFile, "/reference2/", "/data/")
jsonFile = translate(jsonFile, ".html", ".json")
sourcefile = ""

if (not exist(jsonFile)) then
  rem regular page
  pagename = translate(command,  "pages1", "")
  pagename = translate(pagename, "pages2", "")
  pagename = translate(pagename, "pages3", "")
  pagename = translate(pagename, "pages4", "")
  pagename = translate(pagename, "pages", "")
  pagename = translate(pagename, "_out", "")
  pagename = translate(pagename, "/", "")
  pagename = translate(pagename, ".html", "")

  item = ""
  name = pagename
  help = "SmallBASIC | One more basic"
  url = "/" + pagename + ".html"
  title = pagename
  package = ""
  sourcefile = "pages/" + pagename + ".markdown"
else
  rem reference page
  tload jsonFile, s, 1
  item = array(s)
  name = item.keyword
  help = item.help
  url = item.nodeId
  title = item.signature
  package = item.package
  sourcefile = item.nodeId + "-" + lower(item.package) + "-" + lower(item.keyword) + ".markdown"
  sourcefile = "reference/" + translate(sourcefile, " ", "")
endif

lastedit = run("git log -1 --format=\"%cD by %cn\" -- " + sourcefile)
sourceurl = githost + "/blob/master/_build/" + sourcefile
changesurl = githost + "/commits/master/_build/" + sourcefile

