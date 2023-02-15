# Makefile to build PDF and Markdown pub from YAML.
#
# Brandon Amos <http://bamos.github.io> and
# Ellis Michael <http://ellismichael.com>

WEBSITE_DIR=../ai4eda.github.io
WEBSITE_PDF=$(WEBSITE_DIR)/data/pub.pdf
WEBSITE_MD=$(WEBSITE_DIR)/_includes/pub.md
WEBSITE_DATE=$(WEBSITE_DIR)/_includes/last-updated.txt

TEMPLATES=$(shell find templates -type f)

BUILD_DIR=build
TEX=$(BUILD_DIR)/pub.tex
PDF=$(BUILD_DIR)/pub.pdf
MD=$(BUILD_DIR)/pub.md

ifneq ("$(wildcard pub.hidden.yaml)","")
	YAML_FILES = pub.yaml pub.hidden.yaml
else
	YAML_FILES = pub.yaml
endif

.PHONY: all public viewpdf stage jekyll push clean

all: $(PDF) $(MD)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

public: $(BUILD_DIR) $(TEMPLATES) $(YAML_FILES) generate.py
	./generate.py -m pub.yaml

$(TEX) $(MD): $(TEMPLATES) $(YAML_FILES) generate.py publications/*.bib
	./generate.py -m $(YAML_FILES)

# $(PDF): $(TEX)
# 	# TODO: Hack for biber on OSX.
# 	rm -rf /var/folders/8p/lzk2wkqj47g5wf8g8lfpsk4w0000gn/T/par-62616d6f73

# 	latexmk -pdf -cd- -jobname=$(BUILD_DIR)/pub $(BUILD_DIR)/pub
# 	latexmk -c -cd $(BUILD_DIR)/pub

md: $(BUILD_DIR) $(TEMPLATES) $(YAML_FILES) generate.py
	./generate.py -m pub.yaml
	cp $(MD) $(WEBSITE_MD)
	date +%Y-%m-%d > $(WEBSITE_DATE)

viewpdf: $(PDF)
	open $(PDF)

wslpdf:
	wslview $(PDF)

# stagemd: $(MD)
# 	cp $(MD) $(WEBSITE_MD)
# 	date +%Y-%m-%d > $(WEBSITE_DATE)

stage: $(PDF) $(MD)
	cp $(PDF) $(WEBSITE_PDF)
	cp $(MD) $(WEBSITE_MD)
	date +%Y-%m-%d > $(WEBSITE_DATE)

jekyll: stage
	cd $(WEBSITE_DIR) && bundle exec jekyll server

push: stage
	git -C $(WEBSITE_DIR) add $(WEBSITE_PDF) $(WEBSITE_MD) $(WEBSITE_DATE)
	git -C $(WEBSITE_DIR) commit -m "Update pub."
	git -C $(WEBSITE_DIR) push

clean:
	rm -rf *.db $(BUILD_DIR)/pub*
