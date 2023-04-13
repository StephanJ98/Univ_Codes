FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

english:	english.tab.o english.lex.o
	$(CC) -o english english.tab.o english.lex.o $(LDLIBS)
english.lex.o:	english.lex.c english.tab.h
	$(CC) -c english.lex.c 
english.tab.o:	english.tab.c english.tab.h
	$(CC) -c english.tab.c 
english.tab.c:	english.y
	$(BISON) -d english.y
english.lex.c:	english.l
	$(FLEX) english.l
	mv  lex.yy.c english.lex.c

clean:
	rm  english.tab.o english.lex.o english.tab.c english.lex.c \
            english.tab.h english 