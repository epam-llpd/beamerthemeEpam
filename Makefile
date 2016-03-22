TARGET = beamerexample.pdf
TEXFILES=$(wildcard *.tex)

all: $(TARGET)



%.pdf: %.tex $(TEXFILES) beamerthemeEpam.sty
	latex $<
	latex $<

$(TARGET): bibliography

.PHONY: bibliography
bibliography: beamerexample.tex
	latex $<
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
