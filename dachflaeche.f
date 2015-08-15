C created Samstag, 19. Januar 2013 09:06 (C) 2013 by Leander Jedamus
C modifiziert Mittwoch, 24. Juni 2015 12:59 von Leander Jedamus
C modified Samstag, 19. Januar 2013 16:55 by Leander Jedamus
C modified Samstag, 19. Januar 2013 16:54 by Leander Jedamus
C modified Samstag, 19. Januar 2013 16:52 by Leander Jedamus
C modified Samstag, 19. Januar 2013 12:44 by Leander Jedamus
C modified Samstag, 19. Januar 2013 09:27 by Leander Jedamus
       
       PROGRAM dachflaeche

	 USE helper

         IMPLICIT NONE

         REAL   :: PI, RAD2DEG, DEG2RAD
         REAL   :: hoehe, breite, laenge
         REAL   :: zw, zw_out
         REAL   :: s, s_out
         REAL   :: flaeche, flaeche_out

         PI = 4.0 * ATAN(1.0)
         RAD2DEG = 180.0 / PI
         DEG2RAD = 1.0 / RAD2DEG

         WRITE(*,*) "Hoehe des Daches : "
         READ(*,*) hoehe
         WRITE(*,*) "Breite des Hauses : "
         READ(*,*) breite
         WRITE(*,*) "Laenge des Hauses : "
         READ(*,*) laenge

         breite = breite/2.0

         zw = ATAN(hoehe/breite)
         zw_out = RUNDEN(zw * RAD2DEG,2)
         PRINT 1001, "Winkel der Dachschraege  : ", zw_out, "°"

         s = hoehe / SIN(zw)
         s_out = RUNDEN(s,2)
         PRINT 1001, "Laenge des Daches        : ", s_out, " m"

         flaeche = 2.0 * s * laenge
         flaeche_out = RUNDEN(flaeche,2)
         PRINT 1001, "Gesamtflaeche des Daches : ", flaeche_out, "m^2"
 1001    FORMAT(A, G11.4, A)

       END PROGRAM dachflaeche
       
C vim:ai sw=4 expandtab

