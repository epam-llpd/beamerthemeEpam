TARGET = beamerexample.pdf
TEXFILES=$(wildcard *.tex)
LATEX:=pdflatex

all: $(TARGET)



%.pdf: %.tex $(TEXFILES) beamerthemeEpam.sty
	$(LATEX) $<
	$(LATEX) $<

$(TARGET): bibliography

.PHONY: bibliography
bibliography: beamerexample.tex
	$(LATEX) $<
	bibtex $(patsubst %.tex, %.aux, $<)


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
