DOCNAME=thesis
TARGET=${wildcard *.tex} reference.bib
BUILDPATH=build

# LaTeX Compile
LATEXCOMPILE=xelatex
LATEXARGS=-synctex=1 -interaction=nonstopmode -file-line-error --output-directory=${BUILDPATH}

# bib Compile
BIBCOMPILE=biber
BIBARGS=--output-directory=${BUILDPATH}

ifdef WATERMARK
LATEXARGS+="\def\withwatermark{1} "
endif

ifdef DOI
LATEXARGS+="\def\withdoi{1} "
endif

ifdef APPROVAL
LATEXARGS+="\def\withapproval{1} "
endif

ifdef FIRSTPAGE
LATEXARGS+="\def\firstpage{1} "
else
LATEXARGS+="\def\excludefirstpage{1} "
endif

LATEXARGS+="\input{${DOCNAME}}"



.PHONY: all clean-all

all: ${BUILDPATH}/${DOCNAME}.pdf
	mv ${BUILDPATH}/${DOCNAME}.pdf .

${BUILDPATH}/${DOCNAME}.pdf: ${BUILDPATH}
	make latex
	make bib
	make latex
	make latex
	# gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/ebook -dPrinted=false -sOutputFile=thesis-compressed.pdf ${DOCNAME}.pdf
${BUILDPATH}:
	mkdir -p build


latex:
	${LATEXCOMPILE} ${LATEXARGS} ${DOCNAME}.tex

bib:
	${BIBCOMPILE} ${BIBARGS} ${DOCNAME}

clean:
	@-rm -rf ${BUILDPATH}
clean-all:
	@-rm -rf ${BUILDPATH}
	@-rm ${DOCNAME}.pdf
