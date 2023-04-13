FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

pascal:	pascal.tab.o pascal.lex.o
	$(CC) -o pascal pascal.tab.o pascal.lex.o $(LDLIBS)
pascal.lex.o:	pascal.lex.c pascal.tab.h
	$(CC) -c pascal.lex.c 
pascal.tab.o:	pascal.tab.c pascal.tab.h
	$(CC) -c pascal.tab.c 
pascal.tab.c:	pascal.y
	$(BISON) -d pascal.y
pascal.lex.c:	pascal.l
	$(FLEX) pascal.l
	mv  lex.yy.c pascal.lex.c

clean:
	rm  pascal.tab.o pascal.lex.o pascal.tab.c pascal.lex.c \
            pascal.tab.h pascal 