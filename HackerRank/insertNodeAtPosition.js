/*
Given the pointer to the head node of a linked list and an integer 
to insert at a certain position, create a new node with the given 
integer as its  attribute, insert this node at the desired position 
and return the head node.

A position of 0 indicates head, 
a position of 1 indicates one node away from the head and so on.
The head pointer given may be null meaning that the initial list is empty.

Example:
head refers to the first node in the list 1 -> 2 -> 3
data = 4
position = 2
insert a node at position 2 with data = 4. The new list is
1 -> 2 -> 4 -> 3

function description
Complete the function InsertNodeAtPosition. 
It must return a reference to the head node of your finished list.

InsertNodeAtPosition has the following parameters:
head: a singlyLinkedListNode pointing to the head of the list
data: an integer value to insert as data in your new node
position: an integer position to insert the new node, zero based indexing

returns: singlyLinkedListNode pointer: a reference to the head of the
revised list

input format:
The first line contains an integer n, the number of elements in the linked list.
Each of the next n lines contains an integer SinglyLinkedListNode[i].data.
The next line contains an integer data, the data of the node that is to be inserted.
The last line contains an integer position.

For your reference:
 *
 * SinglyLinkedListNode {
 *     int data;
 *     SinglyLinkedListNode next;
 * }
 *
 *

sample input
3
16
13
7
1
2
sample output
16, 13, 17

explanation
the initial linked list is 16-13-7. insert 1 at the psoition 2
which currently has 7 in it. the updated linked list is 
16 -> 13 -> 1 -> 7. 

head = 16, data = 1 and position = 2
*/

const InsertNodeAtPosition = (head, data, position) => {
    // instantiate a new singlylinkedListNode with its data as a param
    let newNode = new SinglyLinkedListNode(data);
    
    // If inserting at the head
    if (position === 0) {
        // set the old head to the next node after our new node
        newNode.next = head;
        return newNode;
    }
    
    // Find the node before the insertion point
    // current is like a finger pointing to the current node we're looking at 
    let current = head;
    // we use a for loop to move "current" along the list one node at a time
    for(let i = 0; i < position - 1; i++) {
        // after this loop, current is pointing to the node with '13' (position -1)
        current = current.next;
    }

    // Insert the new node
    // we want to insert newNode after current, but before current's next node
    // 
    newNode.next = current.next;
    current.next = newNode;

    return head;
}

// now the linked list looks like this:
// 16 -> 13 -> 1 -> 7

/*
Commentary


*/