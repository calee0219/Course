#ifndef __NODE_H__
#define __NODE_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum NTenum {
    OP_PLUS,
    OP_MINUS,
    OP_STAR,
    OP_DIV,
    OP_EQUAL,
    OP_NOTEQUAL,
    OP_LT,
    OP_GT,
    OP_LE,
    OP_GE,
    OP_NOT,

    VALUE_VALID,
    VALUE_INVALID,

    VALUE_INT,
    VALUE_REAL,
    VALUE_STRING,
    
    NODE_TOKEN,
    NODE_IDENTIFER,
    
    NODE_PROGRAM,
    NODE_ASSIGNMENT,
    NODE_RPAREN,
    NODE_LPAREN,
    NODE_RBRAC,
    NODE_LBRAC,
    NODE_PBEGIN,
    NODE_END,
    NODE_INTEGER,
    NODE_REAL,
    NODE_ARRAY,
    NODE_STRING,

    NODE_COLON,
    NODE_SEMICOLON,
    NODE_COMMA,
    NODE_DOT,
    NODE_DOTDOT,
    NODE_FUNCTION,
    NODE_PROCEDURE,
    NODE_TYPE,
    NODE_VAR,
    NODE_WHILE,
    NODE_DO,
    NODE_IF,
    NODE_ELSE,
    NODE_THEN,
    NODE_OF
};

struct nodeType {
    int type;
    char* value;
    int value_valid;
    struct nodeType* parent;
    struct nodeType* child;
    struct nodeType* l_siblings;
    struct nodeType* r_siblings;
};

struct nodeType* newNode(int);
void deleteNode(struct nodeType*);
void addChild(struct nodeType*, struct nodeType*);
void printTree();

#endif