make:
	lex scanner.l
	yacc -d parser.y
	icc lex.yy.c y.tab.c -o standard-pascal -g
	./standard-pascal
