/*
This is an to practice traversing a linked list. 
Given a pointer to the head node of a linked list, 
print each node's data element, one per line. 
If the head pointer is null (indicating the list is empty), 
there is nothing to print.


*/

// Complete the printLinkedList function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     int data;
 *     SinglyLinkedListNode next;
 * }
 *
 */
function printLinkedList(head) {
    let current = head;
    while (current) {
      console.log(current.data);
      current = current.next;
  }
}

/*
COMMENTARY
In this code, we assume that the linked list is represented by a head node. 
The printLinkedList function iterates through the linked list starting from the head node. 
At each node, it prints the data using console.log() 
and updates the current node to the next node using current = current.next.
 The loop continues until it reaches the end of the linked list (i.e., current becomes null).
*/