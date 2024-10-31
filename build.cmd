pdflatex ./Thesis -draftmode
biber ./Thesis
makeindex -s ./Thesis.ist -t ./Thesis.alg -o ./Thesis.acr ./Thesis.acn
makeglossaries ./Thesis
pdflatex ./Thesis -draftmode
pdflatex ./Thesis

zip -r ./Quellen.zip ./quellen/*

:: Auto Git-Commit
::git add .
::git commit -am "Auto Commit"

:: Remove unassasary files
:: ==all Thesis files
del "./Thesis.acr"
del "./Thesis.acn"
del "./Thesis.alg"
del "./Thesis.aux"
del "./Thesis.bcf"
del "./Thesis.fdb_latexmk"
del "./Thesis.fk"
del "./Thesis.fls"
del "./Thesis.ist"
del "./Thesis.lof"
del "./Thesis.log"
del "./Thesis.lol"
del "./Thesis.lot"
del "./Thesis.maf"
del "./Thesis.mtc"
del "./Thesis.mtc0"
del "./Thesis.out"
del "./Thesis.synctex.gz"
del "./Thesis.toc"
del "./Thesis.bbl"
del "./Thesis.bbl"
del "./Thesis.blg"
del "./Thesis.glg"
del "./Thesis.glo"
del "./Thesis.gls"
del "./Thesis.run.xml"

del ".\chapter\*.aux"
