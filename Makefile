filename=naaclhlt2019
suppfilename=supplementary
build-dir=build

all:
	latexmk -xelatex -pdf -outdir=$(build-dir) $(filename)

supp:
	latexmk -xelatex -pdf -outdir=$(build-dir) $(suppfilename)

bib:
	bibtex $(build-dir)/$(filename)

read: all
	xdg-open $(build-dir)/$(filename).pdf &> /dev/null 

indent:
	latexindent -w ${filename} &> /dev/null
	mv ${filename}.bak0 indent.log ${build-dir}

clean:
	rm -rf ${build-dir}
