P1.exe: P1.l P1.y
	bison -d P1.y
	flex P1.l
	gcc lex.yy.c P1.tab.c

clean:
	rm P1.tab.* lex.yy.c P1.exe