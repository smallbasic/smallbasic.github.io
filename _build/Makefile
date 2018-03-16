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
.PHONY : all clean

# tools
sbasic = /home/chrisws/src/SmallBASIC/src/platform/console/sbasic
pandoc = /usr/bin/pandoc

# variables
mkdir = @mkdir -p $(dir $@)
out = _out
pandoc_options=--to html5
bas = $(patsubst layouts/%.html, $(out)/%.bas, $(wildcard layouts/*.html))
pages = $(patsubst pages/%.markdown, $(out)/pages4/%.html, $(wildcard pages/*.markdown))
reference = $(patsubst reference/%.markdown, $(out)/reference3/%.html, $(wildcard reference/*.markdown))

# rules
.data: reference.json page.bas site.bas mkdata.bas includes/header.html
	@mkdir -p $(out)/data
	$(sbasic) mkdata.bas

$(out)/%.bas: layouts/%.html .data
	$(mkdir)
	$(sbasic) mkpage.bas $< > $@

$(out)/reference1/%.html: reference/%.markdown
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

$(out)/pages/%.bas: $(out)/pages/%.html $(bas)
	$(mkdir)
	$(sbasic) mkpage.bas $< > $@

$(out)/pages2/%.html: $(out)/pages/%.bas
	$(mkdir)
	$(sbasic) $< > $@

$(out)/pages3/%.html: $(out)/pages2/%.html
	$(mkdir)
	$(sbasic) $(out)/article.bas $< > $@

$(out)/pages4/%.html: $(out)/pages3/%.html
	$(mkdir)
	$(sbasic) $(out)/sitepage.bas $< > $@

all: $(reference) $(pages)
	@mkdir -p ../reference
	@mkdir -p ../pages
	$(sbasic) deploy.bas
	@cp $(out)/pages4/*.html ../pages

clean:
	rm -rf $(out) *.sbu
