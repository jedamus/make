/* -*- C -*- */
/* main.c */
/* erzeugt Freitag, 29. Juni 2018 17:28 (C) 2018 von Leander Jedamus */
/* modifiziert Montag, 09. Juli 2018 10:44 von Leander Jedamus */
/* modifiziert Mittwoch, 04. Juli 2018 20:09 von Leander Jedamus */
/* modifiziert Freitag, 29. Juni 2018 17:33 von Leander Jedamus */

static const char* sccsid =
"@(#) main.c, (C) 2018 by Leander Jedamus";

#include <stdio.h>
#include "lib1.h"
#include "lib2.h"

int main(int argc, char** argv)
{
  f();
  g();
  return 0;
}

void dummym() {
  printf("%s",sccsid);
}

/* vim:set cindent ai sw=2: */

