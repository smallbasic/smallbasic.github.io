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
export samples

githost = "https://github.com/smallbasic/smallbasic.github.io"

jsonFile = translate(command, "/reference1/", "/data/")
jsonFile = translate(jsonFile, "/reference2/", "/data/")
jsonFile = translate(jsonFile, ".html", ".json")
sourcefile = ""

if (not exist(jsonFile)) then
  rem non reference page, could be either "pages", "scripts" or "posts"
  pagename = translate(command,  "pages2", "")
  pagename = translate(pagename, "pages3", "")
  pagename = translate(pagename, "pages", "")
  pagename = translate(pagename, "posts2", "")
  pagename = translate(pagename, "posts3", "")
  pagename = translate(pagename, "posts", "")
  pagename = translate(pagename, "scripts", "")
  pagename = translate(pagename, "_out", "")
  pagename = translate(pagename, "/", "")
  pagename = translate(pagename, ".html", "")

  item = ""
  name = iff(pagename=="index", "one more basic", pagename)
  help = "SmallBASIC | One more basic"
  url = "/" + pagename + ".html"
  title = pagename
  package = ""
  sourcefile = "pages/" + pagename + ".markdown"
  if (not exist(sourcefile)) then
    sourcefile = "scripts/" + pagename + ".html"
    if (not exist(sourcefile)) then
      sourcefile = "posts/" + pagename + ".markdown"
    endif
  endif
  samples = ""
else
  rem reference page
  tload jsonFile, s, 1
  item = array(s)
  name = item.keyword
  help = item.help
  url = item.nodeId
  title = item.signature
  package = item.package
  samples = item.samples
  sourcefile = item.nodeId + "-" + lower(item.package) + "-" + lower(item.keyword) + ".markdown"
  sourcefile = "reference/" + translate(sourcefile, " ", "")
endif

lastedit = run("git log -1 --format=\"%cD\" -- " + sourcefile)
sourceurl = githost + "/blob/master/_build/" + sourcefile
changesurl = githost + "/commits/master/_build/" + sourcefile

