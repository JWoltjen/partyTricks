/*
Delete the node at a given position in a linked list and return a reference to the head node. 
The head is at position 0. The list may be empty after you delete the node. 
In that case, return a null value.

Example

llist = 0 -> 1 -> 2 -> 3;
position = 2;

after removing the node at position 2: llist = 0 -> 1 -> 3;

*/
function deleteNode(llist, position) {
    // Case 1: If the list is empty, return null
    if (llist === null) {
      return null;
    }
  
    // Case 2: If the position is 0, update the head to the next node and return the new head
    if (position === 0) {
      return llist.next;
    }
  
    // Case 3: For positions other than 0, traverse the list to find the node before the position
    let current = llist;
    for (let i = 0; i < position - 1; i++) {
      current = current.next;
      // If we reach the end of the list before the desired position, return the original head
      if (current === null) {
        return llist;
      }
    }
  
    // Update the references to remove the node at the given position
    current.next = current.next.next;
  
    // Return the original head of the list
    return llist;
  }



/*
COMMENTARY

*/