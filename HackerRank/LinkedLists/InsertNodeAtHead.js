/*
Given a pointer to the head of a linked list, insert a new node before the head. 
The next value in the new node should point to head and the data value should be replaced 
with a given value. Return a reference to the new head of the list. 
The head pointer given may be null meaning that the initial list is empty.

Function Description

Complete the function insertNodeAtHead in the editor below.

insertNodeAtHead has the following parameter(s):

SinglyLinkedListNode llist: a reference to the head of a list
data: the value to insert in the  field of the new node
Input Format

The first line contains an integer n, the number of elements to be inserted at the head of the list.
The next n lines contain an integer each, the elements to be inserted, one per function call.


*/
function insertNodeAtHead(head, data) {
    const newNode = new SinglyLinkedListNode(data);
    // if it's empty simply set the head to the newNode.
    if (head === null) {
      head = newNode;
    } else {
      // update the next attribute of the new node to point to the current head.
      // this ensures the new node becomes the first node in the list.
      newNode.next = head;
      // update the head variable to referecne the new node, (now the head of the list)
      head = newNode;
    }
    return head;
  }

/*
COMMENTARY

Inside the function, we create a new node using the SinglyLinkedListNode class and 
assign the given data to its data attribute. This new node will be our new head.

We check if the linked list is empty by checking if head is null. If it is, 
it means the list is empty, so we assign the new node to head, making it the head of the list.

If the linked list is not empty, we update the next attribute of the new node 
to point to the current head (head). This ensures that the new node becomes the 
first node in the list.

Finally, we update the head variable to reference the new node, 
as the new node is now the head of the list.
*/