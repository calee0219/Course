make:
	lex standard-pascal-no-yacc.l
	yacc -d standard-pascal.y
	icc lex.yy.c y.tab.c -o standard-pascal
	./standard-pascal
