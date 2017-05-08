/*************************************************************************
	> File Name: MyStack.cpp
	> Author: Gavin Lee
	> School: National Chiao Tung University
	> Team: NCTU_Ragnorok
	> Mail: sz110010@gmail.com
	> Created Time: Sun 03 Apr 2016 09:39:44 PM CST
 ************************************************************************/

#include <bits/stdc++.h>
#include "MyStack.h"
#include "Coordinate.h"
using namespace std;

// MyStack
template <class T>
MyStack<T>::MyStack():size(0),head(NULL) {}

template <class T>
MyStack<T>::~MyStack()
{
    if(head == NULL) return;
    while(head->next != NULL)
    {
        Node *tmp_head = head;
        while((tmp_head->next)->next != NULL)
            tmp_head = tmp_head->next;
        delete(tmp_head->next);
        tmp_head->next = NULL;
    }
    return;
}

template <class T>
void MyStack<T>::push(T &t)
{
    if(head == NULL)
    {
        head = new Node(t,NULL);
        size = 1;
        return;
    }
    Node *tmp = new Node(t,head);
    head = tmp;
    size++;
    return;
}

template <class T>
void MyStack<T>::pop()
{
    if(head == NULL) return;
    Node *tmp = head;
    head = tmp->next;
    delete(tmp);
    size--;
    return;
}

template <class T>
T& MyStack<T>::top()
{
    return head->value;
}

template <class T>
size_t MyStack<T>::getSize() const { return size; }

template <class T>
bool MyStack<T>::empty() const { return head == NULL; }

// Node
template <class T>
MyStack<T>::Node::Node(T &t, Node *node):value(t),next(node) {}

template class MyStack<char>;
template class MyStack<Coordinate>;
