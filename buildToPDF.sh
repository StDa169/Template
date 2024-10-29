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
rm ./chapter/Anhang.aux
rm ./chapter/Durchfuehrung.aux
rm ./chapter/Ehrenwoertliche_Erklaerung.aux
rm ./chapter/Einleitung.aux
rm ./chapter/Grundlagen.aux
rm ./chapter/Quellenverzeichnis.aux
rm ./chapter/Sperrvermerk.aux
rm ./chapter/Zusammenfassung.aux

# Auto Git-Commit
git add .
git commit -am "$(date +"%D %T")"