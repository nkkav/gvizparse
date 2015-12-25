/*
 * Filename: graphviz.l
 * Purpose : Lexer for the Graphviz/dot file parser.
 * Author  : Nikolaos Kavvadias (C) 2007, 2008, 2009, 2010, 2011, 2012, 2013, 
 *                                  2014, 2015
 * Date    : 04-Oct-2014
 * Revision: 1.0.0 (14/10/04)
 *           Updated for github.
 */ 
%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "graphviz.tab.h"

#define MAXSIZE  1024
char any_name_s[MAXSIZE];

void count();

%}

ws	  [ \t\n]
anum  [a-zA-Z0-9_][a-zA-Z0-9_.]*
digit [0-9]
A	  [aA]
B	  [bB]
C	  [cC]
D	  [dD]
E	  [eE]
F	  [fF]
G	  [gG]
H	  [hH]
I	  [iI]
J	  [jJ]
K	  [kK]
L	  [lL]
M	  [mM]
N	  [nN]
O	  [oO]
P	  [pP]
Q	  [qQ]
R	  [rR]
S	  [sS]
T	  [tT]
U	  [uU]
V	  [vV]
W	  [wW]
X	  [xX]
Y	  [yY]
Z	  [zZ]

%%
"//".*          { count(); }
\"(\\.|[^\\"])*\"	{ count(); 
                  strcpy(any_name_s,yytext);
                  return(T_STRING); }
{ws}+		        ;
"["             { count();
                  return(T_LBRACKET); }
"]"             { count();
                  return(T_RBRACKET); }
"("             { count();
                  return(T_LPAREN); }
")"             { count();
                  return(T_RPAREN); }
"{"             { count();
                  return(T_LBRACE); }
"}"             { count();
                  return(T_RBRACE); }
","             { count();
                  return(T_COMMA); }
":"             { count();
                  return(T_COLON); }
";"             { count();
                  return(T_SEMI); }
"->"            { count();
                  return(T_DEDGE); }
"--"            { count();
                  return(T_UEDGE); }
"="             { count();
                  return(T_EQ); }
{D}{I}{G}{R}{A}{P}{H}     { count();
                  return(T_DIGRAPH); }
{G}{R}{A}{P}{H}           { count();
                  return(T_GRAPH); }
{S}{U}{B}{G}{R}{A}{P}{H}  { count();
                  return(T_SUBGRAPH); }
{A}{T}          { count();
                  return(T_AT); }
{S}{T}{R}{I}{C}{T}        { count();
                  return(T_STRICT); }
{N}{O}{D}{E}    { count();
                  return(T_NODE); }
{E}{D}{G}{E}    { count();
                  return(T_EDGE); }
{anum}          { count();
                  //any_name_s = malloc(sizeof(yytext)+1);
                  strcpy(any_name_s, yytext);
                  return(T_ID); }

%%


yywrap()
{
  return(1);
}

int column = 0;

void count()
{
  int i;

  for (i=0; yytext[i]!='\0'; i++)
    if (yytext[i] == '\n')
      column = 0;
    else if (yytext[i] == '\t')
      column += 8 - (column % 8);
    else
      column++;

  ECHO;
}
