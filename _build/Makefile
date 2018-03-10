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
.PHONY : all clean bas

# tools
SBASIC = /home/chrisws/src/SmallBASIC/src/platform/console/sbasic
PANDOC = /usr/bin/pandoc

# variables
out = _out
pandoc_options=--smart --to html5

# dependencies
MKDIR = @mkdir -p $(dir $@)
bas = $(patsubst layouts/%.html, $(out)/%.bas, $(wildcard layouts/*.html))
reference0 = $(wildcard reference/*.markdown)
reference1 = $(patsubst reference/%.markdown, $(out)/reference1/%.html, $(reference0))
reference2 = $(patsubst $(out)/reference1/%.html, $(out)/reference2/%.html, $(reference1))
reference3 = $(patsubst $(out)/reference2/%.html, $(out)/reference3/%.html, $(reference2))

# rules
$(out)/%.bas : layouts/%.html
	$(MKDIR)
	$(SBASIC) mkpage.bas $< > $@

$(out)/reference1/%.html : reference/%.markdown
	$(MKDIR)
	$(PANDOC) $(pandoc_options) -o $@ $<

$(out)/reference2/%.html : $(out)/reference1/%.html $(bas)
	$(MKDIR)
	$(SBASIC) $(out)/post.bas $< > $@

$(out)/reference3/%.html : $(out)/reference2/%.html $(bas)
	$(MKDIR)
	$(SBASIC) $(out)/html.bas $< > $@

all : $(reference3)

clean:
	rm -rf $(out) *.sbu

