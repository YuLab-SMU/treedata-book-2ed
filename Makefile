
html:
	quarto render --to html
	# sed -i 's/Chalkduster/Comic Sans MS/g' gh-pages/related-tools.html 

pdf:
	quarto render --to pdf

all: html pdf

softwareinfo:
	Rscript -e 'rmarkdown::render("software-info.Rmd", rmarkdown::md_document(variant="gfm"))';\
	sed -i 's/─//g' software-info.md;\
	sed -i 's/✔//g' software-info.md

clean:
	quarto clean
	rm -rf _bookdown_files

cover:
	Rscript -e 'source("book-cover.R")'

largeImg:
	ls -lhS gh-pages/treedata_files/figure-html | head  

publish:
	cd gh-pages;\
	git add .;\
	git commit -m 'update';\
	git push -u origin gh-pages
