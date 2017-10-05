0:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test00.p 2> output

1:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test01.p 2> output

2:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test02-pragma.p 2> output

31:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test03-nested-comments.p 2> output

32:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test03-runaway-comments.p 2> output

33:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/scanner-test03-runaway-string.p 2> output

long:	a.out
	./a.out < TEST-COMPILER01-FOR-SCANNER/test-longname.p 2> output

a.out: lex.yy.c
	cc lex.yy.c -ll

lex.yy.c:	standard-pascal-no-yacc.l
	flex standard-pascal-no-yacc.l

clean:
	rm a.out lex.yy.c output
