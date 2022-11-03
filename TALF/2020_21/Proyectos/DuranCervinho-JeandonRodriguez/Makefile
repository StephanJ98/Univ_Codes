c-dull:	c-dull.tab.c c-dull.lex.c
	gcc -o c-dull c-dull.tab.c lex.yy.c -lm
c-dull.tab.c:	c-dull.y
	bison -dv c-dull.y
c-dull.lex.c:	c-dull.l
	flex c-dull.l
clean:
	rm  c-dull.tab.c c-dull.tab.h c-dull.output lex.yy.c c-dull