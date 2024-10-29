clear

pdflatex ./Thesis -draftmode
biber ./Thesis
makeindex -s ./Thesis.ist -t ./Thesis.alg -o ./Thesis.acr ./Thesis.acn
makeglossaries ./Thesis
pdflatex ./Thesis -draftmode
pdflatex ./Thesis

zip -r ./Quellen.zip ./quellen/*

# Remove unassasary files
# ==all Thesis files, but not .tex
find . -type f -name 'Thesis*' ! -name '*.pdf' ! -name '*.tex' -exec rm -f {} +

# ==all.aux Files
cd chapter
rm Anhang.aux
rm Durchfuehrung.aux
rm Ehrenwoertliche_Erklaerung.aux
rm Einleitung.aux
rm Grundlagen.aux
rm Quellenverzeichnis.aux
rm Sperrvermerk.aux
rm Zusammenfassung.aux
cd ..

# Auto Git-Commit
git add .
git commit -am "$(date +"%D %T")"