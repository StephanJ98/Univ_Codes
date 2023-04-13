FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

no-ambiguo:	no-ambiguo.tab.o no-ambiguo.lex.o
	$(CC) -o no-ambiguo no-ambiguo.tab.o no-ambiguo.lex.o $(LDLIBS)
no-ambiguo.lex.o:	no-ambiguo.lex.c no-ambiguo.tab.h
	$(CC) -c no-ambiguo.lex.c 
no-ambiguo.tab.o:	no-ambiguo.tab.c no-ambiguo.tab.h
	$(CC) -c no-ambiguo.tab.c 
no-ambiguo.tab.c:	no-ambiguo.y
	$(BISON) -d no-ambiguo.y
no-ambiguo.lex.c:	no-ambiguo.l
	$(FLEX) no-ambiguo.l
	mv  lex.yy.c no-ambiguo.lex.c

clean:
	rm  no-ambiguo.tab.o no-ambiguo.lex.o no-ambiguo.tab.c \
            no-ambiguo.lex.c no-ambiguo.tab.h no-ambiguo 