
target: pdf_output
	@echo "Finished."

clean:
	echo "clean"

tex_compile: 
	@echo "Make started."
	xelatex ${SOURCE}
	@echo "LaTeX compiled."

maxima_compile: tex_compile
ifeq ($(shell test -e $(subst .tex,.mac,${SOURCE}) && echo -n yes),yes)
	@echo "Found maxima file, start maxima compile."
	maxima -b $(subst .tex,.mac,${SOURCE})
	@echo "Maxima compiled."
else
	@echo "Maxima is not needed."
endif

gnuplot_compile: maxima_compile
ifeq ($(shell test -e $(subst .tex,.gnp,${SOURCE}) && echo -n yes),yes)
	@echo "Found GNUPlot file, start gnuplot compile."
	gnuplot $(subst .tex,.gnp,${SOURCE})
	@echo "GNUPlot compiled."
else
	@echo "GNUPlot is not needed."
endif

pdf_output: gnuplot_compile
	@echo "XeLaTeX started."
	xelatex ${SOURCE} 
	@echo "XeLaTeX compiled."
