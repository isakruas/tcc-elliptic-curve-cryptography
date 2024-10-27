#
# Compilar arquivos
#
# Autores:	Marcos Miller Martins da Silva (mmarcos.miller@gmail.com)
#		Ítalo Antônio de Brito
#
all:
	pdflatex Monografia.tex
	pdflatex Monografia.tex
	
	rm -f *.aux *.log *.lof *.lot *.out *.log *.toc *.gz
