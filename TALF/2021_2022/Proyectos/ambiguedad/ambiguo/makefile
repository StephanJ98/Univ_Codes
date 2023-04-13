FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

ambiguo:	ambiguo.tab.o ambiguo.lex.o
	$(CC) -o ambiguo ambiguo.tab.o ambiguo.lex.o $(LDLIBS)
ambiguo.lex.o:	ambiguo.lex.c ambiguo.tab.h
	$(CC) -c ambiguo.lex.c 
ambiguo.tab.o:	ambiguo.tab.c ambiguo.tab.h
	$(CC) -c ambiguo.tab.c 
ambiguo.tab.c:	ambiguo.y
	$(BISON) -d ambiguo.y
ambiguo.lex.c:	ambiguo.l
	$(FLEX) ambiguo.l
	mv  lex.yy.c ambiguo.lex.c

clean:
	rm  ambiguo.tab.o ambiguo.lex.o ambiguo.tab.c ambiguo.lex.c \
            ambiguo.tab.h ambiguo 