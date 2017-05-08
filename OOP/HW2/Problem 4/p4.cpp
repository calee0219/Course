#include <iostream>  
#include <algorithm>  
#include <string.h>

char pre[50],in[50];
struct node
{
	char s;
	node *left;
	node *right;
	node(char c) :s(c),left(NULL),right(NULL) {} 
};

node* findNextNode(int pstart,int istart,int size)
{
	if(size==0) { 
		 return NULL;
	}
	   //bonus question,if you realize how it works 
	   node *n=new node(pre[pstart]);
	   int ipos=istart;	
	   while(pre[pstart]!=in[ipos]){ipos++;}
	   int lsize=ipos - istart;
	   int rsize=size-lsize-1;
	  
	   n->left=findNextNode(pstart+1,istart,lsize);
	   n->right=findNextNode(pstart+lsize+1,ipos+1,rsize);
       return n;
}
void Preorder(node *p)
{
    //fill you code 
    if(!p) return;
    std::cout << p->s << ' ';
    if(p->left != NULL)
        Preorder(p->left);
    if(p->right != NULL)
        Preorder(p->right);
    return;
}
void Inorder(node *p)
{
    //fill you code 
    if(!p) return;
    if(p->left != NULL)
        Inorder(p->left);
    std::cout << p->s << ' ';
    if(p->right != NULL)
        Inorder(p->right);
    return;
}
void Postorder(node *p)
{
	//fill you code  
    if(!p) return;
    if(p->left != NULL)
        Postorder(p->left);
    if(p->right != NULL)
        Postorder(p->right);
    std::cout << p->s << ' ';
	delete p;
    return;
}

int main()  
{  
 	int m;
 	std::cin>>m;
 	for(int j=0;j<m;j++)
 	{
 		int n ;
 		std::cin>>n;
 		for(int i=0;i<n;i++) { std::cin>>pre[i]; }
		for(int i=0;i<n;i++) { std::cin>>in[i]; }
        node* root;
        //generation binary tree
	 	root = findNextNode(0,0,strlen(pre));
	 	
		//preorder trace 
	 	Preorder(root);
	 	std::cout<<std::endl; 
	 	
	 	//inorder trace 
	 	Inorder(root);
	 	std::cout<<std::endl;
		  
	 	//postorder trace 
        Postorder(root);
        std::cout<<std::endl;
	 }
    return 0;
}
