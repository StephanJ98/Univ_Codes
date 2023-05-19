fileName = "LOGFILE_$(shell date +%F_%T).txt"

moronico:	moronico.tab.c moronico.lex.c
	gcc -o moronico moronico.tab.c lex.yy.c -lm
	chmod u+x moronico
moronico.tab.c:	moronico.y
	bison -dv moronico.y
moronico.lex.c:	moronico.l
	flex moronico.l
log:
	touch $(fileName)
	echo "################### Compilación: \n" >> $(fileName) 2>&1
	make moronico >> $(fileName) 2>&1
	echo "\n################### Resultado Test: \n" >> $(fileName) 2>&1
	./moronico ordenar.mor >> $(fileName) 2>&1
clean:
	rm  moronico.tab.c moronico.tab.h moronico.output lex.yy.c moronico