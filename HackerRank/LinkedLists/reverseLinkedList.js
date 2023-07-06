/*
Given the pointer to the head node of a linked list, 
change the next pointers of the nodes so that their order is reversed. 
The head pointer given may be null meaning that the initial list is empty.

Example
head references the list 1->2->3->Null

Manipulate the next pointers of each node in place and return head,
now referencing the head of the list 3 -> 2 -> 1 -> null.

Function Description

Complete the reverse function in the editor below.

reverse has the following parameter:

SinglyLinkedListNode pointer head: a reference to the head of a list
Returns

SinglyLinkedListNode pointer: a reference to the head of the reversed list
*/

function reverse(llist) {
    let current = llist;
    let prev = null;
    let next = null;

    while (current !== null) {
        next = current.next; // Store the next node
        current.next = prev; // Reverse the pointer to the previous node
        prev = current; // Move the prev pointer forward
        current = next; // Move the current pointer forward
    }

    // Update the head of the reversed list
    llist = prev;

    return llist;
}


/*
COMMENTARY
This code doesn't make sense without a visual representation:
https://www.youtube.com/watch?v=S9kMVEUg-x4

In this solution, we maintain three pointers: current, prev, and next.

We start with current pointing to the head of the original linked list, prev pointing to null, 
and next temporarily storing the reference to the next node.

Inside the while loop, we perform the following operations:
    Store the reference to the next node in next before modifying the current pointer.
    Reverse the pointer of current to point to the previous node (prev).
    Move the prev pointer forward by setting it to current.
    Move the current pointer forward by setting it to next.

After the while loop finishes, we update the head of the reversed list by assigning llist to prev, 
which now points to the new head of the reversed list.

Finally, we return the head of the reversed list.

his solution iterates through the original list, modifying the pointers to reverse the order of the nodes. 
It effectively reverses the linked list in-place.
*/