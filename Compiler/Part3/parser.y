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
    #include <stdlib.h>
    #include <string.h>
    #include "node.h"

    void yyerror(const char *str);
    int yywrap();

    extern struct nodeType* ASTRoot;

%}

%union
{
    struct nodeType * node;
    int number;
    double dbnumber;
    char * string;
}

%token <number> NUM_INT
%token <dbnumber> NUM_REAL
%token <node> IDENTIFIER
%token <node> PROGRAM
%token <node> ASSIGNMENT
%token <node> RPAREN LPAREN RBRAC LBRAC
%token <node> PBEGIN END
%token <node> INTEGER REAL ARRAY STRING
%token <node> PLUS MINUS STAR DIV
%token <node> EQUAL NOTEQUAL LT GT LE GE NOT
%token <node> COLON SEMICOLON COMMA
%token <node> DOT DOTDOT
%token <node> FUNCTION PROCEDURE
%token <node> TYPE VAR
%token <node> WHILE DO IF ELSE THEN OF

%type <node> prog identifier_list standard_type subprogram_declarations subprogram_declaration subprogram_head arguments parameter_list optional_var compound_statement optional_statements statement_list statement variable tail procedure_statement expression_list expression simple_expression term factor addop mulop relop lambda

%%
file: prog
        { ASTRoot = $1; }
    ;
prog : PROGRAM IDENTIFIER LPAREN identifier_list RPAREN SEMICOLON
    declarations
    subprogram_declarations
    compound_statement
    DOT
        {
            deleteNode($1);
            $$ = $2;            // program name
            deleteNode($3);     // (
            deleteNode($4);     // para
            deleteNode($5);     // )
            deleteNode($6);     // ;
            addChild($$, $7);   // declarations
            addChild($$, $8);   // subprogram_declaration
            addChild($$, $9);   // compound_statement
            deleteNode($10);    // .
        }
    ;

identifier_list : IDENTIFIER
        {
            struct nodeType* tmp = newNode(NODE_IDENTIFER);
        }
    | identifier_list COMMA IDENTIFIER
        {
        }
    ;

declarations : declarations VAR identifier_list COLON type SEMICOLON
    |
    ;

type : standard_type
    | ARRAY LBRAC NUM_INT DOTDOT NUM_INT RBRAC OF type
    ;

standard_type : INTEGER
    | REAL
    | STRING
    ;

subprogram_declarations :
    subprogram_declarations subprogram_declaration SEMICOLON
    | lambda
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
    | lambda
    ;

parameter_list : optional_var identifier_list COLON type
    | optional_var identifier_list COLON type SEMICOLON parameter_list
    ;

optional_var : VAR
    | lambda
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
    | lambda
    ;

variable : IDENTIFIER tail
    ;
tail : RBRAC expression LBRAC tail
    | lambda
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
    | NUM_INT
    | NUM_REAL
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

lambda : ;

%%

struct nodeType *ASTRoot;

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
    return;
}

int yywrap()
{
    return 1;
}

int main()
{
    int result = yyparse();
    if(result) return 0;
    printf("********************************\n"
           "*       No syntax error!       *\n"
           "********************************\n");

    printTree(ASTRoot, 0);

    //SymbolTable.size = 0;
    //semanticCheck(ASTRoot);
    printf("********************************\n"
           "*      No semantic error!      *\n"
           "********************************\n");

    return 0;
}
