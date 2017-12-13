#include "node.h"

void printTree()
{

}

struct nodeType* newNode(char* type, char* value)
{
    nodeType* node = (nodeType*)malloc(sizeof(nodeType));
    strcpy(node->type, type);
    strcpy(node->value, value);
    return node;
}

void addChild()
{
    return;
}
