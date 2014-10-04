CC = gcc
#CXX = g++
YACC = bison
LEX = flex
CFLAGS = -O2
#CFLAGS = -O2 -DMINGW32_GCC
#YFLAGS = -t -v -d -p "graphviz"
YFLAGS = -t -v -d -g --report=all -p "graphviz"
LFLAGS = -Pgraphviz
EXE = .exe

all: gvizparse$(EXE)

gvizparse$(EXE): gvizparse.o graphviz.tab.o lex.graphviz.o
	$(CC) gvizparse.o graphviz.tab.o lex.graphviz.o -o gvizparse$(EXE)
	chmod 755 gvizparse$(EXE)
	strip gvizparse$(EXE)

graphviz.tab.h: graphviz.y
	$(YACC) $(YFLAGS) graphviz.y

graphviz.tab.c: graphviz.y
	$(YACC) $(YFLAGS) graphviz.y

graphviz.tab.o: graphviz.tab.c graphviz.tab.h
	$(CC) $(CFLAGS) -c graphviz.tab.c

lex.graphviz.c: graphviz.tab.h
	$(LEX) $(LFLAGS) graphviz.l

lex.graphviz.o: lex.graphviz.c graphviz.tab.h
	$(CC) $(CFLAGS) -c lex.graphviz.c

gvizparse.o: gvizparse.c graphviz.tab.h
	$(CC) $(CFLAGS) -c gvizparse.c

remdiag:
	rm -f graphviz.output graphviz.dot graphviz.vcg

tidy:
	rm -f *.o graphviz.tab.* lex.* graphviz.output graphviz.dot graphviz.vcg

clean:
	rm -f *.o graphviz.tab.* lex.* gvizparse$(EXE)
