.PHONY: all clean view

TARGET=semma

all:
	latexmk $(TARGET).tex

esitelma: esitelma.tex
	pdflatex -file-line-error -halt-on-error -interaction=nonstopmode --shell-escape $<

clean:
	-rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc *.dvi *.fdb_latexmk

view: all
	evince $(TARGET).pdf 2>/dev/null&
