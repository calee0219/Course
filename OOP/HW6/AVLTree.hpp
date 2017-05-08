/*

  AVLTree.hpp

*/



#ifndef __AVL_TREE__HPP__
#define __AVL_TREE__HPP__

#if !defined(__cplusplus) || (__cplusplus < 201103L)
#error "C++11 support is required."
#endif

#include <cstdint>
#include <utility>
#include <iterator>
#include <functional>
#include <iostream>





template<class key_type,
         class mapped_type,
         class key_compare = std::less<key_type>
         >
class AVLTree {

	// Internal data structure.
	struct Node {

		std::pair<const key_type, mapped_type> Mapping;
		Node*  Parent;
		Node*  Left;
		Node*  Right;
		size_t Height;

		// Construct by providing arguments.
		template<class K, class D>
		Node(K&& InitKey,
		     D&& InitData,
		     Node* InitParent,
		     Node* InitLeft,
		     Node* InitRight,
		     size_t InitHeight):
			Mapping( std::forward<K>(InitKey), std::forward<D>(InitData) ),
			Parent( InitParent ),
			Left( InitLeft ),
			Right( InitRight ),
			Height( InitHeight ) {
			;
			}

		// Construct a new tree from an existing tree.
		Node(const Node* Tree, Node* InitParent):
			Mapping( Tree->Mapping ),
			Parent( InitParent ),
			Left( (Tree->Left != nullptr) ? (new Node(Tree->Left, this)) : nullptr ),
			Right( (Tree->Right != nullptr) ? (new Node(Tree->Right, this)) : nullptr ),
			Height( Tree->Height ) {
			;
			}

		~Node() {

			delete Left;
			delete Right;

			}

		static size_t HeightOf(Node* Tree) noexcept {

			return (Tree != nullptr) ? (Tree->Height) : 0;

			};

		template<class K, class D>
		static std::pair<Node*, bool> Insert(Node** PtrToThisNode, Node* Parent, K&& KeyToInsert, D&& DataToInsert, key_compare& );

		// Returns new root of child tree.
		static Node* RightRotate(Node* ) noexcept;
		static Node* LeftRotate(Node* ) noexcept;
		static Node* Begin(Node* ) noexcept;
		static Node* Find(Node* Tree, const key_type& KeyToFind, key_compare& );

		static void Dump(Node* CurrentNode) {

			if( CurrentNode == nullptr ){

				std::cout << "()";
				return;

				}

			std::cout << "((" << (CurrentNode->Mapping).first << ": " << (CurrentNode->Mapping).second << "), ";
			Dump(CurrentNode->Left);
			std::cout << ", ";
			Dump(CurrentNode->Right);
			std::cout << ')';

			}

		};

	Node* Root;
	key_compare Comp;


	// Public stuff.
	public:

	class iterator : public std::iterator<std::bidirectional_iterator_tag, decltype(Node::Mapping)> {

		Node* CurrentNode;

		// This can only be used in member functions of AVLTree.
		iterator(Node* InitPtr):
			CurrentNode( InitPtr ) {
			;
			}

		// It enables AVLTree to call the private constructor.
		friend class AVLTree;

		public:

		iterator():
			CurrentNode( nullptr ) {
			;
			}

		iterator(const iterator& ) = default;
		~iterator() = default;
		iterator& operator=(const iterator& ) = default;

		decltype(Node::Mapping)& operator*(void) const noexcept {

			return (CurrentNode->Mapping);

			}

		decltype(Node::Mapping)* operator->(void) const noexcept {

			return &(CurrentNode->Mapping);

			}

		iterator& operator++(void);
		iterator& operator--(void);

		iterator operator++(int) {

			iterator It(*this);

			++(*this);

			return It;

			}

		iterator operator--(int) {

			iterator It(*this);

			--(*this);

			return It;

			}

		bool operator==(const iterator& RHS) const noexcept {

			return ( (this->CurrentNode) == RHS.CurrentNode );

			}

		bool operator!=(const iterator& RHS) const noexcept {

			return ( (this->CurrentNode) != RHS.CurrentNode );

			}

		};

	// Const iterator.
	class const_iterator : public std::iterator<std::bidirectional_iterator_tag, const decltype(Node::Mapping)> {

		iterator It;

		public:

		const_iterator():
			It( nullptr ) {
			;
			}

		const_iterator(const iterator& RHS):
			It( RHS ) {
			;
			}

		const_iterator(const const_iterator& ) = default;
		~const_iterator() = default;
		const_iterator& operator=(const const_iterator& ) = default;

		const decltype(Node::Mapping)& operator*(void) const noexcept {

			return *It;

			}

		const decltype(Node::Mapping)* operator->(void) const noexcept {

			return &(*It);

			}


		const_iterator& operator++(void) {

			++It;

			return (*this);

			}

		const_iterator& operator--(void) {

			--It;

			return (*this);

			}

		const_iterator operator++(int) {

			return (It++);

			}

		const_iterator operator--(int) {

			return (It--);

			}

		bool operator==(const const_iterator& RHS) const noexcept {

			return ( It == RHS.It );

			}

		bool operator!=(const const_iterator& RHS) const noexcept {

			return ( It != RHS.It );

			}

		};


	AVLTree():
		Root(nullptr),
		Comp() {
		;
		}

	AVLTree(const AVLTree& RHS):
		Root( (RHS.Root != nullptr) ? new Node(RHS.Root, nullptr) : 0 ),
		Comp( RHS.Comp ) {
		;
		}

	AVLTree(AVLTree&& RHS):
		Root( RHS.Root ),
		Comp( std::move(RHS.Comp) ){

		RHS.Root = nullptr;

		}

	~AVLTree() {

		delete Root;

		}

	iterator begin(void) {

		return Node::Begin(Root);

		}

	iterator end(void) {

		return nullptr;

		}

	const_iterator begin(void) const {

		return iterator(Node::Begin(Root));

		}

	const_iterator end(void) const {

		return iterator(nullptr);

		}

	iterator find(const key_type& KeyToFind) {

		return Node::Find(Root, KeyToFind, Comp);

		}

	const_iterator find(const key_type& KeyToFind) const {

		return iterator(Node::Find(Root, KeyToFind, Comp));

		}

	template<class K, class D>
	std::pair<iterator, bool> insert(K&& KeyToInsert, D&& DataToInsert);

	AVLTree& operator=(const AVLTree& RHS) {

		if( this != &RHS ) {

			delete Root;

			if( RHS.Root != nullptr )
				Root = new Node(RHS.Root, nullptr);
			else
				Root = nullptr;

			Comp = RHS.Comp;

			}

		return *this;

		}

	template<class K>
	mapped_type& operator[](K&& Index) {

		auto Result = insert(std::forward<K>(Index), mapped_type());
		return (Result.first)->second;

		}

	AVLTree& operator=(AVLTree&& RHS) {

		if( this != &RHS ) {

			delete this->Root;
			this->Root = RHS.Root;
			RHS.Root = nullptr;
			Comp = std::move( RHS.Comp );

			}

		return *this;

		}

	size_t GetHeight(void) const noexcept {

		if( Root == nullptr )
			return 0;

		return Root->Height;

		}

	void Dump(void) const {

		Node::Dump(Root);
		std::cout << std::endl;

		}

	};





template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::iterator::operator++(void) -> iterator& {

	if( CurrentNode == nullptr )
		return (*this);

	// TODO: Find the next node in an in-order manner.

	return (*this);

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::iterator::operator--(void) -> iterator& {

	if( CurrentNode == nullptr )
		return (*this);

	// TODO: Find the previous node in an in-order manner.

	return (*this);

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::Node::Begin(Node* CurrentNode) noexcept -> Node* {

		if( CurrentNode == nullptr )
			return CurrentNode;

		Node* Next;

		while( (Next = CurrentNode->Left) != nullptr )
			CurrentNode = Next;

		return CurrentNode;

		}



template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::Node::Find(Node* Tree, const key_type& KeyToFind, key_compare& Comp) -> Node* {

	Node* CurrentNode = Tree;

	// TODO: Use Comp to find where it located.
	//       You may want to take a look of the implementation of Insert.

	return CurrentNode;

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
template<class K, class D>
auto AVLTree<key_type, mapped_type, key_compare>::insert(K&& KeyToInsert, D&& DataToInsert) -> std::pair<iterator, bool> {

	auto Result = Node::Insert(&Root,
	                           nullptr,
	                           std::forward<K>(KeyToInsert),
	                           std::forward<D>(DataToInsert),
	                           Comp);

	return std::pair<iterator, bool>(Result.first, Result.second);

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
template<class K, class D>
auto AVLTree<key_type, mapped_type, key_compare>::Node::Insert(Node** PtrToThisNode, Node* Parent, K&& KeyToInsert, D&& DataToInsert, key_compare& Comp) -> std::pair<Node*, bool> {

	Node* ThisNode = *PtrToThisNode;

	// We found where to insert the data.
	if( ThisNode == nullptr ) {

		ThisNode = new Node(std::forward<K>(KeyToInsert),
		                    std::forward<D>(DataToInsert),
		                    Parent,
		                    nullptr,
		                    nullptr,
		                    1
		                    );

		// Fix parent's pointer to the new node and return where it's inserted.
		return std::pair<Node*, bool>(*PtrToThisNode = ThisNode, true);

		}

	std::pair<Node*, bool> InsertResult;

	// If the data shall be placed in left child.
	if( Comp(KeyToInsert, (ThisNode->Mapping).first) ) {

		InsertResult = Insert(&(ThisNode->Left),
		                      ThisNode,
		                      std::forward<K>(KeyToInsert),
		                      std::forward<D>(DataToInsert),
		                      Comp);

		size_t LeftHeight = Node::HeightOf(ThisNode->Left);
		size_t RightHeight = Node::HeightOf(ThisNode->Right);

		// If left child is higher.
		if( LeftHeight >= RightHeight + 2 ) {

			Node* LeftNode = ThisNode->Left;

			if( Node::HeightOf(LeftNode->Left) < Node::HeightOf(LeftNode->Right) )
				ThisNode->Left = LeftNode = LeftRotate(LeftNode);

			*PtrToThisNode = ThisNode = RightRotate(ThisNode);

			}
		// Already balanced. No need to rotate.
		else
			ThisNode->Height = 1 + std::max(LeftHeight, RightHeight);

		}
	// If the data shall be placed in right tree.
	else if( Comp((ThisNode->Mapping).first, KeyToInsert) ) {

		InsertResult = Insert(&(ThisNode->Right),
		                      ThisNode,
		                      std::forward<K>(KeyToInsert),
		                      std::forward<D>(DataToInsert),
		                      Comp);

		size_t LeftHeight = Node::HeightOf(ThisNode->Left);
		size_t RightHeight = Node::HeightOf(ThisNode->Right);

		// If right child is higher.
		if( RightHeight >= LeftHeight + 2 ){

			Node* RightNode = ThisNode->Right;

			if( Node::HeightOf(RightNode->Left) > Node::HeightOf(RightNode->Right) )
				ThisNode->Right = RightNode = RightRotate(RightNode);

			*PtrToThisNode = ThisNode = LeftRotate(ThisNode);

			}
		// Already balanced. No need to rotate.
		else
			ThisNode->Height = 1 + std::max(LeftHeight, RightHeight);

		}
	// Found.
	else {

		InsertResult.first = ThisNode;
		InsertResult.second = false;

		}

	return InsertResult;

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::Node::RightRotate(Node* ThisNode) noexcept -> Node* {

	// TODO: Right rotate the tree and return the new root.
	//       The height of modified trees should also be fixed accordingly.

	return ThisNode;

	}



template<class key_type,
         class mapped_type,
         class key_compare
         >
auto AVLTree<key_type, mapped_type, key_compare>::Node::LeftRotate(Node* ThisNode) noexcept -> Node* {

	// TODO: Left rotate the tree and return the new root.
	//       The height of modified trees should also be fixed accordingly.

	return ThisNode;

	}





#endif
