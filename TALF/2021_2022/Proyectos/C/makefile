FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

C:	C.tab.o C.lex.o
	$(CC) -o C C.tab.o C.lex.o $(LDLIBS)
C.lex.o:C.lex.c C.tab.h
	$(CC) -c C.lex.c 
C.tab.o:C.tab.c C.tab.h
	$(CC) -c C.tab.c 
C.tab.c:C.y
	$(BISON) -d C.y
C.lex.c:C.l
	$(FLEX) C.l
	mv  lex.yy.c C.lex.c

clean:
	rm  C.tab.o C.lex.o C.tab.c C.lex.c \
            C.tab.h C  *~ \#*