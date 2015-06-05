# Data structures 

Review of Data Structures 
**Note**: When in doubt use hashes
**Note**: More detail and graphics will be added in the future for the momment bare neccesities. 

## Stacks
* Big-O facts 
	* Average Time Complexity 
	
 	 | Access | Search | Insertion | Deletion |
 	 | ------ | ------ | --------- | -------- |
 	 | O(n)   | O(n)   | O(1)	   | O(1)	  |
 
 	* Worst Time Complexity

 	 | Access | Search | Insertion | Deletion | 
 	 | :----- | :----- | :-------- | :------- |  
 	 | O(n)   | O(n)   | O(1)	   | O(1)	  | 
* LIFO order
	* Last-in first-out: The last element to be added to the stack is the first one retrieved from the stack 
	* Example: Printer paper, PEZ dispenser, and book piles
* Basic functions (Name will vary depending on implementation, function will not)
	* `Stack()`: 
		* creates a new empty stack object. `return` an empty stack.
	* `push(item)`:
		* adds a new element `item` to the top of the stack. `return` nothing.
	* `pop()`:
		* removes the top element of the stack and stores it in a temp variable. `return` the top element of the stack that was saved in a temp variable. 
	* `peek()`:
		* `return` the top element of the stack, but does not remove it. 
	* `isEmpty()`:
		* tests to see if the stack is empty. `return` nothing 
	* `size()`:
		* `return` the number of items in the stack. 
* Python implementation of a stack
 
 ```python
 	class Stack:
     def __init__(self):
         self.elements = []

     def isEmpty(self):
         return self.elements == []

     def push(self, item):
         self.elements.append(item)

     def pop(self):
         return self.elements.pop()

     def peek(self):
         return self.elements[len(self.items)-1]

     def size(self):
         return len(self.elements)
 ```

## Queues 
* Big-O facts 
	* Average Time Complexity 
	
 	 | Access | Search | Insertion | Deletion |
 	 | ------ | ------ | --------- | -------- |
 	 | O(n)   | O(n)   | O(1)	   | O(1)	  |
 
 	* Worst Time Complexity

 	 | Access | Search | Insertion | Deletion | 
 	 | :----- | :----- | :-------- | :------- |  
 	 | O(n)   | O(n)   | O(1)	   | O(1)	  | 
* FIFO order
	* First-in first-out: The first element to be added to the queue is the first one retrieved from the queue.
	* Example: waiting in line. 
* Basic functions (Name will vary depending on implementation, function will not)
	* `Queue()`: 
		* creates a new empty Queue object. `return` an empty queue.
	* `enqueue(item)`:
		* adds a new element `item` to the rear or back of the queue. `return` nothing.
	* `dequeue()`:
		* removes the first element in the queue and stores it in a temp variable. `return` the first element in the queue that was saved in a temp variable. 
	* `isEmpty()`:
		* tests to see if the queue is empty. `return` nothing 
	* `size()`:
		* `return` the number of items in the queue. 
* Python implementation of a queue
 
 ```python
 	class Queue:
    def __init__(self):
        self.elements = []

    def isEmpty(self):
        return self.elements == []

    def enqueue(self, item):
        self.elements.insert(0,item)

    def dequeue(self):
        return self.elements.pop()

    def size(self):
        return len(self.elements)
 ```


