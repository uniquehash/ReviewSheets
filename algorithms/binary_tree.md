# overview of binary trees

* What is a [binary tree](https://en.wikipedia.org/wiki/Binary_tree)?
	* a tree data structure in which each node has at most two children
		* left child
		* right child
	* types of binary trees
		* rooted
			* has a root node and every node has at most two children
		* full
			* also known as proper, or plane
			* a tree in which every node in the tree has either 0 or 2 children
		* perfect
			* a tree in which all interior nodes have two children and all leaves have the same depth
		* complete
			* a tree in which every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible
			* a complete binary tree can be efficiently represented using an array
		* balanced
			* has the minimum possible maximum height for the leaf nodes because for any given number of leaf nodes the leaf nodes are placed at the greatest height possible
		* degenerate
			* also known as pathological
			* a tree where each parent node has only one associated child node
			* basically a linked list
	* properties of binary trees
		* number of nodes n in a full binary tree is at least n = 2h - 1 and at most n = (2^h+1) - 1 where h is the height of the tree
		* a tree consisting of only a root node has a height of 0
		* number of leaf nodes l in a perfect binary tree is l = (n + 1)/2 
		* a perfect binary tree with l leaves has n = 2l - 1 nodes
		* in a balanced full binary tree h = [log2(l)] + 1 = [log2((n+1)/2)] + 1 = [log2(n+1)]
		* in a perfect full binary tree l = 2^h 
		* in a perfect full binary tree n = (2^h+1) - 1
		* the maximum possible number of null links in a complete binary tree of n nodes is (n+1) where only 1 node exists in bottom-most level to the far left
		* the number of internal nodes in a complete binary tree of n nodes is [n/2]
		* for any non-empty binary tree with n0 leaf nodes and n2 nodes of degree 2, n0 = n2 + 1
	* methods for storing binary trees
		* nodes and references
			* you can use nodes and pointers to build a binary tree
		* tagged unions
			* tree nodes are often a tagged union of two types of nodes
				* 3-tuple of data
					* left child
					* right child
				* leaf node
					* contains no data and functions 
		* arrays
			* breadth-first order 
				* if complete tree, this wastes no space
				* if node has index i
					* left child at index 2i + 1 
					* right child at index 2i + 2
					* parent node is found at index (i - 1) / 2
				* more compact storage and better locality of reference
				* expensive to grow and wastes proportional to (2^h) - n for a tree of depth h with n nodes
				* often used for binary heaps 
					* no space is wasted because nodes are added in breadth-first order
	* common operations
		* insertion
			* nodes can be inserted into binary trees in between two other nodes
			* nodes can be added after leaf nodes
			* leaf nodes
				* add a new node after leaf node A 
					* A assigns the new node as one of its children
					* new node assigns A as its parent
			* internal nodes
				* givens
					* internal node A
					* node B is right child of A
				* adding new node as right child of A
					* A assigns new node as right child
					* new node assigns A as parent and B as child
					* B assigns new node as parent
		* deletion
			* the process whereby a node is removed from the tree 
				* only certain nodes in a binary tree can be removed unambiguously
			* node with zero or one child
				* givens
					* node to delete is node A
					* A has parent and one child 
				* if A has no children 
					* set the child of A's parent to null
				* if A has one child
					* in the child of A set parent to A's parent
					* in parent of A set child to A's child
			* node with two children
				* tree must be reanrranged
		* traversal
			* depth-first order
				* attempt to visit the node farthes from the root node that we can that is a child of a node we have already visited
			* breadth-first order
				* attempt to visit the node closest to the root that has not already been visited




