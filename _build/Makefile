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
pandoc_options=--smart --to html5
bas = $(patsubst layouts/%.html, $(out)/%.bas, $(wildcard layouts/*.html))
reference = $(patsubst reference/%.markdown, $(out)/reference3/%.html, $(wildcard reference/*.markdown))

# rules
.data: reference.json
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
	$(sbasic) $(out)/post.bas $< > $@

$(out)/reference3/%.html: $(out)/reference2/%.html
	$(mkdir)
	$(sbasic) $(out)/html.bas $< > $@

all: $(reference)
	@mkdir -p ../reference
	$(sbasic) deploy.bas
	$(sbasic) $(out)/reference.bas > $(out)/reference.html
	$(sbasic) $(out)/html.bas $(out)/reference.html > ../reference/index.html

clean:
	rm -rf $(out) *.sbu
