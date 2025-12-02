# ============================
# Makefile for LaTeX Project
# ============================

# Name of your main .tex file (without extension)
MAIN = main

# LaTeX compiler
LATEX = pdflatex
BIB = biber

# Flags for pdflatex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# === Main compilation target ===
pdf: $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

	# Run biber only if bibliography is used
	@if grep -q "\\\\addbibresource" $(MAIN).tex; then \
		$(BIB) $(MAIN); \
		$(LATEX) $(LATEX_FLAGS) $(MAIN).tex; \
	fi

	# Always run glossaries (necessary if glossaries package is loaded)
	makeglossaries $(MAIN)

	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

	@echo "Compilation terminée : $(MAIN).pdf"


# Default = pdf
all: pdf

# === Clean auxiliary files ===
clean:
	rm -f \
	*.aux *.log *.out *.toc *.synctex.gz *.nav *.snm *.vrb \
	*.fls *.fdb_latexmk *.bbl *.bcf *.run.xml *.blg *.lof *.lot \
	*.acn *.acr *.alg *.glg *.glo *.gls *.ist

# === Remove everything including PDF ===
fullclean: clean
	rm -f $(MAIN).pdf

.PHONY: all pdf clean fullclean
