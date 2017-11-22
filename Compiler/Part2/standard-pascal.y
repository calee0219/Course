%{
/*
 * grammar.y
 *
 * Pascal grammar in Yacc format, based originally on BNF given
 * in "Standard Pascal -- User Reference Manual", by Doug Cooper.
 * This in turn is the BNF given by the ANSI and ISO Pascal standards,
 * and so, is PUBLIC DOMAIN. The grammar is for ISO Level 0 Pascal.
 * The grammar has been massaged somewhat to make it LALR, and added
 * the following extensions.
 *
 * constant expressions
 * otherwise statement in a case
 * productions to correctly match else's with if's
 * beginnings of a separate compilation facility
 */
    #include <stdio.h>
    #include <string.h>

    void yyerror(const char *str) {
        fprintf(stderr,"error: %s\n",str);
    }
    int main() {
        yyparse();
    }

%}

%token PROGRAM
%token ASSIGNMENT
%token RPAREN LPAREN RBRAC LBRAC
%token PBEGIN END
%token INTEGER REAL ARRAY NUMBER STRING
%token PLUS MINUS STAR DIV
%token EQUAL NOTEQUAL LT GT LE GE NOT
%token COLON SEMICOLON COMMA
%token DOT DOTDOT
%token FUNCTION IDENTIFIER PROCEDURE
%token TYPE VAR
%token WHILE DO IF ELSE THEN OF

%%
file : prog
    ;
prog : PROGRAM IDENTIFIER LPAREN identifier_list RPAREN SEMICOLON
    declarations
    subprogram_declarations
    compound_statement
    DOT
    ;

identifier_list : IDENTIFIER
    | identifier_list COMMA IDENTIFIER
    ;

declarations : declarations VAR identifier_list COLON type SEMICOLON
    |
    ;

type : standard_type
    | ARRAY LBRAC NUMBER DOTDOT NUMBER RBRAC OF type
    ;

standard_type : INTEGER
    | REAL
    | STRING
    ;

subprogram_declarations :
    subprogram_declarations subprogram_declaration SEMICOLON
    |
    ;

subprogram_declaration :
    subprogram_head
    declarations
    compound_statement
    ;
subprogram_head : FUNCTION IDENTIFIER arguments COLON standard_type SEMICOLON
    | PROCEDURE IDENTIFIER arguments SEMICOLON
    ;

arguments : LPAREN parameter_list RPAREN
    |
    ;

parameter_list : optional_var identifier_list COLON type
    | optional_var identifier_list COLON type SEMICOLON parameter_list
    ;

optional_var : VAR
    |
    ;

compound_statement : PBEGIN
    optional_statements
    END
    ;

optional_statements : statement_list
    ;

statement_list : statement
    | statement_list SEMICOLON statement
    ;

statement : variable ASSIGNMENT expression
    | procedure_statement
    | compound_statement
    | IF expression THEN statement ELSE statement
    | WHILE expression DO statement
    |
    ;

variable : IDENTIFIER tail
    ;
tail : RBRAC expression LBRAC tail
    |
    ;

procedure_statement : IDENTIFIER
    | IDENTIFIER LPAREN expression_list RPAREN
    ;

expression_list : expression
    | expression_list COMMA expression
    ;

expression : simple_expression
    | simple_expression relop simple_expression
    ;

simple_expression : term
    | simple_expression addop term
    ;

term : factor
    | term mulop factor
    ;

factor : IDENTIFIER tail
    | IDENTIFIER LPAREN expression_list RPAREN
    | NUMBER
    | LPAREN expression RPAREN
    | NOT factor
    ;

addop : PLUS | MINUS
    ;

mulop : STAR | DIV
    ;


relop : LT
    | GT
    | EQUAL
    | LE
    | GE
    | NOTEQUAL
    ;
