FLEX = /usr/bin/flex
CFLAGS = -g
LDLIBS = -lfl
CC = /usr/bin/gcc
BISON = /usr/bin/bison

calc:	calc.tab.o calc.lex.o
	$(CC) -o calc calc.tab.o calc.lex.o $(LDLIBS)
calc.lex.o:	calc.lex.c calc.tab.h
	$(CC) -c calc.lex.c 
calc.tab.o:	calc.tab.c calc.tab.h
	$(CC) -c calc.tab.c 
calc.tab.c:	calc.y
	$(BISON) -d calc.y
calc.lex.c:	calc.l
	$(FLEX) calc.l
	mv  lex.yy.c calc.lex.c

clean:
	rm  calc.tab.o calc.lex.o calc.tab.c calc.lex.c calc.tab.h \
	calc 