/*
Given the pointer to the head node of a linked list and an integer to insert 
at a certain position, create a new node with the given integer as its data attribute, 
insert this node at the desired position and return the head node.

A position of 0 indicates head, a position of 1 indicates one node away from the 
head and so on. The head pointer given may be null meaning that the initial list is empty.

Example
 head refers to the first node in the list 1 -> 2 -> 3
data = 4
position = 2

Insert a node at position 2 with data =4 . The new list is 1 -> 2 -> 4 -> 3

Function Description Complete the function insertNodeAtPosition in the editor below. 
It must return a reference to the head node of your finished list.

insertNodeAtPosition has the following parameters:

head: a SinglyLinkedListNode pointer to the head of the list
data: an integer value to insert as data in your new node
position: an integer position to insert the new node, zero based indexing
*/

function insertNodeAtPosition(head, data, position) {
    let newNode = new SinglyLinkedListNode(data);
    
    // If inserting at the head
    if (position === 0) {
        newNode.next = head;
        return newNode;
    }
    
    // Find the node before the insertion point
    let current = head;
    for(let i = 0; i < position - 1; i++) {
        current = current.next;
    }

    // once the loop finishes, it means we've reached the node before POSITION
    // Insert the new node
    newNode.next = current.next;
    // current.next refers to the next attribute of the node before the desired insertion point (current).
    current.next = newNode;

    // we return the head of the linked list, 
    // which ensures that the rest of the list remains connected and intact.
    return head;

}


/*
COMMENTARY

It's all about position. If position isn't equal to head, we iterate over the list until
we arrive at i = position, at which point we perform a simple insert as follows:
assign current.next to newNode.next

*/