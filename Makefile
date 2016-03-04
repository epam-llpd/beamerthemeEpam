DOCNAME=example

TARGET=$(DOCNAME)-article.pdf
TARGET+=$(DOCNAME)-presentation.pdf

TEXFILES=$(wildcard *.tex)

all: $(TARGET)

%.pdf: %.tex $(TEXFILES)
	latex $<
	latex $<

$(DOCNAME)-article.pdf: bibarticle
$(DOCNAME)-presentation.pdf: bibpresentation

.PHONY: bibarticle bibpresentation
bibarticle: $(TEXFILES)
	latex $(DOCNAME)-article.tex
	bibtex $(DOCNAME)-article.aux

bibpresentation: $(TEXFILES)
	latex $(DOCNAME)-presentation.tex
	bibtex $(DOCNAME)-presentation.aux

.PHONY: clean
clean:
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f $(TARGET)
