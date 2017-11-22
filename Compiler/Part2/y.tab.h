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
    PROGRAM = 258,
    ASSIGNMENT = 259,
    RPAREN = 260,
    LPAREN = 261,
    RBRAC = 262,
    LBRAC = 263,
    PBEGIN = 264,
    END = 265,
    INTEGER = 266,
    REAL = 267,
    ARRAY = 268,
    NUMBER = 269,
    STRING = 270,
    PLUS = 271,
    MINUS = 272,
    STAR = 273,
    DIV = 274,
    EQUAL = 275,
    NOTEQUAL = 276,
    LT = 277,
    GT = 278,
    LE = 279,
    GE = 280,
    NOT = 281,
    COLON = 282,
    SEMICOLON = 283,
    COMMA = 284,
    DOT = 285,
    DOTDOT = 286,
    FUNCTION = 287,
    IDENTIFIER = 288,
    PROCEDURE = 289,
    TYPE = 290,
    VAR = 291,
    WHILE = 292,
    DO = 293,
    IF = 294,
    ELSE = 295,
    THEN = 296,
    OF = 297
  };
#endif
/* Tokens.  */
#define PROGRAM 258
#define ASSIGNMENT 259
#define RPAREN 260
#define LPAREN 261
#define RBRAC 262
#define LBRAC 263
#define PBEGIN 264
#define END 265
#define INTEGER 266
#define REAL 267
#define ARRAY 268
#define NUMBER 269
#define STRING 270
#define PLUS 271
#define MINUS 272
#define STAR 273
#define DIV 274
#define EQUAL 275
#define NOTEQUAL 276
#define LT 277
#define GT 278
#define LE 279
#define GE 280
#define NOT 281
#define COLON 282
#define SEMICOLON 283
#define COMMA 284
#define DOT 285
#define DOTDOT 286
#define FUNCTION 287
#define IDENTIFIER 288
#define PROCEDURE 289
#define TYPE 290
#define VAR 291
#define WHILE 292
#define DO 293
#define IF 294
#define ELSE 295
#define THEN 296
#define OF 297

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
