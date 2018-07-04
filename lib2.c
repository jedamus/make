// This may look like C code, but it is really -*- C++ -*-
// lib2.c
// erzeugt Freitag, 29. Juni 2018 17:25 (C) 2018 von Leander Jedamus
// modifiziert Mittwoch, 04. Juli 2018 20:09 von Leander Jedamus
// modifiziert Samstag, 30. Juni 2018 09:48 von Leander Jedamus
// modifiziert Freitag, 29. Juni 2018 17:32 von Leander Jedamus

static const char* sccsid =
"@(#) lib2.c, (C) 2018 by Leander Jedamus";

#include <stdio.h>
#include "lib2.h"

int g() {
  printf("ich bin g.\n");
  return 0;
}

void dummyl2() {
  printf("%s",sccsid);
}

// vim:cindent ai sw=2

