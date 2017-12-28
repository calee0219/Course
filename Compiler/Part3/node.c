#include "node.h"

void printTree()
{

}

struct nodeType* newNode(int type)
{
    struct nodeType* node = (struct nodeType*)malloc(sizeof(struct nodeType));
    node->type = type;
    node->value_valid = VALUE_INVALID;
    node->parent = NULL;
    node->child = NULL;
    node->l_siblings = node;
    node->r_siblings = node;
    return node;
}

void addChild(struct nodeType *node, struct nodeType *child)
{
    child->parent = node;

    if(node->child == NULL) {
        node->child = child;
    }
    else {
        child->r_siblings = node->child;
        node->child->l_siblings = child;
        node->child = child;
    }
    return;
}

void deleteNode(struct nodeType *node) {
    return;
}