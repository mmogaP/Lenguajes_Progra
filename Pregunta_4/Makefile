P4.exe: P4.l P4.y
	bison -d P4.y
	flex P4.l
	gcc lex.yy.c P4.tab.c -lfl -o P4.exe

clean:
	rm P4.tab.* lex.yy.c P4.exe