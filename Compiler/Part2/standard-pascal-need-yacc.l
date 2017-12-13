%{
/*
 * scan.l
 *
 * lex input file for pascal scanner
 *
 * extensions: two ways to spell "external" and "->" ok for "^".
 */

#include <stdio.h>
#include "y.tab.h"

int line_no = 1;

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

{P}{R}{O}{G}{R}{A}{M}        return(PROGRAM);
"("                          return(LPAREN);
")"                          return(RPAREN);
";"                          return(SEMICOLON);
"."                          return(DOT);
","                          return(COMMA);
{V}{A}{R}                    return(VAR);
":"                          return(COLON);
{A}{R}{R}{A}{Y}              return(ARRAY);
"["                          return(LBRAC);
"]"                          return(RBRAC);
{O}{F}                       return(OF);
{I}{N}{T}{E}{G}{E}{R}        return(INTEGER);
{R}{E}{A}{L}                 return(REAL);
{F}{U}{N}{C}{T}{I}{O}{N}     return(FUNCTION);
{P}{R}{O}{C}{E}{D}{U}{R}{E}  return(PROCEDURE);
{B}{E}{G}{I}{N}              return(PBEGIN);
{E}{N}{D}                    return(END);
":="                         return(ASSIGNMENT);
{I}{F}                       return(IF);
{T}{H}{E}{N}                 return(THEN);
{E}{L}{S}{E}                 return(ELSE);
{W}{H}{I}{L}{E}              return(WHILE);
{D}{O}                       return(DO);
{R}{E}{A}{L}                 return(REAL);
"<"                          return(LT);
">"                          return(GT);
"<="                         return(LE);
">="                         return(GE);
"="                          return(EQUAL);
"!="                         return(NOTEQUAL);
"+"                          return(PLUS);
"-"                          return(MINUS);
"*"                          return(STAR);
"/"                          return(DIV);
{N}{O}{T}                    return(NOT);
".."                         return(DOTDOT);

\/\/.*[^\n|\r]               line_no++;
[a-zA-Z]([a-zA-Z0-9])*       return(IDENTIFIER);
[0-9]+                       return(INTNUM);
[0-9]+"."[0-9]+              return(REALNUM);

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

[0-9]+[a-zA-Z]+ {fprintf(stderr,"Lexical analyzer error at line %d : %s\n",line_no,yytext);}

.    { fprintf (stderr,
        "'%c' (0%o): illegal charcter at line %d\n",
        yytext[0], yytext[0], line_no);
    }

%%

commentof()
{
    fprintf(stderr, "unexpected EOF inside comment at line %d\n", line_no);
    exit(1);
}
