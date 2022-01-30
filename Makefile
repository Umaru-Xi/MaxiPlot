
target: clean tex_compile maxima_compile gnuplot_compile pdf_output
	@echo "Finished."

clean:
	rm -f $(subst .tex,.aux,${SOURCE})
	rm -f $(subst .tex,.log,${SOURCE})
	rm -f $(subst .tex,.mac,${SOURCE})
	rm -f $(subst .tex,.mxp,${SOURCE})
	rm -f header.aux
	rm -f texput.log

tex_compile:
	@echo "Make started."
	xelatex ${SOURCE}
	@echo "LaTeX compiled."

maxima_compile:
#ifeq ( $(wildcard $(subst .tex,.mac,${SOURCE})) , $(subst .tex,.mac,${SOURCE}))
ifeq ($(shell test -e $(subst .tex,.mac,${SOURCE}) && echo -n yes),yes)
	@echo "Found maxima file, start maxima compile."
	maxima -b $(subst .tex,.mac,${SOURCE})
	@echo "Maxima compiled."
else
	@echo "Maxima is not needed."
endif

gnuplot_compile:
ifeq ($(shell test -e $(subst .tex,.gnp,${SOURCE}) && echo -n yes),yes)
	@echo "Found GNUPlot file, start gnuplot compile."
	gnuplot $(subst .tex,.gnp,${SOURCE})
	@echo "GNUPlot compiled."
else
	@echo "GNUPlot is not needed."
endif

pdf_output:
	@echo "XeLaTeX started."
	xelatex ${SOURCE}
	@echo "XeLaTeX compiled."
