/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUM_INT = 258,
    NUM_REAL = 259,
    IDENTIFIER = 260,
    PROGRAM = 261,
    ASSIGNMENT = 262,
    RPAREN = 263,
    LPAREN = 264,
    RBRAC = 265,
    LBRAC = 266,
    PBEGIN = 267,
    END = 268,
    INTEGER = 269,
    REAL = 270,
    ARRAY = 271,
    STRING = 272,
    PLUS = 273,
    MINUS = 274,
    STAR = 275,
    DIV = 276,
    EQUAL = 277,
    NOTEQUAL = 278,
    LT = 279,
    GT = 280,
    LE = 281,
    GE = 282,
    NOT = 283,
    COLON = 284,
    SEMICOLON = 285,
    COMMA = 286,
    DOT = 287,
    DOTDOT = 288,
    FUNCTION = 289,
    PROCEDURE = 290,
    TYPE = 291,
    VAR = 292,
    WHILE = 293,
    DO = 294,
    IF = 295,
    ELSE = 296,
    THEN = 297,
    OF = 298
  };
#endif
/* Tokens.  */
#define NUM_INT 258
#define NUM_REAL 259
#define IDENTIFIER 260
#define PROGRAM 261
#define ASSIGNMENT 262
#define RPAREN 263
#define LPAREN 264
#define RBRAC 265
#define LBRAC 266
#define PBEGIN 267
#define END 268
#define INTEGER 269
#define REAL 270
#define ARRAY 271
#define STRING 272
#define PLUS 273
#define MINUS 274
#define STAR 275
#define DIV 276
#define EQUAL 277
#define NOTEQUAL 278
#define LT 279
#define GT 280
#define LE 281
#define GE 282
#define NOT 283
#define COLON 284
#define SEMICOLON 285
#define COMMA 286
#define DOT 287
#define DOTDOT 288
#define FUNCTION 289
#define PROCEDURE 290
#define TYPE 291
#define VAR 292
#define WHILE 293
#define DO 294
#define IF 295
#define ELSE 296
#define THEN 297
#define OF 298

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 30 "parser.y" /* yacc.c:1909  */

    struct nodeType * node;
    int number;
    double dbnumber;
    char * string;

#line 147 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
