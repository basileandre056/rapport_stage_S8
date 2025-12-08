# ============================
# Makefile for LaTeX Project
# ============================

MAIN = main
LATEX = pdflatex
BIB = biber

# Flags for pdflatex (ajout de -file-line-error)
LATEX_FLAGS = -file-line-error -interaction=nonstopmode -halt-on-error

# === Main compilation target ===
pdf: $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

	@if grep -q "\\\\addbibresource" $(MAIN).tex; then \
		$(BIB) $(MAIN); \
		$(LATEX) $(LATEX_FLAGS) $(MAIN).tex; \
	fi

	makeglossaries $(MAIN)

	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

	@echo "Compilation terminée : $(MAIN).pdf"

all: pdf

clean:
	rm -f \
	*.aux *.log *.out *.toc *.synctex.gz *.nav *.snm *.vrb \
	*.fls *.fdb_latexmk *.bbl *.bcf *.run.xml *.blg *.lof *.lot \
	*.acn *.acr *.alg *.glg *.glo *.gls *.ist

fullclean: clean
	rm -f $(MAIN).pdf

# === NEW: Debug target ===
debug:
	$(LATEX) -file-line-error -interaction=errorstopmode $(MAIN).tex

# === NEW: Show errors from log ===
errors:
	@grep -n "!" $(MAIN).log || echo "No LaTeX errors found."

.PHONY: all pdf clean fullclean debug errors
