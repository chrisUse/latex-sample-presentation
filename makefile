#
## Makefile
#
PROJEKT=WVv3Tut
#
# pdfs/%_handout.pdf: %.tex
# 	sed "s/\documentclass{beamer}/\documentclass[handout]{beamer}/" < $< > $(patsubst %,build/%,$(subst .tex,_handout.tex,$<))
# 	pdflatex -output-directory build -interaction=nonstopmode $(subst .tex,_handout.tex,$<)
#       pdflatex -output-directory build -interaction=nonstopmode $(subst .tex,_handout.tex,$<)
#       rm -f $(subst .tex,_handout.tex,$<)
#       cp $(patsubst pdfs/%,build/%,$@) pdfs/
#
all:	$(PROJEKT).tex
	pdflatex $(PROJEKT)
	pdflatex $(PROJEKT)
	if [ ! -d "build" ]; then mkdir build; fi
	mv $(PROJEKT).pdf build/
	make clean
#
#prepareHandout: $(PROJEKT)-handout.tex
#	sed "s/\documentclass\[xcolor=dvipsnames,14pt\]{beamer}/\documentclass\[xcolor=dvipsnames,14pt,handout\]{beamer}/" $(PROJEKT).tex > $(PROJEKT)-handout.tex
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
push:   
	svn commit -m ""
#
pull: 
	svn update
#
clean:      
	rm -f *.snm *.nav *.dvi *.toc *.aux *.out *.bbl *.blg *blx.bib *.gls *.glg *.glo *.ist *.log *.run*
