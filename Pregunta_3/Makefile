P3.exe: P3.l P3.y
	bison -d P3.y
	flex P3.l
	gcc lex.yy.c P3.tab.c -o P3.exe

clean:
	rm P3.tab.* lex.yy.c P3.exe