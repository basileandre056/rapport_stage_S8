# rapport_stage_S8



## ✅ 1. Installation LaTeX complète (version minimale mais sûre)

```bash
sudo apt update
sudo apt install texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-lang-european
```
Ensuite :

```bash
sudo apt install biber

```

🎉 Avec ça, 100% des packages utilisés dans ton préambule sont couverts.


## 1. Arborecence 

```bash
mon_projet/
├── main.tex
└── images/
    └── logos/
        ├── logo_DEAL.jpg
        ├── Enib_inp_2025.png
        └── Corail-ile-de-la-reunion.jpg

```

## 2. 📦 Liste exacte des packages utilisés → où ils se trouvent
 

 ```bash
| Package LaTeX  | Contenu Ubuntu            | Installé par              |
| -------------- | ------------------------- | ------------------------- |
| inputenc       | Base                      | texlive-latex-recommended |
| fontenc        | Base                      | texlive-latex-recommended |
| babel (french) | Langues                   | texlive-lang-european     |
| graphicx       | Base                      | texlive-latex-recommended |
| lmodern        | Police                    | texlive-fonts-recommended |
| geometry       | Base                      | texlive-latex-recommended |
| titlesec       | Custom titres             | texlive-latex-extra       |
| setspace       | Espacement                | texlive-latex-recommended |
| hyperref       | Liens                     | texlive-latex-extra       |
| fancyhdr       | En-têtes/pieds            | texlive-latex-recommended |
| color          | Couleurs                  | latex-base                |
| tocloft        | Table des matières custom | texlive-latex-extra       |
| etoolbox       | Hooks                     | texlive-latex-extra       |
```


🚀 4. Compilation
Sans bibliographie (pour tester le préambule) :


```bash
pdflatex main.tex
pdflatex main.tex

```
Avec bibliographie (plus tard)

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex

```
