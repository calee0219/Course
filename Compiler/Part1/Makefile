0:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test00.p 2> output

1:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test01.p 2> output

a.out: lex.yy.c
	cc lex.yy.c -ll

lex.yy.c:	standard-pascal-no-yacc.l
	flex standard-pascal-no-yacc.l

clean:
	rm a.out lex.yy.c
