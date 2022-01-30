# MaxiPlot

This is a fork of the project maxiplot, which provide a way to insert maxima equations into LaTeX code and calculate that.  

About how to write inline maxima code and pnuplot code, please read the original documents at https://maxima.sourceforge.io/contrib/maxiplot/maxiplot_en.pdf .  

I have modified it to avoid some error for today's toolchains. And added Makefile for automake.  

## Warning

The Makefile is designed for build .tex file, not this project.
Usage: make SOURCE=${Your_Tex_File}
