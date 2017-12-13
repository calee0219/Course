#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct nodeType {
    nodeType() {
    }
    ~nodeType() {
        free(type);
        free(content);
    }
    char* type;
    char* value;
    struct nodeType* parent;
    struct nodeType* children;
    struct nodeType* siblings;
};

void printTree();
void addChild();
nodeType* newNode(char*);
