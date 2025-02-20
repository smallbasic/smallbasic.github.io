#
# smallbasic.github.io site generator
#
# 1. create reference markdown from drupal export
# $ sbasic mkref.bas sb_ref.json markdown
#
# 2. create reference.json from
# $ sbasic mksite.bas
#

.SECONDARY :
.PHONY : all clean spell

# tools
sbasic = sbasic
pandoc = /usr/bin/pandoc

# variables
mkdir = @mkdir -p $(dir $@)
out = _out
pandoc_options=--from markdown-tex_math_dollars --to html5 --syntax-definition=smallbasic.xml
pandoc_ide_options=--from markdown-tex_math_dollars --to html5
bas = $(patsubst layouts/%.html, $(out)/%.bas, $(wildcard layouts/*.html))
pages = $(patsubst pages/%.markdown, $(out)/pages3/%.html, $(wildcard pages/*.markdown))
scripts = $(patsubst scripts/%.html, $(out)/scripts2/%.html, $(wildcard scripts/*.html))
reference = $(patsubst reference/%.markdown, $(out)/reference3/%.html, $(wildcard reference/*.markdown))
reference_txt = $(patsubst reference/%.markdown, $(out)/reference_txt/%.txt, $(wildcard reference/*.markdown))
reference_ide = $(patsubst reference/%.markdown, $(out)/reference_ide/%.html, $(wildcard reference/*.markdown))

# rules
.data: reference.json page.bas site.bas mkdata.bas includes/header.html
	@mkdir -p $(out)/data
	$(sbasic) mkdata.bas

$(out)/%.bas: layouts/%.html .data
	$(mkdir)
	$(sbasic) mkpage.bas $< > $@

$(out)/reference0/%.markdown: reference/%.markdown
	$(mkdir)
	$(sbasic) mkhl.bas $< > $@

$(out)/reference1/%.html: $(out)/reference0/%.markdown $(bas)
	$(mkdir)
	$(pandoc) $(pandoc_options) -o $@ $<

$(out)/reference2/%.html: $(out)/reference1/%.html $(bas)
	$(mkdir)
	$(sbasic) $(out)/reference.bas $< > $@

$(out)/reference3/%.html: $(out)/reference2/%.html
	$(mkdir)
	$(sbasic) $(out)/sitepage.bas $< > $@

$(out)/pages/%.html: pages/%.markdown
	$(mkdir)
	$(pandoc) $(pandoc_options) -o $@ $<

$(out)/pages2/%.html: $(out)/pages/%.html $(bas)
	$(mkdir)
	$(sbasic) $(out)/article.bas $< > $@

$(out)/pages3/%.html: $(out)/pages2/%.html
	$(mkdir)
	$(sbasic) $(out)/sitepage.bas $< > $@

$(out)/scripts/%.bas: scripts/%.html $(bas) refindex.bas
	$(mkdir)
	$(sbasic) mkpage.bas $< > $@

$(out)/scripts/%.html: $(out)/scripts/%.bas
	$(mkdir)
	$(sbasic) $< > $@

$(out)/scripts2/%.html: $(out)/scripts/%.html
	$(mkdir)
	$(sbasic) $(out)/sitepage.bas $< > $@

$(out)/reference_txt/%.txt: reference/%.markdown
	$(mkdir)
	$(pandoc) --from markdown-tex_math_dollars --to plain -o $@ $<

$(out)/reference_ide/%.html: reference/%.markdown
	$(mkdir)
	$(pandoc) $(pandoc_ide_options) -o $@ $<

all: $(reference) $(reference_ide) $(out)/sbref.txt $(out)/sbasic_ref.csv $(pages) $(posts) $(scripts)
	@mkdir -p ../reference/ide
	@mkdir -p ../pages
	@$(sbasic) deploy.bas
	@cp $(out)/sbref.txt ../reference/
	@cp $(out)/pages3/*.html ../pages
	@cp $(out)/scripts2/*.html ../pages
	@mv ../pages/index.html ../
	@cp layouts/index.html ../pages
	@cp layouts/index.html ../samples
	@cp layouts/index.html ../reference
	@cp layouts/index.html ../reference/ide

$(out)/sbref.txt : $(reference_txt) mkref.bas
	@$(sbasic) mkref.bas > $(out)/sbref.txt

$(out)/sbasic_ref.csv : mkrefcsv.bas
	@$(sbasic) mkrefcsv.bas > $(out)/sbasic_ref.csv

clean:
	rm -rf $(out) *.sbu

spell:
	@enchant -l pages/*.markdown | sort | uniq | diff pages.dict -
	@enchant -l reference/*.markdown | sort | uniq | diff reference.dict -
