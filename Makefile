TARGET = presentation.pdf

.PHONY: all tex clean

%.dvi: %.tex
	latex $<
	latex $<
	latex $<

%.ps: %.dvi
	dvips -j0 -Ppdf -o $@ $<

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<

tex: $(TARGET)

bib: programm.aux
	bibtex8 -s programm.aux

all: tex

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
