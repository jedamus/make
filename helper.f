C erzeugt Mittwoch, 24. Juni 2015 12:54 (C) 2015 von Leander Jedamus
C modifiziert Mittwoch, 24. Juni 2015 12:57 von Leander Jedamus
       
       MODULE helper
         IMPLICIT NONE

       CONTAINS

         REAL FUNCTION RUNDEN(zahl, stellen)
           IMPLICIT NONE
           REAL    :: zahl
           INTEGER :: stellen
           REAL    :: faktor

           faktor = 10**stellen
           RUNDEN = INT(zahl*faktor+0.5)/faktor
         END FUNCTION RUNDEN

       END MODULE helper
       
C vim:ai sw=4 expandtab

