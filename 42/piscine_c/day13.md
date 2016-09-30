# day13


# questions 


# explore
	
* binary trees have a right and left pointer 
	* structure 
	```
		typedef struct			s_btree
		{
			struct	s_btree		*parent;
			struct	s_btree		*right;
			struct	s_btree		*left;
			void				*data;
		}						t_btree;
	```
	* traversing 
		* depth first order traversal 
			* use dfs
		* breath first traversal 
			* use bfs
	* balancing binary trees
		* use a red black tree
			* structure 
			```
				enum	e_rb_color
				{
					RB_BLACK,
					RB_RED
				};

				typedef	struct			s_rb_node
				{
					struct	s_rb_node	*parent;
					struct	s_rb_node	*right;
					struct	s_rb_node	*left;
					void				*data;
					enum	e_rb_color	color;
				}						t_rb_node;
			```
		* red black trees properties 
			* parent node is black
			* all leaves including null empty leaves are black 
			* a red node only has black paths 
				* both null 
				* real 
			* from which ever node in the tree the amount of black nodes distance between this node and the last leaf is the same for every leaf of this node 
			* example
				* insertion 
			* create a function that displays your tree
			* display nodes that null





