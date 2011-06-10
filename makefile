#
## Makefile
#
PROJEKT=presentation
#
#
pres:	$(PROJEKT).tex
	pdflatex $(PROJEKT)
	pdflatex $(PROJEKT)
	if [ ! -d "build" ]; then mkdir build; fi
	mv $(PROJEKT).pdf build/
	make clean
#
handout: $(PROJEKT).tex
	sed "s/\documentclass\[xcolor=dvipsnames,14pt\]{beamer}/\documentclass\[xcolor=dvipsnames,14pt,handout\]{beamer}/" $(PROJEKT).tex > $(PROJEKT)-handout.tex
	pdflatex $(PROJEKT)-handout
	pdflatex $(PROJEKT)-handout
	rm -f $(PROJEKT)-handout.tex
	if [ ! -d "build" ]; then mkdir build; fi
	mv $(PROJEKT)-handout.pdf build/
	make clean
#
clean:      
	rm -f *.snm *.nav *.dvi *.toc *.aux *.out *.bbl *.blg *blx.bib *.gls *.glg *.glo *.ist *.log *.run*
