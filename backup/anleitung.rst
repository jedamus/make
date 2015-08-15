===================
man page for test_
===================

:Author: Leander Jedamus
:Contact: ljedamus@gmail.com
:Revision: $Revision: 1.0 $
:Date: $Date: 27.11.2012 08:07:00 +0100 (Die, 27.Nov.2012) $
:Copyright: 2012 Leander Jedamus.

This is some example text.

Module information
''''''''''''''''''

  Here comes the text for module information.
  See References_ (<-- this is a link).
  *hervorgehoben*, **besonders hervorgehoben**. `Phrase reference`_ 
  Siehe rst_.

Hier kommen zwei nicht nummerierte Listen:

* text1
* text2
* text3

- item1
- item2
- item3

1. Dies ist ein Beispiel für eine Aufzählungsliste. Sie wird
   hier umbrochen, wenn genug Text zusammen kommt, um die Zeile
   zu füllen. Das sollte jetzt reichen, weil genug Text zusammengekommen ist,
   um auch bei großen Bildschirmen einen Umbruch zu erzeugen.
2. hier geht es weiter.

**was**
  Dies ist eine Definition von was.

**wie**
  Dies ist eine zweite Definition. Hier wird "wie" erklärt.

References
''''''''''

Hier kommt die Referenz. Will man Code einfügen, macht man das so

::

  if (i<2) and (j>5):
      pass
  elif (k == 2):
      continue
  else:
      break

Hier geht es weiter mit normalem Text. Jetzt kommt ein weiteres Literal::

> Dies ist ein anderes Beispiel für
> literalen Text.

Phrase reference
''''''''''''''''

Hier kommt eine Phasenreferenz hin.

Convention
''''''''''

.. NOTE::

  * text1
  * text2

.. _test: http://www.example.com/test/
.. _rst: http://docutils.sourceforge.net/docs/user/rst/quickref.html
