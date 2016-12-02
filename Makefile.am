SUFFIXES = .aux .tex .bbl .bib .pdf .gnuplot .eps .dia .png .svg .jpg .fig .pgm .rb .tpt .idx .pstex_t .erb .ini .txt .dot

noinst_DATA = thesis2.pdf

MALLOC1_SRC = $(wildcard $(MALLOC)/ext/*.hh $(MALLOC)/ext/*.cc)
MALLOC2_SRC = $(wildcard $(MALLOC)/lib/*.rb)
MULTIARRAY_SRC = $(wildcard $(MULTIARRAY)/lib/*.rb $(MULTIARRAY)/lib/multiarray/*.rb)

EXTRA_DIST = thesis.tex thesis2.tex thesis.bib thesis2.bib algorithm2e.sty \
	trfsigns.sty build-cross.sh source.rb \
	Makefile.dist dataflow.dia overview.svg architecture.svg jeol.jpg \
	shulogo.svg smallwheel.png linux.png windows.png pipette.jpg \
	gripper.jpg sift1.png sift2.png circle.png \
	gaborF.gnuplot gabor.gnuplot matching.svg \
	autofocus.fig fbank.fig analytic.fig smallwheelg_335.png \
	defocus1.pgm defocus2.pgm depthfromdefocus.pgm mark-n-sweep.fig \
	cc-by-sa.svg cc-by-nc-sa.svg operatortable.fig strides.fig \
	cycle-static.svg cycle-dynamic.svg eager.svg lazy.svg select.svg \
	memory.svg globe.tgz diagonal.fig goes.jpg pseudo.rb blur.rb \
	integral.rb interfaces.svg coriander.png linuxlogo.png mplayerlogo.png \
	win32.jpg openexr.jpg rmagick.png xinelogo.png mesa.png qt4.png xorg.png \
	gnuplot.png mplayerlogo.png xorg.png win32.jpg rmagick.png fftw.png \
	opencv.png tanaka.png y.png ycr.png ycb.png colours.png tilt00.tif \
	mr-knee.dcm lossless.png lossy.jpg irb.png \
	smallaudi0.jpg smallaudi1.jpg smallaudi2.jpg smallaudi3.jpg smallaudi4.jpg \
	smallaudi5.jpg smallaudi6.jpg smallaudi7.jpg smallaudi8.jpg smallaudi9.jpg \
	smallaudi.exr alignedaudi0.jpg alignedaudi1.jpg alignedaudi2.jpg \
	alignedaudi3.jpg alignedaudi4.jpg alignedaudi5.jpg alignedaudi6.jpg \
	alignedaudi7.jpg alignedaudi8.jpg alignedaudi9.jpg exraudi.jpg \
	decoder.fig encoder.fig rgb.png yv12.rb x11.png qtlogo.png ruby.png \
	rbuic.svg xvwidget.png world.jpg polar.jpg neontetra.jpg neon.png fish.jpg \
	warpx.png warpy.png warpa.png warpr.png hist3d.rb hist3d.ini hist3d.jpg \
	morph.png dilate.png erode.png bmorph.png bdilate.png gamma1.png gamma22.png \
	audiover.png audinorm.png audiclip.png uhvr8a.pfb sgauss.gnuplot sgauss.dat \
	vgauss.gnuplot sdgauss.gnuplot sdgauss.dat vdgaussx.gnuplot vdgaussy.gnuplot \
	gaussblur.png gaussgradx.png gaussgrady.png gaussgradn.png robertsedge.png \
	sobeledge.png fabric.jpg twindow.jpg zeropad.jpg spectrum.jpg y_b_f_u.png \
	s_t.png h_s.png harris.gnuplot helicopter.jpg template.png ncc.jpg lucas.fig \
	interpolate0.png interpolate1.png boundary.png gauss0x.png gauss0y.png \
	gauss1x.png gauss1y.png lctemplate.png \
	polygon0000.png polygon0010.png polygon0020.png polygon0030.png polygon0040.png \
	polygon0050.png polygon0060.png polygon0070.png polygon0080.png polygon0090.png \
	polygon0100.png polygon0110.png polygon0120.png polygon0130.png polygon0140.png \
	polygon0150.png polygon0160.png polygon0170.png polygon0180.png polygon0190.png \
	polygon0200.png polygon0210.png polygon0220.png polygon0230.png polygon0240.png \
	lines.png hough.png hlines.png \
	fiber1.jpg fiber2.jpg fiber3.jpg fiber4.jpg fiber5.jpg fiber6.jpg \
	fiber7.jpg fiber8.jpg fiber9.jpg fiberd.jpg fiberv.jpg astronaut.jpg \
	descr1.png descr2.png descr3.png descr4.png quickcam.jpg unibrain.jpg \
	mouse0.png mouse1.jpg mouse2.png mouse3.png mouse4.png mouse5.png mouse6.png mouse7.jpg \
	presenter.png presentf0.jpg presentf1.jpg presentf2.jpg presentf3.jpg presentmenu.jpg \
	arinput.png arstep10.png arstep1.png arstep2.png arstep3.png arstep4.png \
	arstep5.png arstep6.png arstep7.png arstep8.png arstep9.png \
	holo01.jpg holo02.jpg holo03.jpg holo04.jpg holo05.jpg holo06.jpg \
	holo07.jpg holo08.jpg holo09.jpg holo10.jpg holo11.jpg holo12.jpg \
	parking.jpg mundy.jpg ariane5.jpg gumstix.jpg \
	calibration00.jpg calibration01.jpg calibration02.jpg calibration03.jpg \
	calibration04.png calibration05.png calibration06.png calibration07.png \
	calibration08.png calibration09.jpg calibration10.jpg calibration11.jpg \
	calibration12.jpg calibration13.jpg calibration14.jpg inject.svg integrate.svg \
	argmax.svg pinhole.fig tensor.cc tensor.rb narr.rb skip.rb \
	grid.erb grid.ini calibration2.txt chequer.png grid.rb kinect.jpg ranges.rb \
	nranges.rb ranges.cc breakdown.rb breakdown.c cbreakdown.cc expression.rb \
	corners.png edges.png canny0.fig canny1.fig canny2.fig canny3.fig \
	bmw.jpg bmw1.png bmw2.png bmw3.png \
	poly0.png poly1.png poly2.png poly3.png poly4.png poly5.png \
	nanoconf.jpg nanocontrol.jpg nanogui.png triangle.svg xmpincl.sty license.xmp \
	uint.dot sfloat.dot dfloat.dot ubytergb.dot usintrgb.dot sfloatrgb.dot pdfloat.dot \
	langcycle.dot

wedekind_phd_draft_007.pdf: thesis2.pdf
	$(LN_S) $< $@

thesis.pdf: thesis.tex thesis.bbl gripper.jpg \
	sift1.png sift2.png overview.pdf architecture.pdf jeol.jpg \
	shulogo.pdf autofocus.pdf autofocus.pstex_t fbank.pdf fbank.pstex_t \
	analytic.pdf analytic.pstex_t \
	phasecorrelation.jpg y_b_f_u.jpg h_s.jpg s_t.jpg l_o_g.jpg \
	fubk.png \
	sobelx.jpg sobely.jpg sobel.jpg roberts.jpg smallwheel.jpg \
	exposure.jpg grey.png linux.jpg windows.jpg \
	defocus1.jpg defocus2.jpg depthfromdefocus.jpg sharpen.jpg \
	binarise.png pixelwise.jpg gauss.jpg \
	phasecorrelation.rb sobelx.rb sobel.rb sharpen.rb exposure.rb \
	roberts.rb y_b_f_u.rb h_s.rb s_t.rb l_o_g.rb \
	binarise.rb pixelwise.rb
	$(PDFLATEX) $<
	$(THUMBPDF) --modes=pdftex $@
	$(PDFFONTS) $@
	( sleep 1 && touch thesis.aux ) &

thesis2.pdf: thesis2.tex thesis2.bbl thesis2.ind xmpincl.sty architecture.pdf \
	mark-n-sweep.pdf mark-n-sweep.pstex_t cc-by-sa.pdf cc-by-nc-sa.pdf \
	shulogo.pdf operatortable.pdf operatortable.pstex_t overview.pdf fubk.png \
	grey.png strides.pdf strides.pstex_t cycle-static.pdf cycle-dynamic.pdf \
	matching.pdf eager.pdf lazy.pdf select.pdf memory.pdf \
	malloc-1.4.0.tgz multiarray-1.0.1.tgz \
	globe.tgz diagonal.pdf diagonal.pstex_t goes.jpg pseudo.jpg \
	blur.jpg integrated.jpg integral.jpg interfaces.jpg \
	y.jpg ycr.jpg ycb.jpg colours.jpg tilt00.jpg mr-knee.png \
	lossless.png lossy.jpg irb.png \
	smallaudi0.jpg smallaudi1.jpg smallaudi2.jpg smallaudi3.jpg smallaudi4.jpg \
	smallaudi5.jpg smallaudi6.jpg smallaudi7.jpg smallaudi8.jpg smallaudi9.jpg \
	alignedaudi0.jpg alignedaudi1.jpg alignedaudi2.jpg alignedaudi3.jpg \
	alignedaudi4.jpg alignedaudi5.jpg alignedaudi6.jpg alignedaudi7.jpg \
	alignedaudi8.jpg alignedaudi9.jpg exraudi.jpg \
	decoder.pdf encoder.pdf rgb.png yv12.png x11.png rbuic.pdf \
	xvwidget.png world.jpg polar.jpg neontetra.jpg neon.png fish.jpg \
	warpx.png warpy.png warpa.png warpr.png hist3d.jpg \
	morph.png dilate.png erode.png bmorph.png bdilate.png gamma1.png gamma22.png \
	audiover.png audinorm.png audiclip.png sgauss.pdf vgauss.pdf \
	sdgauss.pdf vdgaussx.pdf vdgaussy.pdf gaussblur.png \
	gaussgradx.png gaussgrady.png gaussgradn.png robertsedge.png sobeledge.png \
	fabric.jpg twindow.jpg zeropad.jpg spectrum.jpg y_b_f_u.jpg s_t.jpg h_s.jpg \
	harris.pdf helicopter.jpg template.png ncc.jpg lucas.pdf lucas.pstex_t \
	interpolate0.png interpolate1.png boundary.png gauss0x.png gauss0y.png \
	gauss1x.png gauss1y.png lctemplate.png \
	polygon0000.png polygon0010.png polygon0020.png polygon0030.png polygon0040.png \
	polygon0050.png polygon0060.png polygon0070.png polygon0080.png polygon0090.png \
	polygon0100.png polygon0110.png polygon0120.png polygon0130.png polygon0140.png \
	polygon0150.png polygon0160.png polygon0170.png polygon0180.png polygon0190.png \
	polygon0200.png polygon0210.png polygon0220.png polygon0230.png polygon0240.png \
	lines.png hough.png hlines.png \
	fiber1.jpg fiber2.jpg fiber3.jpg fiber4.jpg fiber5.jpg fiber6.jpg \
	fiber7.jpg fiber8.jpg fiber9.jpg fiberd.jpg fiberv.jpg astronaut.jpg \
	descr1.png descr2.png descr3.png descr4.png quickcam.jpg unibrain.jpg \
	mouse0.png mouse1.jpg mouse2.png mouse3.png mouse4.png mouse5.png mouse6.png mouse7.jpg \
	presenter.png presentf0.jpg presentf1.jpg presentf2.jpg presentf3.jpg presentmenu.jpg \
	arinput.png arstep10.png arstep1.png arstep2.png arstep3.png arstep4.png \
	arstep5.png arstep6.png arstep7.png arstep8.png arstep9.png \
	holo01.jpg holo02.jpg holo03.jpg holo04.jpg holo05.jpg holo06.jpg \
	holo07.jpg holo08.jpg holo09.jpg holo10.jpg holo11.jpg holo12.jpg \
	parking.jpg mundy.jpg ariane5.jpg gumstix.jpg \
	calibration00.jpg calibration01.jpg calibration02.jpg calibration03.jpg \
	calibration04.png calibration05.png calibration06.png calibration07.png \
	calibration08.png calibration09.jpg calibration10.jpg calibration11.jpg \
	calibration12.jpg calibration13.jpg calibration14.jpg inject.pdf integrate.pdf \
	argmax.pdf pinhole.pdf pinhole.pstex_t kinect.jpg \
	grid0.png grid1.png grid2.png grid3.png grid4.png grid5.png \
	cal0.jpg cal1.jpg cal2.jpg cal3.jpg cal4.jpg cal5.jpg \
	gridcalib0.jpg gridcalib1.jpg gridcalib2.jpg gridcalib3.jpg \
	gridcalib4.jpg gridcalib5.jpg corners.png edges.png \
	canny0.pdf canny1.pdf canny2.pdf canny3.pdf bmw1.png bmw2.png bmw3.png \
	poly0.png poly1.png poly2.png poly3.png poly4.png poly5.png \
	nanoconf.jpg nanocontrol.jpg nanogui.png triangle.pdf \
	uint.pdf sfloat.pdf dfloat.pdf ubytergb.pdf usintrgb.pdf sfloatrgb.pdf pdfloat.pdf \
	langcycle.pdf \
	license.xmp
	$(PDFLATEX) $<
	$(THUMBPDF) --modes=pdftex $@
	$(PDFFONTS) $@
	( sleep 1 && touch thesis2.aux ) &

malloc-1.4.0.tgz: $(MALLOC)/pkg/malloc-1.4.0.tgz
	$(LN_S) -f $< $@

$(MALLOC)/pkg/malloc-1.4.0.tgz:
	cd $(MALLOC) && $(RAKE) package

multiarray-1.0.1.tgz: $(MULTIARRAY)/pkg/multiarray-1.0.1.tgz
	$(LN_S) -f $< $@

$(MULTIARRAY)/pkg/multiarray-1.0.1.tgz:
	cd $(MULTIARRAY) && $(RAKE) package

%.bbl: %.bib %.aux
	$(BIBTEX) $(basename $@)

thesis2.bbl: thesis2.bib thesis2.aux
	$(BIBTEX) $(basename $@)

#malloc1.tex: source.rb $(MALLOC1_SRC)
#	$(RUBY) source.rb $@ C++ $(MALLOC)/lib/ $(MALLOC1_SRC)
#
#malloc2.tex: source.rb $(MALLOC2_SRC)
#	$(RUBY) source.rb $@ Ruby $(MALLOC)/lib/ $(MALLOC2_SRC)
#
#multiarray.tex: source.rb $(MULTIARRAY_SRC)
#	$(RUBY) source.rb $@ Ruby $(MULTIARRAY)/lib/ $(MULTIARRAY_SRC)

pseudo.jpg: pseudo.rb goes.jpg
	$(RUBY) pseudo.rb goes.jpg $@

blur.jpg: blur.rb fubk.png
	$(RUBY) blur.rb fubk.png $@

integrated.jpg integral.jpg: integral.rb fubk.png
	$(RUBY) integral.rb fubk.png integrated.jpg integral.jpg

yv12.png: yv12.rb rgb.png
	$(RUBY) yv12.rb rgb.png $@

hist3d.png: hist3d.pov hist3d.ini
	$(POVRAY) hist3d

hist3d.pov: hist3d.rb neon.png
	$(RUBY) $<

mr-knee.png: mr-knee.dcm
	$(CONVERT) $< $@

tilt00.jpg: tilt00.tif
	$(CONVERT) $< -normalize -quality 50 $@

colours.jpg: colours.png
	$(CONVERT) $< -quality 80 $@

y.jpg: y.png
	$(CONVERT) $< -quality 80 $@

ycr.jpg: ycr.png
	$(CONVERT) $< -quality 80 $@

ycb.jpg: ycb.png
	$(CONVERT) $< -quality 80 $@

hist3d.jpg: hist3d.png
	$(CONVERT) $< -quality 80 $@

interfaces.jpg: interfaces.png
	$(CONVERT) $< -quality 70 $@

phasecorrelation.jpg: phasecorrelation.png
	$(CONVERT) $< -quality 90 $@

sobelx.jpg: sobelx.png
	$(CONVERT) $< -quality 90 $@

sobely.jpg: sobely.png
	$(CONVERT) $< -quality 90 $@

sobel.jpg: sobel.png
	$(CONVERT) $< -quality 90 $@

roberts.jpg: roberts.png
	$(CONVERT) $< -quality 90 $@

smallwheel.jpg: smallwheel.png
	$(CONVERT) $< -quality 90 $@

smallwheelg_335.jpg: smallwheelg_335.png
	$(CONVERT) $< -quality 90 $@

defocus1.jpg: defocus1.pgm
	$(CONVERT) $< -quality 90 $@

defocus2.jpg: defocus2.pgm
	$(CONVERT) $< -quality 90 $@

depthfromdefocus.jpg: depthfromdefocus.pgm
	$(CONVERT) $< -quality 90 $@

sharpen.jpg: sharpen.png
	$(CONVERT) $< -quality 90 $@

exposure.jpg: exposure.png
	$(CONVERT) $< -quality 90 $@

y_b_f_u.jpg: y_b_f_u.png
	$(CONVERT) $< -quality 90 $@

h_s.jpg: h_s.png
	$(CONVERT) $< -quality 90 $@

s_t.jpg: s_t.png
	$(CONVERT) $< -quality 90 $@

l_o_g.jpg: l_o_g.png
	$(CONVERT) $< -quality 90 $@

gauss.jpg: gauss.png
	$(CONVERT) $< -quality 90 $@

pixelwise.jpg: pixelwise.png
	$(CONVERT) $< -quality 90 $@

#grey.jpg: grey.png
#	$(CONVERT) $< -quality 90 $@

linux.jpg: linux.png
	$(CONVERT) $< -quality 90 $@

windows.jpg: windows.png
	$(CONVERT) $< -quality 90 $@

fubk.png: $(HORNETSEYE)/data/images/fubk.png
	$(LN_S) $< $@

phasecorrelation.png: $(HORNETSEYE)/doc/phasecorrelation.png
	$(LN_S) $< $@

sobel.png: $(HORNETSEYE)/doc/sobel.png
	$(LN_S) $< $@

sobelx.png: $(HORNETSEYE)/doc/sobelx.png
	$(LN_S) $< $@

sobely.png: $(HORNETSEYE)/doc/sobely.png
	$(LN_S) $< $@

roberts.png: $(HORNETSEYE)/doc/roberts.png
	$(LN_S) $< $@

l_o_g.png: $(HORNETSEYE)/doc/l_o_g.png
	$(LN_S) $< $@

y_b_f_u.png: $(HORNETSEYE)/doc/y_b_f_u.png
	$(LN_S) $< $@

s_t.png: $(HORNETSEYE)/doc/s_t.png
	$(LN_S) $< $@

h_s.png: $(HORNETSEYE)/doc/h_s.png
	$(LN_S) $< $@

exposure.png: $(HORNETSEYE)/doc/exposure.png
	$(LN_S) $< $@

grey.png: $(HORNETSEYE)/doc/grey.png
	$(LN_S) $< $@

sharpen.png: $(HORNETSEYE)/doc/sharpen.png
	$(LN_S) $< $@

binarise.png: $(HORNETSEYE)/doc/binarise.png
	$(LN_S) $< $@

pixelwise.png: $(HORNETSEYE)/doc/pixelwise.png
	$(LN_S) $< $@

gauss.png: $(HORNETSEYE)/doc/gauss.png
	$(LN_S) $< $@

phasecorrelation.rb: $(HORNETSEYE)/samples/general/phasecorrelation.rb
	$(LN_S) $< $@

sobelx.rb: $(HORNETSEYE)/samples/correlate/sobelx.rb
	$(LN_S) $< $@

sobel.rb: $(HORNETSEYE)/samples/correlate/sobel.rb
	$(LN_S) $< $@

sharpen.rb: $(HORNETSEYE)/samples/correlate/sharpen.rb
	$(LN_S) $< $@

exposure.rb: $(HORNETSEYE)/samples/openexrio/exposure.rb
	$(LN_S) $< $@

roberts.rb: $(HORNETSEYE)/samples/correlate/roberts.rb
	$(LN_S) $< $@

y_b_f_u.rb: $(HORNETSEYE)/samples/correlate/y_b_f_u.rb
	$(LN_S) $< $@

h_s.rb: $(HORNETSEYE)/samples/correlate/h_s.rb
	$(LN_S) $< $@

s_t.rb: $(HORNETSEYE)/samples/correlate/s_t.rb
	$(LN_S) $< $@

l_o_g.rb: $(HORNETSEYE)/samples/correlate/l_o_g.rb
	$(LN_S) $< $@

binarise.rb: $(HORNETSEYE)/samples/general/binarise.rb
	$(LN_S) $< $@

pixelwise.rb: $(HORNETSEYE)/samples/magickio/pixelwise.rb
	$(LN_S) $< $@

calibration2.avi: /home/jan/Documents/work/phd/video/calibration2.avi
	$(LN_S) $< $@

gridcalib.avi: /home/jan/Documents/work/phd/video/gridcalib.avi
	$(LN_S) $< $@

grid.avi: grid.erb grid.ini calibration2.txt chequer.png grid.rb
	$(RUBY) grid.rb
	$(MENCODER) mf://tmp*.png -o grid.avi -fps 15 -ovc x264 -x264encopts qp=23:subq=7:frameref=6:me=umh:nob_adapt:pass=1
	$(MENCODER) mf://tmp*.png -o grid.avi -fps 15 -ovc x264 -x264encopts qp=23:subq=7:frameref=6:me=umh:nob_adapt:pass=2
	rm -f tmp*.png

cal0.jpg cal1.jpg cal2.jpg cal3.jpg cal4.jpg cal5.jpg: skip.rb calibration2.avi
	$(RUBY) skip.rb calibration2.avi cal 19 138 226 275 533 679
	$(CONVERT) cal0.png -quality 85 cal0.jpg
	$(CONVERT) cal1.png -quality 85 cal1.jpg
	$(CONVERT) cal2.png -quality 85 cal2.jpg
	$(CONVERT) cal3.png -quality 85 cal3.jpg
	$(CONVERT) cal4.png -quality 85 cal4.jpg
	$(CONVERT) cal5.png -quality 85 cal5.jpg

grid0.png grid1.png grid2.png grid3.png grid4.png grid5.png: skip.rb grid.avi
	$(RUBY) skip.rb grid.avi grid 19 138 226 275 533 679
	$(CONVERT) grid0.png -colors 127 grid0.png
	$(CONVERT) grid1.png -colors 127 grid1.png
	$(CONVERT) grid2.png -colors 127 grid2.png
	$(CONVERT) grid3.png -colors 127 grid3.png
	$(CONVERT) grid4.png -colors 127 grid4.png
	$(CONVERT) grid5.png -colors 127 grid5.png

gridcalib0.jpg gridcalib1.jpg gridcalib2.jpg gridcalib3.jpg gridcalib4.jpg gridcalib5.jpg: skip.rb gridcalib.avi
	$(RUBY) skip.rb gridcalib.avi gridcalib 19 138 226 275 533 679
	$(CONVERT) gridcalib0.png -quality 85 gridcalib0.jpg
	$(CONVERT) gridcalib1.png -quality 85 gridcalib1.jpg
	$(CONVERT) gridcalib2.png -quality 85 gridcalib2.jpg
	$(CONVERT) gridcalib3.png -quality 85 gridcalib3.jpg
	$(CONVERT) gridcalib4.png -quality 85 gridcalib4.jpg
	$(CONVERT) gridcalib5.png -quality 85 gridcalib5.jpg

tensor: tensor.cc
	$(CXX) -O -o $@ $<

ranges: ranges.cc
	$(CXX) -O -o $@ $<

cbreakdown: cbreakdown.cc
	$(CXX) -O -o $@ $<

CLEANFILES = \
	*.bbl *.blg *.aux *.tpt *.pdf *.log *.out *.eps *.toc *.pstex_t *~ \
	*.bak *.brf *.idx *.ilg *.ind *.lof *.lol *.lot *.cb \
	thesis2.*.gnuplot fubk.png phasecorrelation.png phasecorrelation.jpg \
	sobelx.png sobelx.jpg \
	sobely.png sobely.jpg sobel.png sobel.jpg grey.png \
	smallwheel.jpg defocus1.jpg defocus2.jpg depthfromdefocus.jpg \
	sharpen.png sharpen.jpg exposure.png exposure.jpg gauss.jpg gauss.png \
	grayinput.jpg h_s.png h_s.jpg y_b_f_u.png y_b_f_u.jpg binarise.png \
	pixelwise.png pixelwise.jpg windows.jpg l_o_g.png l_o_g.png \
        s_t.jpg s_t.png roberts.jpg roberts.png \
	phasecorrelation.rb sobelx.rb sobel.rb sharpen.rb exposure.rb roberts.rb \
	y_b_f_u.rb h_s.rb s_t.rb l_o_g.rb binarise.rb pixelwise.rb \
	pseudo.jpg blur.jpg \
	integrated.jpg integral.jpg interfaces.png interfaces.jpg \
	y.jpg ycr.jpg ycb.jpg colours.jpg tilt00.jpg mr-knee.png yv12.png \
	hist3d.png hist3d.jpg hist3d.pov grid.pov tmp????.png grid.avi calibration2.avi \
	cal?.png cal?.jpg grid?.png gridcalib?.png gridcalib?.jpg \
  uint.svg

MAINTAINERCLEANFILES = \
	aclocal.m4 config.status configure install-sh missing

# echo -e ?

%.aux:
	echo '\citation{RefWorks:Undefined}' > $@
	echo '\bibstyle{alpha}' >> $@
	echo '\bibdata{thesis}' >> $@

%.idx:
	touch $@

.idx.ind:
	$(MAKEINDEX) $<

.eps.pdf:
	$(EPS2PDF) $< -o $@

.gnuplot.eps:
	$(GNUPLOT) $<

.dia.eps:
	$(DIA) -n -t eps $<

.svg.png:
	$(INKSCAPE) $< -d 300 -e $@

.svg.pdf:
	$(INKSCAPE) $< -A $@

.fig.pstex_t:
	$(FIG2DEV) -L pstex_t $< > $@

.dot.svg:
	$(DOT) $< -Tsvg > $@

# Do not create pdf directly!
# Set all text-flags in xfig to special! Use pstex_t!
# Call "pdftools <file>" to see wether all fonts are included.
# Do not follow Selvan's rule "always create PDF's directly"
# .fig.pdf:
# 	$(FIG2DEV) -L pdf $< $@

.fig.eps:
	$(FIG2DEV) -L pstex $< $@

