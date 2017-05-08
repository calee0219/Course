#include<iostream>
using namespace std;

class node{
public:
	node();
	node(int value);
	~node();
	friend void gothrough(node *p);

private:
	node *left, *right; // the left child and the right child pointer
	int number; // record the node's number
	int is_threadl, is_threadr; //the flag to record whether the pointer is a thread or not

	friend class op_tree_totum;//you could access all valuables in class op_tree_totum
};

//ctor
node::node(){
	left = right = NULL;
	is_threadl = 1;
	is_threadr = 1;
}

//ctor
node::node(int value){
	number = value;
	left = right = NULL;
	is_threadl = 1;
	is_threadr = 1;
}

//dtor
node::~node(){

}

class op_tree_totum{

public:
	op_tree_totum();
	~op_tree_totum();
	void insertion(int s);
	void deletion(int s);
	void inorder_run();
	void reverseorder_run();
	int size();

private:
	node *root, *head, *tail;
	int num;//caculate how many nodes in the totum
};

//ctor
op_tree_totum::op_tree_totum(){
	head = new node();
	tail = new node();
	head->right = tail; //initialize the head node to connect to the tail node
	tail->left = head;
	root = NULL;
	num = 0;
}

//dtor
op_tree_totum::~op_tree_totum(){
	node *p = root;
	if(p!=NULL)	gothrough(p);
	num = 0;
	if (head != NULL)delete head;
	if (tail != NULL)delete tail;
}

void gothrough(node *p){
	if (p->is_threadl==0 && p->left!= NULL) gothrough(p->left);
	if (p->is_threadr==0 && p->right!= NULL) gothrough(p->right);
	delete p;
}

void op_tree_totum::insertion(int s){
	//TODO: fill in the code to do the insertion of the node with number s
    node* n = new node(s);
    // first insert
    if(num == 0) {
        root = n;
        n->left = head;
        n->right = tail;
        head->right = tail->left = n;
        num++;
        return;
    }
    node* tmp = root;
    // find the position of the new node should puts using binery search
    while((tmp != head && tmp != tail) && (tmp->left != NULL || tmp->right != NULL)) {
        if(s < tmp->number && !tmp->is_threadl) tmp = tmp->left;
        else if(s >= tmp->number && !tmp->is_threadr) tmp = tmp->right;
        else break;
    }
    if(s < tmp->number) {
        if(tmp->left == head) head->right = n; // modify head
        // modify nLeft and nRight
        n->left = tmp->left;
        n->right = tmp;
        // modify who point to new node
        tmp->left = n;
        tmp->is_threadl = 0; // turn left to not_thread
    } else {
        if(tmp->right == tail) tail->left = n; // modify tail
        // modify nLeft and nRight
        n->right = tmp->right;
        n->left = tmp;
        // modify who point to new node
        tmp->right = n;
        tmp->is_threadr = 0; // turn right to not_thread
    }
    num++;
    return;
}

void op_tree_totum::deletion(int s){
	//TODO: fill in the code to do the deletion of the node with number s
    node* now = root;
    node* previous = root; // maintain who to point to deleted node
    // find whitch node to delete
    while(now->number != s) {
        if(!now->is_threadl && now->number > s) {
            previous = now;
            now = now->left;
        }
        else if(!now->is_threadr && now->number < s) {
            previous = now;
            now = now->right;
        }
        // if node is a leaf and value isn't match, this number is not in the tree
        else return;
    }
    // if node is a leaf, just delete it and point the previous' to it's next one
    if(now->is_threadr && now->is_threadl) {
        if(now == root) {
            // back to the original sitionation
            root = NULL;
            head->right = tail->left;
            tail->left = head;
        } else {
            if(previous->number > s) { // previous' left points to node
                previous->left = now->left;
                previous->is_threadl = 1;
            } else { // or previous' right points to node
                previous->right = now->right;
                previous->is_threadr = 1;
            }
        }
        // maintain head and tail
        if(now->right == tail) tail->left = now->left;
        if(now->left == head) head->right = now->right;
        delete now;
        num--;
        return;
    }
    if(!now->is_threadr) { // if there's right subtree
        node* change = now->right;
        node* pri = now;
        // find the smallest number of right subtree
        // maintain pri as the parent of smallest number
        while(!change->is_threadl) {
            pri = change;
            change = change->left;
        }
        // change the deleted number to the down[right subtree]
        now->number = change->number;
        if(change->is_threadr) { // if change node is leaf
            if(pri != now) { // if change node not the child of priv but grandchild, change node will always be the left child of priv
                pri->left = now;
                pri->is_threadl = 1;
            } else { // change node is right child of priv
                pri->right = change->right;
                pri->is_threadr = 1;
                // maintain is_threadr
                if(change->right == tail) pri->is_threadr = 1;
            }
        } else { // if change node has right subtree
            // change may be both right or left child of priv
            if(pri->left == change) pri->left = change->right;
            else pri->right = change->right;
            // find the smallest number of change's right subtree
            node* cg = change->right;
            while(!cg->is_threadl) cg = cg->left;
            // cg points to change original, change will be deleted, so cg should point to now
            cg->left = now;
        }
        // maintain head and tail
        if(change->right == tail) tail->left = change->left;
        if(change->left == head) head->right = change->right;
        delete change;
    } else { // there's left subtree
        node* change = now->left;
        node* pri = now;
        // find the biggest number of left subtree
        // maintain pri as the parent of biggest number
        while(!change->is_threadr) {
            pri = change;
            change = change->right;
        }
        // change the deleted number to the up[left subtree]
        now->number = change->number;
        if(change->is_threadl) { // if change is leaf
            if(pri != now) { // if change node not the child of pirv but grandchild, change node will always be the right child of priv
                pri->right = now;
                pri->is_threadr = 1;
            } else { // change node is left child of priv
                pri->left = change->left;
                pri->is_threadl = 1;
                // maintain is_threadl
                if(change->left == head) change->is_threadl = 1;
            }
        } else { // if change node has left subtree
            // change may be both right or left child of priv
            if(pri->right == change) pri->right = change->left;
            else pri->left = change->left;
            // find the biggest number of change's left subtree
            node* cg = change->left;
            while(!cg->is_threadr) cg = cg->right;
            // cg points to change original, change will be deleted, so cg should point to now
            cg->right = now;
        }
        // maintain head and tail
        if(change->right == tail) tail->left = change->left;
        if(change->left == head) head->right = change->right;
        delete change;
    }
    num--;
    return;
}

void op_tree_totum::inorder_run(){
	//TODO: travel the tree from the head node to the tail node and output the values
	//You should NOT use stack or recurtion
    // from head runs to tail
    node* now = head->right;
    while(now != tail) {
        cout << now->number << ' ';
        node* tmp = now;
        now = now->right;
        // if now has child, it must check subtree's smallest node but not just used it's child
        if(!tmp->is_threadr)
            while(!now->is_threadl)
                now = now->left;
    }
    return;
}

void op_tree_totum::reverseorder_run(){
	//TODO: travel the tree from the tail node to the head node and output the values
	//You should NOT use stack or recurtion
    // from tail runs to head
    node* now = tail->left;
    while(now != head) {
        cout << now->number << ' ';
        node* tmp = now;
        now = now->left;
        // if now has child, it must check subtree's biggest node but not just used it's child
        if(!tmp->is_threadl)
            while(!now->is_threadr)
                now = now->right;
    }
    return;
}

int op_tree_totum::size(){
	return num;
}
