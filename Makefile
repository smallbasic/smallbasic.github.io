#
# smallbasic.github.io site generator
#
# $ cd reference
# $ ~/src/SmallBASIC/src/platform/console/sbasic ../../mkref.bas ../../sb_ref.json markdown
#

out = _out
mkdir = @mkdir -p $(dir $@)
pandoc_options=--smart --to html5
markdown := $(wildcard reference/*.markdown)
html := $(patsubst %.markdown, $(out)/%.html, $(markdown))

$(out)/%.html : %.markdown
	$(mkdir)
	pandoc $(pandoc_options) -o $@ $<

.PHONY: all clean

all : $(html)

clean:
	rm $(html)


