%{
/*
 * scan.l
 *
 * lex input file for pascal scanner
 *
 * extensions: two ways to spell "external" and "->" ok for "^".
 */

#include <stdio.h>
#include "node.h"
#include "y.tab.h"

struct nodeType* newTokenNode(int tokenType);

int line_no = 1;
void commentof();

%}

A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK]
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY]
Z [zZ]
NQUOTE [^']

%%

{P}{R}{O}{G}{R}{A}{M}        {
    yylval.node = newTokenNode(PROGRAM);
    return(PROGRAM);
}
"("                          {
    yylval.node = newTokenNode(LPAREN);
    return(LPAREN);
}
")"                          {
    yylval.node = newTokenNode(RPAREN);
    return(RPAREN);
}
";"                          {
    yylval.node = newTokenNode(SEMICOLON);
    return(SEMICOLON);
}
"."                          {
    yylval.node = newTokenNode(DOT);
    return(DOT);
}
","                          {
    yylval.node = newTokenNode(COMMA);
    return(COMMA);
}
{V}{A}{R}                    {
    yylval.node = newTokenNode(VAR);
    return(VAR);
}
":"                          {
    yylval.node = newTokenNode(COLON);
    return(COLON);
}
{A}{R}{R}{A}{Y}              {
    yylval.node = newTokenNode(ARRAY);
    return(ARRAY);
}
"["                          {
    yylval.node = newTokenNode(LBRAC);
    return(LBRAC);
}
"]"                          {
    yylval.node = newTokenNode(RBRAC);
    return(RBRAC);
}
{O}{F}                       {
    yylval.node = newTokenNode(OF);
    return(OF);
}
{I}{N}{T}{E}{G}{E}{R}        {
    yylval.node = newTokenNode(INTEGER);
    return(INTEGER);
}
{R}{E}{A}{L}                 {
    yylval.node = newTokenNode(REAL);
    return(REAL);
}
{F}{U}{N}{C}{T}{I}{O}{N}     {
    yylval.node = newTokenNode(FUNCTION);
    return(FUNCTION);
}
{P}{R}{O}{C}{E}{D}{U}{R}{E}  {
    yylval.node = newTokenNode(PROCEDURE);
    return(PROCEDURE);
}
{B}{E}{G}{I}{N}              {
    yylval.node = newTokenNode(PBEGIN);
    return(PBEGIN);
}
{E}{N}{D}                    {
    yylval.node = newTokenNode(END);
    return(END);
}
":="                         {
    yylval.node = newTokenNode(ASSIGNMENT);
    return(ASSIGNMENT);
}
{I}{F}                       {
    yylval.node = newTokenNode(IF);
    return(IF);
}
{T}{H}{E}{N}                 {
    yylval.node = newTokenNode(THEN);
    return(THEN);
}
{E}{L}{S}{E}                 {
    yylval.node = newTokenNode(ELSE);
    return(ELSE);
}
{W}{H}{I}{L}{E}              {
    yylval.node = newTokenNode(WHILE);
    return(WHILE);
}
{D}{O}                       {
    yylval.node = newTokenNode(DO);
    return(DO);
}
"<"                          {
    yylval.node = newTokenNode(LT);
    return(LT);
}
">"                          {
    yylval.node = newTokenNode(GT);
    return(GT);
}
"<="                         {
    yylval.node = newTokenNode(LE);
    return(LE);
}
">="                         {
    yylval.node = newTokenNode(GE);
    return(GE);
}
"="                          {
    yylval.node = newTokenNode(EQUAL);
    return(EQUAL);
}
"!="                         {
    yylval.node = newTokenNode(NOTEQUAL);
    return(NOTEQUAL);
}
"+"                          {
    yylval.node = newTokenNode(PLUS);
    return(PLUS);
}
"-"                          {
    yylval.node = newTokenNode(MINUS);
    return(MINUS);
}
"*"                          {
    yylval.node = newTokenNode(STAR);
    return(STAR);
}
"/"                          {
    yylval.node = newTokenNode(DIV);
    return(DIV);
}
{N}{O}{T}                    {
    yylval.node = newTokenNode(NOT);
    return(NOT);
}
".."                         {
    yylval.node = newTokenNode(DOTDOT);
    return(DOTDOT);
}
[a-zA-Z]([a-zA-Z0-9])*       {
    yylval.node = newTokenNode(IDENTIFIER);
    yylval.node->value_valid = VALUE_VALID;
    yylval.node->value = (char*)malloc(yyleng+1);
    strcpy(yylval.node->value, yytext);
    return(IDENTIFIER);
}
[0-9]+                       {
    yylval.node = newTokenNode(NUM_INT);
    yylval.node->value_valid = VALUE_VALID;
    yylval.node->value = (char*)malloc(yyleng+1);
    strcpy(yylval.node->value, yytext);
    return(NUM_INT);
}
[0-9]+"."[0-9]+              {
    yylval.node = newTokenNode(NUM_REAL);
    yylval.node->value_valid = VALUE_VALID;
    yylval.node->value = (char*)malloc(yyleng+1);
    strcpy(yylval.node->value, yytext);
    return(NUM_REAL);
}
\/\/.*[^\n|\r]               {
    line_no++;
}

"(*"    |
"{"     { register int c;
        while ((c = input())) {
            if (c == '}') {
                break;
            } else if (c == '*') {
                if ((c = input()) == ')')
                    break;
                else
                    unput (c);
            } else if (c == '\n') {
                line_no++;
            } else if (c == 0) {
                commentof();
            }
        }
    }

[ \t\f]    ;

\r         ;
\n    line_no++;

[0-9]+[a-zA-Z]+ {
        fprintf(stderr,"Lexical analyzer error at line %d : %s\n",line_no,yytext);
    }

.    { fprintf (stderr,
        "'%c' (0%o): illegal charcter at line %d\n",
        yytext[0], yytext[0], line_no);
    }

%%

struct nodeType* newTokenNode(int tokenType) {
    struct nodeType *node = newNode(NODE_TOKEN);
    node->type = tokenType;

    return node;
}

void commentof()
{
    fprintf(stderr, "unexpected EOF inside comment at line %d\n", line_no);
    exit(1);
}
