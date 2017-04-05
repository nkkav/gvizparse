/*
 * Filename: gvizparse.c
 * Purpose : main() driver for the Graphviz (dot) file parser.
 * Author  : Nikolaos Kavvadias (C) 2007, 2008, 2009, 2010, 2011, 2012, 2013, 
 *                                  2014, 2015, 2016
 *           Original grammar for the GOLD parser builder written by
 *           Richard Schneider <richard@blackhen.co.nz>
 * Date    : 04-Oct-2014
 * Revision: 1.0.0 (14/10/04)
 *           Updated for github.
 *           
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include "graphviz.tab.h"

int enable_debug=0;
char *graphviz_file_name, *debug_file_name;
//
extern FILE *graphvizin;
FILE *debug_file;

// FUNCTION PROTOTYPES
// declared in "graphviz.tab.c", "graphviz.tab.c"
int graphvizparse();

/* print_usage:
 * Print usage information upon "-h" or incorrect input arguments.
 */
static void print_usage()
{
  printf("\n");
  printf("* Usage:\n");
  printf("* ./gvizparse [options] input.[dot|gv]\n");
  printf("* \n");
  printf("* Options:\n");
  printf("* \n");
  printf("*   -h:                  Print this help.\n");
  printf("*   -d:                  Enable debug output (nothing yet).\n");
  printf("* \n");
  printf("* For further information, please refer to the website:\n");
  printf("* http://electronics.physics.auth.gr/people/nkavv/\n\n");
}

int main(int argc, char **argv)
{
  int i;
  int copied_graphviz_file_name = 0;

  // Read input arguments.
  if (argc < 2)
  {
    print_usage();
    exit(1);
  }

  for (i = 1; i < argc; i++) {
    if (strcmp("-d",argv[i]) == 0) {
      enable_debug = 1;
    }
    else if (strcmp("-h",argv[i]) == 0) {
      print_usage();
      exit(1);
    }
    else {
      if (argv[i][0] != '-') {
        if (copied_graphviz_file_name == 0) {
          graphviz_file_name = malloc((strlen(argv[i])+1) * sizeof(char));
          strcpy(graphviz_file_name, argv[i]);
          copied_graphviz_file_name = 1;
        }
        else {
          print_usage();
          exit(1);
        }
      }
    }
  }

  // infile (argv[1]) is passed as input to the graphviz parser
  if (copied_graphviz_file_name==0) {
    print_usage();
    exit(1);
  }
  else {
    graphvizin = fopen(graphviz_file_name, "r");
  }

  // Parse graphviz file.
  graphvizparse();

  // Release memory.
  free(graphviz_file_name);

  return 0;
}
