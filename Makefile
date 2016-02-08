# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Montag, 08. Februar 2016 15:26 von Leander Jedamus
# modifiziert Freitag, 23. Oktober 2015 12:39 von Leander Jedamus
# modifiziert Montag, 21. September 2015 12:41 von Leander Jedamus
# modifiziert Mittwoch, 02. September 2015 14:44 von Leander Jedamus
# modifiziert Dienstag, 01. September 2015 18:11 von Leander Jedamus
# modifiziert Samstag, 15. August 2015 12:35 von Leander Jedamus
# modifiziert Mittwoch, 29. Juli 2015 13:28 von Leander Jedamus
# modifiziert Freitag, 17. Juli 2015 20:37 von Leander Jedamus
# modifiziert Dienstag, 14. Juli 2015 17:19 von Leander Jedamus
# modifiziert Mittwoch, 08. Juli 2015 15:20 von Leander Jedamus
# modifiziert Samstag, 04. Juli 2015 14:11 von Leander Jedamus

SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm

include Makefile.c_and_c++
include Makefile.latex
include Makefile.flex_and_bison
include Makefile.cweb_and_noweb
include Makefile.documentation
include Makefile.cobol
include Makefile.FORTRAN

DEBUGGER	= gdb
RM		= rm -f
GENERATE	= ./generate2
PRINT		= print
TOUCH		= touch

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

define debug
$(DEBUGGER)
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

%.cc:		%.txt
		$(generate)

%.hh:		%.txt
		$(generate)

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
CLEAN		+= helper.mod
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
INCREZEPTFILES	= rezept_header.tex rezept_vorspann.tex rezept_toc.tex
INCREZEPTFILES	+= rezept_index.tex rezept_gls.tex

PDFFILES3	= $(LATEXFILES3:%.tex=%.pdf)
IDXFILE3	= $(LATEXFILES3:%.tex=%.idx)
GLOFILE3	= $(LATEXFILES3:%.tex=%.glo)
GLSFILE3	= $(LATEXFILES3:%.tex=%.gls)
CLEAN		+= $(LATEXFILES3:%.tex=%.aux)
CLEAN		+= $(INCLATEXFILES3:%.tex=%.aux)
CLEAN		+= $(IDXFILE3) $(GLOFILE3) $(GLSFILE3)
#CLEAN		+= $(PDFFILES3)
CLEAN		+= $(LATEXFILES3:%.tex=%.toc)
CLEAN		+= $(LATEXFILES3:%.tex=%.ilg)
CLEAN		+= $(LATEXFILES3:%.tex=%.ind)
#CLEAN		+= $(LATEXFILES3:%.tex=%.pdf)
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
		$(COMPILE.cob) -x $(COBFILES) -o $@

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
ifeq ($(machtype),MacOS)
clean:
		$(RM) $(CLEAN)
		$(RM) -r check.dSYM
else
clean:
		$(RM) $(CLEAN)
endif

print:		$(FILES)
		$(PRINT) $?
		$(TOUCH) print

.PHONY:		dummy
dummy:

dachflaeche.f:	helper.o
yylval.l:	grammar.tab.o
check.c:	check.h
rezepte.pdf:	$(INCLATEXFILES3) $(INCREZEPTFILES)

#
# include a dependency file if one exists
#
ifeq (.depend,$(wildcard .depend))
include .depend
endif
# vim:ai sw=2

