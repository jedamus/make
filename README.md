# make

Makefile to compile COBOL, FORTRAN, flex, bison, C, C++ etc.
Creates also documentation (rST, pod, TeX, LaTeX) and knows how to handle noweb and cweb-files.

## Getting started

Perhaps you have to do first:

```
sudo apt install gcc g++ open-cobol gfortran noweb cweb-latex flex \
                 bison docutils-common docutils-doc texlive-full \
		 gnuplot
```

To make everything, do:

```
make
make doc
```

Or if you only want to get rezepte.pdf and konfituere.pdf, do:

```
make rezepte.pdf
make konfituere.pdf
```
