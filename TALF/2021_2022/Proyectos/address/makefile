FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

address:	address.tab.o address.lex.o
	$(CC) -o address address.tab.o address.lex.o $(LDLIBS)
address.lex.o:	address.lex.c address.tab.h
	$(CC) -c address.lex.c 
address.tab.o:	address.tab.c address.tab.h
	$(CC) -c address.tab.c 
address.tab.c:	address.y
	$(BISON) -d address.y
address.lex.c:	address.l
	$(FLEX) address.l
	mv  lex.yy.c address.lex.c

clean:
	rm  address.tab.o address.lex.o address.tab.c address.lex.c \
            address.tab.h address 