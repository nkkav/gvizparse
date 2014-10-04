=======================
 gvizparse user manual
=======================

+-------------------+----------------------------------------------------------+
| **Title**         | gvizparse (Parser for the Graphviz/dot grammar).         |
+-------------------+----------------------------------------------------------+
| **Author**        | Nikolaos Kavvadias (C) 2007, 2008, 2009, 2010, 2011,     |
|                   | 2012, 2013, 2014                                         |
+-------------------+----------------------------------------------------------+
| **Contact**       | nikos@nkavvadias.com                                     |
+-------------------+----------------------------------------------------------+
| **Website**       | http://www.nkavvadias.com                                |
+-------------------+----------------------------------------------------------+
| **Release Date**  | 04 October 2014                                          |
+-------------------+----------------------------------------------------------+
| **Version**       | 1.0.0                                                    |
+-------------------+----------------------------------------------------------+
| **Rev. history**  |                                                          |
+-------------------+----------------------------------------------------------+
|        **v1.0.0** | 2014-10-04                                               |
|                   |                                                          |
|                   | Updated and uploaded to github.                          |
+-------------------+----------------------------------------------------------+


1. Introduction
===============

``gvizparse`` is a flex/bison-based parser for the Graphviz/dot graph 
representation format supported by the popular Graphviz graph layout and 
visualization tool (http://www.graphviz.org). 

This grammar is based on the original grammar written by Richard Schneider 
(richard@blackhen.co.nz) for the GOLD parser builder 
(http://www.goldparser.org).

The distribution also contains a couple of sample test files in the ``/test`` 
subdirectory in order to evaluate Graphviz files both with and without custom 
attributes. 

Richard Schneider's version of the Graphviz grammar for the GOLD parser builder 
can still be downloaded from the GOLD Parsing System's website: 
http://goldparser.org


2. File listing
===============

The ``gvizparse`` file collection includes the following files: 

+-----------------------+------------------------------------------------------+
| /gvizparse            | Top-level directory                                  |
+-----------------------+------------------------------------------------------+
| AUTHORS               | List of authors.                                     |
+-----------------------+------------------------------------------------------+
| LICENSE               | License argeement (Modified BSD license).            |
+-----------------------+------------------------------------------------------+
| Makefile              | GNU makefile for building the parser.                |
+-----------------------+------------------------------------------------------+
| README.rst            | This file.                                           |
+-----------------------+------------------------------------------------------+
| README.html           | HTML version of README.                              |
+-----------------------+------------------------------------------------------+
| README.pdf            | PDF version of README.                               |
+-----------------------+------------------------------------------------------+
| VERSION               | Current version.                                     |
+-----------------------+------------------------------------------------------+
| graphviz.grm          | The GOLD parser grammar for Graphviz.                |
+-----------------------+------------------------------------------------------+
| graphviz.l            | Lex/flex lexical analyzer for the Graphviz grammar.  |
+-----------------------+------------------------------------------------------+
| graphviz.grm          | Bison/yacc syntax analyzer for the Graphviz grammar. |
+-----------------------+------------------------------------------------------+
| rst2docs.sh           | Bash script for generating the HTML and PDF versions |
|                       | of the documentation (README).                       |
+-----------------------+------------------------------------------------------+
| /test                 | Test files subdirectory                              |
+-----------------------+------------------------------------------------------+
| datapath.dot          | Graphviz file representing a partial datapath.       |
+-----------------------+------------------------------------------------------+
| datapath.dot.png      | PNG visualization of the above Graphviz file.        |
+-----------------------+------------------------------------------------------+
| datapath_attrs.dot    | Graphviz file with custom attributes (operator,      |
|                       | input, output, hardware) representing a partial      |
|                       | datapath.                                            |
+-----------------------+------------------------------------------------------+
| datapath_attrs.dot.png| PNG visualization of the above Graphviz file.        |
+-----------------------+------------------------------------------------------+
| test.sh               | Bash shell script for running the tests.             |
+-----------------------+------------------------------------------------------+


3. Usage
========

In order to build the Graphviz parser use the Makefile from the top-level 
directory:

| ``$ make clean ; make``

This will generate diagnostic output for the parser:

``graphviz.output``: 
  Summary of the automaton's state transitions including shift-reduce and 
  reduce-reduce conflicts (there are no such conflicts present in the Graphviz 
  grammar).
``graphviz.dot``
  Graphviz/dot representation of the automaton.
``graphviz.vcg``
  GDL/VCG representation of the automaton.

and the actual parser executable, ``gvizparse`` or ``gvizparse.exe``.

To execute the parser on a sample file, first change directory to the test 
subdirectory:

| ``$ cd test``

and then run the parser on a sample input:

| ``$ ../gvizparse.exe datapath.dot``

The parser can also be tested by running a sample provided script as follows:

| ``$ ./test.sh``



4. Prerequisites
================

There are no external dependencies for building the Graphviz parser. However, 
in order to visualize the sample graphs in ``/gvizparse/test`` the Graphviz 
distribution is needed, which can be downloaded from http://www.graphviz.org 
for a number of host OS environments. ``test.sh`` assumes that Graphviz' 
``dot`` executable is already in the ``PATH``.
