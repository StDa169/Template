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
rm ./chapter/*.aux

# Auto Git-Commit
git add .
git commit -am "$(date +"%D %T")"