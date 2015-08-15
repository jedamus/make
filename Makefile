# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Samstag, 15. August 2015 12:05 von Leander Jedamus
# modifiziert Mittwoch, 29. Juli 2015 13:28 von Leander Jedamus
# modifiziert Freitag, 17. Juli 2015 20:37 von Leander Jedamus
# modifiziert Dienstag, 14. Juli 2015 17:19 von Leander Jedamus
# modifiziert Mittwoch, 08. Juli 2015 15:20 von Leander Jedamus
# modifiziert Samstag, 04. Juli 2015 14:11 von Leander Jedamus

SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm

CC		= gcc # cc
CXX		= g++

FORTRANC        = mpifort

COBOLC          = cobc
#COBCWARN	= -W
COBCWARN	=
#COBCFREE	= -free
COBCFREE	=

LEX		= flex
YACC		= bison

POD2MAN		= pod2man
GROFF		= groff
RST2MAN		= rst2man.py
RST2LATEX	= rst2latex.py
RST2ODT		= rst2odt.py
RST2HTML	= rst2html.py

DEBUGGER	= gdb
TEX		= tex
LATEX		= pdflatex
MAKEINDEX	= makeindex
BIBTEX		= bibtex
DVIPS		= dvips
GS		= gs
CWEAVE		= cweave
CTANGLE		= ctangle
NOWEAVE		= noweave
NOTANGLE	= notangle
GNUPLOT		= gnuplot
MF		= mf
GFTOPK		= gftopk
SED		= sed
PATCH		= patch
TOUCH		= touch

RM		= rm -f
GENERATE	= ./generate2
PRINT		= print
COPTS		= $(DFLAGS) $(CPPFLAGS) $(IFLAGS) $(TARGET_ARCH)
LOPTS		= $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
C.c		= $(CC) $(strip $(CFLAGS) $(COPTS))
C.cc		= $(CXX) $(strip $(CXXFLAGS) $(COPTS))
COMPILE.c	= $(C.c) -c
COMPILE.f	= $(FORTRANC)
COMPILE.cob	= $(COBOLC)
COMPILE.cc	= $(C.cc) -c
LINK.c		= $(CC) $(strip $(CFLAGS) $(LOPTS))
LINK.cc		= $(CXX) $(strip $(CXXFLAGS) $(LOPTS))
DEPEND.c	= $(C.c) -MM
DEPEND.cc	= $(C.cc) -MM

NOWEAVE.latex	= $(NOWEAVE) -latex
MAKEINDEX.idx	= $(MAKEINDEX) $(MAKEINDEXFLAGS)
MAKEINDEXGST	= makeindex.gst
MAKEINDEXIST	= makeindex.ist
MAKEINDEXFLAGS	= -s makeindex.ist -g -l
PAPER		= a4
RES1		= 300
RES2		= 600
SEDCMD		= noweb2latex.sed
SEDTMP		= sed.tmp
RST		= rst
DOPLOT		= doplot
NOWEB		= nw

CFLAGS		= #
CPPFLAGS	= -Wall -g
CPPFLAGS	+= # -O2
CPPFLAGS	+= # -ansi
CPPFLAGS	+= # -traditional
CPPFLAGS	+= # -funroll-loops -fomit-frame-pointer
CXXFLAGS	= # -felide-constructors -fmemoize-lookups
DFLAGS		= -DINLINE=inline
DFLAGS		+= -DCONST=const
LDFLAGS		= # -s
LDLIBS		= -lm
# LDLIBS		+= -lefence
LDLIBS		+= # -lvga
LDLIBS		+= # -ly
LDLIBS		+= # -ltermcap
LDLIBS		+= -ll # lex
LDLIBS		+= -ly # yacc
CLEAN		= #

LEXFILE		= lex.yy.c

define compile.c
$(RM) $@
$(COMPILE.c) $< $(OUTPUT_OPTION)
endef

define compile.f
$(RM) $@
$(COMPILE.f) -c $< -o $@
endef

define compile.cob
$(RM) $@
$(COMPILE.cob) $(COBCFREE) $(COBCWARN) -c $< -o $@
endef

define compile.cc
$(RM) $@
$(COMPILE.cc) $< $(OUTPUT_OPTION)
endef

define link.c
$(RM) $@
$(LINK.c) $^ $(LOADLIBES) -o $@ $(LDLIBS)
endef

define link.cc
$(RM) $@
$(LINK.cc) $^ $(LOADLIBES) -o $@ $(LDLIBS)
endef

define lex.l
@$(RM) $@
$(LEX) $<
mv $(LEXFILE) $@
endef

define yacc.y
@$(RM) $@
$(YACC) -d $<
endef

define pod2man.pl
@$(RM) $@
$(POD2MAN) $< > $@
endef

define man2ps.1
@$(RM) $@
$(GROFF) -T ps -man $< > $@
endef

define rst2man.txt
@$(RM) $@
$(RST2MAN) $< > $@
endef

define rst2html.txt
@$(RM) $@
$(RST2HTML) $< > $@
endef

define rst2latex.txt
@$(RM) $@
$(RST2LATEX) $< > $@
endef

define rst2odt.txt
@$(RM) $@
$(RST2ODT) $< > $@
endef

define debug
$(DEBUGGER)
endef

define ctangle
$(RM) $@
$(CTANGLE) $<
endef

define cweave
$(RM) $@
$(CWEAVE) $<
endef

define notangle
$(RM) $@
$(NOTANGLE) -R$@ $< > $@
endef

define noweave
$(RM) $@
$(NOWEAVE) $< > $@
endef

define tex
$(RM) $@
$(TEX) $<
endef

define latex
$(RM) $@
$(LATEX) $<
$(LATEX) $<
endef

define dvips
$(RM) $@
$(DVIPS) -t $(PAPER) $< -o $@
endef

define gnuplot
$(RM) $@
@echo set terminal mf > gnuplot.do
@echo set output '"'$@'"' >> gnuplot.do
@cat $< >> gnuplot.do
@echo cp $< gnuplot.do
$(GNUPLOT) < gnuplot.do
$(RM) gnuplot.do
endef

define mf
$(RM) $@
$(MF) '\mode=localfont; \mag=1; input $<'
endef

define gftopk
$(RM) $@
$(GFTOPK) $<
endef

define sed
$(SED) -f $(SEDCMD) $@ > $(SEDTMP)
mv $(SEDTMP) $@
endef

define makeindex
$(MAKEINDEX) $(MAKEINDEXFLAGS) $<
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

%.c:		%.f
		$(lex.l)

%.tab.c:	%.y
		$(yacc.y)

%.1:		%.pl
		$(pod2man.pl)

%.ps:		%.1
		$(man2ps.1)

%.1:		%.$(RST)
		$(rst2man.txt)

%.tex:		%.$(RST)
		$(rst2latex.txt)

%.pdf:		%.tex
		$(latex)

%.html:		%.$(RST)
		$(rst2html.txt)

%.odt:		%.$(RST)
		$(rst2odt.txt)

%.o:		%.c
		$(compile.c)

%.o:		%.f
		$(compile.f)

%.o:		%.cob
		$(compile.cob)

%.o:		%.cc
		$(compile.cc)

%.c:		%.l
		$(lex.l)

%.tab.c:	%.y
		$(yacc.y)

%.cc:		%.txt
		$(generate)

%.hh:		%.txt
		$(generate)

%.c:		%.w
		$(ctangle)

%.tex:		%.w
		$(cweave)

%.c:		%.$(NOWEB)
		$(notangle)

%.h:		%.$(NOWEB)
		$(notangle)

%.cc:		%.$(NOWEB)
		$(notangle)

%.hh:		%.$(NOWEB)
		$(notangle)

%.tex:		%.$(NOWEB)
		$(noweave)
		$(sed)

%.mf:		%.$(DOPLOT)
		$(gnuplot)

%.$(RES1)gf:	%.mf
		$(mf)
		mv $(<:%.mf=%.$(RES2)gf) $@

%.$(RES1)pk:	%.$(RES1)gf
		$(gftopk)

%.$(RES2)gf:	%.mf
		$(mf)

%.$(RES2)pk:	%.$(RES2)gf
		$(gftopk)

%.idx:		%.tex
		$(latex)

%.ind:		%.idx
		$(makeindex)

OBJS		= #
FILES		= Makefile
FFILES          = helper.f dachflaeche.f
COBFILES	= helloworld.cob
FILES		+= $(FFILES) $(COBFILES)
LEXFILES	= yylval.l
YACCFILES	= grammar.y
FILES		+= $(LEXFILES) $(YACCFILES)
YACCCFILES	= $(YACCFILES:%.y=%.tab.c)
YACCHFILES	= $(YACCCFILES:%.c=%.h)
CLEAN		+= $(YACCHFILES)
FOBJS		= $(FFILES:%.f=%.o)
OBJS		+= $(FOBJS)
COBOBJS		= $(COBFILES:%.cob=%.o)
OBJS		+= $(COBOBJS)
LEXOBJS		= $(LEXFILES:%.l=%.o)
OBJS		+= $(LEXOBJS)
YACCOBJS	= $(YACCCFILES:%.c=%.o)
OBJS		+= $(YACCOBJS)

PODFILE		= mycopy.pl
FILES		+= $(PODFILE)
MANFILE1	= $(PODFILE:%.pl=%.1)
PSFILE1		= $(MANFILE1:%.1=%.ps)
CLEAN		+= $(MANFILE1) $(PSFILE1)

RSTFILE		= anleitung.$(RST)
FILES		= $(RSTFILE)
MANFILE2	= $(RSTFILE:%.$(RST)=%.1)
HTMLFILE	= $(MANFILE2:%.1=%.html)
ODTFILE		= $(MANFILE2:%.1=%.odt)

LATEXFILES	= $(MANFILE2:%.1=%.tex)
PDFFILES	= $(LATEXFILES:%.tex=%.pdf)
CLEAN		+= $(PDFFILES)
CLEAN		+= $(LATEXFILES:%.tex=%.aux)
CLEAN		+= $(LATEXFILES:%.tex=%.out)
CLEAN		+= $(LATEXFILES:%.tex=%.log)
CLEAN		+= $(LATEXFILES:%.tex=%.ps)
CLEAN		+= $(MANFILE2) $(HTMLFILE) $(LATEXFILE) $(ODTFILE)

NOWEBFILE	= check.$(NOWEB)
NOWEBCFILES	= check.c
NOWEBHFILES	= $(NOWEBCFILES:%.c=%.h)
LATEXFILES2	= $(NOWEBFILE:%.$(NOWEB)=%.tex)
PDFFILES2	= $(LATEXFILES2:%.tex=%.pdf)
CLEAN		+= $(LATEXFILES2) $(PDFFILES2)
CLEAN		+= $(LATEXFILES2:%.tex=%.out)
CLEAN		+= $(LATEXFILES2:%.tex=%.aux)
CLEAN		+= $(LATEXFILES2:%.tex=%.log)

LATEXFILES3	= rezepte.tex
INCLATEXFILES3	= rezepte_neues_2.tex rezepte_rezepte.tex rezepte_salate.tex
INCLATEXFILES3	+= rezepte_auberginen.tex rezepte_spaghetti.tex
INCLATEXFILES3	+= rezepte_brotaufstriche.tex rezepte_chicoree.tex
INCLATEXFILES3	+= rezepte_spinat.tex rezepte_speisekarte_deutschland.tex
INCLATEXFILES3	+= rezepte_kartoffeln.tex rezepte_suppen.tex
INCLATEXFILES3	+= rezepte_kuchen.tex rezepte_title.tex rezepte_mezze.tex
INCLATEXFILES3	+= rezepte_zucchini.tex rezepte_neues.tex

PDFFILES3	= $(LATEXFILES3:%.tex=%.pdf)
IDXFILE3	= $(LATEXFILES3:%.tex=%.idx)
GLOFILE3	= $(LATEXFILES3:%.tex=%.glo)
GLSFILE3	= $(LATEXFILES3:%.tex=%.gls)
CLEAN		+= $(LATEXFILES3:%.tex=%.aux)
CLEAN		+= $(INCLATEXFILES3:%.tex=%.aux)
CLEAN		+= $(IDXFILE3) $(GLOFILE3) $(GLSFILE3) $(PDFFILES3)
CLEAN		+= $(LATEXFILES3:%.tex=%.toc)
CLEAN		+= $(LATEXFILES3:%.tex=%.ilg)
CLEAN		+= $(LATEXFILES3:%.tex=%.ind)
CLEAN		+= $(LATEXFILES3:%.tex=%.pdf)
CLEAN		+= $(LATEXFILES3:%.tex=%.out)
CLEAN		+= $(LATEXFILES3:%.tex=%.log)

LATEXFILES4	= all.tex
PDFFILES4	= $(LATEXFILES4:%.tex=%.pdf)
BIBFILE4	= $(LATEXFILES4:%.tex=%)
IDXFILE4	= $(LATEXFILES4:%.tex=%.idx)
GLOFILE4	= $(LATEXFILES4:%.tex=%.glo)
GLSFILE4	= $(LATEXFILES4:%.tex=%.gls)
CLEAN		+= missfont.log
CLEAN		+= $(IDXFILE4) $(GLOFILE4) $(GLSFILE4) $(PDFFILES4)
CLEAN		+= $(LATEXFILES4:%.tex=%.aux)
CLEAN		+= $(LATEXFILES4:%.tex=%.toc)
CLEAN		+= $(LATEXFILES4:%.tex=%.ilg)
CLEAN		+= $(LATEXFILES4:%.tex=%.ind)
CLEAN		+= $(LATEXFILES4:%.tex=%.bbl)
CLEAN		+= $(LATEXFILES4:%.tex=%.blg)
CLEAN		+= $(LATEXFILES4:%.tex=%.pdf)
CLEAN		+= $(LATEXFILES4:%.tex=%.out)
CLEAN		+= $(LATEXFILES4:%.tex=%.log)
CLEAN		+= $(LATEXFILES4:%.tex=%.lof)
CLEAN		+= $(LATEXFILES4:%.tex=%.lot)

PLOTFILES	= plot_sinh.$(DOPLOT)
FILES		+= $(PLOTFILES)
PKFILES		= $(PLOTFILES:%.$(DOPLOT)=%.$(RES1)pk)
PKFILES		+= $(PLOTFILES:%.$(DOPLOT)=%.$(RES2)pk)
CLEAN		+= $(PLOTFILES:%.$(DOPLOT)=%.mf)
CLEAN		+= $(PLOTFILES:%.$(DOPLOT)=%.tfm)
CLEAN		+= $(PLOTFILES:%.$(DOPLOT)=%.log)
CLEAN		+= $(PLOTFILES:%.$(DOPLOT)=%.$(RES1)gf)
CLEAN		+= $(PLOTFILES:%.$(DOPLOT)=%.$(RES2)gf)
CLEAN		+= $(PKFILES)

CLEAN		+= $(NOWEBHFILES) $(NOWEBCFILES)

PROGRAM1	= dachflaeche
PROGRAM2	= calc
PROGRAM3	= helloworld
PROGRAM4	= check
PROGRAMS	= $(PROGRAM1) $(PROGRAM2) $(PROGRAM3) $(PROGRAM4)
CLEAN		+= $(OBJS) $(PROGRAMS)
CLEAN		+= mycopy.1 mycopy.ps

.PHONY:		all
all::		$(PROGRAMS)
		@echo done.

doc:		$(PSFILE1) $(MANFILE1) $(MANFILE2) $(HTMLFILE) $(ODTFILE) $(PDFFILES) $(PDFFILES2) $(PKFILES) $(PDFFILES3) $(PDFFILES4)
		@echo done.

dachflaeche:	$(FOBJS)
		$(FORTRANC) $(FOBJS) -o $@

helloworld:	$(COBOBJS)
		$(COBOLC) -x $(COBFILES) -o $@

calc:		$(YACCOBJS) $(LEXOBJS)
		$(link.c)

check:		$(NOWEBCFILES)
		$(link.c)

rezepte.pdf:	rezepte.tex
		$(TOUCH) $(GLSFILE3)
		$(latex)
		$(MAKEINDEX) -s $(MAKEINDEXGST) -g $(GLOFILE3) -o $(GLSFILE3)
		$(MAKEINDEX) -g -s $(MAKEINDEXIST) $(IDXFILE3)
		$(latex)

all.pdf:	all.tex
		$(TOUCH) $(GLSFILE4)
		$(latex)
		$(BIBTEX) $(BIBFILE4)
		$(MAKEINDEX) -s $(MAKEINDEXGST) -g $(GLOFILE4) -o $(GLSFILE4)
		$(MAKEINDEX) -g -s $(MAKEINDEXIST) $(IDXFILE4)
		$(latex)

.PHONY:		clean
clean:
		$(RM) $(CLEAN)

print:		$(FILES)
		$(PRINT) $?
		touch print

.PHONY:		dummy
dummy:

dachflaeche.f:	helper.o
yylval.l:	grammar.tab.o
check.c:	check.h

#
# include a dependency file if one exists
#
ifeq (.depend,$(wildcard .depend))
include .depend
endif

# vim:ai sw=2
