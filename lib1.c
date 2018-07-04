// This may look like C code, but it is really -*- C++ -*-
// lib1.c
// erzeugt Freitag, 29. Juni 2018 17:25 (C) 2018 von Leander Jedamus
// modifiziert Mittwoch, 04. Juli 2018 20:09 von Leander Jedamus
// modifiziert Samstag, 30. Juni 2018 09:49 von Leander Jedamus
// modifiziert Freitag, 29. Juni 2018 17:27 von Leander Jedamus

static const char* sccsid =
"@(#) lib1.c, (C) 2018 by Leander Jedamus";

#include <stdio.h>
#include "lib1.h"

double pi = 3.1415926;

int f() {
  printf("ich bin f.\n");
  return 0;
}

void dummyl1() {
  printf("%s",sccsid);
}

// vim:cindent ai sw=2
