# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Mittwoch, 02. September 2015 14:28 von Leander Jedamus
# modifiziert Dienstag, 01. September 2015 18:11 von Leander Jedamus
# modifiziert Samstag, 15. August 2015 12:35 von Leander Jedamus
# modifiziert Mittwoch, 29. Juli 2015 13:28 von Leander Jedamus
# modifiziert Freitag, 17. Juli 2015 20:37 von Leander Jedamus
# modifiziert Dienstag, 14. Juli 2015 17:19 von Leander Jedamus
# modifiziert Mittwoch, 08. Juli 2015 15:20 von Leander Jedamus
# modifiziert Samstag, 04. Juli 2015 14:11 von Leander Jedamus

COBOLC          = cobc
#COBCWARN	= -W
COBCWARN	=
#COBCFREE	= -free
COBCFREE	=

COMPILE.cob	= $(COBOLC) -I /usr/local/include -L /usr/local/lib

define compile.cob
$(RM) $@
$(COMPILE.cob) $(COBCFREE) $(COBCWARN) -c $< -o $@
endef

%.o:		%.cob
		$(compile.cob)

# vim:ai sw=2

