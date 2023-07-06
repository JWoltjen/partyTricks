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
    // Case 1: If the position is 0, update the list to exclude the head node
    // and return the new list
    if (position === 0) {
      return llist.next;
    }
  
    // Case 2: For positions other than 0, traverse the list to find 
    // the node before the position
    let current = llist;
    for (let i = 0; i < position - 1; i++) {
      current = current.next;
    }
  
    // Update the references to remove the node at the given position
    current.next = current.next.next;
  
    // Return the reference to the head node of the updated list
    return llist;
  }



/*
COMMENTARY
current.next refers to the node that comes after current.

current.next = current.next.next
By assigning current.next to current.next.next, 
we effectively bypass the node we want to delete.
We update the next reference of current to point 
directly to the node that comes after the deleted node.
*/