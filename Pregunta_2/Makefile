P2.exe: P2.l P2.y
	bison -d P2.y
	flex P2.l
	gcc lex.yy.c P2.tab.c

clean:
	rm P2.tab.* lex.yy.c P2.exe